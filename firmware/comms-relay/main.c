#include "ch.h"
#include "hal.h"

#include "usbserial.h"


int main(void) {

    /* Allow debug access during WFI sleep */
    DBGMCU->CR |= DBGMCU_CR_DBG_SLEEP;

    /* Initialise ChibiOS */
    halInit();
    chSysInit();

    usbserial_init();

    chThdSleep(TIME_INFINITE);
}
