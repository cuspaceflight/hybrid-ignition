#include "ch.h"
#include "hal.h"

#include "state.h"

#define LTC4151_ADDRESS     0x6F

/* I2C Config for LTC4151 */
static const I2CConfig i2c_cfg = {
    .op_mode = OPMODE_I2C,
    .clock_speed = 100000,
    .duty_cycle = STD_DUTY_CYCLE,
};

/* State Machine Thread */
static THD_WORKING_AREA(waStateThread, 2048);
static THD_FUNCTION(StateThread, arg) {

    (void)arg;

    i2cStart(&I2CD1, &i2c_cfg);

    chThdSleepMilliseconds(100);  

    while(true){

        msg_t result;
        static uint8_t res;
        static uint8_t read_reg_addr;
        
        read_reg_addr = 0x02;
        
        i2cAcquireBus(&I2CD1);
        result = i2cMasterTransmitTimeout(&I2CD1, LTC4151_ADDRESS, &read_reg_addr, 1, &res, 1, MS2ST(200));
        i2cReleaseBus(&I2CD1);
        
        (void)result;
        chThdSleepMilliseconds(200); 
    }    

    
}



/* Start State Machine Thread */
void state_init(void) {
    chThdCreateStatic(waStateThread, sizeof(waStateThread), NORMALPRIO, StateThread, NULL);
}