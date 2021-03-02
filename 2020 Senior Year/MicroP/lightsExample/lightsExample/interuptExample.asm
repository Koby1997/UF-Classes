/* External_Interrupt.asm
 *
 * Modified: 2 Feb 2020
 * Authors: Dr. Schwartz
 * This program will generate an external interrupt on a low level on PORTD_PIN0
 * For demonstration, use the following Watch: 
 *   *(char*)PortD_IN
 * Use simulator (or board) to demonstrate.
 * Use F5 (NOT F11, i.e., do NOT single step) and pause, changing the value
 *   of PD0 as follows (put breakpoints at first line of MAIN, rjmp LOOP, 
 *   and nop in ISR:
 * In IO View, use PORTD
 *      If PD0 is a 0, should get an interrupt. 
 *      If PD0 is a 1, should NOT get an interrupt.
 */ 
 .include "ATxmega128A1Udef.inc"
;******************************INITIALIZATIONS***************************************
.equ Bit0 = 0b00000001
.equ BIT10 = 0b00000011
.equ INV760 = 0b00111110	;Not used

.equ stack_init = 0x3FFF	

.org 0x0000
	rjmp MAIN

; Place code at the interrupt vector for PORTD_INT0 interrupt & jump to ISR
.org PORTD_INT0_VECT		
	rjmp EXT_INTR_ISR			

; org program at 0x200 so we don't overwrite interrupt vectors at 0x0000-0x00FE
.org 0x0200		
MAIN:
	ldi YL, low(stack_init)
	out CPU_SPL, YL
	ldi YL, high(stack_init)
	out CPU_SPH, YL

	ldi r18, 0
	ldi r19, 0
	rcall INIT_INTERRUPT	;call our subroutine to initialize our interrupt
	nop

LOOP:
	inc  r19
 	rjmp LOOP				;loop forver while our interrupt fires
/************************************************************************************
* Name:     INIT_INTERRUPT
* Purpose:  Subroutine to initialize the PortD external pin interrupt PD0 using INT0
* Inputs:   None			 
* Outputs:  None
* Affected: r16, PMIC_CTRL, PORTD: _INT0MASK_OUT, _DIRCLR, _INTCTRL, _PIN0CTRL
 ***********************************************************************************/
INIT_INTERRUPT:
	ldi r16, BIT0			;select PORTD_PIN0 as the interrupt source
	sts PORTD_INT0MASK, r16	;		

	sts PORTD_OUT, r16		;set output to default to '1'. 
;	Manual tells you to do this, but it may not be necessary, but good practice.
	
;	ldi r16, BIT0			;Set external interrupt pin (PD0) as an input
	sts PORTD_DIRCLR, r16

;	ldi r16, BIT0			;select the external interrupt as a low level 
	sts PORTD_INTCTRL, r16	;  priority interrupt 
;	Probably inappropriately cleared the INT1 interrupt level pins 

	ldi	r16, BIT10			;select low level pin for external interrupt 
	sts	PORTD_PIN0CTRL, r16	;  (not rising edge, falling edge, or any edge)
;	Probably inappropriately cleared pins 7, 5, 4, 3

	ldi r16, BIT0
	sts PMIC_CTRL, r16		;turn on low level interrupts
;	Also effected pins 7-1

	sei						;turn on the global interrupt flag LAST! 
	ret
/************************************************************************************
* Name:     EXT_INTR_ISR
* Purpose:  Interrupt service routine to deal with the PortD external 
*           pin interrupt PD0.  Do NOT need to clear the interrupt flag,
*           but "it can't hurt!"
* Inputs:   r18
* Outputs:  r18
* Affected: PORTD_INTFLAGS
 ***********************************************************************************/
EXT_INTR_ISR:
;	"push CPU_SREG"	;not needed since won't change from below
	push r17
	nop			;dummy instruction to set a breakpoint	
	inc  r18
	ldi	 r17, Bit0
	sts  PORTD_INTFLAGS, r17	; Clear the PORTD_INTFLAGS
	pop  r17
;	"pop CPU_SREG"
	reti		;return from the interrupt routine