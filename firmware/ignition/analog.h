#ifndef ANALOG_H_
#define ANALOG_H_

/* N.B. For STM32F42/3x VBAT & TEMP share ADC1_IN18  */

#define CHANNEL_OPEN    0x00
#define CHANNEL_SHORT   0xFF
#define CHANNEL_FIRING  0xAA

/* Analog Measurements Struct */
typedef struct __attribute__((packed)) {

    /* 24v PSU Voltage */
    float       psu_voltage;

    /* Channel Continuity */
    uint32_t    ch_cont_voltage[5];
    uint8_t     ch_cont[5];

    /* MCU Temp */
    float    mcu_temp;

} analog;

/* Setup ADC */
void init_analog(void);

/* ADC Conversion */
void get_analog_values(analog *vals);

#endif