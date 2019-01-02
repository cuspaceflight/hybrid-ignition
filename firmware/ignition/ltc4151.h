#ifndef LTC4151_H
#define LTC4151_H

#include "ch.h"
#include "hal.h"

#define LTC4151_ADDR_SUPPLY   0x6F
#define LTC4151_ADDR_CH1      0x6F
#define LTC4151_ADDR_CH2      0x69
#define LTC4151_ADDR_CH3      0x67
#define LTC4151_ADDR_CH4      0x6C
#define LTC4151_ADDR_CH5      0x6B

typedef struct {
  I2CDriver *i2c;
  i2caddr_t address;
  float rsense_ohms;
} LTC4151Config;

typedef struct {
  LTC4151Config config;
  float voltage_v;
  float aux_voltage_v;
  float current_ma;
  float power_w;
} LTC4151;

void ltc4151_init_bus(void);
bool ltc4151_get_measurements(LTC4151 *ltc);
void ltc4151_init(LTC4151 *ltc, I2CDriver *i2c, i2caddr_t address, float sense_resistor);

#endif
