/*
 * lab2_2.asm
 *
 *  Created: 6/7/2020 4:34:29 PM
 *   Author: Koby Miller
 */ 


.include "ATxmega128A1Udef.inc"

.equ F_CPU = 2000000
.equ CLK_PRE = 64
.equ FRAME_PER_A = 1/1
.equ FRAME_PER_RECIP_A = 1

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

ldi r17, 60				; We will count the seconds here (count down)
ldi r18, 0				; We will count the minutes here

LOOP:

lds r16, TCC0_INTFLAGS
sbrs r16, 0				; if 0, skip the next instruction
rjmp LOOP
ldi r16, 0xFF			; this is used to toggle every light
sts PORTC_OUTTGL, r16

; clear OVFIF
ldi r16, TC0_OVFIF_bm
sts TCC0_INTFLAGS, r16

dec r17
sbrs r17, 0				; if 0, skip the next instruction
rjmp LOOP
ldi r17, 60				; if here, reset second count and increase minute count
inc r18

rjmp LOOP


DONE:
	rjmp DONE


	
TCC0_INIT:
	push r16

	clr r16
	sts TCC0_CNT, r16
	sts(TCC0_CNT+1), r16

	;set TCC0 period register
	;TCC0_PER = (fclk/prescalar) * (duration in seconds)
	;			 2MH/64					1
	;when you use the reciprocal, you divide by the duration
	;assembler can't do decimals

	ldi r16, low((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)		; change CLK_PRE to CLK_PRE for prescalar of 2
	sts TCC0_PER, r16										; 2,000,000/64	/1	  = 31250

	ldi r16, high((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)
	sts (TCC0_PER + 1), r16

	;starts timer counter with prescaler of 64
	ldi r16, TC_CLKSEL_DIV64_gc
	sts TCC0_CTRLA, r16

	pop r16

	ret
