;******************************************************************************
;  File name: lab1_skeleton.asm
;  Author:  Christopher Crary
;  Last Modified By: Koby Miller
;  Last Modified On: 25 May 2020
;  Purpose: To filter data stored within a predefined input table based on a
;			set of given conditions and store a subset of filtered values
;			into an output table.
;******************************************************************************
;*********************************INCLUDES*************************************
.include "ATxmega128a1udef.inc"
;******************************END OF INCLUDES*********************************
;*********************************EQUATES**************************************
; potentially useful expressions
.equ NULL = 0
.equ OUT_TABLE_START_ADDR = 0x3700
.equ ThirtySeven = 3*7 + 37/3 - (3-7)  ; 21 + 12 + 4
;******************************END OF EQUATES**********************************
;***************************MEMORY CONFIGURATION*******************************
; program memory constants (if necessary)
.cseg
.org 0xABCD
IN_TABLE:
.db 99, 0x3B, 0164 ,0b00111111 ,0x44 ,0x55 ,'p' ,0112 ,'t' ,0b00111010 ,'<' ,0x39 ,0x57 ,49 ,100 ,NULL

.equ Table_size = 16; label used to calculate size of input table
IN_TABLE_END:
.db 16

; data memory allocation (if necessary)
.dseg
.org OUT_TABLE_START_ADDR
OUT_TABLE:
.byte (IN_TABLE_END - IN_TABLE)
;*************************END OF MEMORY CONFIGURATION**************************
;********************************MAIN PROGRAM**********************************
.cseg
; configure the reset vector 
;	(ignore meaning of "reset vector" for now)
.org 0x0
	rjmp MAIN

; place main program after interrupt vectors 
;	(ignore meaning of "interrupt vectors" for now)
.org 0x100
MAIN:
									;point appropriate indices to input/output tables
	ldi ZL, low(IN_TABLE << 1)		;load the first value in the table into the Z register
	ldi ZH, high(IN_TABLE << 1)

									;To read program memory we must multiply the table address by 2
									;0xABCD * 2 = 0x1579A
									;ZL = 9A
									;ZH = 57
									;we still need the most significant 1
	ldi r20, 0x01					;so we load it into the RAMPZ register
	out CPU_RAMPZ, r20				;we will need to extend load to use the RAMPZ register

	ldi YL, low(OUT_TABLE_START_ADDR)
	ldi YH, high(OUT_TABLE_START_ADDR)

	ldi r17, Table_Size

	clr r0


	; loop through input table, performing filtering and storing conditions
LOOP:
	
	elpm r16, Z				;load value from input table into an appropriate register
	dec r17
	breq DONE				;determine if the end of table has been reached (perform general check)
	
	; if end of table (EOT) has been reached, i.e., the NULL character was 
	; encountered, the program should branch to the relevant label used to
	; terminate the program (i.e., LOOP_END)
	rjmp CHECK_1
	; if EOT was not encountered, perform the first specified 
	; overall conditional check on loaded value (CONDITION_1)
CHECK_1:
	; check if the CONDITION_1 is met (bit 6 is set); if not, branch to 
	; FAILED_CHECK1
	andi r16, 0b1000000		;if bit is not set, this will = 0
	breq FAILED_CHECK1		;if bit is not set, branch to FAILED_CHECK1

							;if it is here, bit 6 is set, load Z back into r16
	elpm r16, Z+
	lsr r16					;divide by two
	ldi r18, 55				
	cp r16, r18				;compare 55
	brlo loop				;if lower than 55 branch to loop

	ldi r18, 8
	sub r16, r18			;otherwise, subtract 8

	st Y+, r16				;store in the table

	; the program should jump back to the beginning of the relevant loop
	rjmp LOOP

FAILED_CHECK1:
	elpm r16, Z+

	lsl r16					;divide by 2
	ldi r18, 114
	cp r16, r18				;compare 114
	breq EQUAL_OR_LOWER		;there is not <= so check for == then <
	brlo EQUAL_OR_LOWER
							;if here, it was greater than 114 so just loop
	rjmp loop

EQUAL_OR_LOWER:
	ldi r18, 191			;now add that extra 191
	add r16, r18

	st Y+, r16				;store in the table
	
	; the program should jump back to the beginning of the relevant loop
	rjmp LOOP
	
; end of program (infinite loop)
DONE: 
	rjmp DONE
;*****************************END OF MAIN PROGRAM *****************************