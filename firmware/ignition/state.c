#include "ch.h"
#include "hal.h"

#include "state.h"
#include "analog.h"
#include "ltc4151.h"


/* State Machine Thread */
static THD_WORKING_AREA(waStateThread, 2048);
static THD_FUNCTION(StateThread, arg) {

    (void)arg;
    
    // analog tmp;
    // get_analog_values(&tmp);

    LTC4151 supply_sensor;
    ltc4151_init(&supply_sensor, &I2CD1, 0x6F, 0.1f);

    while(true){

        ltc4151_get_measurements(&supply_sensor);
        chThdSleepMilliseconds(200); 
    } 
    
}



/* Start State Machine Thread */
void state_init(void) {
    chThdCreateStatic(waStateThread, sizeof(waStateThread), NORMALPRIO, StateThread, NULL);
}