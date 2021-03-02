;
; Lab3quiz.asm
;
; Author : Koby Miller
;


.include "ATxmega128A1Udef.inc"


.equ F_CPU = 2000000
.equ CLK_PRE = 1
.equ FRAME_PER_A = 1/100 ; 10ms
.equ FRAME_PER_RECIP_A = 100


.equ RED = 0b00010000
.equ GREEN = 0b00100000
.equ BLUE = 0b01000000

.ORG 0x0000
	rjmp MAIN


.ORG PORTF_INT0_vect
	rjmp S1_ISR

.ORG TCC0_OVF_vect
	rjmp S1_TC_ISR


.ORG PORTF_INT1_vect
	rjmp S2_ISR

.ORG TCC1_OVF_vect
	rjmp S2_TC_ISR





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
rcall TC1_INIT

; initialize relevant interrupts
rcall INTR_INIT
	


OVERALL_LOOP:


rjmp OVERALL_LOOP



DONE:
	rjmp DONE




;***********************************************************
;	I/O Initializations
;***********************************************************
IO_INIT:
	; protect relevant registers
	push r16

	; initialize the relevant I/O

	; LEDs on SLB
	ldi r16, 0xFF
	sts PORTC_OUT, r16		; this sets all LEDs
	sts PORTC_DIR, r16		; sets direction as outputs

	; default LED to GREEN
	ldi r16, 0b00100000
	sts PORTD_OUTCLR, r16
	ldi r16, 0b01010000
	sts PORTD_OUTSET, r16

	ldi r16, 0b01110000
	sts PORTD_DIRSET, r16	;make it an output

	; switch on OOTB SLB
	ldi r16, 0b00000110		; tactical switch 1 and 2
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
	;			 2MH/1					0.01
	;when you use the reciprocal, you divide by the duration
	;assembler can't do decimals

	ldi r16, low((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)
	sts TCC0_PER, r16

	ldi r16, high((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)	; 2,000,000/1   /100  = 20000
	sts (TCC0_PER + 1), r16
	
	; recover relevant registers
	pop r16

	; return from subroutine
	ret

TC1_INIT:
	; protect relevant registers
	push r16

	; initialize the relevant TC modules
	clr r16
	sts TCC1_CNT, r16
	sts(TCC1_CNT+1), r16

	;set TCC0 period register
	;TCC0_PER = (fclk/prescalar) * (duration in seconds)
	;			 2MH/1					0.01
	;when you use the reciprocal, you divide by the duration
	;assembler can't do decimals

	ldi r16, low((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)
	sts TCC1_PER, r16

	ldi r16, high((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)	; 2,000,000/1   /100  = 20000
	sts (TCC1_PER + 1), r16
	
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
	
	;Select pin2 as the interrupt source
	ldi r16, 0b00000100		
	sts PORTF_INT0MASK, r16

	ldi r16, 0b00001000		
	sts PORTF_INT1MASK, r16


	;Set as low level interrupt
	ldi r16, 0b00000101				
	sts PORTF_INTCTRL, r16

	;call the interrupt on both edges. When the button is pressed and released
	ldi r16, 0b00000000
	sts PORTF_PIN2CTRL, r16
	sts PORTF_PIN3CTRL, r16


	;TC interrupt. Low level
	ldi r16, TC_OVFINTLVL_LO_gc		
	sts TCC0_INTCTRLA, r16
	sts TCC1_INTCTRLA, r16

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

S1_ISR:
;button has been pressed or realeased

	; first, always preserve the status register
	push r16
	lds r16, CPU_SREG
	push r16

	;Debounce switch here. Just start TC
	;do the logic of adding and showing LEDs in the TC interrupt
	ldi r16, TC_CLKSEL_DIV1_gc
	sts TCC0_CTRLA, r16
	
	; recover the status register
	pop r16
	sts CPU_SREG, r16
	pop r16

	; return from interrupt
	reti	;not 'ret'!



S1_TC_ISR:
;if here, timer has overflowed

	; first, always preserve the status register
	push r16
	lds r16, CPU_SREG
	push r16


	ldi r17, 0b01100000		;toggle green off and blue on
	sts PORTD_OUTTGL, r17

	; clear OVFIF
	ldi r16, TC0_OVFIF_bm
	sts TCC0_INTFLAGS, r16

	;Turn off TC
	ldi r16, TC_CLKSEL_OFF_gc	;Turn it off
	sts TCC0_CTRLA, r16

	; recover the status register
	pop r16
	sts CPU_SREG, r16
	pop r16

	reti




S2_ISR:
;button has been pressed or realeased

	; first, always preserve the status register
	push r16
	lds r16, CPU_SREG
	push r16

	;Debounce switch here. Just start TC
	;do the logic of adding and showing LEDs in the TC interrupt
	ldi r16, TC_CLKSEL_DIV1_gc
	sts TCC1_CTRLA, r16
	
	; recover the status register
	pop r16
	sts CPU_SREG, r16
	pop r16

	; return from interrupt
	reti	;not 'ret'!



S2_TC_ISR:
;if here, timer has overflowed

	; first, always preserve the status register
	push r16
	lds r16, CPU_SREG
	push r16


	ldi r17, 0b00110000		;toggle green off and red on
	sts PORTD_OUTTGL, r17

	; clear OVFIF
	ldi r16, TC0_OVFIF_bm
	sts TCC1_INTFLAGS, r16

	;Turn off TC
	ldi r16, TC_CLKSEL_OFF_gc	;Turn it off
	sts TCC1_CTRLA, r16

	; recover the status register
	pop r16
	sts CPU_SREG, r16
	pop r16

	reti