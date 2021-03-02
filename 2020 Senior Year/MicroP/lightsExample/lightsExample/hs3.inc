;******************************************************************************
;  File name: hs3.inc
;  Author: Christopher Crary
;  Last Modified By: Christopher Crary
;  Last Modified On: 06 June 2020
;  Purpose: To define some useful symbols for the "hs3" program.
;******************************************************************************

#ifndef HS3_INC		; beginning of header guard
#define HS3_INC

;*********************************INCLUDES*************************************
.include "ATxmega128a1udef.inc"

; files to increase "modularity" of this file
.include "atxmega128a1u_extra.inc"
.include "misc.inc"
.include "ootb_upad_platform.inc"
;******************************END OF INCLUDES*********************************

;**********************************SYMBOLS*************************************

; interrupt symbols

.equ GLOBAL_INTR_PRI_LEVELS				=   (PMIC_LOLVLEN_bm)

.equ TOGGLE_PIN0_TC_OVF_vect			=   (TCC0_OVF_vect)

; toggle pin symbols

.equ TOGGLE_PIN0_bp						=   (0)
.equ TOGGLE_PIN0_bm						=   (1<<TOGGLE_PIN0_bp)
.equ TOGGLE_PIN1_bp						=   (1)
.equ TOGGLE_PIN1_bm						=   (1<<TOGGLE_PIN1_bp)

.equ TOGGLE_PINS_gm						=   (TOGGLE_PIN0_bm | TOGGLE_PIN1_bm)

.equ TOGGLE_PINS_PORT_DIRSET			=   (PORTA_DIRSET)
.equ TOGGLE_PINS_PORT_OUTTGL			=   (PORTA_OUTTGL)


; switch symbols

.equ TOGGLE_PIN1_SWITCH_bp				=	(OOTB_MB_S1_bp)
.equ TOGGLE_PIN1_SWITCH_bm				=	(1<<TOGGLE_PIN1_SWITCH_bp)

.equ TOGGLE_PIN1_SWITCH_PORT_DIRCLR     =   (OOTB_MB_TS_PORT_DIRCLR)
.equ TOGGLE_PIN1_SWITCH_PORT_IN			=   (OOTB_MB_TS_PORT_IN)


; timer/counter symbols


.equ TOGGLE_PIN0_TC_FREQ				=	(10)
.equ TOGGLE_PIN0_TC_PRE					=	(8)
.equ TOGGLE_PIN0_TC_PER_VAL_CAL			=   (500)
.equ TOGGLE_PIN0_TC_PER_VAL				=	(DEFAULT_SYS_CLOCK_FREQ/ \
											 TOGGLE_PIN0_TC_PRE)/ \
											(TOGGLE_PIN0_TC_FREQ) + \
											(TOGGLE_PIN0_TC_PER_VAL_CAL)


.equ TOGGLE_PIN0_TC_CTRLA				=   (TCC0_CTRLA)
.equ TOGGLE_PIN0_TC_INTCTRLA			=   (TCC0_INTCTRLA)
.equ TOGGLE_PIN0_TC_INTFLAGS			=   (TCC0_INTFLAGS)
.equ TOGGLE_PIN0_TC_PER					=   (TCC0_PER)

.equ TOGGLE_PIN0_TC_CLKSEL				=	(TC_CLKSEL_DIV8_gc)

.equ TOGGLE_PIN0_TC_OVF_PRI_LVL			=	(TC0_OVFINTLVL0_bm)

.equ TOGGLE_PIN0_TC_OVFIF_bp			=	(TC0_OVFIF_bp)
.equ TOGGLE_PIN0_TC_OVFIF_bm			=	(1<<TOGGLE_PIN0_TC_OVFIF_bp)

;******************************END OF SYMBOLS**********************************

#endif		; end of header guard

;******************************END OF "hs3.inc"********************************
