/*
 * lab2_1.asm
 *
 *  Created: 5/31/2020 4:34:29 PM
 *   Author: Koby Miller
 */ 


.include "ATxmega128A1Udef.inc"

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
sts PORTA_DIR, r16		; sets switch direction as inputs


LOOP:

lds r16, PORTA_IN		; load r16 wich input switches
sts PORTC_OUT, r16

rjmp LOOP


DONE:
	rjmp DONE