/*
 * Lab8.c
 *
 * Author : Koby
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>

extern void clock_init(void);int16_t array_position;

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

int main(void)
{
	clock_init();
	tcc0_init();
	dma_init();
	dac_init();
	intr_init();
	
		
	
    while (1) 
    {	
		//while(!(DACA.STATUS & DAC_CH0DRE_bm));
		///* Write digital data to the CH0DATA register. 0 = 0V, 0xFFF = VREF. */
		//DACA.CH0DATA = sine[array_position];
		//array_position++;
			//
		//if(array_position == 256)
		//{
		//array_position = 0;
		//}	
	
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
	// so our PER = (1/1760Hz) /256 = 1/256000
	//;TCC0_PER = (fclk/prescalar) * (duration in seconds)
	//;				32MH/1					1/459560
	//this didn't give a value withing 2% so I manually changed the PER
	
	TCC0.CNT = 0;
	TCC0.PER = 72; //(32000000/1) / 459560; // = 69 but didn't work
	TCC0.CTRLA = TC_CLKSEL_DIV1_gc;
	
	/* Clear OVFIF to be safe */
	TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc;	
	
	/* Set as low level interrupt */
	TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc;
	
	EVSYS.CH0MUX = EVSYS_CHMUX_TCC0_OVF_gc;
}


void dma_init(void)
{
	/* reset entire DMA periph */
	DMA.CTRL |= DMA_RESET_bm;
	
	DMA.CH0.CTRLA = DMA_CH_SINGLE_bm | DMA_CH_BURSTLEN_2BYTE_gc; // I think I need to change this to 2byte
	
	DMA.CH0.ADDRCTRL = DMA_CH_SRCRELOAD_BLOCK_gc | DMA_CH_SRCDIR_INC_gc | DMA_CH_DESTRELOAD_NONE_gc | DMA_CH_DESTDIR_FIXED_gc;
	
	DMA.CH0.TRIGSRC = DMA_CH_TRIGSRC_DACA_CH0_gc;//DMA_CH_TRIGSRC_DACA_CH0_gc  or DMA_CH_TRIGSRC_TCC0_OVF_gc change to TC interrupt
	
	DMA.CH0.TRFCNT = (uint16_t)(sizeof(sine));
	
	DMA.CH0.SRCADDR0 = (uint8_t)((uintptr_t)sine);
	DMA.CH0.SRCADDR1 = (uint8_t)(((uintptr_t)sine) >> 8);
	DMA.CH0.SRCADDR2 = (uint8_t)(((uint32_t)((uintptr_t)sine)) >> 16);
	
	DMA.CH0.DESTADDR0 = (uint8_t)((uintptr_t)&DACA.CH0DATA);
	DMA.CH0.DESTADDR1 = (uint8_t)(((uintptr_t)&DACA.CH0DATA) >> 8);
	DMA.CH0.DESTADDR2 = (uint8_t)(((uint32_t)((uintptr_t)&DACA.CH0DATA)) >> 16);
	
	
	
	/* enable CH0 */
	DMA.CH0.CTRLA |= DMA_CH_ENABLE_bm;
	
	/* enable entire DMA periph */
	DMA.CTRL = DMA_ENABLE_bm;
	
}



ISR(TCC0_OVF_vect)
{
	DMA.CH0.CTRLA |= DMA_CH_ENABLE_bm;
	
	DMA.CH0.CTRLA |= DMA_CH_TRFREQ_bm;
}