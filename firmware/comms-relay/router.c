#include "ch.h"
#include "hal.h"

#include <string.h>

#include "rs422.h"
#include "router.h"
#include "packets.h"
#include "usbserial.h"


/* Packet Router Thread */
static THD_WORKING_AREA(waRouterThread, 2048);
static THD_FUNCTION(RouterThread, arg) {

    (void)arg;
    
    packet tmp_data; 
    
    while(true){


        if(get_packet_usb(&tmp_data)){
            send_packet_rs422(&tmp_data);
        }

        if(get_packet_rs422(&tmp_data)){
            send_packet_usb(&tmp_data);
        }
    }
}



/* Start Packet Router Thread */
void router_init(void) {
    chThdCreateStatic(waRouterThread, sizeof(waRouterThread), NORMALPRIO, RouterThread, NULL);
}