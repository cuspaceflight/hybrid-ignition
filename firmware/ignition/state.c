#include "ch.h"
#include "hal.h"

#include "uart.h"
#include "state.h"
#include "analog.h"
#include "valves.h"
#include "packets.h"
#include "ltc4151.h"
#include "checksum.h"



/* State Machine Thread */
static THD_WORKING_AREA(waStateThread, 2048);
static THD_FUNCTION(StateThread, arg) {

    (void)arg;
    
    analog tmp;

    packet data;

    valve_state valves;
    valves.ch_state[0] = VALVE_STATE_ON;
    valves.ch_state[1] = VALVE_STATE_OFF;
    valves.ch_state[2] = VALVE_STATE_ON;
    valves.ch_state[3] = VALVE_STATE_OFF;
    valves.ch_state[4] = VALVE_STATE_ON;
    set_valves(&valves);


    /* Initilise LTC4151 Devices */
    LTC4151 ltc_supply, ltc_ch[5];
    ltc4151_init(&ltc_supply, &I2CD1, LTC4151_ADDR_SUPPLY, 0.01f);
    ltc4151_init(&ltc_ch[0], &I2CD2, LTC4151_ADDR_CH1, 0.05f);
    ltc4151_init(&ltc_ch[1], &I2CD2, LTC4151_ADDR_CH2, 0.05f);
    ltc4151_init(&ltc_ch[2], &I2CD2, LTC4151_ADDR_CH3, 0.05f);
    ltc4151_init(&ltc_ch[3], &I2CD2, LTC4151_ADDR_CH4, 0.05f);
    ltc4151_init(&ltc_ch[4], &I2CD2, LTC4151_ADDR_CH5, 0.05f);



    while(true){

        ltc4151_get_measurements(&ltc_supply);
        ltc4151_get_measurements(&ltc_ch[0]);
        ltc4151_get_measurements(&ltc_ch[1]);
        ltc4151_get_measurements(&ltc_ch[2]);
        ltc4151_get_measurements(&ltc_ch[3]);
        ltc4151_get_measurements(&ltc_ch[4]);
        get_analog_values(&tmp);

        if(get_packet(&data)){
            palSetLine(LINE_ARM_GRN);
            uint32_t test = fletcher_32(&data);
            if(test == data.checksum){
                palClearLine(LINE_ARM_GRN);
            }
        }

        chThdSleepMilliseconds(10);
    } 
    
}



/* Start State Machine Thread */
void state_init(void) {
    chThdCreateStatic(waStateThread, sizeof(waStateThread), NORMALPRIO, StateThread, NULL);
}