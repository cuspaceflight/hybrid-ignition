#include "ch.h"
#include "hal.h"


int main(void) {

    /* Allow debug access during WFI sleep */
    DBGMCU->CR |= DBGMCU_CR_DBG_SLEEP;

    /* Initialise ChibiOS */
    halInit();
    chSysInit();

    palSetLine(LINE_STATUS);
    palSetLine(LINE_LED2);
    palSetLine(LINE_LED1);
}
