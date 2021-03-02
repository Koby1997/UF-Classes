;
; Practical1.asm
;
; Created: 6/18/2020 9:22:52 AM
; Author : Koby
;


.include "ATxmega128A1Udef.inc"

.ORG 0x0000
	rjmp MAIN


;rememeber to set vectors here
.ORG TCC0_OVF_vect
	rjmp TC_ISR



.ORG 0x0100

MAIN:

; initialize the stack pointer
ldi r16, 0xFF
sts CPU_SPL, r16
ldi r16, 0x3F
sts CPU_SPH, r16

; initialize relevant I/O modules (switches and LEDs)
rcall IO_INIT

; initialize (but do not start) the relevant timer/counter module(s)
rcall TC_INIT

; initialize relevant interrupts
rcall INTR_INIT


;Here is where we will put logic at the bottom of the instructions
;Continually check S2. If pressed, LEDs show DIP switches
CHECK_S2:

	lds r16, PORTF_IN	;read input of SLB tactical switch S2
	sbrc r16, 3			;skip next instruction if bit3 = 0 meaning pressed
	rjmp CHECK_S2

	;if here, it is pressed. Now read DIP switches, and put that value on LEDs
	lds r16, PORTA_IN
	sts PORTC_OUT, r16

	;now continue this loop. The rest of the functionality is with interupts
	rjmp CHECK_S2

DONE:
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

	; DIP switches on SLB
	ldi r16, 0x00
	sts PORTA_DIR, r16		; sets switch direction as inputs

	; tactical switches on OOTB SLB
	ldi r16, 0b00001100		; tactical switch 1 and 2
	sts PORTF_DIRCLR, r16
							
	; recover relevant registers
	pop r16

	; return from subroutine
	ret


;***********************************************************
;	Timer Counter initializations
;***********************************************************
TC_INIT:
	; protect relevant registers
	push r16

	; initialize the relevant TC modules
	clr r16
	sts TCC0_CNT, r16
	sts(TCC0_CNT+1), r16

	;set TCC0 period register
	;TCC0_PER = (fclk/prescalar) * (duration in seconds)
	;			 2MH/64			 *		0.3744			= 11,700
	
	ldi r16, low(11700)
	sts TCC0_PER, r16
	ldi r16, high(11700)
	sts (TCC0_PER + 1), r16

	;starts timer counter with prescaler of 64
	ldi r16, TC_CLKSEL_DIV64_gc
	sts TCC0_CTRLA, r16
	
	; recover relevant registers
	pop r16

	; return from subroutine
	ret


;***********************************************************
;	Interrupt initializations
;***********************************************************
INTR_INIT:

	;protect registers
	push r16

	;TC interrupt. Low level
	ldi r16, TC_OVFINTLVL_LO_gc		
	sts TCC0_INTCTRLA, r16

	;Turn on low level interrupts
	ldi r16, PMIC_LOLVLEN_bm 
	sts PMIC_CTRL, r16

	;enable global interrupt bit
	sei

	;recover registers
	pop r16

	ret


;***********************************************************
;	Interrupts
;***********************************************************

TC_ISR:
;if here, timer counter has overflowed

	; first, always preserve the status register
	push r16
	lds r16, CPU_SREG
	push r16


	;If S1 pressed:		decriment by one
	;If S1 not pressed:	1's Compliment
	lds r16, PORTF_IN	;read input of SLB tactical switch S1
	sbrc r16, 2			;skip next instruction if bit2 = 0 meaning pressed
	rjmp NOT_PRESSED

PRESSED:
	lds r16, PORTC_OUT
	inc r16				;lights are inverted so this is a decriment for visuals
	sts PORTC_OUT, r16
	rjmp LOGIC_DONE


NOT_PRESSED:
	/*lds r16, PORTA_IN
	sts PORTC_OUT, r16*/
	ldi r16, 0b11111111
	sts PORTC_OUTTGL, r16	; CHECK THIS LATER!!! Should be 1's Compliment


LOGIC_DONE:

	; clear OVFIF
	ldi r16, TC0_OVFIF_bm
	sts TCC0_INTFLAGS, r16

	; recover the status register
	pop r16
	sts CPU_SREG, r16
	pop r16

	reti