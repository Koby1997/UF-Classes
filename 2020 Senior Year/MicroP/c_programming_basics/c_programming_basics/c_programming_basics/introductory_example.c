/*
 * introductory_example.c
 *
 * Created: 7/20/2020 7:33:01 PM
 *  Author: Koby
 */ 

/***************************DEPENDENCIES********************************/
#include <avr/io.h>
/************************END OF DEPENDENCIES****************************/

/*****************************MACROS************************************/
/*************************END OF MACROS*********************************/

int main(void)
{
	/* Initialize all LEDs on the OOTB SLB to be turned off. */
	
	/*Example implementation, in assembly
	
	ldi r16, 0xFF
	sts PORTC_OUTSET, r16
	sts PORTC_DIRSET, r16
	*/
	
	PORTC.OUTSET = 0xFF;
	PORTC.DIRSET = 0xFF;
	
	
	
	/* Initialize DIP switches on the OOTB SLB to be inputs. */
	/*
	ex in assembly
	
	ldi r16, 0xFF
	sts PORTA_DIRCLR, r16
	*/
	
	PORTA.DIRCLR = 0xFF;
	
	
	
	/*Continually map the digital value by DIP switches to the LEDs
	
	
	ex in assembly:
	LOOP:
		lds r16, PORTA_IN
		sts PORTC_OUT, r16
		rjmp LOOP
		*/
	
	
	while(1)
	{
		PORTC.OUT = PORTA.IN;
	}
	
	
	
	/*
	different types of data types
	
	uint8_t		variables that represent 8-bit unsigned value. Main one
	int8_t		8-bit signed value
	uint16_t	same but 16
	int16_t		same but 16
	
	char		character codes
	ex		char c0 = 'H';   // 'H' - > 0x48
	
	float		fractions
	
	
	
	
	
	
	*/
	
	
	
	
	
	
	
	
	
	
	
}