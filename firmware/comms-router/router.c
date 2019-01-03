#include "ch.h"
#include "hal.h"

#include <string.h>

#include "rs422.h"
#include "uart_a.h"
#include "uart_b.h"
#include "router.h"
#include "packets.h"
#include "usbserial.h"

void send_packet_to_bank(packet *pkt);
uint8_t get_destination(packet *pkt);


/* Packet Router Thread */
static THD_WORKING_AREA(waRouterThread, 2048);
static THD_FUNCTION(RouterThread, arg) {

    (void)arg;
    
    packet tmp_data; 
    
    while(true){


        if(get_packet_usb(&tmp_data)){
            send_packet_to_bank(&tmp_data);
        }

        if(get_packet_rs422(&tmp_data)){
            send_packet_to_bank(&tmp_data);
        }

        // TODO - Bottleneck in get_packet

        /*if(get_packet_bank_a(&tmp_data)){
            send_packet_rs422(&tmp_data);
            //send_packet_usb(&tmp_data);
        }
        
        if(get_packet_bank_b(&tmp_data)){
            send_packet_rs422(&tmp_data);
            //send_packet_usb(&tmp_data);
        }*/

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


/* Start Packet Router Thread */
void router_init(void) {
    chThdCreateStatic(waRouterThread, sizeof(waRouterThread), HIGHPRIO, RouterThread, NULL);
}