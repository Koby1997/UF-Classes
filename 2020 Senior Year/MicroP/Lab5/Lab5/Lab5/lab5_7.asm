/*
 * lab5_7.asm
 *
 *   Author: Koby
 *	 Description: Uses USART and interrupts to echo to computer characters received
 */ 


 .include "ATxmega128A1Udef.inc"

 //.equ here

 .equ NULL = 0


 ; USART0

 .equ USART0_RX_bp = (2)
 .equ USART0_RX_bm = (1<<USART0_RX_bp)

 .equ USART0_TX_bp = (3)
 .equ USART0_TX_bm = (1<<USART0_TX_bp)

 .equ TABLE_SIZE = 100



 .ORG 0x0000
	rjmp MAIN

//Other interupt vectors here
.ORG USARTD0_RXC_vect
	rjmp RECEIVE_COMPLETE_ISR



.ORG 0x0100

MAIN:

; initialize the stack pointer
ldi r16, 0xFF
sts CPU_SPL, r16
ldi r16, 0x3F
sts CPU_SPH, r16

; initialize relevant I/O modules (switches and LEDs)
rcall IO_INIT

; initialize USART
rcall USART_INIT

;initialize interrupts
rcall INTR_INIT



MAIN_LOOP:

;toggle green here
ldi r16, 0b00100000
sts PORTD_OUTTGL, r16

rjmp MAIN_LOOP
	

DONE:
	rjmp DONE


;***********************************************************
;	I/O Initializations
;***********************************************************
IO_INIT:
	; protect relevant registers
	push r16

	; GREEN_PMW
	ldi r16, 0b00100000
	sts PORTD_OUTSET, r16	; set led to off
	sts PORTD_DIRSET, r16	;make it an output

	; Initialize transmit pin as a high voltage output
	ldi r16, USART0_TX_bm
	sts PORTD_OUTSET, r16
	sts PORTD_DIRSET, r16

	pop r16

	; return from subroutine
	ret


/*Initialize USARTD0 to utilize an async communication protocol with the following characteristics:

		Baud rate: 115,200 bps
		Parity: odd
		No. data bits: 8
		No. stop bits: 1
*/
USART_INIT:

	; Baud rate symbols
	.equ BSEL = 1	; 12-bit value
	.equ BSCALE = -4; 4-bit 2's complement value

	push r16

	; Configure the UART frame.
	ldi r16, ( USART_CMODE_ASYNCHRONOUS_GC | USART_PMODE_ODD_gc | USART_CHSIZE_8BIT_gc )
	sts USARTD0_CTRLC, r16

	; Initialize the baud rate.
	ldi r16, low(BSEL)
	sts USARTD0_BAUDCTRLA, r16

	ldi r16, ( (BSCALE<<4) | high(BSEL) )
	sts USARTD0_BAUDCTRLB, r16

	; Enable the transmitter and receiver
	ldi r16, ( USART_TXEN_bm | USART_RXEN_bm )
	sts USARTD0_CTRLB, r16

	pop r16

	ret


;***********************************************************
;	Interrupt initializations
;***********************************************************
INTR_INIT:

	;protect registers
	push r16
	
	;RXC interrupt. Low level
	ldi r16, 0b010000		
	sts USARTD0_CTRLA, r16

	;Turn on low level interrupts
	ldi r16, PMIC_LOLVLEN_bm 
	sts PMIC_CTRL, r16

	;enable global interrupt bit
	sei

	;recover registers
	pop r16

	ret



;***********************************************************
;	IN/OUT SUBROUTINES
;***********************************************************

;output a single character to the transmit pin of a chosen USART module
OUT_CHAR:	; passing in r17
	push r16

TX_POLL:
	;Wait until the data register is empty.
	lds r16, USARTD0_STATUS
	sbrs r16, USART_DREIF_bp
	rjmp TX_POLL

	; Transmit the character that was passed in via r17
	sts USARTD0_DATA, r17

	pop r16

	ret

;output a character string stored in program memory
OUT_STRING:

	ldi r16, NULL

	NEXT_LETTER:
	elpm r17, Z+			;Load next value from table
	rcall OUT_CHAR
	cpse r16, r17
	rjmp NEXT_LETTER

	ret


OUT_STRING_TWO:
	;reset Y
	ldi YL, low(0x3700)
	ldi YH, high(0x3700)

	ldi r16, NULL

	NEXT_LETTER_TWO:
	ld r17, Y+
	rcall OUT_CHAR
	cpse r16, r17
	rjmp NEXT_LETTER_TWO

	ret



; receive a single character and return the received character to the calling procedure
IN_CHAR:

RX_POLL:
	; Wait until a character is received.
	lds r17, USARTD0_STATUS
	sbrs r17, USART_RXCIF_bp		;skip instruction if bit is set
	rjmp RX_POLL

	;Read the received character and save it in r17 for the calling program
	lds r17, USARTD0_DATA

	;r17 contains what data has been recieved
	ret


IN_STRING:

	READ_NEXT:

	rcall IN_CHAR

	;document says 0x0A, but that didn't work for me
	;I don't know how to type a line feed, so I used the enter key
	;in ascii that is 0x0D
	cpi r17, 0x0D ;carriage
	breq CARRIAGE

	cpi r17, 0x08 ;backspace
	breq BACKSPACE

	cpi r17, 0x7F ;Delete character
	breq BACKSPACE
	

	;if here, not any of the  above, store

	st Y+, r17
	rjmp READ_NEXT


	CARRIAGE:
	ldi r17, NULL
	st Y+, r17
	ret


	BACKSPACE:
	ldi r17, NULL
	st -Y, r17
	rjmp READ_NEXT

	;shouldn't reach this, but in case
	ret



;***********************************************************
;	Interrupt SERVICE ROUTINES
;***********************************************************
RECEIVE_COMPLETE_ISR:

	; first, always preserve the status register
	push r16
	lds r16, CPU_SREG
	push r16


j	lds r17, USARTD0_DATA

	EMPTY_REG:
	;Wait until the data register is empty.
	lds r16, USARTD0_STATUS
	sbrs r16, USART_DREIF_bp
	rjmp EMPTY_REG

	sts USARTD0_DATA, r17

	cpi r17, 0x0D ;carriage
	brne SKIP
	ldi r17, '\n'
	sts USARTD0_DATA, r17 ; just to make it look nicer
	

	SKIP:
	; recover the status register
	pop r16
	sts CPU_SREG, r16
	pop r16

	reti