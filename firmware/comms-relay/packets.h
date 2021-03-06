#ifndef PACKET_H
#define PACKET_H

#define PACKET_COMMAND              0x00
#define PACKET_CHANNEL_STATUS       0x01
#define PACKET_BANK_STATUS          0x02
#define PACKET_CONFIG               0x03

#define COMMAND_BANK_STATE          0xF0
#define COMMAND_VALVE_STATE         0xF1

#define VALVE_STATE_ON              0x10
#define VALVE_STATE_OFF             0x1F

#define BANK_STATE_ARMED            0x1D
#define BANK_STATE_SAFE             0x12
#define BANK_STATE_ISOLATED         0x16

#define BANK_A                      0xA0
#define BANK_B                      0xB0

#define BANK_A_CH1                  0xA1
#define BANK_A_CH2                  0xA2
#define BANK_A_CH3                  0xA3
#define BANK_A_CH4                  0xA4
#define BANK_A_CH5                  0xA5

#define BANK_B_CH1                  0xB1
#define BANK_B_CH2                  0xB2
#define BANK_B_CH3                  0xB3
#define BANK_B_CH4                  0xB4
#define BANK_B_CH5                  0xB5



/* PACKET STRUCTURE [128 Bytes] */
typedef struct __attribute__((packed)) {

    uint8_t     packet_type;
    uint8_t     reserved[3];
    systime_t   timestamp;
    uint8_t     payload[116];
    uint32_t    checksum;
    
} packet;



/*    COMMANDS    */


/* PACKET PAYLOAD - Command */
typedef struct __attribute__((packed)) {

    uint8_t     command;
    uint8_t     data[115];
    
} payload_command;

/* COMMAND DATA - Bank State */
typedef struct __attribute__((packed)) {

    uint8_t     bank;
    uint8_t     state;
    
} cmd_data_bank_state;

/* COMMAND DATA - Valve State */
typedef struct __attribute__((packed)) {

    uint8_t     valve;
    uint8_t     state;
    
} cmd_data_valve_state;



/*    BANK STATUS    */


/* PACKET PAYLOAD - Bank Status */
typedef struct __attribute__((packed)) {

    uint8_t     bank;
    uint8_t     state;

    float    mcu_temp;

    float    psu_voltage;
    float    firing_bus_voltage;
    float    firing_bus_current;    
    
} payload_bank_status;



/*    CHANNEL STATUS    */


/* CHANNEL DATA */
typedef struct __attribute__((packed)) {

    uint8_t     state;
    float       firing_bus_voltage;
    float       output_voltage;
    float       output_current;
    uint8_t     continuity;
    
} channel_status;


/* PACKET PAYLOAD - Channel Status */
typedef struct __attribute__((packed)) {

    uint8_t         bank;
    channel_status  ch_data[5];
    
} payload_channel_status;



/*    CONFIG    */


/* PACKET PAYLOAD - Config */
typedef struct __attribute__((packed)) {

    uint8_t     bank; 
    
} payload_config;


#endif