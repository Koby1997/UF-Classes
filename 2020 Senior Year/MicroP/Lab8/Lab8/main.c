/*
 * Lab8.c
 *
 * Author : Koby
 */ 

#include <avr/io.h>



extern void clock_init(void);

int main(void)
{
    while (1) 
    {
		/* Ensure the CH0DATA register is empty before starting a new conversion. */
		while(!(DACA.STATUS & DAC_CH0DRE_bm));		
		
		/* Write digital data to the CH0DATA register. 0 = 0V, 0xFFF = VREF. */
		DACA.CH0DATA = 0;		
    }
	
	
	//clock_init();
	//
	//PORTCFG.CLKEVOUT = 0b00010001; //PORTCFG_CLKOUT1_bm | PORTCFG_EVOUT1_bm;
	//
	//io_init();
	//
	//while(1)
	//{
		//
	//}
	
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


void io_init(void)
{
	PORTC.OUTSET = 0b10000000;
	PORTC.DIRSET = 0b10000000;
	
}

