#include "ch.h"
#include "hal.h"

#include "valves.h"
#include "packets.h"


void set_valves(valve_state *state){

    /* Channel 1 */
    if(state->ch_state[0] == VALVE_STATE_ON){
        palSetLine(LINE_CH1_FIRE);
    } else {
        palClearLine(LINE_CH1_FIRE);
    }

    /* Channel 2 */
    if(state->ch_state[1] == VALVE_STATE_ON){
        palSetLine(LINE_CH2_FIRE);
    } else {
        palClearLine(LINE_CH2_FIRE);
    }

    /* Channel 3 */
    if(state->ch_state[2] == VALVE_STATE_ON){
        palSetLine(LINE_CH3_FIRE);
    } else {
        palClearLine(LINE_CH3_FIRE);
    }

    /* Channel 4 */
    if(state->ch_state[3] == VALVE_STATE_ON){
        palSetLine(LINE_CH4_FIRE);
    } else {
        palClearLine(LINE_CH4_FIRE);
    }

    /* Channel 5 */
    if(state->ch_state[4] == VALVE_STATE_ON){
        palSetLine(LINE_CH5_FIRE);
    } else {
        palClearLine(LINE_CH5_FIRE);
    }

}