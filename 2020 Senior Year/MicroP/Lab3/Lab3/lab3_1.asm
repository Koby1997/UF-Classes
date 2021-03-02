;
; Lab3_1.asm
;
; Toggle LEDS on SLB backpack every 250ms
;
; Created: 6/15/2020 9:14:12 PM
; Author : Koby Miller
;


.include "ATxmega128A1Udef.inc"

.equ F_CPU = 2000000
.equ CLK_PRE = 256
.equ FRAME_PER_A = 1/4 ; 250ms
.equ FRAME_PER_RECIP_A = 4


.ORG 0x0000
	rjmp MAIN

.ORG TCC0_OVF_vect
	rjmp TOGGLE_ISR


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

; initialize Interrupts
rcall INTR_INIT


TOGGLE_LOOP:
;Nothing goes here?
;Just keep looping and the timer will count
rjmp TOGGLE_LOOP


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
	;			 2MH/256			0.25
	;when you use the reciprocal, you divide by the duration
	;assembler can't do decimals

	ldi r16, low((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)
	sts TCC0_PER, r16

	ldi r16, high((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)	; 2,000,000/256   /4  = 19536
	sts (TCC0_PER + 1), r16

	ldi r16, TC_CLKSEL_DIV256_gc		;start the timer
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

	ldi r16, TC_OVFINTLVL_LO_gc		; low level. System level
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
TOGGLE_ISR:

	; first, always preserve the status register
	push r16
	lds r16, CPU_SREG
	push r16

	; this is used to toggle every light
	ldi r16, 0xFF
	sts PORTC_OUTTGL, r16

	; clear OVFIF
	ldi r16, TC0_OVFIF_bm
	sts TCC0_INTFLAGS, r16

	; recover the status register
	pop r16
	sts CPU_SREG, r16
	pop r16

	reti