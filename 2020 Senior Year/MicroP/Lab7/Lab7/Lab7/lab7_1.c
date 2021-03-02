/*
 * Lab7_1.c
 *
 * Author : Koby
 */ 

#include <avr/io.h>


int main(void)
{
	/* Initialize Channel 0 of the ADCA module. */
	adc_init();
	
	/* Temporary 8-bit signed variable to store the result. */
	int16_t temp;
	
    while (1) 
    {
		/* Start a conversion. */
		ADCA.CH0.CTRL |= ADC_CH_START_bm;
		
		/* Wait for the conversion to be completed. */
		while(!(ADCA.CH0.INTFLAGS & ADC_CH_CHIF_bm));
		
		/* Read the 12-bit result. */
		temp = ADCA.CH0.RES;
		
		/* Clear interrupt flag. */
		ADCA.CH0.INTFLAGS = ADC_CH_CHIF_bm;
		
    }
}




void adc_init(void)
{
	
	/* Signed, 12-bit conversion results. */
	ADCA.CTRLB = ADC_CONMODE_bm | ADC_RESOLUTION_12BIT_gc;
	
	/* Use external reference voltage on Port B. See doc8385 for reference pin. */
	ADCA.REFCTRL = ADC_REFSEL_AREFB_gc;
	
	/* Single-ended mode. */
	ADCA.CH0.CTRL = ADC_CH_INPUTMODE_SINGLEENDED_gc;
	
	/* Measure voltage on PA1 and PA6. */
	ADCA.CH0.MUXCTRL = ADC_CH_MUXPOS_PIN1_gc | ADC_CH_MUXNEG_PIN6_gc;
	
	/* Enable the ADC. */
	ADCA.CTRLA = ADC_ENABLE_bm;
}
