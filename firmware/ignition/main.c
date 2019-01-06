#include "ch.h"
#include "hal.h"

#include "uart.h"
#include "state.h"
#include "analog.h"
#include "ltc4151.h"

int main(void) {

    /* Allow debug access during WFI sleep */
    DBGMCU->CR |= DBGMCU_CR_DBG_SLEEP;

    /* Initialise ChibiOS */
    halInit();
    chSysInit();

    chThdSleepMilliseconds(1000);    
    palSetLine(LINE_ARM_SUPPLY);

    /* Initialise UART */
    uart_init(&SD1);

    /* Initialise ADC */
    analog_init();

    /* Initialise LTC4151 Bus */
    ltc4151_init_bus();

    /* Initialise State Machine */
    state_init();

    /* Status LED */
    while(true){
        palToggleLine(LINE_STATUS);
        chThdSleepMilliseconds(500);
    }

    /* Do Nothing */
    chThdSleep(TIME_INFINITE);
}
