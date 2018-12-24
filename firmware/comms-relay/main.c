#include "ch.h"
#include "hal.h"

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

    /* Initialise Packet Router  */
    router_init();

    /* Do Nothing */
    chThdSleep(TIME_INFINITE);
}
