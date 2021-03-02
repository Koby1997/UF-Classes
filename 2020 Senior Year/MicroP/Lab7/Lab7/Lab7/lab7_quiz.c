/*
 * Lab7_quiz.c
 *
 * Author : Koby
 *
 * Uses Serial plot. Can change what is being read
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdbool.h>

int16_t temp;


int main(void)
{
	/* Initialize I/o */
	io_init();
	
	/* Initialize Channel 0 of the ADCA module. */
	adc_init();
	
	/* Initialize TC */
	tcc0_init();
	
	/* Initialize USART */
	usartd0_init();
	
	/* Initialize Interrupts */
	intr_init();
	
    while (1) 
    {		
		int8_t high = temp >> 8;
		int8_t low = temp & 0x00FF;
			
		out_binary(low); //do low first
		out_binary(high);			
    }
}


/****************INITIALIZATIONS**************/

void adc_init(void)
{
	
	/* Signed, 12-bit conversion results. */
	ADCA.CTRLB = ADC_CONMODE_bm | ADC_RESOLUTION_12BIT_gc;
	
	/* Use external reference voltage on Port B. See doc8385 for reference pin. */
	ADCA.REFCTRL = ADC_REFSEL_AREFB_gc;
	
	/* Single-ended mode. */
	ADCA.CH0.CTRL = ADC_CH_INPUTMODE_SINGLEENDED_gc;
	
	/* Enable ADC interrupt to be triggered when a conversion is complete */
	ADCA.CH0.INTFLAGS = ADC_CH_CHIF_bm;
	
	/* Measure voltage on PA1 and PA6. */
	//ADCA.CH0.MUXCTRL = ADC_CH_MUXPOS_PIN1_gc | ADC_CH_MUXNEG_PIN6_gc;
	
	/* Make an ADC conversion start when Event Channel 0 is triggered */
	ADCA.EVCTRL = ADC_EVACT1_bm;
	
	/* Enable the ADC. */
	ADCA.CTRLA = ADC_ENABLE_bm;
}


void tcc0_init(void)
{
	TCC0.CNT = 0;
	TCC0.PER = (2000000/1) / 100;
	TCC0.CTRLA = TC_CLKSEL_DIV1_gc;
	
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
	PORTD.OUTSET = (1<<5) | (1<<3);
	PORTD.DIRSET = (1<<5) | (1<<3);	
}

void usartd0_init()
{
	//BSEL = 1
	//BSCALE = -4
	
	/* Configure the UART frame. */
	USARTD0.CTRLC = ( USART_CMODE_ASYNCHRONOUS_gc | USART_PMODE_DISABLED_gc | USART_CHSIZE_8BIT_gc ); //need to use 8 bit
	
	/* Initialize the baud rate */
	USARTD0.BAUDCTRLA = 1;
	USARTD0.BAUDCTRLB = (-4<<4); //Should really or the high part of 1, but that is 0
	
	/* Enable the transmitter and receiver */
	USARTD0.CTRLB = ( USART_TXEN_bm | USART_RXEN_bm );
	
	USARTD0.CTRLA = 0b010000; //make low level. couldn't find the bm
	
}





/********************DIFFERENT OUT FUNCTIONS****************/
/* there is probably a good way to do all of these in one, but
I kept having problems */

void out_number(int character)
{
	//char convert = '0' + character;
	
	USARTD0.DATA = character;
	while(!(USARTD0.STATUS & USART_DREIF_bm)); //wait
}

void out_char(char character)
{
	USARTD0.DATA = character;
	while(!(USARTD0.STATUS & USART_DREIF_bm)); //wait
}

void out_binary(int8_t number)
{
	USARTD0.DATA = number;
	while(!(USARTD0.STATUS & USART_DREIF_bm)); //wait
	
}

/* I know there is probably a better way to print hex values
	but I don't know what else to do and I am running out of time.
	this is better than no solution */
void out_hex(int character)
{
	switch(character)
	{
		case 10:
			out_char('A');
			break;
		case 11:
			out_char('B');
			break;
		case 12:
			out_char('C');
			break;
		case 13:
			out_char('D');
			break;
		case 14:
			out_char('E');
			break;
		case 15:
			out_char('F');
			break;
		default:
			out_number(character);		
	}	
}


/*******************ISRs************/

ISR(TCC0_OVF_vect)
{	
	/* Wait for the conversion to be completed. */
	while(!(ADCA.CH0.INTFLAGS & ADC_CH_CHIF_bm));
	
	/* Save result into a signed 16-bit integer variable */
	temp = ADCA.CH0.RES;
	
	/* Toggle GREEN_PWM led */
	PORTD.OUTTGL = (1<<5);
	
	TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc;	
}


ISR(USARTD0_RXC_vect)
{
	while(!(USARTD0.STATUS & USART_DREIF_bm)); //wait
	
	if(USARTD0.DATA == 'C')
	{
		/* Measure voltage on PA1 and PA6. */
		ADCA.CH0.MUXCTRL = ADC_CH_MUXPOS_PIN1_gc | ADC_CH_MUXNEG_PIN6_gc;		
	}
	else if(USARTD0.DATA == 'J')
	{
		/* Measure voltage on PA4 and PA5. */
		ADCA.CH0.MUXCTRL = ADC_CH_MUXPOS_PIN4_gc | ADC_CH_MUXNEG_PIN5_gc;
	}	
}