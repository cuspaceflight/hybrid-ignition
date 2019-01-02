#include "ch.h"
#include "hal.h"

#include "state.h"
#include "analog.h"
#include "ltc4151.h"


/* State Machine Thread */
static THD_WORKING_AREA(waStateThread, 2048);
static THD_FUNCTION(StateThread, arg) {

    (void)arg;
    
    analog tmp;    

    /* Initilise LTC4151 Devices */
    LTC4151 ltc_supply, ltc_ch1, ltc_ch2, ltc_ch3, ltc_ch4, ltc_ch5;
    ltc4151_init(&ltc_supply, &I2CD1, LTC4151_ADDR_SUPPLY, 0.01f);
    ltc4151_init(&ltc_ch1, &I2CD2, LTC4151_ADDR_CH1, 0.05f);
    ltc4151_init(&ltc_ch2, &I2CD2, LTC4151_ADDR_CH2, 0.05f);
    ltc4151_init(&ltc_ch3, &I2CD2, LTC4151_ADDR_CH3, 0.05f);
    ltc4151_init(&ltc_ch4, &I2CD2, LTC4151_ADDR_CH4, 0.05f);
    ltc4151_init(&ltc_ch5, &I2CD2, LTC4151_ADDR_CH5, 0.05f);

    while(true){

        ltc4151_get_measurements(&ltc_supply);
        ltc4151_get_measurements(&ltc_ch1);
        ltc4151_get_measurements(&ltc_ch2);
        ltc4151_get_measurements(&ltc_ch3);
        ltc4151_get_measurements(&ltc_ch4);
        ltc4151_get_measurements(&ltc_ch5);
        get_analog_values(&tmp);
        chThdSleepMilliseconds(200); 
    } 
    
}



/* Start State Machine Thread */
void state_init(void) {
    chThdCreateStatic(waStateThread, sizeof(waStateThread), NORMALPRIO, StateThread, NULL);
}