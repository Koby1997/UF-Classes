/*
 * Lab7.c
 *
 * Created: 7/27/2020 8:34:25 PM
 * Author : Koby
 */ 

#include <avr/io.h>


int main(void)
{
	/* Initialize Channel 0 of the ADCA module. */
	adc_init();
	
	/* Temporary 8-bit signed variable to store the result. */
	int8_t temp;
	
    while (1) 
    {
		/* Start a conversion. */
		ADCA.CH0.CTRL |= ADC_CH_START_bm;
		
		/* Wait for the conversion to be completed. */
		while(!(ADCA.CH0.INTFLAGS & ADC_CH_CHIF_bm));
		
		/* Read the 8-bit result. */
		temp = ADCA.CH0.RESL;		//for 12 bit just do RES
		
		/* Clear interrupt flag. */
		ADCA.CH0.INTFLAGS = ADC_CH_CHIF_bm;
		
    }
}




void adc_init(void)
{
	
	/* Signed, 8-bit conversion results. */
	ADCA.CTRLB = ADC_CONMODE_bm | ADC_RESOLUTION_8BIT_gc;
	
	/* Use external reference voltage on Port A. See doc8385 for reference pin. */
	ADCA.REFCTRL = ADC_REFSEL_AREFA_gc;
	
	/* Set ADC clock to 2MHz / 4 = 500 kHz */
	ADCA.PRESCALER = ADC_PRESCALER_DIV4_gc;
	
	/* Single-ended mode. */
	ADCA.CH0.CTRL = ADC_CH_INPUTMODE_SINGLEENDED_gc;
	
	/* Measure voltage on PA1. */
	ADCA.CH0.MUXCTRL = ADC_CH_MUXPOS_PIN1_gc
	
	/* Enable the ADC. */
	ADCA.CTRLA = ADC_ENABLE_bm;
}


//49:28