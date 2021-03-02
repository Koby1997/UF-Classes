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
sts PORTA_DIR, r16		; sets direction as inputs


LOOP:

lds r16, PORTA_IN		; load r16 with input switches
sts PORTC_OUTTGL, r16	; if the switch is on, toggle the light

ldi r16, 0xFF			; this is used to toggle every light
sts PORTC_OUTTGL, r16

ldi r20, 5
rcall DELAY_X_10MS		; delay specified amount

rjmp LOOP

; note for if you use the switches: If you flip a switch on and then off, the light can be left on, but
; this code is just to test the DELAY sub routines so I didn't worry about it




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