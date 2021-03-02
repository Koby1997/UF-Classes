/*
 * lab5_4.asm
 *
 *   Author: Koby
 */ 


 .include "ATxmega128A1Udef.inc"

 //.equ here

 .equ NULL = 0

 ; USART0

 .equ USART0_RX_bp = (2)
 .equ USART0_RX_bm = (1<<USART0_RX_bp)

 .equ USART0_TX_bp = (3)
 .equ USART0_TX_bm = (1<<USART0_TX_bp)



.org 0xABCD
IN_TABLE:
.db "KOBY MILLER"
;.db 'K', 'O', 'B', 'Y', ' ', 'M', 'I', 'L', 'L', 'E', 'R', NULL 

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


;***NOTE: I basically just took this from my LAB 1
; I have a lot of other school work to do so I am trying to just re-use code to save time because I know it works
;point appropriate indices to input/output tables
ldi ZL, BYTE1(IN_TABLE << 1)		;load the first value in the table into the Z register
ldi ZH, BYTE2(IN_TABLE << 1)

								;To read program memory we must multiply the table address by 2
								;0xABCD * 2 = 0x1579A
								;ZL = 9A
								;ZH = 57
								;we still need the most significant 1
ldi r20, BYTE3(IN_TABLE << 1)	;so we load it into the RAMPZ register
out CPU_RAMPZ, r20				;we will need to extend load to use the RAMPZ register


LOOP:
	rcall OUT_STRING
	

DONE:
	rjmp DONE


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


;output a character string stored in program memory
OUT_STRING:

	ldi r16, NULL

NEXT_LETTER:
	elpm r17, Z+			;Load next value from table
	rcall OUT_CHAR
	cpse r16, r17
	rjmp NEXT_LETTER

	ret