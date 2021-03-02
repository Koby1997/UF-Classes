/*
 * Lab6.c
 *
 * Created: 7/20/2020 6:16:31 PM
 * Author : Koby
 */ 

#include <avr/io.h>
#include "spi.h"



int main(void)
{
    spi_init();
	
	while(1)
	{
		//assert low
		PORTF.OUTCLR = 0b00010000;
		
		spi_write(0x53);
		
		//assert high
		PORTF.OUTSET = 0b00010000;
	}
}
