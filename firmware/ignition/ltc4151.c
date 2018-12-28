#include "ch.h"
#include "hal.h"

#include "ltc4151.h"

/* Register Addresses */
#define LTC4151_REG_SENSE_HI     0x00
#define LTC4151_REG_SENSE_LO     0x01
#define LTC4151_REG_VIN_HI       0x02
#define LTC4151_REG_VIN_LO       0x03
#define LTC4151_REG_AUX_HI       0x04
#define LTC4151_REG_AUX_LO       0x05

#define LTC4151_SENSE_SCALE_MV  (0.02f)
#define LTC4151_VIN_SCALE_V     (0.025f)


/* I2C Config for LTC4151 */
static const I2CConfig i2c_cfg = {
  .opmode = OPMODE_I2C,
  .clock_speed = 100000,
  .duty_cycle = STD_DUTY_CYCLE,
};


/* Initialise LTC4151 Device  */
void ltc4151_init(LTC4151 *ltc, I2CDriver *i2c, i2caddr_t address, float sense_resistor){
  
  ltc->config.i2c = i2c;
  ltc->config.address = address;
  ltc->config.rsense_ohms = sense_resistor;

  ltc->voltage_v = 0;
  ltc->current_a = 0;
  ltc->power_w = 0;
  ltc->aux_voltage_v = 0;
}


/* Read Values from LTC4151 Device */
bool ltc4151_read(LTC4151 *ltc){


  uint16_t dat_le, dat;
  if(smbus_read_word(ltc->config.i2c, ltc->config.address, LTC4151_RA_SENSE_HI, &dat_le) != 0){
    return ERR_COMMS;
  }
  // This reads in the wrong endianness, so swap it:
  dat = ((dat_le & 0xff) << 8) | ((dat_le & 0xff00) >> 8);
  float mv = ((dat >> 4) & 0x0fff) * LTC4151_SENSE_SCALE_MV;
  ltc->current_ma = mv / ltc->config.rsense_ohms;

  if(smbus_read_word(ltc->config.i2c, ltc->config.address, LTC4151_RA_VIN_HI, &dat_le) != 0){
    return ERR_COMMS;
  }
  dat = ((dat_le & 0xff) << 8) | ((dat_le & 0xff00) >> 8);
  ltc->voltage_v = ((dat >> 4) & 0x0fff) * LTC4151_VIN_SCALE_V;

  ltc->power_mw = ltc->voltage_v * ltc->current_ma;



  return true;
}
