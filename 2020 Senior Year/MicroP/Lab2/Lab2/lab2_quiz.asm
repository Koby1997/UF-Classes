/*
 * lab2_quiz.asm
 *
 *  Created: 6/9/2020 2:04:29 PM
 *   Author: Koby Miller
 */ 


.include "ATxmega128A1Udef.inc"


.equ F_CPU = 2000000
.equ CLK_PRE = 256
.equ FRAME_PER_A = 1/2 ;500ms
.equ FRAME_PER_RECIP_A = 2

.equ CLK_PRE_ONE = 1
.equ FRAME_PER_A_ONE = 1/100 ;10ms
.equ FRAME_PER_RECIP_A_ONE = 100



.ORG 0x0000
	rjmp MAIN

.ORG 0x0100

MAIN:

; initialize stack, start at 0x3FFF
ldi r16, 0xFF
sts CPU_SPL, r16
ldi r16, 0x3F
sts CPU_SPH, r16

; initialize relevant I/O modules (switches and LEDs)
	rcall IO_INIT

; initialize (but do not start) the relevant timer/counter module(s)
	rcall TC0_INIT
	rcall TC1_INIT

; initialize r18 (count from right) and r19(count from left)
ldi r18, 0b00000001
ldi r19, 0b10000000


LOOP:

lds r16, PORTC_OUT
cp r16, r0			;if all 0 go to toggle
breq TOGGLE_START

;if here, not all lights are on, check the buttons

lds r16, PORTF_IN
sbrs r16, 2		;skip next instruction if bit = 1 meaning not pressed
rcall LEFT

sbrs r16, 3
rcall RIGHT



rjmp LOOP





TOGGLE_START:
;starts timer counter with prescaler of 1
ldi r16, TC_CLKSEL_DIV256_gc
sts TCC0_CTRLA, r16

TOGGLE:
lds r16, TCC0_INTFLAGS
sbrs r16, 0				; if 0, skip the next instruction
rjmp TOGGLE
ldi r16, 0xFF			; this is used to toggle every light
sts PORTC_OUTTGL, r16

; clear OVFIF
ldi r16, TC0_OVFIF_bm
sts TCC0_INTFLAGS, r16

rjmp TOGGLE





DONE:
	rjmp DONE


	;********************************SUBROUTINES***********************************

LEFT:

;starts timer counter with prescaler of 1
ldi r16, TC_CLKSEL_DIV1_gc
sts TCC1_CTRLA, r16

WAIT_ONE:
lds r16, TCC1_INTFLAGS
sbrs r16, 0				; if 1, skip the next instruction
rjmp WAIT_ONE

ldi r16, TC_CLKSEL_OFF_gc	;Turn it off
sts TCC1_CTRLA, r16

ldi r16, TC1_OVFIF_bm		;clear OVFIF
sts TCC1_INTFLAGS, r16

lds r16, PORTF_IN			;read press again
sbrc r16, 2					;skip next instruction if bit = 0 meaning pressed
ret


SWITCH_ONE_RELEASE_WAIT_LOOP:
lds r16, PORTF_IN			;read until not pressed
sbrs r16, 2					;skip next instruction if bit = 1, not pressed
rjmp SWITCH_ONE_RELEASE_WAIT_LOOP




sts PORTC_OUTTGL, r19
lsr r19
ret






RIGHT:

;starts timer counter with prescaler of 1
ldi r16, TC_CLKSEL_DIV1_gc
sts TCC1_CTRLA, r16

WAIT_TWO:
lds r16, TCC1_INTFLAGS
sbrs r16, 0				; if 1, skip the next instruction
rjmp WAIT_TWO

ldi r16, TC_CLKSEL_OFF_gc	;Turn it off
sts TCC1_CTRLA, r16

ldi r16, TC1_OVFIF_bm		;clear OVFIF
sts TCC1_INTFLAGS, r16

lds r16, PORTF_IN			;read press again
sbrc r16, 3					;skip next instruction if bit = 0 meaning pressed
ret


SWITCH_TWO_RELEASE_WAIT_LOOP:
lds r16, PORTF_IN			;read until not pressed
sbrs r16, 3					;skip next instruction if bit = 1, not pressed
rjmp SWITCH_TWO_RELEASE_WAIT_LOOP


sts PORTC_OUTTGL, r18
lsl r18
ret




;******************************************************************************
; Name: IO_INIT 
; Purpose: To initialize the relevant input/output modules, as pertains to the
;		   application.
; Input(s): OOTB SLB DIP switches/tactical switch 1
; Output: LEDs
;******************************************************************************
IO_INIT:
	; protect relevant registers
	push r16

	; initialize the relevant I/O

	; LEDs on SLB
	ldi r16, 0xFF
	sts PORTC_OUT, r16		; this sets all LEDs
	sts PORTC_DIR, r16		; sets direction as outputs

	; switch on OOTB SLB
	ldi r16, 0b00001100		; tactical switch 1 and 2
	sts PORTF_DIRCLR, r16	; used DIRCLR for practice, really it sets every bit that = 1 in r16
							; to 0. That sets them to inputs

	; recover relevant registers
	pop r16
	; return from subroutine
	ret

;******************************************************************************
; Name: TC_INIT 
; Purpose: To initialize the relevant timer/counter modules, as pertains to
;		   application.
; Input(s): N/A
; Output: N/A
;******************************************************************************
TC0_INIT:
	; protect relevant registers
	push r16
	; initialize the relevant TC modules

	clr r16
	sts TCC0_CNT, r16
	sts(TCC0_CNT+1), r16

	;set TCC0 period register
	;TCC0_PER = (fclk/prescalar) * (duration in seconds)
	;			 2MH/256			0.5
	;when you use the reciprocal, you divide by the duration
	;assembler can't do decimals

	ldi r16, low((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)
	sts TCC0_PER, r16

	ldi r16, high((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)	; 2,000,000/256   /2  = 7812/2 = 3906
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
	;			 2MH/1			0.01
	;when you use the reciprocal, you divide by the duration
	;assembler can't do decimals

	ldi r16, low((F_CPU/CLK_PRE_ONE)/FRAME_PER_RECIP_A_ONE)
	sts TCC1_PER, r16

	ldi r16, high((F_CPU/CLK_PRE_ONE)/FRAME_PER_RECIP_A_ONE)	; 2,000,000/1   /100  = 20000
	sts (TCC1_PER + 1), r16
	
	; recover relevant registers
		pop r16

	; return from subroutine
	ret








;*****************************END OF SUBROUTINES*******************************