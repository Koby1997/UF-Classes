/*
 * Lab8.c
 *
 * Author : Koby
 */ 

#include <avr/io.h>



extern void clock_init(void);

int main(void)
{
	clock_init();
	dac_init();
	
	
    while (1) 
    {
		/* Ensure the CH0DATA register is empty before starting a new conversion. */
		while(!(DACA.STATUS & DAC_CH0DRE_bm));		
		
		/* Write digital data to the CH0DATA register. 0 = 0V, 0xFFF = VREF. */
		DACA.CH0DATA = 0x999;	//just used formula in section 29	
    }
}


void dac_init(void)
{
	/* Use only channel 0 */
	DACA.CTRLB = DAC_CHSEL_SINGLE_gc;
	
	/* Use AREFB (2.5V). Data is right-adjusted. */
	DACA.CTRLC = DAC_REFSEL_AREFB_gc;
	
	/* Enable channel 0, as well as the overall DAC module. */
	DACA.CTRLA = DAC_CH0EN_bm | DAC_ENABLE_bm;	
}

