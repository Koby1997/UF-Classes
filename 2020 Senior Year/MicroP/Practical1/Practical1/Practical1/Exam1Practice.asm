/*
 * Exam1Practice.asm
 *
 *  Created: 6/18/2020 3:29:51 PM
 *   Author: Koby
 */ 


 .include "ATxmega128aludef.inc

 .equ TABLE_SIZE = 0x4AB
 .equ 

 .org 0x2A0E
	OUT_TAB:
	.db 0x00, 0x00, 0x00





CALC:

;assume Y and Z are pointed at the beginning of the input table
