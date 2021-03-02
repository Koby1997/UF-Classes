/*
 * Lab7.c
 *
 * Created: 7/27/2020 8:34:25 PM
 * Author : Koby
 * 
 * This uses PUTTY
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdbool.h>

int16_t temp;
//bool flag = false;


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
	
	/* Initialize USART */
	usartd0_init();
	
	
	
    while (1) 
    {
		if(GPIO0 == 1)
		{
			GPIO0 = 0;
			
			//temp = our value in 16 bits, we need 12
			//we can give USART 8 bits at the same time.
			
			int16_t msb = 1 << 11;
			if(temp & msb)
			{
				out_char('-');
			}
			else
			{
				out_char('+');
			}
			
			float voltage = ((temp * 2.5) /2048);					
			
			/* Now do the algorithm given to us */
			int Int1 = (int) voltage;
				out_number(Int1);
				out_char('.');
			float voltage2 = 10*(voltage - Int1);
			int Int2 = (int) voltage2;
				out_number(Int2);
			float voltage3 = 10*(voltage2 - Int2);
			int Int3 = (int) voltage3;
				out_number(Int3);
				out_char(' ');
				out_char('V');
				out_char(' ');
				out_char('(');
				out_char('0');
				out_char('x');
				
				/* now find the hex value */
				int high_byte = temp >> 8;
				int med_byte = ((temp >> 4) & 0x0F);
				int low_byte = temp & 0x0F;
				
				out_hex(high_byte);
				out_hex(med_byte);
				out_hex(low_byte);
			
				out_char(')');
				out_char('\n');
				out_char('\r');		
		}
    }
}




void adc_init(void)
{
	
	/* Signed, 12-bit conversion results. */
	ADCA.CTRLB = ADC_CONMODE_bm | ADC_RESOLUTION_12BIT_gc;
	
	/* Use external reference voltage on Port B. See doc8385 for reference pin. */
	ADCA.REFCTRL = ADC_REFSEL_AREFB_gc;
	
	/* Single-ended mode. */ //wrong mode
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
	
	/* Enable the transmitter */
	USARTD0.CTRLB = USART_TXEN_bm;
}

void out_number(int character)
{
	char convert = '0' + character;
	
	USARTD0.DATA = convert;
	while(!(USARTD0.STATUS & USART_DREIF_bm)); //wait
}

void out_char(char character)
{
	
	USARTD0.DATA = character;
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





ISR(TCC0_OVF_vect)
{	
	/* Wait for the conversion to be completed. */
	while(!(ADCA.CH0.INTFLAGS & ADC_CH_CHIF_bm));
	
	/* Save result into a signed 16-bit integer variable */
	temp = ADCA.CH0.RES;
	
	/* Update my flag */
	//flag = true;
	GPIO0 = 1;
	
	/* Toggle GREEN_PWM led */
	PORTD.OUTTGL = (1<<5);
	
	TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc;	
}