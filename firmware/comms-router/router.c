#include "ch.h"
#include "hal.h"

#include <string.h>

#include "rs422.h"
#include "uart_a.h"
#include "uart_b.h"
#include "router.h"
#include "packets.h"
#include "checksum.h"
#include "usbserial.h"

/* Prototypes */
void broadcast_bank_ids(void);
void send_packet_to_bank(packet *pkt);
uint8_t get_destination(packet *pkt);


/* Packet Router Thread */
static THD_WORKING_AREA(waRouterThread, 2048);
static THD_FUNCTION(RouterThread, arg) {

    (void)arg;
    
    systime_t time = chVTGetSystemTime();
    packet tmp_data; 
    
    while(true){       

        if(get_packet_usb(&tmp_data)){
            send_packet_to_bank(&tmp_data);
        }

        if(get_packet_rs422(&tmp_data)){
            send_packet_to_bank(&tmp_data);
        }

        if(get_packet_bank_a(&tmp_data)){
            send_packet_rs422(&tmp_data);
            send_packet_usb(&tmp_data);
        }
        
        if(get_packet_bank_b(&tmp_data)){
            send_packet_rs422(&tmp_data);
            send_packet_usb(&tmp_data);
        }

        if((chVTGetSystemTime()-time) > MS2ST(10000)){
            time = chVTGetSystemTime();
            broadcast_bank_ids();
        }

    }
}


/* Send Packet to Intended Bank */
void send_packet_to_bank(packet *pkt){

    switch(get_destination(pkt)){

        case BANK_A:

            send_packet_bank_a(pkt);  
            break;

        case BANK_B:
            
            send_packet_bank_b(pkt);
            break;
    } 

}


/* Extract Destination from Packet */
uint8_t get_destination(packet *pkt){

    /* Check Packet is a Command */
    if(!(pkt->packet_type == PACKET_COMMAND)){
        return 0;
    }

    /* Extract Payload */
    payload_command cmd;
    memcpy(&cmd, pkt->payload, sizeof(payload_command));

    cmd_data_bank_state cmd_bank_data;
    cmd_data_valve_state cmd_valve_data;

    /* Extract Bank ID */
    switch(cmd.command) {

        case COMMAND_BANK_STATE:
            
            memcpy(&cmd_bank_data, cmd.data, sizeof(cmd_data_bank_state));
            return cmd_bank_data.bank;
            break;

        case COMMAND_VALVE_STATE:

            memcpy(&cmd_valve_data, cmd.data, sizeof(cmd_data_valve_state));
            return cmd_valve_data.valve & 0xF0;
            break;

        default:
            return 0;
    }    
}


/* Broadcast Bank IDs */
void broadcast_bank_ids(void){

    packet bank_a_id, bank_b_id;
    payload_config bank_a_payload, bank_b_payload;

    bank_a_id.packet_type = PACKET_CONFIG;
    bank_b_id.packet_type = PACKET_CONFIG;

    bank_a_id.timestamp = chVTGetSystemTime();
    bank_b_id.timestamp = chVTGetSystemTime();

    bank_a_payload.bank = BANK_A;
    bank_b_payload.bank = BANK_B;

    memcpy(bank_a_id.payload, &bank_a_payload, sizeof(payload_config));
    memcpy(bank_b_id.payload, &bank_b_payload, sizeof(payload_config));

    bank_a_id.checksum = fletcher_32(&bank_a_id);
    bank_b_id.checksum = fletcher_32(&bank_b_id);

    send_packet_bank_a(&bank_a_id);
    send_packet_bank_b(&bank_b_id);
}



/* Start Packet Router Thread */
void router_init(void) {
    chThdCreateStatic(waRouterThread, sizeof(waRouterThread), NORMALPRIO, RouterThread, NULL);
}