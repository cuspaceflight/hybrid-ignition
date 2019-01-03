#include "ch.h"
#include "hal.h"

#include <string.h>

#include "uart_a.h"
#include "packets.h"

#define UART_A_MEMPOOL_ITEMS 64

/* Serial Config */
static SerialDriver* uart_a_seriald;
static SerialConfig serial_cfg = {
    .speed = 115200,
    .cr1 = 0,
    .cr2 = 0,
    .cr3 = 0,
};

/* Function Prototypes */
static void mem_init(void);

/* Memory pool to store incoming/outgoing packets */
static memory_pool_t uart_a_mempool;

/* Mailbox for storing pointers to queued data */
static mailbox_t uart_a_tx_mailbox;
static mailbox_t uart_a_rx_mailbox;

/* Statically allocated memory used for the memory pool */
static volatile char uart_a_mempool_buffer[UART_A_MEMPOOL_ITEMS * sizeof(packet)]
                    __attribute__((aligned(sizeof(stkalign_t))))
                    __attribute__((section(".ram0")));

/* Statically allocated memory used for the queue in mailbox */
static volatile msg_t uart_a_rx_mailbox_buffer[UART_A_MEMPOOL_ITEMS]
                    __attribute__((section(".ram0")));
static volatile msg_t uart_a_tx_mailbox_buffer[UART_A_MEMPOOL_ITEMS]
                    __attribute__((section(".ram0")));




/* Bank A UART TX Thread */
static THD_WORKING_AREA(waUART_A_TXThread, 2048);
static THD_FUNCTION(UART_A_TXThread, arg) {

    (void)arg;
    
    /* Mailbox Variables */             
    msg_t mailbox_res;       
    intptr_t data_msg;

    /* Output Buffer */
    uint8_t* chars;
    uint8_t tx_buf[256];
    size_t tx_bufidx = 0;  
    
    /* Fetch Packets & Send over UART A */
    while (true) {

        /* Wait for message to be avaliable */
        mailbox_res = chMBFetch(&uart_a_tx_mailbox, (msg_t*)&data_msg, MS2ST(50));

        /* Re-attempt if mailbox was reset or fetch failed */
        if (mailbox_res != MSG_OK || data_msg == 0) continue;

        /* Generate TX Buffer */  
        tx_bufidx = 0;     
        tx_buf[tx_bufidx++] = 0x7E;
        chars = (uint8_t*)data_msg;
        for(size_t i=0; i<sizeof(packet); i++) {
            uint8_t c = chars[i];
            if(c == 0x7E) {
                tx_buf[tx_bufidx++] = 0x7D;
                tx_buf[tx_bufidx++] = 0x5E;
            } else if(c == 0x7D) {
                tx_buf[tx_bufidx++] = 0x7D;
                tx_buf[tx_bufidx++] = 0x5D;
            } else {
                tx_buf[tx_bufidx++] = c;
            }
        }

        /* TX Packet over UART A */
        sdWrite(uart_a_seriald, tx_buf, tx_bufidx);

        /* Free from Memory Pool */        
        chPoolFree(&uart_a_mempool, (void*)data_msg);
    }  
}



/* Bank A UART RX Thread */
static THD_WORKING_AREA(waUART_A_RXThread, 2048);
static THD_FUNCTION(UART_A_RXThread, arg) {

    (void)arg;
    
    /* Mailbox Variables */             
    void* msg;
    msg_t retval;    
    
    /* RX Buffer */
    bool packet_detect = false;
    int rx_bufidx = 0;
    uint8_t rx_buf[128];

    /* Recieve Bytes over UART A */
    while(true) {
        
        uint8_t c = sdGet(uart_a_seriald);
        
        /* Handle Start Byte */
        if(c == 0x7E) {
            rx_bufidx = 0;
            packet_detect = true;
            continue;
        }

        /* Handle Escape Character */
        if((c == 0x7D) && packet_detect) {
            c = sdGet(uart_a_seriald) ^ 0x20;
        }

        /* Put Byte in Buffer */
        if(packet_detect){
            rx_buf[rx_bufidx++] = c;
        }

        /* Full Packet Recieved */
        if(rx_bufidx == sizeof(packet)) {

            /* Zero Counter */
            rx_bufidx = 0;
            packet_detect = false;
            
            /* Allocate Space for Packet if Avaliable */
            msg = chPoolAlloc(&uart_a_mempool);
            if (msg == NULL) continue;
            
            /* Copy the packet into the mempool */
            memcpy(msg, (void*)rx_buf, sizeof(packet));
            
            /* Post the location of the packet into the mailbox */
            retval = chMBPost(&uart_a_rx_mailbox, (intptr_t)msg, TIME_IMMEDIATE);
            if (retval != MSG_OK) {
                chPoolFree(&uart_a_mempool, msg);
                continue;
            }
        }
    }
}


/* Get a Packet Recieved over UART A */
bool get_packet_bank_a(packet *pkt) {

    (void)pkt;

    msg_t mailbox_res;       
    intptr_t data_msg;

    /* Check for Recieved Packet */
    mailbox_res = chMBFetch(&uart_a_rx_mailbox, (msg_t*)&data_msg, MS2ST(50));

    /* Pass Recieved Packet if Avaliable */
    if (mailbox_res != MSG_OK || data_msg == 0) {
        return false;
    } else {
        memcpy((void*)pkt, (void*)data_msg, sizeof(packet));
        chPoolFree(&uart_a_mempool, (void*)data_msg);
        return true;
    }
}


/* Send a Packet over UART A */
bool send_packet_bank_a(packet *pkt) {

    void* msg;
    msg_t retval;

    /* Allocate Space for Packet */
    msg = chPoolAlloc(&uart_a_mempool);
    if (msg == NULL) return false;
    
    /* Copy the packet into the mempool */
    memcpy(msg, (void*)pkt, sizeof(packet));
    
    /* Post the location of the packet into the mailbox */
    retval = chMBPost(&uart_a_tx_mailbox, (intptr_t)msg, TIME_IMMEDIATE);
    if (retval != MSG_OK) {
        chPoolFree(&uart_a_mempool, msg);
        return false;
    } else {
        return true;
    }
}



/* Initialise Mailboxes and Memorypool */
static void mem_init(void) {
    
    chMBObjectInit(&uart_a_tx_mailbox, (msg_t*)uart_a_tx_mailbox_buffer, UART_A_MEMPOOL_ITEMS);
    chMBObjectInit(&uart_a_rx_mailbox, (msg_t*)uart_a_rx_mailbox_buffer, UART_A_MEMPOOL_ITEMS);
    chPoolObjectInit(&uart_a_mempool, sizeof(packet), NULL);

    /* Fill Memory Pool with Statically Allocated Bits of Memory */
    chPoolLoadArray(&uart_a_mempool, (void*)uart_a_mempool_buffer, UART_A_MEMPOOL_ITEMS);
}


/* Start Bank A UART Thread */
void bank_a_uart_init(SerialDriver* seriald){

    /* Start Serial Driver */
    uart_a_seriald = seriald;
    sdStart(uart_a_seriald, &serial_cfg);

    /* Initalise Memory */
    mem_init();

    /* Spawn TX/RX Threads */
    chThdCreateStatic(waUART_A_TXThread, sizeof(waUART_A_TXThread), NORMALPRIO, UART_A_TXThread, NULL);
    chThdCreateStatic(waUART_A_RXThread, sizeof(waUART_A_RXThread), NORMALPRIO, UART_A_RXThread, NULL);

}