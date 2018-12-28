#ifndef LTC4151_H
#define LTC4151_H

#include "ch.h"
#include "hal.h"

typedef struct {
  I2CDriver *i2c;
  i2caddr_t address;
  float rsense_ohms;
} LTC4151Config;

typedef struct {
  LTC4151Config config;
  float voltage_v;
  float aux_voltage_v;
  float current_a;
  float power_w;
} LTC4151;

void ltc4151_init(LTC4151 *ltc, I2CDriver *i2c, i2caddr_t address, float sense_resistor);
bool ltc4151_read(LTC4151 *ltc);

#endif
