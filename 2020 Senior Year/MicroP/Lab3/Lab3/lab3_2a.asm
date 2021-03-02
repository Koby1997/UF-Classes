;
; Lab3_2a.asm
;
; Using interrupts to count with a tactile switch.
; This works asynchronously as we are always toggling a blue LED.
; However, this code does not debounce the tactile switch.
;
;
; Created: 6/15/2020 9:35:11 PM
; Author : Koby Miller
;


.include "ATxmega128A1Udef.inc"


.ORG 0x0000
	rjmp MAIN


.ORG PORTF_INT0_vect
	rjmp COUNT_ISR


.ORG 0x0100
MAIN:

; initialize the stack pointer
ldi r16, 0xFF
sts CPU_SPL, r16
ldi r16, 0x3F
sts CPU_SPH, r16

; initialize relevant I/O modules (switches and LEDs)
rcall IO_INIT

; initialize relevant interrupts
rcall INTR_INIT

;default r20 to have all the lights off. Use this to store our count
ldi r20, 0xFF	



OVERALL_LOOP:
;toggle blue here
ldi r16, 0b01000000
sts PORTD_OUTTGL, r16

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

	; BLUE_PMW
	ldi r16, 0b01000000
	sts PORTD_OUTSET, r16	; set led to off
	sts PORTD_DIRSET, r16	;make it an output

	; switch on OOTB SLB
	ldi r16, 0b00000100		; tactical switch 1
	sts PORTF_DIRCLR, r16
							

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

	;Set as low level interrupt
	ldi r16, 1				
	sts PORTF_INTCTRL, r16

	;Only call the interrupt on a falling edge. When the button is pressed
	ldi r16, 0b00000010
	sts PORTF_PIN2CTRL, r16

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

COUNT_ISR:

	; first, always preserve the status register
	push r16
	lds r16, CPU_SREG
	push r16

	dec r20		;LEDs are active low, so this is really like adding 1
	sts PORTC_OUT, r20

	; recover the status register
	pop r16
	sts CPU_SREG, r16
	pop r16

	; return from interrupt
	reti	;not 'ret'!