#include "ch.h"
#include "hal.h"

#include "state.h"

int main(void) {

    /* Allow debug access during WFI sleep */
    DBGMCU->CR |= DBGMCU_CR_DBG_SLEEP;

    /* Initialise ChibiOS */
    halInit();
    chSysInit();

    chThdSleepMilliseconds(1000);    
    palSetLine(LINE_ARM_SUPPLY);
    chThdSleepMilliseconds(10);  

    state_init();

    while(true){
        palToggleLine(LINE_STATUS);
        chThdSleepMilliseconds(500);
    }

    /* Do Nothing */
    chThdSleep(TIME_INFINITE);
}
