#include <string.h>
#include "ch.h"
#include "hal.h"
#include "usbcfg.h"
#include "usbserial.h"

static volatile bool usb_setup = false;

static THD_WORKING_AREA(usbserial_thd_wa, 4096);
static THD_FUNCTION(usbserial_thd, arg)
{
    (void)arg;

    palSetLine(LINE_LED1);

    /* Serial Driver Setup */
    sduObjectInit(&SDU1);
    sduStart(&SDU1, &serusbcfg);

    /* USB Setup */
    usbDisconnectBus(serusbcfg.usbp);
    chThdSleepMilliseconds(1500);
    usbStart(serusbcfg.usbp, &usbcfg);
    usbConnectBus(serusbcfg.usbp); 
    chThdSleepMilliseconds(1500);
    
    palSetLine(LINE_LED2);
    usb_setup = true;

    
    uint8_t buf1[128];

    for(size_t i=0; i<128; i++) {
        uint8_t c = chnGetTimeout(&SDU1, TIME_INFINITE);
        buf1[i] = c;
    }


    palSetLine(LINE_STATUS);

    while(true) {
        uint8_t test[1];
        test[0] = buf1[0];
        usbserial_send(test, 1);
        chThdSleepMilliseconds(1000);
    }
}

void usbserial_init(void)
{
    chThdCreateStatic(usbserial_thd_wa, sizeof(usbserial_thd_wa),
                      NORMALPRIO, usbserial_thd, NULL);
}

void usbserial_send(uint8_t* data, size_t len)
{
    uint8_t buf[64];
    size_t bufidx = 0;
    chDbgAssert(len<sizeof(buf), "usbserial_send: len too big");
    for(size_t i=0; i<len; i++) {
        uint8_t c = data[i];
        buf[bufidx++] = c;
    }

    while(usb_setup != true) {
        chThdSleepMilliseconds(10);
    }

    chnWrite(&SDU1, buf, bufidx);
}