#include "ch.h"
#include "hal.h"

#include <string.h>

#include "packets.h"
#include "usbcfg.h"
#include "usbserial.h"

#define USB_MEMPOOL_ITEMS 64

/* Function Prototypes */
static void mem_init(void);
static void usb_driver_init(void);

/* Memory pool to store incoming/outgoing packets */
static memory_pool_t usb_mempool;

/* Mailbox for storing pointers to queued data */
static mailbox_t usb_tx_mailbox;
static mailbox_t usb_rx_mailbox;

/* Statically allocated memory used for the memory pool */
static volatile char usb_mempool_buffer[USB_MEMPOOL_ITEMS * sizeof(packet)]
                    __attribute__((aligned(sizeof(stkalign_t))))
                    __attribute__((section(".ram0")));

/* Statically allocated memory used for the queue in mailbox */
static volatile msg_t usb_rx_mailbox_buffer[USB_MEMPOOL_ITEMS]
                    __attribute__((section(".ram0")));
static volatile msg_t usb_tx_mailbox_buffer[USB_MEMPOOL_ITEMS]
                    __attribute__((section(".ram0")));




/* USB Serial TX Thread */
static THD_WORKING_AREA(waUSBTXThread, 4096);
static THD_FUNCTION(USBTXThread, arg) {

    (void)arg;
    
    /* Mailbox Variables */             
    msg_t mailbox_res;       
    intptr_t data_msg;

    /* Output Buffer */
    uint8_t* chars;
    uint8_t tx_buf[256];
    size_t tx_bufidx = 0;  
    
    /* Fetch Packets & Send over USB */
    while (true) {

        /* Wait for message to be avaliable */
        mailbox_res = chMBFetch(&usb_tx_mailbox, (msg_t*)&data_msg, MS2ST(50));

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

        /* TX Packet over USB */
        chnWrite(&SDU1, tx_buf, tx_bufidx);
        
        /* Free from Memory Pool */        
        chPoolFree(&usb_mempool, (void*)data_msg);
    }  
}


/* USB Serial RX Thread */
static THD_WORKING_AREA(waUSBRXThread, 4096);
static THD_FUNCTION(USBRXThread, arg) {

    (void)arg;
    
    /* Mailbox Variables */             
    void* msg;
    msg_t retval;    
    
    /* RX Buffer */
    uint8_t c;
    int rx_bufidx = 0;
    uint8_t rx_buf[128];
    bool packet_detect = false;

    /* Recieve Bytes over USB */
    while(true) {
        
        /* Attempt to Fetch Byte over USB */
        msg_t usb_fetch_res = chnGetTimeout(&SDU1, TIME_INFINITE);

        /* Handle Disconnected Cable */
        if(!(usb_fetch_res == MSG_RESET)){
            c = (uint8_t)usb_fetch_res;
        } else {
            chThdSleepMilliseconds(10000);
            continue;
        }
        
        /* Handle Start Byte */
        if(c == 0x7E) {
            rx_bufidx = 0;
            packet_detect = true;
            continue;
        }

        /* Handle Escape Character */
        if((c == 0x7D) && packet_detect) {
            c = chnGetTimeout(&SDU1, TIME_INFINITE) ^ 0x20;
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
            msg = chPoolAlloc(&usb_mempool);
            if (msg == NULL) continue;
            
            /* Copy the packet into the mempool */
            memcpy(msg, (void*)rx_buf, sizeof(packet));
            
            /* Post the location of the packet into the mailbox */
            retval = chMBPost(&usb_rx_mailbox, (intptr_t)msg, TIME_IMMEDIATE);
            if (retval != MSG_OK) {
                chPoolFree(&usb_mempool, msg);
                continue;
            }
        }
    }
}


/* Get a Packet Recieved over USB */
bool get_packet_usb(packet *pkt) {

    (void)pkt;

    msg_t mailbox_res;       
    intptr_t data_msg;

    /* Check for Recieved Packet */
    mailbox_res = chMBFetch(&usb_rx_mailbox, (msg_t*)&data_msg, MS2ST(50));

    /* Pass Recieved Packet if Avaliable */
    if (mailbox_res != MSG_OK || data_msg == 0) {
        return false;
    } else {
        memcpy((void*)pkt, (void*)data_msg, sizeof(packet));
        chPoolFree(&usb_mempool, (void*)data_msg);
        return true;
    }
}


/* Send a Packet over USB */
bool send_packet_usb(packet *pkt) {

    void* msg;
    msg_t retval;

    /* Allocate Space for Packet */
    msg = chPoolAlloc(&usb_mempool);
    if (msg == NULL) return false;
    
    /* Copy the packet into the mempool */
    memcpy(msg, (void*)pkt, sizeof(packet));
    
    /* Post the location of the packet into the mailbox */
    retval = chMBPost(&usb_tx_mailbox, (intptr_t)msg, TIME_IMMEDIATE);
    if (retval != MSG_OK) {
        chPoolFree(&usb_mempool, msg);
        return false;
    } else {
        return true;
    }
}


/* Initialise Mailboxes and Memorypool */
static void mem_init(void) {
    
    chMBObjectInit(&usb_tx_mailbox, (msg_t*)usb_tx_mailbox_buffer, USB_MEMPOOL_ITEMS);
    chMBObjectInit(&usb_rx_mailbox, (msg_t*)usb_rx_mailbox_buffer, USB_MEMPOOL_ITEMS);
    chPoolObjectInit(&usb_mempool, sizeof(packet), NULL);

    /* Fill Memory Pool with Statically Allocated Bits of Memory */
    chPoolLoadArray(&usb_mempool, (void*)usb_mempool_buffer, USB_MEMPOOL_ITEMS);
}


/* Initialise USB Driver */
static void usb_driver_init(void) {   

    /* Serial Driver Setup */
    sduObjectInit(&SDU1);
    sduStart(&SDU1, &serusbcfg);

    /* USB Setup */
    usbDisconnectBus(serusbcfg.usbp);
    chThdSleepMilliseconds(1500);
    usbStart(serusbcfg.usbp, &usbcfg);
    usbConnectBus(serusbcfg.usbp); 
    chThdSleepMilliseconds(1500);
}


/* Start USB Serial Thread */
void usbserial_init(void) {

    /* Initalise Memory & USB Driver */
    mem_init();
    usb_driver_init();

    /* Spawn TX & RX Threads */
    chThdCreateStatic(waUSBTXThread, sizeof(waUSBTXThread), NORMALPRIO, USBTXThread, NULL);
    chThdCreateStatic(waUSBRXThread, sizeof(waUSBRXThread), NORMALPRIO, USBRXThread, NULL);
}