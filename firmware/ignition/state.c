#include "ch.h"
#include "hal.h"

#include <string.h>

#include "uart.h"
#include "state.h"
#include "analog.h"
#include "valves.h"
#include "packets.h"
#include "ltc4151.h"
#include "checksum.h"

#define PSU_LDO_THRESH  20000

/* Global Variables */
static uint8_t bank_id = 0;
analog analog_readings;
valve_state valves;
LTC4151 ltc_supply, ltc_ch[5];

/* Uplink Parameters */
systime_t last_packet = 0;
const int upload_int_ms = 200;

/* State Machine Definitions */
typedef enum {
    STATE_INIT=0, STATE_ISOLATED, STATE_SAFE, STATE_ARMED, NUM_STATES
} state_t;

typedef state_t state_func_t(void);

/* State Functions */
state_t run_state(state_t cur_state);
static state_t do_state_init(void);
static state_t do_state_isolated(void);
static state_t do_state_safe(void);
static state_t do_state_armed(void);

/* State Table */
state_func_t* const state_table[NUM_STATES] = {
    do_state_init, do_state_isolated, do_state_safe, do_state_armed
};

/* State Table Lookup */
state_t run_state(state_t cur_state){
    return state_table[cur_state]();
};



/* STATE 1 - Initialisation */
static state_t do_state_init(void){
    
    /* Clear Arming LED */
    palClearLine(LINE_ARM_GRN);
    palClearLine(LINE_ARM_RED);

    /* Turn Off all Valves */
    for(int i=0; i<5; i++){
        valves.ch_state[i] = VALVE_STATE_OFF;
    }
    set_valves(&valves);

    /* De-Energize Firing Bus */
    palClearLine(LINE_ARM_SUPPLY);

    /* Initialise LTC4151 Devices */
    ltc4151_init(&ltc_supply, &I2CD1, LTC4151_ADDR_SUPPLY, 0.01f);
    ltc4151_init(&ltc_ch[0], &I2CD2, LTC4151_ADDR_CH1, 0.05f);
    ltc4151_init(&ltc_ch[1], &I2CD2, LTC4151_ADDR_CH2, 0.05f);
    ltc4151_init(&ltc_ch[2], &I2CD2, LTC4151_ADDR_CH3, 0.05f);
    ltc4151_init(&ltc_ch[3], &I2CD2, LTC4151_ADDR_CH4, 0.05f);
    ltc4151_init(&ltc_ch[4], &I2CD2, LTC4151_ADDR_CH5, 0.05f);

    /* Find Myself */
    packet config_packet;
    while(bank_id == 0){
        if(get_packet(&config_packet)){
            if((config_packet.packet_type == PACKET_CONFIG) && (is_valid(&config_packet))){
                bank_id = config_packet.payload[0];
            }
        }
    }

    return STATE_ISOLATED;
}



/* STATE 2 - Isolated (e.g. Key Switch in SAFE Position) */
static state_t do_state_isolated(void){
    
    /* NO 24V SUPPLY IN THIS STATE */

    /* Clear Arming LED */
    palClearLine(LINE_ARM_GRN);
    palClearLine(LINE_ARM_RED);

    /* Turn Off all Valves */
    for(int i=0; i<5; i++){
        valves.ch_state[i] = VALVE_STATE_OFF;
    }
    set_valves(&valves);

    /* De-Energize Firing Bus */
    palClearLine(LINE_ARM_SUPPLY);

    /* Flush Any Packets */
    packet tmp;
    get_packet(&tmp);

    /* Take Analog Measurements */
    get_analog_values(&analog_readings);

    /* Upload Bank & Channel Status */
    if((chVTGetSystemTime() - last_packet) > MS2ST(upload_int_ms)){

        /* BANK STATUS PACKET */
        packet bank_status_pkt;
        payload_bank_status bank_data;

        /* Populate Payload Data */
        bank_data.bank = bank_id;
        bank_data.state = BANK_STATE_ISOLATED;
        bank_data.mcu_temp = analog_readings.mcu_temp;
        bank_data.psu_voltage = analog_readings.psu_voltage;
        bank_data.firing_bus_voltage = 0;
        bank_data.firing_bus_current = 0;

        /* Populate Bank Status Packet */
        memset(&bank_status_pkt, 0, sizeof(packet));
        bank_status_pkt.packet_type = PACKET_BANK_STATUS;
        bank_status_pkt.timestamp = chVTGetSystemTime();
        memcpy(bank_status_pkt.payload, &bank_data, sizeof(payload_bank_status));
        bank_status_pkt.checksum = fletcher_32(&bank_status_pkt);

        /* Send Bank Status Packet */
        send_packet(&bank_status_pkt);


        /* CHANNEL STATUS PACKET */
        packet channel_status_pkt;
        payload_channel_status channel_data;

        /* Populate Payload Data */
        channel_data.bank = bank_id;
        for(int j=0; j<5; j++){
            channel_data.ch_data[j].state = valves.ch_state[j];
            channel_data.ch_data[j].firing_bus_voltage = 0;
            channel_data.ch_data[j].output_voltage = 0;
            channel_data.ch_data[j].output_current = 0;
            channel_data.ch_data[j].continuity = analog_readings.ch_cont[j];
        }

        /* Populate Channel Status Packet */
        memset(&channel_status_pkt, 0, sizeof(packet));
        channel_status_pkt.packet_type = PACKET_CHANNEL_STATUS;
        channel_status_pkt.timestamp = chVTGetSystemTime();
        memcpy(channel_status_pkt.payload, &channel_data, sizeof(payload_channel_status));
        channel_status_pkt.checksum = fletcher_32(&channel_status_pkt);

        /* Send Channel Status Packet */
        send_packet(&channel_status_pkt);

        /* Time of Last Packet TX */
        last_packet = chVTGetSystemTime();
    }


    /* Detect Ket Switch and Switch State */
    if(analog_readings.psu_voltage > PSU_LDO_THRESH){
        return STATE_SAFE;
    } else {
        return STATE_ISOLATED;
    }
}



/* STATE 3 - Safe (e.g. Key Switch in ARM Position) */
static state_t do_state_safe(void){

    /* 24V READY TO BE SWITCHED TO FIRING BUS */

    /* Set Arming LED RED */
    palClearLine(LINE_ARM_GRN);
    palSetLine(LINE_ARM_RED);

    /* Turn Off all Valves */
    for(int i=0; i<5; i++){
        valves.ch_state[i] = VALVE_STATE_OFF;
    }
    set_valves(&valves);

    /* De-Energize Firing Bus */
    palClearLine(LINE_ARM_SUPPLY);
    
    /* Take Analog Measurements */
    get_analog_values(&analog_readings);

    /* Read Supply LTC4151 */
    ltc4151_get_measurements(&ltc_supply);




    /* Check for Bank Status Commands & Switch to Desired State */
    packet cmd_pkt;
    payload_command cmd;
    cmd_data_bank_state cmd_bank_data;
    if(get_packet(&cmd_pkt)){
        if((cmd_pkt.packet_type == PACKET_COMMAND) && (is_valid(&cmd_pkt))){
            memcpy(&cmd, cmd_pkt.payload, sizeof(payload_command));
            if(cmd.command == COMMAND_BANK_STATE){
                memcpy(&cmd_bank_data, cmd.data, sizeof(cmd_data_bank_state));
                if(cmd_bank_data.bank == bank_id){
                    switch(cmd_bank_data.state){
                        case BANK_STATE_ARMED:
                            return STATE_ARMED; 
                            break;
                        case BANK_STATE_SAFE:
                            return STATE_SAFE;
                            break;
                    } 
                }
            }
        }
    }

    /* E-Stop Detection */
    if(analog_readings.psu_voltage < PSU_LDO_THRESH){
        return STATE_ISOLATED;
    } else {
        return STATE_SAFE;
    }
}



static state_t do_state_armed(void){
    
    /* Set Arming LED GREEN */
    palSetLine(LINE_ARM_GRN);
    palClearLine(LINE_ARM_RED);
    
    return STATE_ARMED;
}


/* State Machine Thread */
static THD_WORKING_AREA(waStateThread, 2048);
static THD_FUNCTION(StateThread, arg) {

    (void)arg;
    
    
    /* Initilise State Machine */
    state_t cur_state = STATE_INIT;

    /* Tick State Machine */
    while(true){

      /* Run Current State */
      cur_state = run_state(cur_state);

      /* Tick Every 5ms */
      chThdSleepMilliseconds(5);
    }
    
}


/* Start State Machine Thread */
void state_init(void) {
    chThdCreateStatic(waStateThread, sizeof(waStateThread), NORMALPRIO, StateThread, NULL);
}