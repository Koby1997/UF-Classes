;******************************************************************************
;  File name: lab2_4.asm
;  Author: Christopher Crary
;  Last Modified By: Koby Miller
;  Last Modified On: 8 June 2020
;  Purpose: To allow LED animations to be created with the OOTB ?AD, 
;			OOTB SLB, and OOTB MB (or EBIBB, if a previous version of the kit
;			is used).
;
;			NOTE: The use of this file is NOT required! This file is just given
;			as an example for how to potentially write code more effectively.
;******************************************************************************

;*********************************INCLUDES*************************************

; The inclusion of the following file is REQUIRED for our course, since
; it is intended that you understand concepts regarding how to specify an 
; "include file" to an assembler. 
.include "ATxmega128a1udef.inc"
;******************************END OF INCLUDES*********************************

;******************************DEFINED SYMBOLS*********************************
.equ ANIMATION_START_ADDR	=	0x2000	;useful, but not required
.equ ANIMATION_SIZE			=	(0x3FFF - 0x2000);useful, but not required
.equ F_CPU = 2000000
.equ CLK_PRE = 256
.equ FRAME_PER_A = 1/20 ;50ms
.equ FRAME_PER_RECIP_A = 20
;**************************END OF DEFINED SYMBOLS******************************

;******************************MEMORY CONSTANTS********************************
; data memory allocation
.dseg

.org ANIMATION_START_ADDR
ANIMATION:
.byte ANIMATION_SIZE
;***************************END OF MEMORY CONSTANTS****************************

;********************************MAIN PROGRAM**********************************
.cseg
; upon system reset, jump to main program (instead of executing
; instructions meant for interrupt vectors)
.org 0x0000
	rjmp MAIN

; place the main program somewhere after interrupt vectors (ignore for now)
.org 0x0100		; >= 0xFD
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

; Initialize the X and Y indices to point to the beginning of the 
; animation table. (Although one pointer could be used to both
; store frames and playback the current animation, it is simpler
; to utilize a separate index for each of these operations.)
; Note: recognize that the animation table is in DATA memory

;Y init. Using to store
ldi YL, BYTE3(ANIMATION)
out CPU_RAMPY, YL
ldi YH, BYTE2(ANIMATION)
ldi YL, BYTE1(ANIMATION)

;Z init. Using to playback
ldi ZL, BYTE3(ANIMATION)
out CPU_RAMPZ, ZL
ldi ZH, BYTE2(ANIMATION)
ldi ZL, BYTE1(ANIMATION)



; begin main program loop 
	
; "EDIT" mode
EDIT:
; Check if it is intended that "PLAY" mode be started, i.e.,
; determine if the relevant switch has been pressed.

;For some reason, bit 1 is for switch S2 even though skematic has it as bit 0
lds r16, PORTE_IN	;read input of memory base tactical switch S2
sbrs r16, 1			;skip next instruction if bit = 1 meaning not pressed (button not pressed = pulled high)
rjmp PLAY
; If it is determined that relevant switch was pressed, 
; go to "PLAY" mode.


; Otherwise, if the "PLAY" mode switch was not pressed,
; update display LEDs with the voltage values from relevant DIP switches
; and check if it is intended that a frame be stored in the animation
; (determine if this relevant switch has been pressed).

lds r16, PORTA_IN
sts PORTC_OUT, r16


; If the "STORE_FRAME" switch was not pressed,
; branch back to "EDIT".

lds r16, PORTF_IN
sbrc r16, 2			;skip next instruction if bit = 0 meaning it is pressed
rjmp EDIT


; Otherwise, if it was determined that relevant switch was pressed,
; perform debouncing process, e.g., start relevant timer/counter
; and wait for it to overflow. (Write to CTRLA and loop until
; the OVFIF flag within INTFLAGS is set.)

;starts timer counter with prescaler of 256
ldi r16, TC_CLKSEL_DIV256_gc
sts TCC0_CTRLA, r16
;I measured around a 10ms debounce rate for the switch. To be safe and to reuse code
;I can use the same TC that counts the frames and just count 50ms

LOOP:
lds r16, TCC0_INTFLAGS
sbrs r16, 0				; if 1, skip the next instruction
rjmp LOOP


; After relevant timer/counter has overflowed (i.e., after
; the relevant debounce period), disable this timer/counter,
; clear the relevant timer/counter OVFIF flag,
; and then read switch value again to verify that it was
; actually pressed. If so, perform intended functionality, and
; otherwise, do not; however, in both cases, wait for switch to
; be released before jumping back to "EDIT".

ldi r16, TC_CLKSEL_OFF_gc	;Turn it off
sts TCC0_CTRLA, r16

ldi r16, TC0_OVFIF_bm		;clear OVFIF
sts TCC0_INTFLAGS, r16

lds r16, PORTF_IN			;read press again
sbrc r16, 2					;skip next instruction if bit = 0 meaning pressed
rjmp EDIT


; Wait for the "STORE FRAME" switch to be released
; before jumping to "EDIT".
STORE_FRAME_SWITCH_RELEASE_WAIT_LOOP:
lds r16, PORTF_IN			;read until not pressed
sbrs r16, 2					;skip next instruction if bit = 1, not pressed
rjmp STORE_FRAME_SWITCH_RELEASE_WAIT_LOOP

;If here, now store
lds r16, PORTA_IN
st Y+, r16

rjmp EDIT




	
; "PLAY" mode
PLAY:

; Reload the relevant index to the first memory location
; within the animation table to play animation from first frame.

ldi ZL, BYTE3(ANIMATION)
out CPU_RAMPZ, ZL
ldi ZH, BYTE2(ANIMATION)
ldi ZL, BYTE1(ANIMATION)

PLAY_LOOP:

; Check if it is intended that "EDIT" mode be started
; i.e., check if the relevant switch has been pressed.

;For some reason, bit 0 is for switch S2 even though skematic has it as bit 1
lds r16, PORTE_IN	;read input of memory base tactical switch S1
sbrs r16, 0			;skip next instruction if bit = 1 meaning not pressed
rjmp EDIT
; If it is determined that relevant switch was pressed, 
; go to "EDIT" mode.


; Otherwise, if the "EDIT" mode switch was not pressed,
; determine if index used to load frames has the same
; address as the index used to store frames, i.e., if the end
; of the animation has been reached during playback.
; (Placing this check here will allow animations of all sizes,
; including zero, to playback properly.)
; To efficiently determine if these index values are equal,
; a combination of the "CP" and "CPC" instructions is recommended.

cp ZL,YL
brne DIFFERENT_ADDRESS
cp ZH,YH
brne DIFFERENT_ADDRESS
;cp CPU_RAMPZ, CPU_RAMPY
;brne DIFFERENT_ADDRESS

;If here, they are at the same address
rjmp PLAY
; If index values are equal, branch back to "PLAY" to
; restart the animation.


DIFFERENT_ADDRESS:
; Otherwise, load animation frame from table, 
; display this "frame" on the relevant LEDs,
; start relevant timer/counter,
; wait until this timer/counter overflows (to more or less
; achieve the "frame rate"), and then after the overflow,
; stop the timer/counter,
; clear the relevant OVFIF flag,
; and then jump back to "PLAY_LOOP".

ld r16, Z+
sts PORTC_OUT, r16

;starts timer counter with prescaler of 256
ldi r16, TC_CLKSEL_DIV256_gc
sts TCC0_CTRLA, r16

FRAME_LOOP:
lds r16, TCC0_INTFLAGS
sbrs r16, 0				; if 0, skip the next instruction
rjmp FRAME_LOOP

; clear OVFIF
ldi r16, TC0_OVFIF_bm
sts TCC0_INTFLAGS, r16 

rjmp PLAY_LOOP


; end of program (never reached)
DONE: 
	rjmp DONE
;*****************************END OF MAIN PROGRAM *****************************

;********************************SUBROUTINES***********************************

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

	; DIP switches on SLB
	ldi r16, 0x00
	sts PORTA_DIR, r16		; sets switch direction as inputs

	; switch on OOTB SLB
	ldi r16, 0b00000100		; tactical switch 1
	sts PORTF_DIRCLR, r16	; used DIRCLR for practice, really it sets every bit that = 1 in r16
							; to 0. That sets them to inputs
	
	;switches on OOTB EBIBB
	ldi r16, 0b00000011
	sts PORTE_DIRCLR, r16

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
TC_INIT:
	; protect relevant registers
	push r16
	; initialize the relevant TC modules

	clr r16
	sts TCC0_CNT, r16
	sts(TCC0_CNT+1), r16

	;set TCC0 period register
	;TCC0_PER = (fclk/prescalar) * (duration in seconds)
	;			 2MH/256			0.05
	;when you use the reciprocal, you divide by the duration
	;assembler can't do decimals

	ldi r16, low((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)
	sts TCC0_PER, r16

	ldi r16, high((F_CPU/CLK_PRE)/FRAME_PER_RECIP_A)	; 2,000,000/256   /20  = 7812/20 = 3906
	sts (TCC0_PER + 1), r16
	
	; recover relevant registers
		pop r16

	; return from subroutine
	ret

;*****************************END OF SUBROUTINES*******************************

;*****************************END OF "lab2_4.asm"******************************