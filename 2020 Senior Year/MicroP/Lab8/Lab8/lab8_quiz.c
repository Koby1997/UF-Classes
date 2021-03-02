/*
 * Lab8.c
 *
 * Author : Koby
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdbool.h>

extern void clock_init(void);int16_t array_position;
bool use_sine;
uint8_t data;

uint16_t sine[256] =
{
	0x800,0x832,0x864,0x896,0x8c8,0x8fa,0x92c,0x95e,0x98f,0x9c0,
	0x9f1,0xa22,0xa52,0xa82,0xab1,0xae0,0xb0f,0xb3d,0xb6b,0xb98,
	0xbc5,0xbf1,0xc1c,0xc47,0xc71,0xc9a,0xcc3,0xceb,0xd12,0xd39,
	0xd5f,0xd83,0xda7,0xdca,0xded,0xe0e,0xe2e,0xe4e,0xe6c,0xe8a,
	0xea6,0xec1,0xedc,0xef5,0xf0d,0xf24,0xf3a,0xf4f,0xf63,0xf76,
	0xf87,0xf98,0xfa7,0xfb5,0xfc2,0xfcd,0xfd8,0xfe1,0xfe9,0xff0,
	0xff5,0xff9,0xffd,0xffe,0xfff,0xffe,0xffd,0xff9,0xff5,0xff0,
	0xfe9,0xfe1,0xfd8,0xfcd,0xfc2,0xfb5,0xfa7,0xf98,0xf87,0xf76,
	0xf63,0xf4f,0xf3a,0xf24,0xf0d,0xef5,0xedc,0xec1,0xea6,0xe8a,
	0xe6c,0xe4e,0xe2e,0xe0e,0xded,0xdca,0xda7,0xd83,0xd5f,0xd39,
	0xd12,0xceb,0xcc3,0xc9a,0xc71,0xc47,0xc1c,0xbf1,0xbc5,0xb98,
	0xb6b,0xb3d,0xb0f,0xae0,0xab1,0xa82,0xa52,0xa22,0x9f1,0x9c0,
	0x98f,0x95e,0x92c,0x8fa,0x8c8,0x896,0x864,0x832,0x800,0x7cd,
	0x79b,0x769,0x737,0x705,0x6d3,0x6a1,0x670,0x63f,0x60e,0x5dd,
	0x5ad,0x57d,0x54e,0x51f,0x4f0,0x4c2,0x494,0x467,0x43a,0x40e,
	0x3e3,0x3b8,0x38e,0x365,0x33c,0x314,0x2ed,0x2c6,0x2a0,0x27c,
	0x258,0x235,0x212,0x1f1,0x1d1,0x1b1,0x193,0x175,0x159,0x13e,
	0x123,0x10a,0xf2,0xdb,0xc5,0xb0,0x9c,0x89,0x78,0x67,
	0x58,0x4a,0x3d,0x32,0x27,0x1e,0x16,0xf,0xa,0x6,
	0x2,0x1,0x0,0x1,0x2,0x6,0xa,0xf,0x16,0x1e,
	0x27,0x32,0x3d,0x4a,0x58,0x67,0x78,0x89,0x9c,0xb0,
	0xc5,0xdb,0xf2,0x10a,0x123,0x13e,0x159,0x175,0x193,0x1b1,
	0x1d1,0x1f1,0x212,0x235,0x258,0x27c,0x2a0,0x2c6,0x2ed,0x314,
	0x33c,0x365,0x38e,0x3b8,0x3e3,0x40e,0x43a,0x467,0x494,0x4c2,
	0x4f0,0x51f,0x54e,0x57d,0x5ad,0x5dd,0x60e,0x63f,0x670,0x6a1,
	0x6d3,0x705,0x737,0x769,0x79b,0x7cd,0x800
};

uint16_t half[256] =
{
	0x405,0x41e,0x437,0x450,0x469,0x482,0x49b,0x4b4,0x4cd,0x4e6,
	0x4fe,0x517,0x52f,0x547,0x55f,0x577,0x58e,0x5a5,0x5bc,0x5d3,
	0x5e9,0x5ff,0x615,0x62b,0x640,0x655,0x669,0x67d,0x691,0x6a4,
	0x6b7,0x6ca,0x6dc,0x6ed,0x6ff,0x70f,0x720,0x72f,0x73f,0x74d,
	0x75c,0x769,0x777,0x783,0x790,0x79b,0x7a6,0x7b1,0x7bb,0x7c4,
	0x7cd,0x7d5,0x7dd,0x7e4,0x7ea,0x7f0,0x7f5,0x7fa,0x7fe,0x801,
	0x804,0x806,0x808,0x809,0x809,0x809,0x808,0x806,0x804,0x801,
	0x7fe,0x7fa,0x7f5,0x7f0,0x7ea,0x7e4,0x7dd,0x7d5,0x7cd,0x7c4,
	0x7bb,0x7b1,0x7a6,0x79b,0x790,0x783,0x777,0x769,0x75c,0x74d,
	0x73f,0x72f,0x720,0x70f,0x6ff,0x6ed,0x6dc,0x6ca,0x6b7,0x6a4,
	0x691,0x67d,0x669,0x655,0x640,0x62b,0x615,0x5ff,0x5e9,0x5d3,
	0x5bc,0x5a5,0x58e,0x577,0x55f,0x547,0x52f,0x517,0x4fe,0x4e6,
	0x4cd,0x4b4,0x49b,0x482,0x469,0x450,0x437,0x41e,0x405,0x3eb,
	0x3d2,0x3b9,0x3a0,0x387,0x36e,0x355,0x33c,0x323,0x30b,0x2f2,
	0x2da,0x2c2,0x2aa,0x292,0x27b,0x264,0x24d,0x236,0x220,0x20a,
	0x1f4,0x1de,0x1c9,0x1b4,0x1a0,0x18c,0x178,0x165,0x152,0x13f,
	0x12d,0x11c,0x10a,0xfa,0xe9,0xda,0xca,0xbc,0xad,0xa0,
	0x92,0x86,0x79,0x6e,0x63,0x58,0x4e,0x45,0x3c,0x34,
	0x2c,0x25,0x1f,0x19,0x14,0xf,0xb,0x8,0x5,0x3,
	0x1,0x0,0x0,0x0,0x1,0x3,0x5,0x8,0xb,0xf,
	0x14,0x19,0x1f,0x25,0x2c,0x34,0x3c,0x45,0x4e,0x58,
	0x63,0x6e,0x79,0x86,0x92,0xa0,0xad,0xbc,0xca,0xda,
	0xe9,0xfa,0x10a,0x11c,0x12d,0x13f,0x152,0x165,0x178,0x18c,
	0x1a0,0x1b4,0x1c9,0x1de,0x1f4,0x20a,0x220,0x236,0x24d,0x264,
	0x27b,0x292,0x2aa,0x2c2,0x2da,0x2f2,0x30b,0x323,0x33c,0x355,
	0x36e,0x387,0x3a0,0x3b9,0x3d2,0x3eb,0x405
};

int main(void)
{
	clock_init();
	usartd0_init();
	dac_init();
	tcc0_init();
	intr_init();
	
	use_sine = true;
	array_position = 0;
	
	
    while (1) 
    {	
		while(!(DACA.STATUS & DAC_CH0DRE_bm));

		/* Write digital data to the CH0DATA register. 0 = 0V, 0xFFF = VREF. */
		
		if(use_sine == true)
		{
			DACA.CH0DATA = sine[array_position];
		}
		else
		{
			DACA.CH0DATA = half[array_position];
		}
		
		array_position++;
			
		if(array_position == 256)
		{
		array_position = 0;
		}	
    }
}



void dac_init(void)
{
	/* Use only channel 0 */
	DACA.CTRLB = DAC_CHSEL_SINGLE_gc | DAC_CH0TRIG_bm;
	
	/* Use AREFB (2.5V). Data is right-adjusted. */
	DACA.CTRLC = DAC_REFSEL_AREFB_gc;
	
	/* Enable channel 0, as well as the overall DAC module. */
	DACA.CTRLA = DAC_CH0EN_bm | DAC_ENABLE_bm;	
	
	/* make a DAC conversion start when Event Channel 0 is triggered */
	DACA.EVCTRL = DAC_EVSEL_0_gc;
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
	// we want sine wave with a 1000Hz frequency
	// but we have 256 values for each frequency
	// so our PER = (1/1000Hz) /256 = 1/256000
	//;TCC0_PER = (fclk/prescalar) * (duration in seconds)
	//;				32MH/1					1/256000
	//this didn't give a value withing 2% so I manually changed the PER
	
	TCC0.CNT = 0;
	TCC0.PER = (32000000/1) / 256000; // = 125
	TCC0.CTRLA = TC_CLKSEL_DIV1_gc;
	
	/* Clear OVFIF to be safe */
	TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc;	
	
	/* Set as low level interrupt */
	TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc;
	
	EVSYS.CH0MUX = EVSYS_CHMUX_TCC0_OVF_gc;
}

void usartd0_init()
{
	//BSEL = 33
	//BSCALE = -1
	
	/* Configure the UART frame. */
	USARTD0.CTRLC = ( USART_CMODE_ASYNCHRONOUS_gc | USART_PMODE_DISABLED_gc | USART_CHSIZE_8BIT_gc ); //need to use 8 bit
	
	/* Initialize the baud rate */
	USARTD0.BAUDCTRLA = 33;
	USARTD0.BAUDCTRLB = (-1<<4); //Should really or the high part of 1, but that is 0
	
	/* Enable the transmitter and receiver */
	USARTD0.CTRLB = ( USART_TXEN_bm | USART_RXEN_bm );
	
	USARTD0.CTRLA = 0b00010000; //make low level. couldn't find the bm
	
}

ISR(USARTD0_RXC_vect)
{
	data = USARTD0.DATA;
	
	if(data == 'h')
	{
		use_sine = false;
	}
	else if(data == 'o')
	{
		use_sine = true;	
	}
}