-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "01/22/2020 15:33:32"

-- 
-- Device: Altera EPM240F100C4 Package FBGA100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

ENTITY 	adder IS
    PORT (
	input1 : IN std_logic_vector(3 DOWNTO 0);
	input2 : IN std_logic_vector(3 DOWNTO 0);
	carry_in : IN std_logic;
	sum : BUFFER std_logic_vector(3 DOWNTO 0);
	carry_out : BUFFER std_logic
	);
END adder;

-- Design Ports Information


ARCHITECTURE structure OF adder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_input2 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_carry_in : std_logic;
SIGNAL ww_sum : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_carry_out : std_logic;
SIGNAL \carry_in~combout\ : std_logic;
SIGNAL \FA0|sum~0_combout\ : std_logic;
SIGNAL \FA0|carry_out~0_combout\ : std_logic;
SIGNAL \FA1|sum~combout\ : std_logic;
SIGNAL \FA1|carry_out~0_combout\ : std_logic;
SIGNAL \FA2|sum~combout\ : std_logic;
SIGNAL \FA2|carry_out~0_combout\ : std_logic;
SIGNAL \FA3|sum~combout\ : std_logic;
SIGNAL \FA3|carry_out~0_combout\ : std_logic;
SIGNAL \input1~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \input2~combout\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_input1 <= input1;
ww_input2 <= input2;
ww_carry_in <= carry_in;
sum <= ww_sum;
carry_out <= ww_carry_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input2[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input2(0),
	combout => \input2~combout\(0));

-- Location: PIN_K6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\carry_in~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_carry_in,
	combout => \carry_in~combout\);

-- Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input1[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input1(0),
	combout => \input1~combout\(0));

-- Location: LC_X3_Y1_N5
\FA0|sum~0\ : maxii_lcell
-- Equation(s):
-- \FA0|sum~0_combout\ = \input2~combout\(0) $ (\carry_in~combout\ $ (((\input1~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9966",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input2~combout\(0),
	datab => \carry_in~combout\,
	datad => \input1~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \FA0|sum~0_combout\);

-- Location: LC_X3_Y1_N9
\FA0|carry_out~0\ : maxii_lcell
-- Equation(s):
-- \FA0|carry_out~0_combout\ = (\input2~combout\(0) & ((\carry_in~combout\) # ((\input1~combout\(0))))) # (!\input2~combout\(0) & (\carry_in~combout\ & ((\input1~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ee88",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input2~combout\(0),
	datab => \carry_in~combout\,
	datad => \input1~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \FA0|carry_out~0_combout\);

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input2[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input2(1),
	combout => \input2~combout\(1));

-- Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input1[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input1(1),
	combout => \input1~combout\(1));

-- Location: LC_X3_Y1_N7
\FA1|sum\ : maxii_lcell
-- Equation(s):
-- \FA1|sum~combout\ = (\FA0|carry_out~0_combout\ $ (\input2~combout\(1) $ (\input1~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c33c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \FA0|carry_out~0_combout\,
	datac => \input2~combout\(1),
	datad => \input1~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \FA1|sum~combout\);

-- Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input1[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input1(2),
	combout => \input1~combout\(2));

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input2[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input2(2),
	combout => \input2~combout\(2));

-- Location: LC_X3_Y1_N3
\FA1|carry_out~0\ : maxii_lcell
-- Equation(s):
-- \FA1|carry_out~0_combout\ = ((\FA0|carry_out~0_combout\ & ((\input2~combout\(1)) # (\input1~combout\(1)))) # (!\FA0|carry_out~0_combout\ & (\input2~combout\(1) & \input1~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fcc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \FA0|carry_out~0_combout\,
	datac => \input2~combout\(1),
	datad => \input1~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \FA1|carry_out~0_combout\);

-- Location: LC_X3_Y1_N2
\FA2|sum\ : maxii_lcell
-- Equation(s):
-- \FA2|sum~combout\ = \input1~combout\(2) $ (((\input2~combout\(2) $ (\FA1|carry_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a55a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input1~combout\(2),
	datac => \input2~combout\(2),
	datad => \FA1|carry_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \FA2|sum~combout\);

-- Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input2[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input2(3),
	combout => \input2~combout\(3));

-- Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input1[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input1(3),
	combout => \input1~combout\(3));

-- Location: LC_X3_Y1_N4
\FA2|carry_out~0\ : maxii_lcell
-- Equation(s):
-- \FA2|carry_out~0_combout\ = (\input1~combout\(2) & (((\input2~combout\(2)) # (\FA1|carry_out~0_combout\)))) # (!\input1~combout\(2) & (((\input2~combout\(2) & \FA1|carry_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "faa0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input1~combout\(2),
	datac => \input2~combout\(2),
	datad => \FA1|carry_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \FA2|carry_out~0_combout\);

-- Location: LC_X3_Y1_N6
\FA3|sum\ : maxii_lcell
-- Equation(s):
-- \FA3|sum~combout\ = \input2~combout\(3) $ (\input1~combout\(3) $ ((\FA2|carry_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9696",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input2~combout\(3),
	datab => \input1~combout\(3),
	datac => \FA2|carry_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \FA3|sum~combout\);

-- Location: LC_X3_Y1_N8
\FA3|carry_out~0\ : maxii_lcell
-- Equation(s):
-- \FA3|carry_out~0_combout\ = (\input2~combout\(3) & ((\input1~combout\(3)) # ((\FA2|carry_out~0_combout\)))) # (!\input2~combout\(3) & (\input1~combout\(3) & (\FA2|carry_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e8e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input2~combout\(3),
	datab => \input1~combout\(3),
	datac => \FA2|carry_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \FA3|carry_out~0_combout\);

-- Location: PIN_J5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\sum[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \FA0|sum~0_combout\,
	oe => VCC,
	padio => ww_sum(0));

-- Location: PIN_H5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\sum[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \FA1|sum~combout\,
	oe => VCC,
	padio => ww_sum(1));

-- Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\sum[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \FA2|sum~combout\,
	oe => VCC,
	padio => ww_sum(2));

-- Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\sum[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \FA3|sum~combout\,
	oe => VCC,
	padio => ww_sum(3));

-- Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\carry_out~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \FA3|carry_out~0_combout\,
	oe => VCC,
	padio => ww_carry_out);
END structure;


