#include "ch.h"
#include "hal.h"

#include "ltc4151.h"

/* LTC4151 Register Addresses */
#define LTC4151_REG_SENSE_HI	0x00
#define LTC4151_REG_SENSE_LO    0x01
#define LTC4151_REG_VIN_HI      0x02
#define LTC4151_REG_VIN_LO      0x03
#define LTC4151_REG_AUX_HI      0x04
#define LTC4151_REG_AUX_LO      0x05

#define LTC4151_VAL_SENSE		0x00
#define LTC4151_VAL_VIN			0x02
#define LTC4151_VAL_AUX			0x04

#define LTC4151_SENSE_SCALE_MV  (0.02f)
#define LTC4151_VIN_SCALE_V     (0.025f)
#define LTC4151_AUX_SCALE_V    	(0.0005f)
#define LTC4151_AUX_DIV_SCALE	12

uint16_t ltc4151_read_value(LTC4151 *ltc, uint8_t val);

/* I2C Config for LTC4151 */
static const I2CConfig i2c_cfg = {
	.op_mode = OPMODE_I2C,
	.clock_speed = 100000,
	.duty_cycle = STD_DUTY_CYCLE,
};


/* Initialise I2C Buses */
void ltc4151_init_bus(void){
	i2cStart(&I2CD1, &i2c_cfg);
	i2cStart(&I2CD2, &i2c_cfg);
}


/* Initialise LTC4151 Device  */
void ltc4151_init(LTC4151 *ltc, I2CDriver *i2c, i2caddr_t address, float sense_resistor){
	
	ltc->config.i2c = i2c;
	ltc->config.address = address;
	ltc->config.rsense_ohms = sense_resistor;

	ltc->voltage_v = 0;
	ltc->current_ma = 0;
	ltc->power_w = 0;
	ltc->aux_voltage_v = 0;
}


/* Get Measurments from LTC4151 Device */
bool ltc4151_get_measurements(LTC4151 *ltc){

	uint16_t voltage_val = ltc4151_read_value(ltc, LTC4151_VAL_VIN);
	uint16_t sense_val = ltc4151_read_value(ltc, LTC4151_VAL_SENSE);
	uint16_t aux_val = ltc4151_read_value(ltc, LTC4151_VAL_AUX);

	/* Supply Voltage */
	ltc->voltage_v = voltage_val*LTC4151_VIN_SCALE_V;

	/* Supply Current */
	ltc->current_ma = (sense_val*LTC4151_SENSE_SCALE_MV)/ltc->config.rsense_ohms;

	/* Auxilary Voltage - (Reffered to Input of Voltage Divider) */
	ltc->aux_voltage_v = (aux_val*LTC4151_AUX_SCALE_V)*LTC4151_AUX_DIV_SCALE;

	/* Power */
	ltc->power_w = ltc->voltage_v*(ltc->current_ma/1000);

	return true;
}

/* Read LTC4151 Value */
uint16_t ltc4151_read_value(LTC4151 *ltc, uint8_t val){

	uint16_t result;
	uint8_t data_high, data_low;
	
	uint8_t reg_high = val;
	uint8_t reg_low = val+1;

	i2cAcquireBus(ltc->config.i2c);
	i2cMasterTransmitTimeout(ltc->config.i2c, ltc->config.address, &reg_high, 1, &data_high, 1, MS2ST(20));
	i2cMasterTransmitTimeout(ltc->config.i2c, ltc->config.address, &reg_low, 1, &data_low, 1, MS2ST(20));
	i2cReleaseBus(ltc->config.i2c);

	result = ((data_high << 4) | ((data_low >> 4) & 0x0F ));
	return result;
}