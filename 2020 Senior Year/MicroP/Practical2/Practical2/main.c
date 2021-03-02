/*
 * Practical 2
 *
 * Author : Koby
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>



extern void clock_init(void);

int16_t voltage_position;
int16_t frequency;
uint8_t old_temp;
uint8_t new_temp;

uint16_t voltage[3] =
{
	0x000, 0x7FF, 0xFFF
};


int main(void)
{
	clock_init();
	io_init();
	frequency = 3744;
	tcc0_init();
	dac_init();
	intr_init();
	
	old_temp = 0x00;
    while (1) 
    {
		new_temp = (PORTE.IN & 0b00000001);
		
		if(new_temp == 0x00 && new_temp != old_temp)
		{
			frequency = 3744;
			tcc0_init();
			TCC0.CTRLA = TC_CLKSEL_DIV1_gc;
		}
		else if(new_temp == 0x01 && new_temp != old_temp)
		{
			frequency = 4744;
			tcc0_init();
			TCC0.CTRLA = TC_CLKSEL_DIV1_gc;
		}
		
		old_temp = new_temp;
		
		
		/* Ensure the CH0DATA register is empty before starting a new conversion. */
		while(!(DACA.STATUS & DAC_CH0DRE_bm));		
		
		DACA.CH0DATA = voltage[voltage_position];	
    }
}

void io_init(void)
{
	/* SPST switch on LED backpack as input */
	PORTE.DIRCLR = 0b00000001;
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

void intr_init(void)
{
	/* Enable low level interrupts in the PMIC. */
	PMIC.CTRL = PMIC_LOLVLEN_bm;
	
	/* Enable interrupts globally. */
	sei();
}


void tcc0_init(void)
{
	//;set TCC0 period register
	// we want a frequency of 3744Hz
	//;TCC0_PER = (fclk/prescalar) * (duration in seconds)
	//;				32MH/1					1/3744
	
	TCC0.CNT = 0;
	TCC0.PER = (32000000/1) / (3 * frequency);
	
	/* Clear OVFIF to be safe */
	TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc;
	
	/* Set as low level interrupt */
	TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc;
}

//void tcc1_init(void)
//{
	////;set TCC0 period register
	//// we want a frequency of 4744Hz
	////;TCC0_PER = (fclk/prescalar) * (duration in seconds)
	////;				32MH/1					1/4744
	//
	//TCC1.CNT = 0;
	//TCC1.PER = (32000000/1) / 4744; //around 6000
	//
	///* Clear OVFIF to be safe */
	//TCC1.INTCTRLA = TC_OVFINTLVL_LO_gc;
	//
	///* Set as low level interrupt */
	//TCC1.INTCTRLA = TC_OVFINTLVL_LO_gc;
//}




ISR(TCC0_OVF_vect)
{
	//DACA.CH0DATA = voltage[voltage_position];
	voltage_position++;
	
	if(voltage_position == 3)
	{
		voltage_position = 0;
	}
	
}

//ISR(TCC1_OVF_vect)
//{
	////DACA.CH0DATA = voltage[voltage_position];
	//voltage_position++;
	//
	//if(voltage_position == 3)
	//{
		//voltage_position = 0;
	//}
	//
//}