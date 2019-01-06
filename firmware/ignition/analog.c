#include "ch.h"
#include "hal.h"

#include "analog.h"

#define ADC_NUM_CHANNELS    7
#define ADC_BUF_DEPTH       1

#define COIL_THRESHOLD_MV       250
#define COIL_FIRE_THRESHOLD_MV  3299

static binary_semaphore_t adc_conv_sem;

/* ADC Sample Buffer */
static adcsample_t samples[ADC_NUM_CHANNELS * ADC_BUF_DEPTH];

/* ADC Callback Function */
static void adccallback(ADCDriver *adcp, adcsample_t *buffer, size_t n);

/* ADC Config */
static const ADCConversionGroup adcgrpcfg = {
    .circular = FALSE,                         
    .num_channels = ADC_NUM_CHANNELS,        
    .end_cb = adccallback,                  
    .error_cb = NULL,
    .cr1 = 0,
    .cr2 = ADC_CR2_SWSTART,
    .smpr1 = ADC_SMPR1_SMP_AN10(ADC_SAMPLE_84) | ADC_SMPR1_SMP_AN11(ADC_SAMPLE_84) |
             ADC_SMPR1_SMP_AN12(ADC_SAMPLE_84) | ADC_SMPR1_SMP_AN13(ADC_SAMPLE_84) |
             ADC_SMPR1_SMP_AN14(ADC_SAMPLE_84) | ADC_SMPR1_SMP_VBAT(ADC_SAMPLE_84),
    .smpr2 = ADC_SMPR2_SMP_AN1(ADC_SAMPLE_84),
    .sqr1 = ADC_SQR1_NUM_CH(ADC_NUM_CHANNELS),
    .sqr2 = ADC_SQR2_SQ7_N(ADC_CHANNEL_VBAT),
    .sqr3 = ADC_SQR3_SQ6_N(ADC_CHANNEL_IN14) | ADC_SQR3_SQ5_N(ADC_CHANNEL_IN13) |
            ADC_SQR3_SQ4_N(ADC_CHANNEL_IN12) | ADC_SQR3_SQ3_N(ADC_CHANNEL_IN11) |
            ADC_SQR3_SQ2_N(ADC_CHANNEL_IN10) | ADC_SQR3_SQ1_N(ADC_CHANNEL_IN1)
};


/* Setup ADC */
void analog_init(void){

    /* Start ADC */
    adcStart(&ADCD1, NULL);
    
    /* Disable VBATE Bit */
    ADC->CCR &= ~ADC_CCR_VBATE;

    /* Enable Internal VREF/TS */
    ADC->CCR |= ADC_CCR_TSVREFE;

    /* Conversion Complete Semaphore */
    chBSemObjectInit(&adc_conv_sem, false);
}


/* ADC Conversion */
void get_analog_values(analog *vals){

    adcConvert(&ADCD1, &adcgrpcfg, samples, ADC_BUF_DEPTH);

    /* Wait for Conversion */
    chBSemWait(&adc_conv_sem);

    /* 24v PSU */
    vals->psu_voltage = (12*(samples[0]*3300))/4096;

    /* Coil Continuity */
    for(int i=0; i<5; i++){
        vals->ch_cont_voltage[i] = (samples[i+1]*3300)/4096;
        if(vals->ch_cont_voltage[i] == COIL_FIRE_THRESHOLD_MV){
            vals->ch_cont[i] = CHANNEL_FIRING;
        }
        else if(vals->ch_cont_voltage[i] > COIL_THRESHOLD_MV){
            vals->ch_cont[i] = CHANNEL_OPEN;
        } 
        else {
            vals->ch_cont[i] = CHANNEL_SHORT;
        }
    }

    /* MCU Temperature */
    vals->mcu_temp = (((((samples[6]*3300)/4096)+62.5)-760)/2.5);
}


/* ADC Callback */
static void adccallback(ADCDriver *adcp, adcsample_t *buffer, size_t n){

    (void)adcp;
    (void)buffer;
    (void)n;

    chSysLockFromISR();
    chBSemSignalI(&adc_conv_sem);
    chSysUnlockFromISR();
}