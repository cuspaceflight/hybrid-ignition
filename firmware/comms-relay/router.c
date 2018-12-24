#include "ch.h"
#include "hal.h"

#include <string.h>

#include "router.h"
#include "packets.h"
#include "usbserial.h"




/* Packet Router Thread */
static THD_WORKING_AREA(waRouterThread, 2048);
static THD_FUNCTION(RouterThread, arg) {

    (void)arg;

    packet tmp_data;
    
    while(true){

        /* USB Loopback Test */
        if(get_packet_usb(&tmp_data)){
            palSetLine(LINE_LED2);
            send_packet_usb(&tmp_data);
        }
        chThdSleepMilliseconds(500);
        palClearLine(LINE_LED2);        
    }
}





/* Start Packet Router Thread */
void router_init(void) {
    chThdCreateStatic(waRouterThread, sizeof(waRouterThread), NORMALPRIO, RouterThread, NULL);
}