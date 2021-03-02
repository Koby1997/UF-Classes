/*
 * Lab7.c
 *
 * Created: 7/27/2020 8:34:25 PM
 * Author : Koby
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>


int main(void)
{
	/* Initialize I/o */
	io_init();
	
	/* Initialize Interrupts */
	intr_init();
	
	/* Initialize Channel 0 of the ADCA module. */
	adc_init();
	
	/* Initialize TC */
	tcc0_init();
	
	
	
    while (1) 
    {		
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
	
	/* Enable ADC interrupt to be triggered when a conversion is complete */
	ADCA.CH0.INTFLAGS = ADC_CH_CHIF_bm;
	
	/* Make an ADC conversion start when Event Channel 0 is triggered */
	ADCA.EVCTRL = ADC_EVACT1_bm;
	
	/* Enable the ADC. */
	ADCA.CTRLA = ADC_ENABLE_bm;
}


void tcc0_init(void)
{
	TCC0.CNT = 0;
	TCC0.PER = (2000000/64) / 3;
	TCC0.CTRLA = TC_CLKSEL_DIV64_gc;
	
	/* Clear OVFIF to be safe */
	TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc;
	
	EVSYS.CH0MUX = EVSYS_CHMUX_TCC0_OVF_gc;
}

void intr_init(void)
{
	/* Enable low level interrupts in the PMIC. */
	PMIC.CTRL = PMIC_LOLVLEN_bm;
	
	/* Enable interrupts globally. */
	sei();
}

void io_init(void)
{
	/* Set Green LED as output */
	PORTD.OUTSET = (1<<5);
	PORTD.DIRSET = (1<<5);
}





ISR(TCC0_OVF_vect)
{	
	/* Wait for the conversion to be completed. */
	while(!(ADCA.CH0.INTFLAGS & ADC_CH_CHIF_bm));
	
	/* Save result into a signed 16-bit integer variable */
	int16_t temp = ADCA.CH0.RES;
	
	/* Toggle GREEN_PWM led */
	PORTD.OUTTGL = (1<<5);
	
	TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc;	
}