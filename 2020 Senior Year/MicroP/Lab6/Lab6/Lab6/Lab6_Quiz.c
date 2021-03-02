/*
 * Lab6_Quiz.c
 *
 * Created: 7/20/2020 6:16:31 PM
 * Author : Koby
 */ 

#include <avr/io.h>
#include "spi.h"



int main(void)
{
	//Initialize spi to talk to LSM6DS3
	//Initialize the USART module to communicate with PuTTY
	//Initialize I/O ports for the RGB LEDs
    spi_init();
	usart_init();
	io_init();
	
	while(1)
	{
		//continually read data from the LSM6DS3
				
		uint8_t XL = spi_read();
		uint8_t XH = spi_read();
		uint8_t YL = spi_read();
		uint8_t YH = spi_read();
		uint8_t ZL = spi_read();
		uint8_t ZH = spi_read();
		
		
		
		
		char putty_char = usart_read();
		//have a function that checks if PuTTY is trying to communicate
		//If there is no character, putty_char will be null
		
		if(putty_char == 'x' || putty_char == 'X')
		{
			usart_write(XH);
			usart_write(XL);
		}
		else if(putty_char == 'y' || putty_char == 'Y')
		{
			usart_write(YH);
			usart_write(YL);
		}
		else if(putty_char == 'z' || putty_char == 'Z')
		{
			usart_write(ZH);
			usart_write(ZL);
		}
		else
		{
			//do nothing 
		}
		
		
		
		
		//now find the greatest in magnitude
		//shift XH 8 times, then Or with XL
		uint16_t X = XL & XH;
		uint16_t Y = YL & YH;
		uint16_t Z = ZL & ZH;
		
		if(X > Y && X > Z)
		{
			//turn off all LEDs
			//turn red LED on
		}
		else if(Y > X && Y > Z)
		{
			//turn off all LEDs
			//turn green LED on
		}
		else if(Z > Y && Z > X)
		{
			//turn off all LEDs
			//turn blue LED on
		}


	}
}
