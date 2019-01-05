#ifndef VALVES_H_
#define VALVES_H_

typedef struct __attribute__((packed)) {

    uint8_t     ch_state[5]; 
    
} valve_state;

void set_valves(valve_state *state);

#endif