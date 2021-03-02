/*
 * lab5_quiz.asm
 *
 *   Author: Koby
 *
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

	rjmp MAIN_LOOP
	

DONE:;I know I don't need this but I'm so used to having it haha
	rjmp DONE


;***********************************************************
;	I/O Initializations
;***********************************************************
IO_INIT:
	; protect relevant registers
	push r16

	; LEDs on SLB
	ldi r16, 0xFF
	sts PORTC_OUT, r16		; this sets all LEDs
	sts PORTC_DIR, r16		; sets direction as outputs

	; Initialize transmit pin as a high voltage output
	ldi r16, USART0_TX_bm
	sts PORTD_OUTSET, r16
	sts PORTD_DIRSET, r16

	pop r16

	; return from subroutine
	ret


/*Initialize USARTD0 to utilize an async communication protocol with the following characteristics:

		Baud rate: 9,600 bps
		Parity: even
		No. data bits: 8
		No. stop bits: 2
*/
USART_INIT:

	; Baud rate symbols
	.equ BSEL = 12	; 12-bit value
	.equ BSCALE = 0; 4-bit 2's complement value

	push r16

	; Configure the UART frame.
	ldi r16, ( USART_CMODE_ASYNCHRONOUS_GC | USART_PMODE_EVEN_gc | USART_CHSIZE_8BIT_gc | USART_SBMODE_bm )
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
;	Interrupt SERVICE ROUTINES
;***********************************************************
RECEIVE_COMPLETE_ISR:

	; first, always preserve the status register
	push r16
	lds r16, CPU_SREG
	push r16


	lds r17, USARTD0_DATA


	EMPTY_REG:
	;Wait until the data register is empty.
	lds r16, USARTD0_STATUS
	sbrs r16, USART_DREIF_bp
	rjmp EMPTY_REG

	cpi r17, '1'
	breq TOGGLE_LEDS

	cpi r17, 'P'
	breq CHECK_U

	;else just output it
	sts USARTD0_DATA, r17
	rjmp SKIP


	TOGGLE_LEDS:
		ldi r16, 0xFF
		sts PORTC_OUTTGL, r16
		sts USARTD0_DATA, r17
		rjmp SKIP

	CHECK_U:
		cpi r20, 'u'
		brne NOT_U
		
		;I understand that this next part is very bad code. I didn't know how else to do it though.
		;without making seperate TX_POLLs I was only ablel to get '37' so I figured I had
		;to wait intil the data register was empty.

		ldi r18, 'P'
		TX_POLL_ZERO:
		;Wait until the data register is empty.
		lds r16, USARTD0_STATUS
		sbrs r16, USART_DREIF_bp
		rjmp TX_POLL_ZERO

		sts USARTD0_DATA, r18

		ldi r18, '3'
		TX_POLL_ONE:
		;Wait until the data register is empty.
		lds r16, USARTD0_STATUS
		sbrs r16, USART_DREIF_bp
		rjmp TX_POLL_ONE

		sts USARTD0_DATA, r18

		ldi r18, '7'
		TX_POLL_TWO:
		;Wait until the data register is empty.
		lds r16, USARTD0_STATUS
		sbrs r16, USART_DREIF_bp
		rjmp TX_POLL_TWO

		sts USARTD0_DATA, r18

		ldi r18, '4'
		TX_POLL_THREE:
		;Wait until the data register is empty.
		lds r16, USARTD0_STATUS
		sbrs r16, USART_DREIF_bp
		rjmp TX_POLL_THREE

		sts USARTD0_DATA, r18

		ldi r18, '4'
		TX_POLL_FOUR:
		;Wait until the data register is empty.
		lds r16, USARTD0_STATUS
		sbrs r16, USART_DREIF_bp
		rjmp TX_POLL_FOUR

		sts USARTD0_DATA, r18
		rjmp SKIP

	NOT_U:
		sts USARTD0_DATA, r17
		rjmp SKIP



	/*cpi r17, 0x0D ;carriage
	brne SKIP
	ldi r18, '\n'
		TX_POLL_FIVE:
		;Wait until the data register is empty.
		lds r16, USARTD0_STATUS
		sbrs r16, USART_DREIF_bp
		rjmp TX_POLL_FIVE

		sts USARTD0_DATA, r18*/
	

	SKIP:

	mov r20, r17;now r20 has previous character
	; recover the status register
	pop r16
	sts CPU_SREG, r16
	pop r16

	reti