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

-- DATE "02/05/2020 17:49:10"

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

ENTITY 	adder_top IS
    PORT (
	x : IN std_logic_vector(7 DOWNTO 0);
	y : IN std_logic_vector(7 DOWNTO 0);
	cin : IN std_logic;
	s : BUFFER std_logic_vector(7 DOWNTO 0);
	cout : BUFFER std_logic
	);
END adder_top;

-- Design Ports Information


ARCHITECTURE structure OF adder_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_x : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_y : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL ww_s : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_cout : std_logic;
SIGNAL \cin~combout\ : std_logic;
SIGNAL \U_ADDER|A1|A1|S[0]~0_combout\ : std_logic;
SIGNAL \U_ADDER|A1|A1|c~0_combout\ : std_logic;
SIGNAL \U_ADDER|A1|A1|BG~0_combout\ : std_logic;
SIGNAL \U_ADDER|A1|GEN|C1~0_combout\ : std_logic;
SIGNAL \U_ADDER|A1|GEN|C1~1_combout\ : std_logic;
SIGNAL \U_ADDER|A1|A2|c~0_combout\ : std_logic;
SIGNAL \U_ADDER|A1|A2|S[1]~0_combout\ : std_logic;
SIGNAL \U_ADDER|A1|A2|BP~0_combout\ : std_logic;
SIGNAL \U_ADDER|G1|C1~0_combout\ : std_logic;
SIGNAL \U_ADDER|A1|GEN|BG~0_combout\ : std_logic;
SIGNAL \U_ADDER|A1|GEN|BG~1_combout\ : std_logic;
SIGNAL \U_ADDER|A2|A1|c~0_combout\ : std_logic;
SIGNAL \U_ADDER|A2|A1|S[1]~0_combout\ : std_logic;
SIGNAL \U_ADDER|A2|A1|BG~0_combout\ : std_logic;
SIGNAL \U_ADDER|A2|GEN|C1~0_combout\ : std_logic;
SIGNAL \U_ADDER|A2|GEN|C1~1_combout\ : std_logic;
SIGNAL \U_ADDER|A2|A2|c~0_combout\ : std_logic;
SIGNAL \U_ADDER|A2|A2|S[1]~0_combout\ : std_logic;
SIGNAL \U_ADDER|G1|C2~0_combout\ : std_logic;
SIGNAL \U_ADDER|G1|C2~1_combout\ : std_logic;
SIGNAL \x~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \y~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \U_ADDER|A2|A1|S\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \U_ADDER|A1|A1|S\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \U_ADDER|A1|A2|S\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \U_ADDER|A2|A2|S\ : std_logic_vector(1 DOWNTO 0);

BEGIN

ww_x <= x;
ww_y <= y;
ww_cin <= cin;
s <= ww_s;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\y[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_y(0),
	combout => \y~combout\(0));

-- Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\cin~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_cin,
	combout => \cin~combout\);

-- Location: PIN_K9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_x(0),
	combout => \x~combout\(0));

-- Location: LC_X5_Y2_N6
\U_ADDER|A1|A1|S[0]~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|A1|S[0]~0_combout\ = (\y~combout\(0) $ (\cin~combout\ $ (\x~combout\(0))))

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
	datab => \y~combout\(0),
	datac => \cin~combout\,
	datad => \x~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|A1|S[0]~0_combout\);

-- Location: PIN_J8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_x(1),
	combout => \x~combout\(1));

-- Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\y[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_y(1),
	combout => \y~combout\(1));

-- Location: LC_X5_Y2_N9
\U_ADDER|A1|A1|c~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|A1|c~0_combout\ = ((\y~combout\(0) & ((\cin~combout\) # (\x~combout\(0)))) # (!\y~combout\(0) & (\cin~combout\ & \x~combout\(0))))

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
	datab => \y~combout\(0),
	datac => \cin~combout\,
	datad => \x~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|A1|c~0_combout\);

-- Location: LC_X5_Y2_N0
\U_ADDER|A1|A1|S[1]\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|A1|S\(1) = \x~combout\(1) $ (((\y~combout\(1) $ (\U_ADDER|A1|A1|c~0_combout\))))

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
	dataa => \x~combout\(1),
	datac => \y~combout\(1),
	datad => \U_ADDER|A1|A1|c~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|A1|S\(1));

-- Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_x(2),
	combout => \x~combout\(2));

-- Location: LC_X5_Y2_N5
\U_ADDER|A1|A1|BG~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|A1|BG~0_combout\ = ((\y~combout\(1) & ((\x~combout\(1)) # (\x~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \x~combout\(1),
	datac => \y~combout\(1),
	datad => \x~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|A1|BG~0_combout\);

-- Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\y[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_y(2),
	combout => \y~combout\(2));

-- Location: LC_X5_Y2_N7
\U_ADDER|A1|GEN|C1~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|GEN|C1~0_combout\ = (\x~combout\(1) & ((\y~combout\(0)) # ((\x~combout\(0))))) # (!\x~combout\(1) & (\y~combout\(1) & ((\y~combout\(0)) # (\x~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fac8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \x~combout\(1),
	datab => \y~combout\(0),
	datac => \y~combout\(1),
	datad => \x~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|GEN|C1~0_combout\);

-- Location: LC_X5_Y2_N2
\U_ADDER|A1|GEN|C1~1\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|GEN|C1~1_combout\ = ((\U_ADDER|A1|GEN|C1~0_combout\ & (\cin~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c0c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U_ADDER|A1|GEN|C1~0_combout\,
	datac => \cin~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|GEN|C1~1_combout\);

-- Location: LC_X5_Y4_N9
\U_ADDER|A1|A2|S[0]\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|A2|S\(0) = \x~combout\(2) $ (\y~combout\(2) $ (((\U_ADDER|A1|A1|BG~0_combout\) # (\U_ADDER|A1|GEN|C1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a596",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \x~combout\(2),
	datab => \U_ADDER|A1|A1|BG~0_combout\,
	datac => \y~combout\(2),
	datad => \U_ADDER|A1|GEN|C1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|A2|S\(0));

-- Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_x(3),
	combout => \x~combout\(3));

-- Location: LC_X5_Y4_N2
\U_ADDER|A1|A2|c~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|A2|c~0_combout\ = (\x~combout\(2) & ((\U_ADDER|A1|A1|BG~0_combout\) # ((\y~combout\(2)) # (\U_ADDER|A1|GEN|C1~1_combout\)))) # (!\x~combout\(2) & (\y~combout\(2) & ((\U_ADDER|A1|A1|BG~0_combout\) # (\U_ADDER|A1|GEN|C1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fae8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \x~combout\(2),
	datab => \U_ADDER|A1|A1|BG~0_combout\,
	datac => \y~combout\(2),
	datad => \U_ADDER|A1|GEN|C1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|A2|c~0_combout\);

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\y[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_y(3),
	combout => \y~combout\(3));

-- Location: LC_X5_Y4_N6
\U_ADDER|A1|A2|S[1]~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|A2|S[1]~0_combout\ = \x~combout\(3) $ (\U_ADDER|A1|A2|c~0_combout\ $ (((\y~combout\(3)))))

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
	dataa => \x~combout\(3),
	datab => \U_ADDER|A1|A2|c~0_combout\,
	datad => \y~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|A2|S[1]~0_combout\);

-- Location: LC_X5_Y4_N8
\U_ADDER|A1|A2|BP~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|A2|BP~0_combout\ = (\x~combout\(2) & ((\y~combout\(3)) # ((\x~combout\(3))))) # (!\x~combout\(2) & (\y~combout\(2) & ((\y~combout\(3)) # (\x~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fac8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \x~combout\(2),
	datab => \y~combout\(3),
	datac => \y~combout\(2),
	datad => \x~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|A2|BP~0_combout\);

-- Location: LC_X5_Y2_N8
\U_ADDER|G1|C1~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|G1|C1~0_combout\ = ((\U_ADDER|A1|GEN|C1~0_combout\ & (\cin~combout\ & \U_ADDER|A1|A2|BP~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U_ADDER|A1|GEN|C1~0_combout\,
	datac => \cin~combout\,
	datad => \U_ADDER|A1|A2|BP~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|G1|C1~0_combout\);

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\y[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_y(4),
	combout => \y~combout\(4));

-- Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_x(4),
	combout => \x~combout\(4));

-- Location: LC_X5_Y4_N4
\U_ADDER|A1|GEN|BG~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|GEN|BG~0_combout\ = (\x~combout\(2)) # (((\x~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffaa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \x~combout\(2),
	datad => \x~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|GEN|BG~0_combout\);

-- Location: LC_X5_Y4_N5
\U_ADDER|A1|GEN|BG~1\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A1|GEN|BG~1_combout\ = (\U_ADDER|A1|A2|BP~0_combout\ & ((\U_ADDER|A1|A1|BG~0_combout\) # ((\U_ADDER|A1|GEN|BG~0_combout\ & \y~combout\(3))))) # (!\U_ADDER|A1|A2|BP~0_combout\ & (((\U_ADDER|A1|GEN|BG~0_combout\ & \y~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f888",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U_ADDER|A1|A2|BP~0_combout\,
	datab => \U_ADDER|A1|A1|BG~0_combout\,
	datac => \U_ADDER|A1|GEN|BG~0_combout\,
	datad => \y~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A1|GEN|BG~1_combout\);

-- Location: LC_X5_Y3_N9
\U_ADDER|A2|A1|S[0]\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A2|A1|S\(0) = \y~combout\(4) $ (\x~combout\(4) $ (((\U_ADDER|G1|C1~0_combout\) # (\U_ADDER|A1|GEN|BG~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c396",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U_ADDER|G1|C1~0_combout\,
	datab => \y~combout\(4),
	datac => \x~combout\(4),
	datad => \U_ADDER|A1|GEN|BG~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A2|A1|S\(0));

-- Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\y[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_y(5),
	combout => \y~combout\(5));

-- Location: LC_X5_Y3_N7
\U_ADDER|A2|A1|c~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A2|A1|c~0_combout\ = (\y~combout\(4) & ((\U_ADDER|G1|C1~0_combout\) # ((\x~combout\(4)) # (\U_ADDER|A1|GEN|BG~1_combout\)))) # (!\y~combout\(4) & (\x~combout\(4) & ((\U_ADDER|G1|C1~0_combout\) # (\U_ADDER|A1|GEN|BG~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fce8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U_ADDER|G1|C1~0_combout\,
	datab => \y~combout\(4),
	datac => \x~combout\(4),
	datad => \U_ADDER|A1|GEN|BG~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A2|A1|c~0_combout\);

-- Location: PIN_E8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_x(5),
	combout => \x~combout\(5));

-- Location: LC_X5_Y3_N8
\U_ADDER|A2|A1|S[1]~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A2|A1|S[1]~0_combout\ = (\y~combout\(5) $ (\U_ADDER|A2|A1|c~0_combout\ $ (\x~combout\(5))))

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
	datab => \y~combout\(5),
	datac => \U_ADDER|A2|A1|c~0_combout\,
	datad => \x~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A2|A1|S[1]~0_combout\);

-- Location: LC_X5_Y3_N4
\U_ADDER|A2|A1|BG~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A2|A1|BG~0_combout\ = ((\y~combout\(5) & ((\x~combout\(4)) # (\x~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ccc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \y~combout\(5),
	datac => \x~combout\(4),
	datad => \x~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A2|A1|BG~0_combout\);

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_x(6),
	combout => \x~combout\(6));

-- Location: LC_X5_Y3_N2
\U_ADDER|A2|GEN|C1~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A2|GEN|C1~0_combout\ = (\y~combout\(4) & ((\y~combout\(5)) # ((\x~combout\(5))))) # (!\y~combout\(4) & (\x~combout\(4) & ((\y~combout\(5)) # (\x~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fac8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \y~combout\(4),
	datab => \y~combout\(5),
	datac => \x~combout\(4),
	datad => \x~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A2|GEN|C1~0_combout\);

-- Location: LC_X5_Y3_N0
\U_ADDER|A2|GEN|C1~1\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A2|GEN|C1~1_combout\ = ((\U_ADDER|A2|GEN|C1~0_combout\ & ((\U_ADDER|G1|C1~0_combout\) # (\U_ADDER|A1|GEN|BG~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ccc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \U_ADDER|A2|GEN|C1~0_combout\,
	datac => \U_ADDER|G1|C1~0_combout\,
	datad => \U_ADDER|A1|GEN|BG~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A2|GEN|C1~1_combout\);

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\y[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_y(6),
	combout => \y~combout\(6));

-- Location: LC_X5_Y3_N1
\U_ADDER|A2|A2|S[0]\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A2|A2|S\(0) = \x~combout\(6) $ (\y~combout\(6) $ (((\U_ADDER|A2|A1|BG~0_combout\) # (\U_ADDER|A2|GEN|C1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c936",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U_ADDER|A2|A1|BG~0_combout\,
	datab => \x~combout\(6),
	datac => \U_ADDER|A2|GEN|C1~1_combout\,
	datad => \y~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A2|A2|S\(0));

-- Location: LC_X5_Y3_N5
\U_ADDER|A2|A2|c~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A2|A2|c~0_combout\ = (\x~combout\(6) & ((\U_ADDER|A2|A1|BG~0_combout\) # ((\U_ADDER|A2|GEN|C1~1_combout\) # (\y~combout\(6))))) # (!\x~combout\(6) & (\y~combout\(6) & ((\U_ADDER|A2|A1|BG~0_combout\) # (\U_ADDER|A2|GEN|C1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fec8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U_ADDER|A2|A1|BG~0_combout\,
	datab => \x~combout\(6),
	datac => \U_ADDER|A2|GEN|C1~1_combout\,
	datad => \y~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A2|A2|c~0_combout\);

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_x(7),
	combout => \x~combout\(7));

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\y[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_y(7),
	combout => \y~combout\(7));

-- Location: LC_X6_Y4_N0
\U_ADDER|A2|A2|S[1]~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|A2|A2|S[1]~0_combout\ = \U_ADDER|A2|A2|c~0_combout\ $ (\x~combout\(7) $ (((\y~combout\(7)))))

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
	dataa => \U_ADDER|A2|A2|c~0_combout\,
	datab => \x~combout\(7),
	datad => \y~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|A2|A2|S[1]~0_combout\);

-- Location: LC_X5_Y3_N3
\U_ADDER|G1|C2~0\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|G1|C2~0_combout\ = (\U_ADDER|A2|A1|BG~0_combout\ & ((\x~combout\(6)) # ((\y~combout\(6))))) # (!\U_ADDER|A2|A1|BG~0_combout\ & (\U_ADDER|A2|GEN|C1~1_combout\ & ((\x~combout\(6)) # (\y~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fac8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U_ADDER|A2|A1|BG~0_combout\,
	datab => \x~combout\(6),
	datac => \U_ADDER|A2|GEN|C1~1_combout\,
	datad => \y~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|G1|C2~0_combout\);

-- Location: LC_X5_Y3_N6
\U_ADDER|G1|C2~1\ : maxii_lcell
-- Equation(s):
-- \U_ADDER|G1|C2~1_combout\ = (\U_ADDER|G1|C2~0_combout\ & (((\x~combout\(7)) # (\y~combout\(7))))) # (!\U_ADDER|G1|C2~0_combout\ & (\y~combout\(7) & ((\x~combout\(6)) # (\x~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fea0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U_ADDER|G1|C2~0_combout\,
	datab => \x~combout\(6),
	datac => \x~combout\(7),
	datad => \y~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \U_ADDER|G1|C2~1_combout\);

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\s[0]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U_ADDER|A1|A1|S[0]~0_combout\,
	oe => VCC,
	padio => ww_s(0));

-- Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\s[1]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U_ADDER|A1|A1|S\(1),
	oe => VCC,
	padio => ww_s(1));

-- Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\s[2]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U_ADDER|A1|A2|S\(0),
	oe => VCC,
	padio => ww_s(2));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\s[3]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U_ADDER|A1|A2|S[1]~0_combout\,
	oe => VCC,
	padio => ww_s(3));

-- Location: PIN_E9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\s[4]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U_ADDER|A2|A1|S\(0),
	oe => VCC,
	padio => ww_s(4));

-- Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\s[5]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U_ADDER|A2|A1|S[1]~0_combout\,
	oe => VCC,
	padio => ww_s(5));

-- Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\s[6]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U_ADDER|A2|A2|S\(0),
	oe => VCC,
	padio => ww_s(6));

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\s[7]~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U_ADDER|A2|A2|S[1]~0_combout\,
	oe => VCC,
	padio => ww_s(7));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\cout~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \U_ADDER|G1|C2~1_combout\,
	oe => VCC,
	padio => ww_cout);
END structure;


