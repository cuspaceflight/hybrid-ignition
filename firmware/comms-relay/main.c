#include "ch.h"
#include "hal.h"

#include "rs422.h"
#include "router.h"
#include "usbserial.h"


int main(void) {

    /* Allow debug access during WFI sleep */
    DBGMCU->CR |= DBGMCU_CR_DBG_SLEEP;

    /* Initialise ChibiOS */
    halInit();
    chSysInit();

    /* Initialise USB Serial */
    usbserial_init();

    /* Initialise RS422 */
    rs422_init(&SD3);

    /* Initialise Packet Router  */
    router_init();

    /* Ready LED */
    palSetLine(LINE_LED1);

    /* Status LED */
    while(true){
        palToggleLine(LINE_STATUS);
        chThdSleepMilliseconds(500);
    }

    /* Do Nothing */
    chThdSleep(TIME_INFINITE);
}
