#include "ch.h"
#include "hal.h"

#include "analog.h"
#include "state.h"


/* State Machine Thread */
static THD_WORKING_AREA(waStateThread, 2048);
static THD_FUNCTION(StateThread, arg) {

    (void)arg;
    
    analog tmp;

    while(true){
    
        get_analog_values(&tmp);
        chThdSleepMilliseconds(500);
    }
    
}



/* Start State Machine Thread */
void state_init(void) {
    chThdCreateStatic(waStateThread, sizeof(waStateThread), NORMALPRIO, StateThread, NULL);
}