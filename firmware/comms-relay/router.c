#include "ch.h"
#include "hal.h"

#include <string.h>

#include "router.h"
#include "packets.h"
#include "usbserial.h"


/* Serial Setup 
static SerialDriver* rs422_seriald;
static SerialConfig serial_cfg = {
    .speed = 115200,
    .cr1 = 0,
    .cr2 = 0,
    .cr3 = 0,
}; */


/* Packet Router Thread */
static THD_WORKING_AREA(waRouterThread, 2048);
static THD_FUNCTION(RouterThread, arg) {

    (void)arg;
    
    packet tmp_data;

    //rs422_seriald = &SD3;
    //sdStart(rs422_seriald, &serial_cfg);
    
    
    while(true){

        palToggleLine(LINE_STATUS);

        /* USB Loopback Test */
        if(get_packet_usb(&tmp_data)){
            send_packet_usb(&tmp_data);
        }
        //sdWrite(rs422_seriald, buff, 3);
    }
}




/* Start Packet Router Thread */
void router_init(void) {
    chThdCreateStatic(waRouterThread, sizeof(waRouterThread), HIGHPRIO, RouterThread, NULL);
}