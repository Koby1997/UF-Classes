/*
 * lab5_2.asm
 *
 *   Author: Koby
 */ 


 .include "ATxmega128A1Udef.inc"

 //.equ here

 ; USART0

 .equ USART0_RX_bp = (2)
 .equ USART0_RX_bm = (1<<USART0_RX_bp)

 .equ USART0_TX_bp = (3)
 .equ USART0_TX_bm = (1<<USART0_TX_bp)



 .ORG 0x0000
	rjmp MAIN


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

; We are only outputting 'U' so store in r17
ldi r17, 'U'

LOOP:
	rcall OUT_CHAR
	rjmp LOOP


;***********************************************************
;	I/O Initializations
;***********************************************************
IO_INIT:
	; protect relevant registers
	push r16

	; initialize the relevant I/O

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

	; Enable the transmitter
	ldi r16, USART_TXEN_bm
	sts USARTD0_CTRLB, r16

	pop r16

	ret


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