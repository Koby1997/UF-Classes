/*
 * lab2_2.asm
 *
 *  Created: 6/7/2020 4:34:29 PM
 *   Author: Koby Miller
 */ 


.include "ATxmega128A1Udef.inc"

.equ F_CPU = 2000000
.equ CLK_PRE = 256
.equ CLK_PRE_TWO = 2
.equ FRAME_PER_A = 1/20 ;50ms
.equ FRAME_PER_RECIP_A = 20

.ORG 0x0000
	rjmp MAIN

.ORG 0x0100

MAIN:

; initialize stack, start at 0x3FFF
ldi r16, 0xFF
sts CPU_SPL, r16
ldi r16, 0x3F
sts CPU_SPH, r16


; initialize ports for switches/LEDs
ldi r16, 0xFF
sts PORTC_OUT, r16		; this sets all LEDs
sts PORTC_DIR, r16		; sets direction as outputs

ldi r16, 0x00
sts PORTA_DIR, r16		; sets direction of switches as inputs

rcall TCC0_INIT

LOOP:

lds r16, TCC0_INTFLAGS
sbrs r16, 0				; if 0, skip the next instruction
rjmp LOOP
ldi r16, 0xFF			; this is used to toggle every light
sts PORTC_OUTTGL, r16

; clear OVFIF
ldi r16, TC0_OVFIF_bm
sts TCC0_INTFLAGS, r16

rjmp LOOP



DONE:
	rjmp DONE


DELAY_10MS:
; 0.01 second = x/(2*10^6)
; x = 2*10^4 = 20000
; would need to count around 20000 cycles
	push r18			; save r18
	push r19			; save r19

	ldi r18, 200		; count down from 200
	ldi r19, 34			; how many times we need to reset r18
DECRIMENT:
	dec r18									;takes 1 cycles
	brne DECRIMENT							;takes 2 when true cycles (Goes back to DECRIMENT)
	
	;if here, r18 is 0, reset to 200 in case we need to count down again
	ldi r18, 200							;takes 1 cycles
	dec r19									;takes 1 cycles
	brne DECRIMENT							;takes 2 cycles when true (Goes back to DECRIMENT)

	pop r19				; put r19 back
	pop r18				; put r18 back
	ret

;   ((200count * 3cycles) * 34resets) + (34resets * 4cycles) = 20,536cycles
;	if you only reset 33 times the total cycles is 19,932 cycles, but it was actually further off time wise


DELAY_X_10MS:
	; uses the r20 register
	; be mindful that at the end of this, r20 = 0

	rcall DELAY_10MS		;call delay sub routine
	dec r20					;decrement r20
	brne DELAY_X_10MS		;if r20 is not 0, do it again

	ret						;else, end the delay


	
TCC0_INIT:
	push r16

	clr r16
	sts TCC0_CNT, r16
	sts(TCC0_CNT+1), r16

	;set TCC0 period register
	;TCC0_PER = (fclk/prescalar) * (duration in seconds)
	;			 2MH/256			0.05
	;when you use the reciprocal, you divide by the duration
	;assembler can't do decimals

	ldi r16, low((F_CPU/CLK_PRE_TWO)/FRAME_PER_RECIP_A)		; change CLK_PRE to CLK_PRE for prescalar of 2
	sts TCC0_PER, r16									; 2,000,000/2	/20	  = 1,000,000/20 = 50000

	ldi r16, high((F_CPU/CLK_PRE_TWO)/FRAME_PER_RECIP_A)	; 2,000,000/256   /20  = 7812/20 = 3906
	sts (TCC0_PER + 1), r16

	;starts timer counter with prescaler of 256
	ldi r16, TC_CLKSEL_DIV2_gc						; change to TC_CLKSEL_DIV2_gc for prescalar of 2
	sts TCC0_CTRLA, r16

	pop r16

	ret
