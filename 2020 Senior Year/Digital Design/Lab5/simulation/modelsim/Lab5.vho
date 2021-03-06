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

-- DATE "02/26/2020 16:40:50"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_level IS
    PORT (
	clk : IN std_logic;
	switch : IN std_logic_vector(9 DOWNTO 0);
	button : IN std_logic_vector(1 DOWNTO 0);
	led0 : OUT std_logic_vector(6 DOWNTO 0);
	led0_dp : OUT std_logic;
	led1 : OUT std_logic_vector(6 DOWNTO 0);
	led1_dp : OUT std_logic;
	led2 : OUT std_logic_vector(6 DOWNTO 0);
	led2_dp : OUT std_logic;
	led3 : OUT std_logic_vector(6 DOWNTO 0);
	led3_dp : OUT std_logic;
	led4 : OUT std_logic_vector(6 DOWNTO 0);
	led4_dp : OUT std_logic;
	led5 : OUT std_logic_vector(6 DOWNTO 0);
	led5_dp : OUT std_logic
	);
END top_level;

-- Design Ports Information
-- led0[0]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led0[1]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led0[2]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led0[3]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led0[4]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led0[5]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led0[6]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led0_dp	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1[0]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1[1]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1[2]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1[3]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1[4]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1[5]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1[6]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1_dp	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led2[0]	=>  Location: PIN_B20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led2[1]	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led2[2]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led2[3]	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led2[4]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led2[5]	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led2[6]	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led2_dp	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led3[0]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led3[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led3[2]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led3[3]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led3[4]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led3[5]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led3[6]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led3_dp	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led4[0]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led4[1]	=>  Location: PIN_E20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led4[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led4[3]	=>  Location: PIN_J18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led4[4]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led4[5]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led4[6]	=>  Location: PIN_F20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led4_dp	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led5[0]	=>  Location: PIN_J20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led5[1]	=>  Location: PIN_K20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led5[2]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led5[3]	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led5[4]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led5[5]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led5[6]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led5_dp	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button[0]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button[1]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[5]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[6]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[7]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[8]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[9]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[0]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[4]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[3]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[2]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[1]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_level IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_switch : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_button : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_led0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_led0_dp : std_logic;
SIGNAL ww_led1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_led1_dp : std_logic;
SIGNAL ww_led2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_led2_dp : std_logic;
SIGNAL ww_led3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_led3_dp : std_logic;
SIGNAL ww_led4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_led4_dp : std_logic;
SIGNAL ww_led5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_led5_dp : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \led0[0]~output_o\ : std_logic;
SIGNAL \led0[1]~output_o\ : std_logic;
SIGNAL \led0[2]~output_o\ : std_logic;
SIGNAL \led0[3]~output_o\ : std_logic;
SIGNAL \led0[4]~output_o\ : std_logic;
SIGNAL \led0[5]~output_o\ : std_logic;
SIGNAL \led0[6]~output_o\ : std_logic;
SIGNAL \led0_dp~output_o\ : std_logic;
SIGNAL \led1[0]~output_o\ : std_logic;
SIGNAL \led1[1]~output_o\ : std_logic;
SIGNAL \led1[2]~output_o\ : std_logic;
SIGNAL \led1[3]~output_o\ : std_logic;
SIGNAL \led1[4]~output_o\ : std_logic;
SIGNAL \led1[5]~output_o\ : std_logic;
SIGNAL \led1[6]~output_o\ : std_logic;
SIGNAL \led1_dp~output_o\ : std_logic;
SIGNAL \led2[0]~output_o\ : std_logic;
SIGNAL \led2[1]~output_o\ : std_logic;
SIGNAL \led2[2]~output_o\ : std_logic;
SIGNAL \led2[3]~output_o\ : std_logic;
SIGNAL \led2[4]~output_o\ : std_logic;
SIGNAL \led2[5]~output_o\ : std_logic;
SIGNAL \led2[6]~output_o\ : std_logic;
SIGNAL \led2_dp~output_o\ : std_logic;
SIGNAL \led3[0]~output_o\ : std_logic;
SIGNAL \led3[1]~output_o\ : std_logic;
SIGNAL \led3[2]~output_o\ : std_logic;
SIGNAL \led3[3]~output_o\ : std_logic;
SIGNAL \led3[4]~output_o\ : std_logic;
SIGNAL \led3[5]~output_o\ : std_logic;
SIGNAL \led3[6]~output_o\ : std_logic;
SIGNAL \led3_dp~output_o\ : std_logic;
SIGNAL \led4[0]~output_o\ : std_logic;
SIGNAL \led4[1]~output_o\ : std_logic;
SIGNAL \led4[2]~output_o\ : std_logic;
SIGNAL \led4[3]~output_o\ : std_logic;
SIGNAL \led4[4]~output_o\ : std_logic;
SIGNAL \led4[5]~output_o\ : std_logic;
SIGNAL \led4[6]~output_o\ : std_logic;
SIGNAL \led4_dp~output_o\ : std_logic;
SIGNAL \led5[0]~output_o\ : std_logic;
SIGNAL \led5[1]~output_o\ : std_logic;
SIGNAL \led5[2]~output_o\ : std_logic;
SIGNAL \led5[3]~output_o\ : std_logic;
SIGNAL \led5[4]~output_o\ : std_logic;
SIGNAL \led5[5]~output_o\ : std_logic;
SIGNAL \led5[6]~output_o\ : std_logic;
SIGNAL \led5_dp~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \switch[3]~input_o\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|y_sel~0_combout\ : std_logic;
SIGNAL \switch[4]~input_o\ : std_logic;
SIGNAL \U_GCD|DATAPATH|Y_MUX|output[4]~15_combout\ : std_logic;
SIGNAL \button[0]~input_o\ : std_logic;
SIGNAL \button[1]~input_o\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|next_state.CHECK_COMP~0_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|state.CHECK_COMP~feeder_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|state.CHECK_COMP~q\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|next_state.FINAL~0_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|state.FINAL~q\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|next_state.STALL~0_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|state.STALL~q\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|Selector2~0_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|state.START~q\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|WideOr1~0_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|y_en~combout\ : std_logic;
SIGNAL \switch[2]~input_o\ : std_logic;
SIGNAL \U_GCD|DATAPATH|Y_MUX|output[2]~17_combout\ : std_logic;
SIGNAL \switch[1]~input_o\ : std_logic;
SIGNAL \U_GCD|DATAPATH|Y_MUX|output[1]~18_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~0_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_REG|output[0]~0_combout\ : std_logic;
SIGNAL \switch[5]~input_o\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|WideOr0~0_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|x_en~combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~0_combout\ : std_logic;
SIGNAL \switch[0]~input_o\ : std_logic;
SIGNAL \U_GCD|DATAPATH|Y_MUX|output[0]~14_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|Y_MUX|output[0]~10_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~1\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~2_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~1\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~2_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_REG|output[1]~1_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_REG|output[1]~feeder_combout\ : std_logic;
SIGNAL \switch[6]~input_o\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~3\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~4_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~3\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~4_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_REG|output[2]~2_combout\ : std_logic;
SIGNAL \switch[7]~input_o\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~5\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~7\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~8_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~5\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~7\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~8_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_REG|output[4]~4_combout\ : std_logic;
SIGNAL \switch[9]~input_o\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~9\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~10_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_MUX|output[5]~0_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~9\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~10_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|Y_MUX|output[5]~13_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~11\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~12_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~11\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~12_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|Y_MUX|output[6]~12_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~13\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~14_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~13\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~14_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_MUX|output[7]~2_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|LessThan0~1_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|LessThan0~3_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|LessThan0~5_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|LessThan0~7_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|LessThan0~9_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|LessThan0~11_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|LessThan0~13_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|LessThan0~14_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|Y_MUX|output[7]~11_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|LessThan0~1_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|LessThan0~3_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|LessThan0~5_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|LessThan0~7_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|LessThan0~9_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|LessThan0~11_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|LessThan0~13_cout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|LessThan0~14_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|next_state.X_GREATER_THAN~0_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|state.X_GREATER_THAN~q\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|Selector3~0_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|Selector3~1_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|state.INIT~feeder_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|state.INIT~q\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|x_sel~0_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_MUX|output[6]~1_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|Equal0~3_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|Equal0~1_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|Equal0~0_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|Equal0~2_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|COMP|Equal0~4_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|next_state.X_LESS_THAN~0_combout\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|state.X_LESS_THAN~q\ : std_logic;
SIGNAL \U_GCD|DATAPATH|Y_MUX|output[3]~16_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add1~6_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|SUB|Add0~6_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_REG|output[3]~3_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_REG|output[3]~feeder_combout\ : std_logic;
SIGNAL \switch[8]~input_o\ : std_logic;
SIGNAL \U_LED4|Mux6~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux5~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux4~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux3~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux2~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux1~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux0~0_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|OUT_REG|output[7]~feeder_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|OUT_REG|output[4]~feeder_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|OUT_REG|output[5]~feeder_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|OUT_REG|output[6]~feeder_combout\ : std_logic;
SIGNAL \U_LED5|Mux6~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux5~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux4~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux3~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux2~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux1~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux0~0_combout\ : std_logic;
SIGNAL \U_GCD|DATAPATH|X_REG|output\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \U_GCD|DATAPATH|OUT_REG|output\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \U_GCD|DATAPATH|Y_REG|output\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_button[0]~input_o\ : std_logic;
SIGNAL \U_GCD|CONTROLLER|ALT_INV_state.STALL~q\ : std_logic;
SIGNAL \U_LED5|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \U_LED4|ALT_INV_Mux0~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_switch <= switch;
ww_button <= button;
led0 <= ww_led0;
led0_dp <= ww_led0_dp;
led1 <= ww_led1;
led1_dp <= ww_led1_dp;
led2 <= ww_led2;
led2_dp <= ww_led2_dp;
led3 <= ww_led3;
led3_dp <= ww_led3_dp;
led4 <= ww_led4;
led4_dp <= ww_led4_dp;
led5 <= ww_led5;
led5_dp <= ww_led5_dp;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_button[0]~input_o\ <= NOT \button[0]~input_o\;
\U_GCD|CONTROLLER|ALT_INV_state.STALL~q\ <= NOT \U_GCD|CONTROLLER|state.STALL~q\;
\U_LED5|ALT_INV_Mux0~0_combout\ <= NOT \U_LED5|Mux0~0_combout\;
\U_LED4|ALT_INV_Mux0~0_combout\ <= NOT \U_LED4|Mux0~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y43_N16
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X58_Y54_N16
\led0[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led0[0]~output_o\);

-- Location: IOOBUF_X74_Y54_N9
\led0[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led0[1]~output_o\);

-- Location: IOOBUF_X60_Y54_N2
\led0[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led0[2]~output_o\);

-- Location: IOOBUF_X62_Y54_N30
\led0[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led0[3]~output_o\);

-- Location: IOOBUF_X74_Y54_N2
\led0[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led0[4]~output_o\);

-- Location: IOOBUF_X74_Y54_N16
\led0[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led0[5]~output_o\);

-- Location: IOOBUF_X74_Y54_N23
\led0[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \led0[6]~output_o\);

-- Location: IOOBUF_X66_Y54_N16
\led0_dp~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \led0_dp~output_o\);

-- Location: IOOBUF_X69_Y54_N23
\led1[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led1[0]~output_o\);

-- Location: IOOBUF_X78_Y49_N9
\led1[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led1[1]~output_o\);

-- Location: IOOBUF_X78_Y49_N2
\led1[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led1[2]~output_o\);

-- Location: IOOBUF_X60_Y54_N9
\led1[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led1[3]~output_o\);

-- Location: IOOBUF_X64_Y54_N2
\led1[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led1[4]~output_o\);

-- Location: IOOBUF_X66_Y54_N30
\led1[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led1[5]~output_o\);

-- Location: IOOBUF_X69_Y54_N30
\led1[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \led1[6]~output_o\);

-- Location: IOOBUF_X60_Y54_N16
\led1_dp~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \led1_dp~output_o\);

-- Location: IOOBUF_X78_Y44_N9
\led2[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led2[0]~output_o\);

-- Location: IOOBUF_X66_Y54_N2
\led2[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led2[1]~output_o\);

-- Location: IOOBUF_X69_Y54_N16
\led2[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led2[2]~output_o\);

-- Location: IOOBUF_X78_Y44_N2
\led2[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led2[3]~output_o\);

-- Location: IOOBUF_X78_Y43_N2
\led2[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led2[4]~output_o\);

-- Location: IOOBUF_X78_Y35_N2
\led2[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led2[5]~output_o\);

-- Location: IOOBUF_X78_Y43_N9
\led2[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \led2[6]~output_o\);

-- Location: IOOBUF_X66_Y54_N9
\led2_dp~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \led2_dp~output_o\);

-- Location: IOOBUF_X78_Y35_N23
\led3[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led3[0]~output_o\);

-- Location: IOOBUF_X78_Y33_N9
\led3[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led3[1]~output_o\);

-- Location: IOOBUF_X78_Y33_N2
\led3[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led3[2]~output_o\);

-- Location: IOOBUF_X69_Y54_N9
\led3[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led3[3]~output_o\);

-- Location: IOOBUF_X78_Y41_N9
\led3[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led3[4]~output_o\);

-- Location: IOOBUF_X78_Y41_N2
\led3[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \led3[5]~output_o\);

-- Location: IOOBUF_X78_Y43_N16
\led3[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \led3[6]~output_o\);

-- Location: IOOBUF_X78_Y35_N9
\led3_dp~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \led3_dp~output_o\);

-- Location: IOOBUF_X78_Y40_N16
\led4[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED4|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \led4[0]~output_o\);

-- Location: IOOBUF_X78_Y40_N2
\led4[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED4|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \led4[1]~output_o\);

-- Location: IOOBUF_X78_Y40_N23
\led4[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED4|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \led4[2]~output_o\);

-- Location: IOOBUF_X78_Y42_N16
\led4[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED4|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \led4[3]~output_o\);

-- Location: IOOBUF_X78_Y45_N23
\led4[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED4|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \led4[4]~output_o\);

-- Location: IOOBUF_X78_Y40_N9
\led4[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED4|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \led4[5]~output_o\);

-- Location: IOOBUF_X78_Y35_N16
\led4[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED4|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \led4[6]~output_o\);

-- Location: IOOBUF_X78_Y43_N23
\led4_dp~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \led4_dp~output_o\);

-- Location: IOOBUF_X78_Y45_N9
\led5[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED5|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \led5[0]~output_o\);

-- Location: IOOBUF_X78_Y42_N2
\led5[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED5|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \led5[1]~output_o\);

-- Location: IOOBUF_X78_Y37_N16
\led5[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED5|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \led5[2]~output_o\);

-- Location: IOOBUF_X78_Y34_N24
\led5[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED5|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \led5[3]~output_o\);

-- Location: IOOBUF_X78_Y34_N9
\led5[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED5|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \led5[4]~output_o\);

-- Location: IOOBUF_X78_Y34_N16
\led5[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED5|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \led5[5]~output_o\);

-- Location: IOOBUF_X78_Y34_N2
\led5[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_LED5|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \led5[6]~output_o\);

-- Location: IOOBUF_X78_Y37_N9
\led5_dp~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_GCD|CONTROLLER|ALT_INV_state.STALL~q\,
	devoe => ww_devoe,
	o => \led5_dp~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G19
\clk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X54_Y54_N29
\switch[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(3),
	o => \switch[3]~input_o\);

-- Location: LCCOMB_X58_Y47_N28
\U_GCD|CONTROLLER|y_sel~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|y_sel~0_combout\ = (!\U_GCD|CONTROLLER|state.INIT~q\ & !\U_GCD|CONTROLLER|state.X_LESS_THAN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|state.INIT~q\,
	datad => \U_GCD|CONTROLLER|state.X_LESS_THAN~q\,
	combout => \U_GCD|CONTROLLER|y_sel~0_combout\);

-- Location: IOIBUF_X54_Y54_N22
\switch[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(4),
	o => \switch[4]~input_o\);

-- Location: LCCOMB_X59_Y47_N6
\U_GCD|DATAPATH|Y_MUX|output[4]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|Y_MUX|output[4]~15_combout\ = (\U_GCD|CONTROLLER|state.X_LESS_THAN~q\ & (((\U_GCD|DATAPATH|X_REG|output[4]~4_combout\)))) # (!\U_GCD|CONTROLLER|state.X_LESS_THAN~q\ & ((\U_GCD|CONTROLLER|state.INIT~q\ & 
-- ((\U_GCD|DATAPATH|X_REG|output[4]~4_combout\))) # (!\U_GCD|CONTROLLER|state.INIT~q\ & (\switch[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[4]~input_o\,
	datab => \U_GCD|DATAPATH|X_REG|output[4]~4_combout\,
	datac => \U_GCD|CONTROLLER|state.X_LESS_THAN~q\,
	datad => \U_GCD|CONTROLLER|state.INIT~q\,
	combout => \U_GCD|DATAPATH|Y_MUX|output[4]~15_combout\);

-- Location: IOIBUF_X49_Y54_N29
\button[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button(0),
	o => \button[0]~input_o\);

-- Location: IOIBUF_X46_Y54_N29
\button[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button(1),
	o => \button[1]~input_o\);

-- Location: LCCOMB_X56_Y47_N4
\U_GCD|CONTROLLER|next_state.CHECK_COMP~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|next_state.CHECK_COMP~0_combout\ = (\U_GCD|CONTROLLER|state.INIT~q\ & \button[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_GCD|CONTROLLER|state.INIT~q\,
	datac => \button[1]~input_o\,
	combout => \U_GCD|CONTROLLER|next_state.CHECK_COMP~0_combout\);

-- Location: LCCOMB_X56_Y47_N20
\U_GCD|CONTROLLER|state.CHECK_COMP~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|state.CHECK_COMP~feeder_combout\ = \U_GCD|CONTROLLER|next_state.CHECK_COMP~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GCD|CONTROLLER|next_state.CHECK_COMP~0_combout\,
	combout => \U_GCD|CONTROLLER|state.CHECK_COMP~feeder_combout\);

-- Location: FF_X56_Y47_N21
\U_GCD|CONTROLLER|state.CHECK_COMP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|CONTROLLER|state.CHECK_COMP~feeder_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|CONTROLLER|state.CHECK_COMP~q\);

-- Location: LCCOMB_X57_Y47_N2
\U_GCD|CONTROLLER|next_state.FINAL~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|next_state.FINAL~0_combout\ = (\U_GCD|CONTROLLER|state.CHECK_COMP~q\ & \U_GCD|DATAPATH|COMP|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GCD|CONTROLLER|state.CHECK_COMP~q\,
	datad => \U_GCD|DATAPATH|COMP|Equal0~4_combout\,
	combout => \U_GCD|CONTROLLER|next_state.FINAL~0_combout\);

-- Location: FF_X57_Y47_N3
\U_GCD|CONTROLLER|state.FINAL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|CONTROLLER|next_state.FINAL~0_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|CONTROLLER|state.FINAL~q\);

-- Location: LCCOMB_X56_Y47_N8
\U_GCD|CONTROLLER|next_state.STALL~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|next_state.STALL~0_combout\ = (\button[1]~input_o\ & ((\U_GCD|CONTROLLER|state.STALL~q\) # (\U_GCD|CONTROLLER|state.FINAL~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \button[1]~input_o\,
	datac => \U_GCD|CONTROLLER|state.STALL~q\,
	datad => \U_GCD|CONTROLLER|state.FINAL~q\,
	combout => \U_GCD|CONTROLLER|next_state.STALL~0_combout\);

-- Location: FF_X56_Y47_N9
\U_GCD|CONTROLLER|state.STALL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|CONTROLLER|next_state.STALL~0_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|CONTROLLER|state.STALL~q\);

-- Location: LCCOMB_X56_Y47_N16
\U_GCD|CONTROLLER|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|Selector2~0_combout\ = (\button[1]~input_o\) # ((!\U_GCD|CONTROLLER|state.FINAL~q\ & (!\U_GCD|CONTROLLER|state.STALL~q\ & \U_GCD|CONTROLLER|state.START~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|state.FINAL~q\,
	datab => \U_GCD|CONTROLLER|state.STALL~q\,
	datac => \button[1]~input_o\,
	datad => \U_GCD|CONTROLLER|state.START~q\,
	combout => \U_GCD|CONTROLLER|Selector2~0_combout\);

-- Location: FF_X57_Y47_N27
\U_GCD|CONTROLLER|state.START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \U_GCD|CONTROLLER|Selector2~0_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|CONTROLLER|state.START~q\);

-- Location: LCCOMB_X56_Y47_N12
\U_GCD|CONTROLLER|WideOr1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|WideOr1~0_combout\ = (\U_GCD|CONTROLLER|state.INIT~q\) # ((\U_GCD|CONTROLLER|state.X_LESS_THAN~q\) # (!\U_GCD|CONTROLLER|state.START~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|state.INIT~q\,
	datab => \U_GCD|CONTROLLER|state.X_LESS_THAN~q\,
	datad => \U_GCD|CONTROLLER|state.START~q\,
	combout => \U_GCD|CONTROLLER|WideOr1~0_combout\);

-- Location: LCCOMB_X56_Y47_N18
\U_GCD|CONTROLLER|y_en\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|y_en~combout\ = (\U_GCD|CONTROLLER|WideOr1~0_combout\ & (!\U_GCD|CONTROLLER|state.INIT~q\)) # (!\U_GCD|CONTROLLER|WideOr1~0_combout\ & ((\U_GCD|CONTROLLER|y_en~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|WideOr1~0_combout\,
	datab => \U_GCD|CONTROLLER|state.INIT~q\,
	datad => \U_GCD|CONTROLLER|y_en~combout\,
	combout => \U_GCD|CONTROLLER|y_en~combout\);

-- Location: FF_X59_Y47_N7
\U_GCD|DATAPATH|Y_REG|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|Y_MUX|output[4]~15_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|y_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|Y_REG|output\(4));

-- Location: IOIBUF_X51_Y54_N1
\switch[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(2),
	o => \switch[2]~input_o\);

-- Location: LCCOMB_X59_Y47_N12
\U_GCD|DATAPATH|Y_MUX|output[2]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|Y_MUX|output[2]~17_combout\ = (\U_GCD|CONTROLLER|state.X_LESS_THAN~q\ & (((\U_GCD|DATAPATH|X_REG|output[2]~2_combout\)))) # (!\U_GCD|CONTROLLER|state.X_LESS_THAN~q\ & ((\U_GCD|CONTROLLER|state.INIT~q\ & 
-- ((\U_GCD|DATAPATH|X_REG|output[2]~2_combout\))) # (!\U_GCD|CONTROLLER|state.INIT~q\ & (\switch[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[2]~input_o\,
	datab => \U_GCD|CONTROLLER|state.X_LESS_THAN~q\,
	datac => \U_GCD|DATAPATH|X_REG|output[2]~2_combout\,
	datad => \U_GCD|CONTROLLER|state.INIT~q\,
	combout => \U_GCD|DATAPATH|Y_MUX|output[2]~17_combout\);

-- Location: FF_X59_Y47_N13
\U_GCD|DATAPATH|Y_REG|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|Y_MUX|output[2]~17_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|y_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|Y_REG|output\(2));

-- Location: IOIBUF_X51_Y54_N22
\switch[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(1),
	o => \switch[1]~input_o\);

-- Location: LCCOMB_X60_Y47_N24
\U_GCD|DATAPATH|Y_MUX|output[1]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|Y_MUX|output[1]~18_combout\ = (\U_GCD|CONTROLLER|state.X_LESS_THAN~q\ & (\U_GCD|DATAPATH|X_REG|output[1]~1_combout\)) # (!\U_GCD|CONTROLLER|state.X_LESS_THAN~q\ & ((\U_GCD|CONTROLLER|state.INIT~q\ & 
-- (\U_GCD|DATAPATH|X_REG|output[1]~1_combout\)) # (!\U_GCD|CONTROLLER|state.INIT~q\ & ((\switch[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|state.X_LESS_THAN~q\,
	datab => \U_GCD|DATAPATH|X_REG|output[1]~1_combout\,
	datac => \switch[1]~input_o\,
	datad => \U_GCD|CONTROLLER|state.INIT~q\,
	combout => \U_GCD|DATAPATH|Y_MUX|output[1]~18_combout\);

-- Location: FF_X60_Y47_N25
\U_GCD|DATAPATH|Y_REG|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|Y_MUX|output[1]~18_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|y_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|Y_REG|output\(1));

-- Location: LCCOMB_X58_Y47_N0
\U_GCD|DATAPATH|SUB|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add0~0_combout\ = (\U_GCD|DATAPATH|X_REG|output\(0) & ((GND) # (!\U_GCD|DATAPATH|Y_REG|output\(0)))) # (!\U_GCD|DATAPATH|X_REG|output\(0) & (\U_GCD|DATAPATH|Y_REG|output\(0) $ (GND)))
-- \U_GCD|DATAPATH|SUB|Add0~1\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(0)) # (!\U_GCD|DATAPATH|Y_REG|output\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(0),
	datab => \U_GCD|DATAPATH|Y_REG|output\(0),
	datad => VCC,
	combout => \U_GCD|DATAPATH|SUB|Add0~0_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add0~1\);

-- Location: LCCOMB_X59_Y47_N4
\U_GCD|DATAPATH|X_REG|output[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|X_REG|output[0]~0_combout\ = (\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & ((\U_GCD|DATAPATH|SUB|Add0~0_combout\))) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & (\U_GCD|DATAPATH|SUB|Add1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	datab => \U_GCD|DATAPATH|SUB|Add1~0_combout\,
	datad => \U_GCD|DATAPATH|SUB|Add0~0_combout\,
	combout => \U_GCD|DATAPATH|X_REG|output[0]~0_combout\);

-- Location: IOIBUF_X49_Y54_N1
\switch[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(5),
	o => \switch[5]~input_o\);

-- Location: LCCOMB_X57_Y47_N0
\U_GCD|CONTROLLER|WideOr0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|WideOr0~0_combout\ = (\U_GCD|CONTROLLER|state.INIT~q\) # ((\U_GCD|CONTROLLER|state.X_GREATER_THAN~q\) # (!\U_GCD|CONTROLLER|state.START~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_GCD|CONTROLLER|state.INIT~q\,
	datac => \U_GCD|CONTROLLER|state.START~q\,
	datad => \U_GCD|CONTROLLER|state.X_GREATER_THAN~q\,
	combout => \U_GCD|CONTROLLER|WideOr0~0_combout\);

-- Location: LCCOMB_X57_Y47_N26
\U_GCD|CONTROLLER|x_en\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|x_en~combout\ = (\U_GCD|CONTROLLER|WideOr0~0_combout\ & (!\U_GCD|CONTROLLER|state.INIT~q\)) # (!\U_GCD|CONTROLLER|WideOr0~0_combout\ & ((\U_GCD|CONTROLLER|x_en~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|state.INIT~q\,
	datab => \U_GCD|CONTROLLER|x_en~combout\,
	datad => \U_GCD|CONTROLLER|WideOr0~0_combout\,
	combout => \U_GCD|CONTROLLER|x_en~combout\);

-- Location: FF_X59_Y47_N5
\U_GCD|DATAPATH|X_REG|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|X_REG|output[0]~0_combout\,
	asdata => \switch[5]~input_o\,
	clrn => \ALT_INV_button[0]~input_o\,
	sload => \U_GCD|CONTROLLER|x_sel~0_combout\,
	ena => \U_GCD|CONTROLLER|x_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|X_REG|output\(0));

-- Location: LCCOMB_X60_Y47_N8
\U_GCD|DATAPATH|SUB|Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add1~0_combout\ = (\U_GCD|DATAPATH|Y_REG|output\(0) & ((GND) # (!\U_GCD|DATAPATH|X_REG|output\(0)))) # (!\U_GCD|DATAPATH|Y_REG|output\(0) & (\U_GCD|DATAPATH|X_REG|output\(0) $ (GND)))
-- \U_GCD|DATAPATH|SUB|Add1~1\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(0)) # (!\U_GCD|DATAPATH|X_REG|output\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(0),
	datab => \U_GCD|DATAPATH|X_REG|output\(0),
	datad => VCC,
	combout => \U_GCD|DATAPATH|SUB|Add1~0_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add1~1\);

-- Location: IOIBUF_X51_Y54_N29
\switch[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(0),
	o => \switch[0]~input_o\);

-- Location: LCCOMB_X58_Y47_N30
\U_GCD|DATAPATH|Y_MUX|output[0]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|Y_MUX|output[0]~14_combout\ = (\U_GCD|CONTROLLER|state.INIT~q\ & (((\U_GCD|DATAPATH|SUB|Add0~0_combout\)))) # (!\U_GCD|CONTROLLER|state.INIT~q\ & ((\U_GCD|CONTROLLER|state.X_LESS_THAN~q\ & ((\U_GCD|DATAPATH|SUB|Add0~0_combout\))) # 
-- (!\U_GCD|CONTROLLER|state.X_LESS_THAN~q\ & (\switch[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[0]~input_o\,
	datab => \U_GCD|DATAPATH|SUB|Add0~0_combout\,
	datac => \U_GCD|CONTROLLER|state.INIT~q\,
	datad => \U_GCD|CONTROLLER|state.X_LESS_THAN~q\,
	combout => \U_GCD|DATAPATH|Y_MUX|output[0]~14_combout\);

-- Location: LCCOMB_X59_Y47_N8
\U_GCD|DATAPATH|Y_MUX|output[0]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|Y_MUX|output[0]~10_combout\ = (\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & (((\U_GCD|DATAPATH|Y_MUX|output[0]~14_combout\)))) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & ((\U_GCD|CONTROLLER|y_sel~0_combout\ & 
-- ((\U_GCD|DATAPATH|Y_MUX|output[0]~14_combout\))) # (!\U_GCD|CONTROLLER|y_sel~0_combout\ & (\U_GCD|DATAPATH|SUB|Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|SUB|Add1~0_combout\,
	datab => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	datac => \U_GCD|CONTROLLER|y_sel~0_combout\,
	datad => \U_GCD|DATAPATH|Y_MUX|output[0]~14_combout\,
	combout => \U_GCD|DATAPATH|Y_MUX|output[0]~10_combout\);

-- Location: FF_X59_Y47_N9
\U_GCD|DATAPATH|Y_REG|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|Y_MUX|output[0]~10_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|y_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|Y_REG|output\(0));

-- Location: LCCOMB_X60_Y47_N10
\U_GCD|DATAPATH|SUB|Add1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add1~2_combout\ = (\U_GCD|DATAPATH|X_REG|output\(1) & ((\U_GCD|DATAPATH|Y_REG|output\(1) & (!\U_GCD|DATAPATH|SUB|Add1~1\)) # (!\U_GCD|DATAPATH|Y_REG|output\(1) & ((\U_GCD|DATAPATH|SUB|Add1~1\) # (GND))))) # 
-- (!\U_GCD|DATAPATH|X_REG|output\(1) & ((\U_GCD|DATAPATH|Y_REG|output\(1) & (\U_GCD|DATAPATH|SUB|Add1~1\ & VCC)) # (!\U_GCD|DATAPATH|Y_REG|output\(1) & (!\U_GCD|DATAPATH|SUB|Add1~1\))))
-- \U_GCD|DATAPATH|SUB|Add1~3\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(1) & ((!\U_GCD|DATAPATH|SUB|Add1~1\) # (!\U_GCD|DATAPATH|Y_REG|output\(1)))) # (!\U_GCD|DATAPATH|X_REG|output\(1) & (!\U_GCD|DATAPATH|Y_REG|output\(1) & !\U_GCD|DATAPATH|SUB|Add1~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(1),
	datab => \U_GCD|DATAPATH|Y_REG|output\(1),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add1~1\,
	combout => \U_GCD|DATAPATH|SUB|Add1~2_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add1~3\);

-- Location: LCCOMB_X58_Y47_N2
\U_GCD|DATAPATH|SUB|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add0~2_combout\ = (\U_GCD|DATAPATH|Y_REG|output\(1) & ((\U_GCD|DATAPATH|X_REG|output\(1) & (!\U_GCD|DATAPATH|SUB|Add0~1\)) # (!\U_GCD|DATAPATH|X_REG|output\(1) & ((\U_GCD|DATAPATH|SUB|Add0~1\) # (GND))))) # 
-- (!\U_GCD|DATAPATH|Y_REG|output\(1) & ((\U_GCD|DATAPATH|X_REG|output\(1) & (\U_GCD|DATAPATH|SUB|Add0~1\ & VCC)) # (!\U_GCD|DATAPATH|X_REG|output\(1) & (!\U_GCD|DATAPATH|SUB|Add0~1\))))
-- \U_GCD|DATAPATH|SUB|Add0~3\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(1) & ((!\U_GCD|DATAPATH|SUB|Add0~1\) # (!\U_GCD|DATAPATH|X_REG|output\(1)))) # (!\U_GCD|DATAPATH|Y_REG|output\(1) & (!\U_GCD|DATAPATH|X_REG|output\(1) & !\U_GCD|DATAPATH|SUB|Add0~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(1),
	datab => \U_GCD|DATAPATH|X_REG|output\(1),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add0~1\,
	combout => \U_GCD|DATAPATH|SUB|Add0~2_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add0~3\);

-- Location: LCCOMB_X60_Y47_N28
\U_GCD|DATAPATH|X_REG|output[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|X_REG|output[1]~1_combout\ = (\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & ((\U_GCD|DATAPATH|SUB|Add0~2_combout\))) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & (\U_GCD|DATAPATH|SUB|Add1~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|SUB|Add1~2_combout\,
	datac => \U_GCD|DATAPATH|SUB|Add0~2_combout\,
	datad => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	combout => \U_GCD|DATAPATH|X_REG|output[1]~1_combout\);

-- Location: LCCOMB_X60_Y47_N4
\U_GCD|DATAPATH|X_REG|output[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|X_REG|output[1]~feeder_combout\ = \U_GCD|DATAPATH|X_REG|output[1]~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GCD|DATAPATH|X_REG|output[1]~1_combout\,
	combout => \U_GCD|DATAPATH|X_REG|output[1]~feeder_combout\);

-- Location: IOIBUF_X54_Y54_N15
\switch[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(6),
	o => \switch[6]~input_o\);

-- Location: FF_X60_Y47_N5
\U_GCD|DATAPATH|X_REG|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|X_REG|output[1]~feeder_combout\,
	asdata => \switch[6]~input_o\,
	clrn => \ALT_INV_button[0]~input_o\,
	sload => \U_GCD|CONTROLLER|x_sel~0_combout\,
	ena => \U_GCD|CONTROLLER|x_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|X_REG|output\(1));

-- Location: LCCOMB_X60_Y47_N12
\U_GCD|DATAPATH|SUB|Add1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add1~4_combout\ = ((\U_GCD|DATAPATH|Y_REG|output\(2) $ (\U_GCD|DATAPATH|X_REG|output\(2) $ (\U_GCD|DATAPATH|SUB|Add1~3\)))) # (GND)
-- \U_GCD|DATAPATH|SUB|Add1~5\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(2) & ((!\U_GCD|DATAPATH|SUB|Add1~3\) # (!\U_GCD|DATAPATH|X_REG|output\(2)))) # (!\U_GCD|DATAPATH|Y_REG|output\(2) & (!\U_GCD|DATAPATH|X_REG|output\(2) & !\U_GCD|DATAPATH|SUB|Add1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(2),
	datab => \U_GCD|DATAPATH|X_REG|output\(2),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add1~3\,
	combout => \U_GCD|DATAPATH|SUB|Add1~4_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add1~5\);

-- Location: LCCOMB_X58_Y47_N4
\U_GCD|DATAPATH|SUB|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add0~4_combout\ = ((\U_GCD|DATAPATH|X_REG|output\(2) $ (\U_GCD|DATAPATH|Y_REG|output\(2) $ (\U_GCD|DATAPATH|SUB|Add0~3\)))) # (GND)
-- \U_GCD|DATAPATH|SUB|Add0~5\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(2) & ((!\U_GCD|DATAPATH|SUB|Add0~3\) # (!\U_GCD|DATAPATH|Y_REG|output\(2)))) # (!\U_GCD|DATAPATH|X_REG|output\(2) & (!\U_GCD|DATAPATH|Y_REG|output\(2) & !\U_GCD|DATAPATH|SUB|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(2),
	datab => \U_GCD|DATAPATH|Y_REG|output\(2),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add0~3\,
	combout => \U_GCD|DATAPATH|SUB|Add0~4_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add0~5\);

-- Location: LCCOMB_X59_Y47_N30
\U_GCD|DATAPATH|X_REG|output[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|X_REG|output[2]~2_combout\ = (\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & ((\U_GCD|DATAPATH|SUB|Add0~4_combout\))) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & (\U_GCD|DATAPATH|SUB|Add1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|SUB|Add1~4_combout\,
	datab => \U_GCD|DATAPATH|SUB|Add0~4_combout\,
	datad => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	combout => \U_GCD|DATAPATH|X_REG|output[2]~2_combout\);

-- Location: IOIBUF_X58_Y54_N29
\switch[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(7),
	o => \switch[7]~input_o\);

-- Location: FF_X59_Y47_N31
\U_GCD|DATAPATH|X_REG|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|X_REG|output[2]~2_combout\,
	asdata => \switch[7]~input_o\,
	clrn => \ALT_INV_button[0]~input_o\,
	sload => \U_GCD|CONTROLLER|x_sel~0_combout\,
	ena => \U_GCD|CONTROLLER|x_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|X_REG|output\(2));

-- Location: LCCOMB_X58_Y47_N6
\U_GCD|DATAPATH|SUB|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add0~6_combout\ = (\U_GCD|DATAPATH|X_REG|output\(3) & ((\U_GCD|DATAPATH|Y_REG|output\(3) & (!\U_GCD|DATAPATH|SUB|Add0~5\)) # (!\U_GCD|DATAPATH|Y_REG|output\(3) & (\U_GCD|DATAPATH|SUB|Add0~5\ & VCC)))) # 
-- (!\U_GCD|DATAPATH|X_REG|output\(3) & ((\U_GCD|DATAPATH|Y_REG|output\(3) & ((\U_GCD|DATAPATH|SUB|Add0~5\) # (GND))) # (!\U_GCD|DATAPATH|Y_REG|output\(3) & (!\U_GCD|DATAPATH|SUB|Add0~5\))))
-- \U_GCD|DATAPATH|SUB|Add0~7\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(3) & (\U_GCD|DATAPATH|Y_REG|output\(3) & !\U_GCD|DATAPATH|SUB|Add0~5\)) # (!\U_GCD|DATAPATH|X_REG|output\(3) & ((\U_GCD|DATAPATH|Y_REG|output\(3)) # (!\U_GCD|DATAPATH|SUB|Add0~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(3),
	datab => \U_GCD|DATAPATH|Y_REG|output\(3),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add0~5\,
	combout => \U_GCD|DATAPATH|SUB|Add0~6_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add0~7\);

-- Location: LCCOMB_X58_Y47_N8
\U_GCD|DATAPATH|SUB|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add0~8_combout\ = ((\U_GCD|DATAPATH|X_REG|output\(4) $ (\U_GCD|DATAPATH|Y_REG|output\(4) $ (\U_GCD|DATAPATH|SUB|Add0~7\)))) # (GND)
-- \U_GCD|DATAPATH|SUB|Add0~9\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(4) & ((!\U_GCD|DATAPATH|SUB|Add0~7\) # (!\U_GCD|DATAPATH|Y_REG|output\(4)))) # (!\U_GCD|DATAPATH|X_REG|output\(4) & (!\U_GCD|DATAPATH|Y_REG|output\(4) & !\U_GCD|DATAPATH|SUB|Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(4),
	datab => \U_GCD|DATAPATH|Y_REG|output\(4),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add0~7\,
	combout => \U_GCD|DATAPATH|SUB|Add0~8_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add0~9\);

-- Location: LCCOMB_X60_Y47_N14
\U_GCD|DATAPATH|SUB|Add1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add1~6_combout\ = (\U_GCD|DATAPATH|Y_REG|output\(3) & ((\U_GCD|DATAPATH|X_REG|output\(3) & (!\U_GCD|DATAPATH|SUB|Add1~5\)) # (!\U_GCD|DATAPATH|X_REG|output\(3) & (\U_GCD|DATAPATH|SUB|Add1~5\ & VCC)))) # 
-- (!\U_GCD|DATAPATH|Y_REG|output\(3) & ((\U_GCD|DATAPATH|X_REG|output\(3) & ((\U_GCD|DATAPATH|SUB|Add1~5\) # (GND))) # (!\U_GCD|DATAPATH|X_REG|output\(3) & (!\U_GCD|DATAPATH|SUB|Add1~5\))))
-- \U_GCD|DATAPATH|SUB|Add1~7\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(3) & (\U_GCD|DATAPATH|X_REG|output\(3) & !\U_GCD|DATAPATH|SUB|Add1~5\)) # (!\U_GCD|DATAPATH|Y_REG|output\(3) & ((\U_GCD|DATAPATH|X_REG|output\(3)) # (!\U_GCD|DATAPATH|SUB|Add1~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(3),
	datab => \U_GCD|DATAPATH|X_REG|output\(3),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add1~5\,
	combout => \U_GCD|DATAPATH|SUB|Add1~6_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add1~7\);

-- Location: LCCOMB_X60_Y47_N16
\U_GCD|DATAPATH|SUB|Add1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add1~8_combout\ = ((\U_GCD|DATAPATH|X_REG|output\(4) $ (\U_GCD|DATAPATH|Y_REG|output\(4) $ (\U_GCD|DATAPATH|SUB|Add1~7\)))) # (GND)
-- \U_GCD|DATAPATH|SUB|Add1~9\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(4) & (\U_GCD|DATAPATH|Y_REG|output\(4) & !\U_GCD|DATAPATH|SUB|Add1~7\)) # (!\U_GCD|DATAPATH|X_REG|output\(4) & ((\U_GCD|DATAPATH|Y_REG|output\(4)) # (!\U_GCD|DATAPATH|SUB|Add1~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(4),
	datab => \U_GCD|DATAPATH|Y_REG|output\(4),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add1~7\,
	combout => \U_GCD|DATAPATH|SUB|Add1~8_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add1~9\);

-- Location: LCCOMB_X59_Y47_N0
\U_GCD|DATAPATH|X_REG|output[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|X_REG|output[4]~4_combout\ = (\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & (\U_GCD|DATAPATH|SUB|Add0~8_combout\)) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & ((\U_GCD|DATAPATH|SUB|Add1~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|SUB|Add0~8_combout\,
	datab => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	datad => \U_GCD|DATAPATH|SUB|Add1~8_combout\,
	combout => \U_GCD|DATAPATH|X_REG|output[4]~4_combout\);

-- Location: IOIBUF_X69_Y54_N1
\switch[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(9),
	o => \switch[9]~input_o\);

-- Location: FF_X59_Y47_N1
\U_GCD|DATAPATH|X_REG|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|X_REG|output[4]~4_combout\,
	asdata => \switch[9]~input_o\,
	clrn => \ALT_INV_button[0]~input_o\,
	sload => \U_GCD|CONTROLLER|x_sel~0_combout\,
	ena => \U_GCD|CONTROLLER|x_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|X_REG|output\(4));

-- Location: LCCOMB_X58_Y47_N10
\U_GCD|DATAPATH|SUB|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add0~10_combout\ = (\U_GCD|DATAPATH|Y_REG|output\(5) & ((\U_GCD|DATAPATH|X_REG|output\(5) & (!\U_GCD|DATAPATH|SUB|Add0~9\)) # (!\U_GCD|DATAPATH|X_REG|output\(5) & ((\U_GCD|DATAPATH|SUB|Add0~9\) # (GND))))) # 
-- (!\U_GCD|DATAPATH|Y_REG|output\(5) & ((\U_GCD|DATAPATH|X_REG|output\(5) & (\U_GCD|DATAPATH|SUB|Add0~9\ & VCC)) # (!\U_GCD|DATAPATH|X_REG|output\(5) & (!\U_GCD|DATAPATH|SUB|Add0~9\))))
-- \U_GCD|DATAPATH|SUB|Add0~11\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(5) & ((!\U_GCD|DATAPATH|SUB|Add0~9\) # (!\U_GCD|DATAPATH|X_REG|output\(5)))) # (!\U_GCD|DATAPATH|Y_REG|output\(5) & (!\U_GCD|DATAPATH|X_REG|output\(5) & !\U_GCD|DATAPATH|SUB|Add0~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(5),
	datab => \U_GCD|DATAPATH|X_REG|output\(5),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add0~9\,
	combout => \U_GCD|DATAPATH|SUB|Add0~10_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add0~11\);

-- Location: LCCOMB_X58_Y47_N16
\U_GCD|DATAPATH|X_MUX|output[5]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|X_MUX|output[5]~0_combout\ = (!\U_GCD|CONTROLLER|x_sel~0_combout\ & ((\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & ((\U_GCD|DATAPATH|SUB|Add0~10_combout\))) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & 
-- (\U_GCD|DATAPATH|SUB|Add1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|x_sel~0_combout\,
	datab => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	datac => \U_GCD|DATAPATH|SUB|Add1~10_combout\,
	datad => \U_GCD|DATAPATH|SUB|Add0~10_combout\,
	combout => \U_GCD|DATAPATH|X_MUX|output[5]~0_combout\);

-- Location: FF_X58_Y47_N17
\U_GCD|DATAPATH|X_REG|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|X_MUX|output[5]~0_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|x_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|X_REG|output\(5));

-- Location: LCCOMB_X60_Y47_N18
\U_GCD|DATAPATH|SUB|Add1~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add1~10_combout\ = (\U_GCD|DATAPATH|X_REG|output\(5) & ((\U_GCD|DATAPATH|Y_REG|output\(5) & (!\U_GCD|DATAPATH|SUB|Add1~9\)) # (!\U_GCD|DATAPATH|Y_REG|output\(5) & ((\U_GCD|DATAPATH|SUB|Add1~9\) # (GND))))) # 
-- (!\U_GCD|DATAPATH|X_REG|output\(5) & ((\U_GCD|DATAPATH|Y_REG|output\(5) & (\U_GCD|DATAPATH|SUB|Add1~9\ & VCC)) # (!\U_GCD|DATAPATH|Y_REG|output\(5) & (!\U_GCD|DATAPATH|SUB|Add1~9\))))
-- \U_GCD|DATAPATH|SUB|Add1~11\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(5) & ((!\U_GCD|DATAPATH|SUB|Add1~9\) # (!\U_GCD|DATAPATH|Y_REG|output\(5)))) # (!\U_GCD|DATAPATH|X_REG|output\(5) & (!\U_GCD|DATAPATH|Y_REG|output\(5) & !\U_GCD|DATAPATH|SUB|Add1~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(5),
	datab => \U_GCD|DATAPATH|Y_REG|output\(5),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add1~9\,
	combout => \U_GCD|DATAPATH|SUB|Add1~10_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add1~11\);

-- Location: LCCOMB_X60_Y47_N0
\U_GCD|DATAPATH|Y_MUX|output[5]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|Y_MUX|output[5]~13_combout\ = (!\U_GCD|CONTROLLER|y_sel~0_combout\ & ((\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & ((\U_GCD|DATAPATH|SUB|Add0~10_combout\))) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & 
-- (\U_GCD|DATAPATH|SUB|Add1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|SUB|Add1~10_combout\,
	datab => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	datac => \U_GCD|CONTROLLER|y_sel~0_combout\,
	datad => \U_GCD|DATAPATH|SUB|Add0~10_combout\,
	combout => \U_GCD|DATAPATH|Y_MUX|output[5]~13_combout\);

-- Location: FF_X60_Y47_N1
\U_GCD|DATAPATH|Y_REG|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|Y_MUX|output[5]~13_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|y_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|Y_REG|output\(5));

-- Location: LCCOMB_X58_Y47_N12
\U_GCD|DATAPATH|SUB|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add0~12_combout\ = ((\U_GCD|DATAPATH|X_REG|output\(6) $ (\U_GCD|DATAPATH|Y_REG|output\(6) $ (\U_GCD|DATAPATH|SUB|Add0~11\)))) # (GND)
-- \U_GCD|DATAPATH|SUB|Add0~13\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(6) & ((!\U_GCD|DATAPATH|SUB|Add0~11\) # (!\U_GCD|DATAPATH|Y_REG|output\(6)))) # (!\U_GCD|DATAPATH|X_REG|output\(6) & (!\U_GCD|DATAPATH|Y_REG|output\(6) & !\U_GCD|DATAPATH|SUB|Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(6),
	datab => \U_GCD|DATAPATH|Y_REG|output\(6),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add0~11\,
	combout => \U_GCD|DATAPATH|SUB|Add0~12_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add0~13\);

-- Location: LCCOMB_X60_Y47_N20
\U_GCD|DATAPATH|SUB|Add1~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add1~12_combout\ = ((\U_GCD|DATAPATH|X_REG|output\(6) $ (\U_GCD|DATAPATH|Y_REG|output\(6) $ (\U_GCD|DATAPATH|SUB|Add1~11\)))) # (GND)
-- \U_GCD|DATAPATH|SUB|Add1~13\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(6) & (\U_GCD|DATAPATH|Y_REG|output\(6) & !\U_GCD|DATAPATH|SUB|Add1~11\)) # (!\U_GCD|DATAPATH|X_REG|output\(6) & ((\U_GCD|DATAPATH|Y_REG|output\(6)) # (!\U_GCD|DATAPATH|SUB|Add1~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(6),
	datab => \U_GCD|DATAPATH|Y_REG|output\(6),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|Add1~11\,
	combout => \U_GCD|DATAPATH|SUB|Add1~12_combout\,
	cout => \U_GCD|DATAPATH|SUB|Add1~13\);

-- Location: LCCOMB_X58_Y47_N18
\U_GCD|DATAPATH|Y_MUX|output[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|Y_MUX|output[6]~12_combout\ = (!\U_GCD|CONTROLLER|y_sel~0_combout\ & ((\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & (\U_GCD|DATAPATH|SUB|Add0~12_combout\)) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & 
-- ((\U_GCD|DATAPATH|SUB|Add1~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|SUB|Add0~12_combout\,
	datab => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	datac => \U_GCD|CONTROLLER|y_sel~0_combout\,
	datad => \U_GCD|DATAPATH|SUB|Add1~12_combout\,
	combout => \U_GCD|DATAPATH|Y_MUX|output[6]~12_combout\);

-- Location: FF_X58_Y47_N19
\U_GCD|DATAPATH|Y_REG|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|Y_MUX|output[6]~12_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|y_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|Y_REG|output\(6));

-- Location: LCCOMB_X58_Y47_N14
\U_GCD|DATAPATH|SUB|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add0~14_combout\ = \U_GCD|DATAPATH|X_REG|output\(7) $ (\U_GCD|DATAPATH|SUB|Add0~13\ $ (!\U_GCD|DATAPATH|Y_REG|output\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_GCD|DATAPATH|X_REG|output\(7),
	datad => \U_GCD|DATAPATH|Y_REG|output\(7),
	cin => \U_GCD|DATAPATH|SUB|Add0~13\,
	combout => \U_GCD|DATAPATH|SUB|Add0~14_combout\);

-- Location: LCCOMB_X60_Y47_N22
\U_GCD|DATAPATH|SUB|Add1~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|Add1~14_combout\ = \U_GCD|DATAPATH|Y_REG|output\(7) $ (\U_GCD|DATAPATH|SUB|Add1~13\ $ (!\U_GCD|DATAPATH|X_REG|output\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(7),
	datad => \U_GCD|DATAPATH|X_REG|output\(7),
	cin => \U_GCD|DATAPATH|SUB|Add1~13\,
	combout => \U_GCD|DATAPATH|SUB|Add1~14_combout\);

-- Location: LCCOMB_X59_Y47_N2
\U_GCD|DATAPATH|X_MUX|output[7]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|X_MUX|output[7]~2_combout\ = (!\U_GCD|CONTROLLER|x_sel~0_combout\ & ((\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & (\U_GCD|DATAPATH|SUB|Add0~14_combout\)) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & 
-- ((\U_GCD|DATAPATH|SUB|Add1~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|SUB|Add0~14_combout\,
	datab => \U_GCD|CONTROLLER|x_sel~0_combout\,
	datac => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	datad => \U_GCD|DATAPATH|SUB|Add1~14_combout\,
	combout => \U_GCD|DATAPATH|X_MUX|output[7]~2_combout\);

-- Location: FF_X59_Y47_N3
\U_GCD|DATAPATH|X_REG|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|X_MUX|output[7]~2_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|x_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|X_REG|output\(7));

-- Location: LCCOMB_X59_Y47_N14
\U_GCD|DATAPATH|SUB|LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|LessThan0~1_cout\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(0) & !\U_GCD|DATAPATH|Y_REG|output\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(0),
	datab => \U_GCD|DATAPATH|Y_REG|output\(0),
	datad => VCC,
	cout => \U_GCD|DATAPATH|SUB|LessThan0~1_cout\);

-- Location: LCCOMB_X59_Y47_N16
\U_GCD|DATAPATH|SUB|LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|LessThan0~3_cout\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(1) & (\U_GCD|DATAPATH|Y_REG|output\(1) & !\U_GCD|DATAPATH|SUB|LessThan0~1_cout\)) # (!\U_GCD|DATAPATH|X_REG|output\(1) & ((\U_GCD|DATAPATH|Y_REG|output\(1)) # 
-- (!\U_GCD|DATAPATH|SUB|LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(1),
	datab => \U_GCD|DATAPATH|Y_REG|output\(1),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|LessThan0~1_cout\,
	cout => \U_GCD|DATAPATH|SUB|LessThan0~3_cout\);

-- Location: LCCOMB_X59_Y47_N18
\U_GCD|DATAPATH|SUB|LessThan0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|LessThan0~5_cout\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(2) & (\U_GCD|DATAPATH|X_REG|output\(2) & !\U_GCD|DATAPATH|SUB|LessThan0~3_cout\)) # (!\U_GCD|DATAPATH|Y_REG|output\(2) & ((\U_GCD|DATAPATH|X_REG|output\(2)) # 
-- (!\U_GCD|DATAPATH|SUB|LessThan0~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(2),
	datab => \U_GCD|DATAPATH|X_REG|output\(2),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|LessThan0~3_cout\,
	cout => \U_GCD|DATAPATH|SUB|LessThan0~5_cout\);

-- Location: LCCOMB_X59_Y47_N20
\U_GCD|DATAPATH|SUB|LessThan0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|LessThan0~7_cout\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(3) & (\U_GCD|DATAPATH|Y_REG|output\(3) & !\U_GCD|DATAPATH|SUB|LessThan0~5_cout\)) # (!\U_GCD|DATAPATH|X_REG|output\(3) & ((\U_GCD|DATAPATH|Y_REG|output\(3)) # 
-- (!\U_GCD|DATAPATH|SUB|LessThan0~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(3),
	datab => \U_GCD|DATAPATH|Y_REG|output\(3),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|LessThan0~5_cout\,
	cout => \U_GCD|DATAPATH|SUB|LessThan0~7_cout\);

-- Location: LCCOMB_X59_Y47_N22
\U_GCD|DATAPATH|SUB|LessThan0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|LessThan0~9_cout\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(4) & (\U_GCD|DATAPATH|X_REG|output\(4) & !\U_GCD|DATAPATH|SUB|LessThan0~7_cout\)) # (!\U_GCD|DATAPATH|Y_REG|output\(4) & ((\U_GCD|DATAPATH|X_REG|output\(4)) # 
-- (!\U_GCD|DATAPATH|SUB|LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(4),
	datab => \U_GCD|DATAPATH|X_REG|output\(4),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|LessThan0~7_cout\,
	cout => \U_GCD|DATAPATH|SUB|LessThan0~9_cout\);

-- Location: LCCOMB_X59_Y47_N24
\U_GCD|DATAPATH|SUB|LessThan0~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|LessThan0~11_cout\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(5) & (\U_GCD|DATAPATH|Y_REG|output\(5) & !\U_GCD|DATAPATH|SUB|LessThan0~9_cout\)) # (!\U_GCD|DATAPATH|X_REG|output\(5) & ((\U_GCD|DATAPATH|Y_REG|output\(5)) # 
-- (!\U_GCD|DATAPATH|SUB|LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(5),
	datab => \U_GCD|DATAPATH|Y_REG|output\(5),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|LessThan0~9_cout\,
	cout => \U_GCD|DATAPATH|SUB|LessThan0~11_cout\);

-- Location: LCCOMB_X59_Y47_N26
\U_GCD|DATAPATH|SUB|LessThan0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|LessThan0~13_cout\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(6) & (\U_GCD|DATAPATH|X_REG|output\(6) & !\U_GCD|DATAPATH|SUB|LessThan0~11_cout\)) # (!\U_GCD|DATAPATH|Y_REG|output\(6) & ((\U_GCD|DATAPATH|X_REG|output\(6)) # 
-- (!\U_GCD|DATAPATH|SUB|LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(6),
	datab => \U_GCD|DATAPATH|X_REG|output\(6),
	datad => VCC,
	cin => \U_GCD|DATAPATH|SUB|LessThan0~11_cout\,
	cout => \U_GCD|DATAPATH|SUB|LessThan0~13_cout\);

-- Location: LCCOMB_X59_Y47_N28
\U_GCD|DATAPATH|SUB|LessThan0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|SUB|LessThan0~14_combout\ = (\U_GCD|DATAPATH|X_REG|output\(7) & ((\U_GCD|DATAPATH|SUB|LessThan0~13_cout\) # (!\U_GCD|DATAPATH|Y_REG|output\(7)))) # (!\U_GCD|DATAPATH|X_REG|output\(7) & (\U_GCD|DATAPATH|SUB|LessThan0~13_cout\ & 
-- !\U_GCD|DATAPATH|Y_REG|output\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_GCD|DATAPATH|X_REG|output\(7),
	datad => \U_GCD|DATAPATH|Y_REG|output\(7),
	cin => \U_GCD|DATAPATH|SUB|LessThan0~13_cout\,
	combout => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\);

-- Location: LCCOMB_X58_Y47_N20
\U_GCD|DATAPATH|Y_MUX|output[7]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|Y_MUX|output[7]~11_combout\ = (!\U_GCD|CONTROLLER|y_sel~0_combout\ & ((\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & (\U_GCD|DATAPATH|SUB|Add0~14_combout\)) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & 
-- ((\U_GCD|DATAPATH|SUB|Add1~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|y_sel~0_combout\,
	datab => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	datac => \U_GCD|DATAPATH|SUB|Add0~14_combout\,
	datad => \U_GCD|DATAPATH|SUB|Add1~14_combout\,
	combout => \U_GCD|DATAPATH|Y_MUX|output[7]~11_combout\);

-- Location: FF_X58_Y47_N21
\U_GCD|DATAPATH|Y_REG|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|Y_MUX|output[7]~11_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|y_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|Y_REG|output\(7));

-- Location: LCCOMB_X57_Y47_N4
\U_GCD|DATAPATH|COMP|LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|LessThan0~1_cout\ = CARRY((!\U_GCD|DATAPATH|X_REG|output\(0) & \U_GCD|DATAPATH|Y_REG|output\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(0),
	datab => \U_GCD|DATAPATH|Y_REG|output\(0),
	datad => VCC,
	cout => \U_GCD|DATAPATH|COMP|LessThan0~1_cout\);

-- Location: LCCOMB_X57_Y47_N6
\U_GCD|DATAPATH|COMP|LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|LessThan0~3_cout\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(1) & ((!\U_GCD|DATAPATH|COMP|LessThan0~1_cout\) # (!\U_GCD|DATAPATH|Y_REG|output\(1)))) # (!\U_GCD|DATAPATH|X_REG|output\(1) & (!\U_GCD|DATAPATH|Y_REG|output\(1) & 
-- !\U_GCD|DATAPATH|COMP|LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(1),
	datab => \U_GCD|DATAPATH|Y_REG|output\(1),
	datad => VCC,
	cin => \U_GCD|DATAPATH|COMP|LessThan0~1_cout\,
	cout => \U_GCD|DATAPATH|COMP|LessThan0~3_cout\);

-- Location: LCCOMB_X57_Y47_N8
\U_GCD|DATAPATH|COMP|LessThan0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|LessThan0~5_cout\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(2) & (\U_GCD|DATAPATH|Y_REG|output\(2) & !\U_GCD|DATAPATH|COMP|LessThan0~3_cout\)) # (!\U_GCD|DATAPATH|X_REG|output\(2) & ((\U_GCD|DATAPATH|Y_REG|output\(2)) # 
-- (!\U_GCD|DATAPATH|COMP|LessThan0~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(2),
	datab => \U_GCD|DATAPATH|Y_REG|output\(2),
	datad => VCC,
	cin => \U_GCD|DATAPATH|COMP|LessThan0~3_cout\,
	cout => \U_GCD|DATAPATH|COMP|LessThan0~5_cout\);

-- Location: LCCOMB_X57_Y47_N10
\U_GCD|DATAPATH|COMP|LessThan0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|LessThan0~7_cout\ = CARRY((\U_GCD|DATAPATH|X_REG|output\(3) & ((!\U_GCD|DATAPATH|COMP|LessThan0~5_cout\) # (!\U_GCD|DATAPATH|Y_REG|output\(3)))) # (!\U_GCD|DATAPATH|X_REG|output\(3) & (!\U_GCD|DATAPATH|Y_REG|output\(3) & 
-- !\U_GCD|DATAPATH|COMP|LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(3),
	datab => \U_GCD|DATAPATH|Y_REG|output\(3),
	datad => VCC,
	cin => \U_GCD|DATAPATH|COMP|LessThan0~5_cout\,
	cout => \U_GCD|DATAPATH|COMP|LessThan0~7_cout\);

-- Location: LCCOMB_X57_Y47_N12
\U_GCD|DATAPATH|COMP|LessThan0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|LessThan0~9_cout\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(4) & ((!\U_GCD|DATAPATH|COMP|LessThan0~7_cout\) # (!\U_GCD|DATAPATH|X_REG|output\(4)))) # (!\U_GCD|DATAPATH|Y_REG|output\(4) & (!\U_GCD|DATAPATH|X_REG|output\(4) & 
-- !\U_GCD|DATAPATH|COMP|LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(4),
	datab => \U_GCD|DATAPATH|X_REG|output\(4),
	datad => VCC,
	cin => \U_GCD|DATAPATH|COMP|LessThan0~7_cout\,
	cout => \U_GCD|DATAPATH|COMP|LessThan0~9_cout\);

-- Location: LCCOMB_X57_Y47_N14
\U_GCD|DATAPATH|COMP|LessThan0~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|LessThan0~11_cout\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(5) & (\U_GCD|DATAPATH|X_REG|output\(5) & !\U_GCD|DATAPATH|COMP|LessThan0~9_cout\)) # (!\U_GCD|DATAPATH|Y_REG|output\(5) & ((\U_GCD|DATAPATH|X_REG|output\(5)) # 
-- (!\U_GCD|DATAPATH|COMP|LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(5),
	datab => \U_GCD|DATAPATH|X_REG|output\(5),
	datad => VCC,
	cin => \U_GCD|DATAPATH|COMP|LessThan0~9_cout\,
	cout => \U_GCD|DATAPATH|COMP|LessThan0~11_cout\);

-- Location: LCCOMB_X57_Y47_N16
\U_GCD|DATAPATH|COMP|LessThan0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|LessThan0~13_cout\ = CARRY((\U_GCD|DATAPATH|Y_REG|output\(6) & ((!\U_GCD|DATAPATH|COMP|LessThan0~11_cout\) # (!\U_GCD|DATAPATH|X_REG|output\(6)))) # (!\U_GCD|DATAPATH|Y_REG|output\(6) & (!\U_GCD|DATAPATH|X_REG|output\(6) & 
-- !\U_GCD|DATAPATH|COMP|LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(6),
	datab => \U_GCD|DATAPATH|X_REG|output\(6),
	datad => VCC,
	cin => \U_GCD|DATAPATH|COMP|LessThan0~11_cout\,
	cout => \U_GCD|DATAPATH|COMP|LessThan0~13_cout\);

-- Location: LCCOMB_X57_Y47_N18
\U_GCD|DATAPATH|COMP|LessThan0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|LessThan0~14_combout\ = (\U_GCD|DATAPATH|Y_REG|output\(7) & ((\U_GCD|DATAPATH|COMP|LessThan0~13_cout\) # (!\U_GCD|DATAPATH|X_REG|output\(7)))) # (!\U_GCD|DATAPATH|Y_REG|output\(7) & (\U_GCD|DATAPATH|COMP|LessThan0~13_cout\ & 
-- !\U_GCD|DATAPATH|X_REG|output\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(7),
	datad => \U_GCD|DATAPATH|X_REG|output\(7),
	cin => \U_GCD|DATAPATH|COMP|LessThan0~13_cout\,
	combout => \U_GCD|DATAPATH|COMP|LessThan0~14_combout\);

-- Location: LCCOMB_X57_Y47_N20
\U_GCD|CONTROLLER|next_state.X_GREATER_THAN~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|next_state.X_GREATER_THAN~0_combout\ = (!\U_GCD|DATAPATH|COMP|LessThan0~14_combout\ & (\U_GCD|CONTROLLER|state.CHECK_COMP~q\ & !\U_GCD|DATAPATH|COMP|Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_GCD|DATAPATH|COMP|LessThan0~14_combout\,
	datac => \U_GCD|CONTROLLER|state.CHECK_COMP~q\,
	datad => \U_GCD|DATAPATH|COMP|Equal0~4_combout\,
	combout => \U_GCD|CONTROLLER|next_state.X_GREATER_THAN~0_combout\);

-- Location: FF_X57_Y47_N21
\U_GCD|CONTROLLER|state.X_GREATER_THAN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \U_GCD|CONTROLLER|next_state.X_GREATER_THAN~0_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|CONTROLLER|state.X_GREATER_THAN~q\);

-- Location: LCCOMB_X56_Y47_N26
\U_GCD|CONTROLLER|Selector3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|Selector3~0_combout\ = (\U_GCD|CONTROLLER|state.X_LESS_THAN~q\) # ((\button[1]~input_o\ & (!\U_GCD|CONTROLLER|state.START~q\)) # (!\button[1]~input_o\ & ((\U_GCD|CONTROLLER|state.INIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \button[1]~input_o\,
	datab => \U_GCD|CONTROLLER|state.START~q\,
	datac => \U_GCD|CONTROLLER|state.INIT~q\,
	datad => \U_GCD|CONTROLLER|state.X_LESS_THAN~q\,
	combout => \U_GCD|CONTROLLER|Selector3~0_combout\);

-- Location: LCCOMB_X56_Y47_N28
\U_GCD|CONTROLLER|Selector3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|Selector3~1_combout\ = (\U_GCD|CONTROLLER|state.X_GREATER_THAN~q\) # (\U_GCD|CONTROLLER|Selector3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|state.X_GREATER_THAN~q\,
	datad => \U_GCD|CONTROLLER|Selector3~0_combout\,
	combout => \U_GCD|CONTROLLER|Selector3~1_combout\);

-- Location: LCCOMB_X56_Y47_N6
\U_GCD|CONTROLLER|state.INIT~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|state.INIT~feeder_combout\ = \U_GCD|CONTROLLER|Selector3~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GCD|CONTROLLER|Selector3~1_combout\,
	combout => \U_GCD|CONTROLLER|state.INIT~feeder_combout\);

-- Location: FF_X56_Y47_N7
\U_GCD|CONTROLLER|state.INIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|CONTROLLER|state.INIT~feeder_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|CONTROLLER|state.INIT~q\);

-- Location: LCCOMB_X59_Y47_N10
\U_GCD|CONTROLLER|x_sel~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|x_sel~0_combout\ = (!\U_GCD|CONTROLLER|state.INIT~q\ & !\U_GCD|CONTROLLER|state.X_GREATER_THAN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|state.INIT~q\,
	datad => \U_GCD|CONTROLLER|state.X_GREATER_THAN~q\,
	combout => \U_GCD|CONTROLLER|x_sel~0_combout\);

-- Location: LCCOMB_X58_Y47_N26
\U_GCD|DATAPATH|X_MUX|output[6]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|X_MUX|output[6]~1_combout\ = (!\U_GCD|CONTROLLER|x_sel~0_combout\ & ((\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & (\U_GCD|DATAPATH|SUB|Add0~12_combout\)) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & 
-- ((\U_GCD|DATAPATH|SUB|Add1~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|CONTROLLER|x_sel~0_combout\,
	datab => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	datac => \U_GCD|DATAPATH|SUB|Add0~12_combout\,
	datad => \U_GCD|DATAPATH|SUB|Add1~12_combout\,
	combout => \U_GCD|DATAPATH|X_MUX|output[6]~1_combout\);

-- Location: FF_X58_Y47_N27
\U_GCD|DATAPATH|X_REG|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|X_MUX|output[6]~1_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|x_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|X_REG|output\(6));

-- Location: LCCOMB_X58_Y47_N22
\U_GCD|DATAPATH|COMP|Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|Equal0~3_combout\ = (\U_GCD|DATAPATH|X_REG|output\(6) & (\U_GCD|DATAPATH|Y_REG|output\(6) & (\U_GCD|DATAPATH|Y_REG|output\(7) $ (!\U_GCD|DATAPATH|X_REG|output\(7))))) # (!\U_GCD|DATAPATH|X_REG|output\(6) & 
-- (!\U_GCD|DATAPATH|Y_REG|output\(6) & (\U_GCD|DATAPATH|Y_REG|output\(7) $ (!\U_GCD|DATAPATH|X_REG|output\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(6),
	datab => \U_GCD|DATAPATH|Y_REG|output\(7),
	datac => \U_GCD|DATAPATH|X_REG|output\(7),
	datad => \U_GCD|DATAPATH|Y_REG|output\(6),
	combout => \U_GCD|DATAPATH|COMP|Equal0~3_combout\);

-- Location: LCCOMB_X57_Y47_N22
\U_GCD|DATAPATH|COMP|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|Equal0~1_combout\ = (\U_GCD|DATAPATH|X_REG|output\(2) & (\U_GCD|DATAPATH|Y_REG|output\(2) & (\U_GCD|DATAPATH|X_REG|output\(3) $ (!\U_GCD|DATAPATH|Y_REG|output\(3))))) # (!\U_GCD|DATAPATH|X_REG|output\(2) & 
-- (!\U_GCD|DATAPATH|Y_REG|output\(2) & (\U_GCD|DATAPATH|X_REG|output\(3) $ (!\U_GCD|DATAPATH|Y_REG|output\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(2),
	datab => \U_GCD|DATAPATH|X_REG|output\(3),
	datac => \U_GCD|DATAPATH|Y_REG|output\(2),
	datad => \U_GCD|DATAPATH|Y_REG|output\(3),
	combout => \U_GCD|DATAPATH|COMP|Equal0~1_combout\);

-- Location: LCCOMB_X57_Y47_N30
\U_GCD|DATAPATH|COMP|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|Equal0~0_combout\ = (\U_GCD|DATAPATH|X_REG|output\(0) & (\U_GCD|DATAPATH|Y_REG|output\(0) & (\U_GCD|DATAPATH|X_REG|output\(1) $ (!\U_GCD|DATAPATH|Y_REG|output\(1))))) # (!\U_GCD|DATAPATH|X_REG|output\(0) & 
-- (!\U_GCD|DATAPATH|Y_REG|output\(0) & (\U_GCD|DATAPATH|X_REG|output\(1) $ (!\U_GCD|DATAPATH|Y_REG|output\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output\(0),
	datab => \U_GCD|DATAPATH|Y_REG|output\(0),
	datac => \U_GCD|DATAPATH|X_REG|output\(1),
	datad => \U_GCD|DATAPATH|Y_REG|output\(1),
	combout => \U_GCD|DATAPATH|COMP|Equal0~0_combout\);

-- Location: LCCOMB_X58_Y47_N24
\U_GCD|DATAPATH|COMP|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|Equal0~2_combout\ = (\U_GCD|DATAPATH|Y_REG|output\(5) & (\U_GCD|DATAPATH|X_REG|output\(5) & (\U_GCD|DATAPATH|Y_REG|output\(4) $ (!\U_GCD|DATAPATH|X_REG|output\(4))))) # (!\U_GCD|DATAPATH|Y_REG|output\(5) & 
-- (!\U_GCD|DATAPATH|X_REG|output\(5) & (\U_GCD|DATAPATH|Y_REG|output\(4) $ (!\U_GCD|DATAPATH|X_REG|output\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|Y_REG|output\(5),
	datab => \U_GCD|DATAPATH|Y_REG|output\(4),
	datac => \U_GCD|DATAPATH|X_REG|output\(4),
	datad => \U_GCD|DATAPATH|X_REG|output\(5),
	combout => \U_GCD|DATAPATH|COMP|Equal0~2_combout\);

-- Location: LCCOMB_X57_Y47_N24
\U_GCD|DATAPATH|COMP|Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|COMP|Equal0~4_combout\ = (\U_GCD|DATAPATH|COMP|Equal0~3_combout\ & (\U_GCD|DATAPATH|COMP|Equal0~1_combout\ & (\U_GCD|DATAPATH|COMP|Equal0~0_combout\ & \U_GCD|DATAPATH|COMP|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|COMP|Equal0~3_combout\,
	datab => \U_GCD|DATAPATH|COMP|Equal0~1_combout\,
	datac => \U_GCD|DATAPATH|COMP|Equal0~0_combout\,
	datad => \U_GCD|DATAPATH|COMP|Equal0~2_combout\,
	combout => \U_GCD|DATAPATH|COMP|Equal0~4_combout\);

-- Location: LCCOMB_X57_Y47_N28
\U_GCD|CONTROLLER|next_state.X_LESS_THAN~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|CONTROLLER|next_state.X_LESS_THAN~0_combout\ = (!\U_GCD|DATAPATH|COMP|Equal0~4_combout\ & (\U_GCD|CONTROLLER|state.CHECK_COMP~q\ & \U_GCD|DATAPATH|COMP|LessThan0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_GCD|DATAPATH|COMP|Equal0~4_combout\,
	datac => \U_GCD|CONTROLLER|state.CHECK_COMP~q\,
	datad => \U_GCD|DATAPATH|COMP|LessThan0~14_combout\,
	combout => \U_GCD|CONTROLLER|next_state.X_LESS_THAN~0_combout\);

-- Location: FF_X57_Y47_N29
\U_GCD|CONTROLLER|state.X_LESS_THAN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \U_GCD|CONTROLLER|next_state.X_LESS_THAN~0_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|CONTROLLER|state.X_LESS_THAN~q\);

-- Location: LCCOMB_X60_Y47_N26
\U_GCD|DATAPATH|Y_MUX|output[3]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|Y_MUX|output[3]~16_combout\ = (\U_GCD|CONTROLLER|state.X_LESS_THAN~q\ & (\U_GCD|DATAPATH|X_REG|output[3]~3_combout\)) # (!\U_GCD|CONTROLLER|state.X_LESS_THAN~q\ & ((\U_GCD|CONTROLLER|state.INIT~q\ & 
-- (\U_GCD|DATAPATH|X_REG|output[3]~3_combout\)) # (!\U_GCD|CONTROLLER|state.INIT~q\ & ((\switch[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|X_REG|output[3]~3_combout\,
	datab => \switch[3]~input_o\,
	datac => \U_GCD|CONTROLLER|state.X_LESS_THAN~q\,
	datad => \U_GCD|CONTROLLER|state.INIT~q\,
	combout => \U_GCD|DATAPATH|Y_MUX|output[3]~16_combout\);

-- Location: FF_X60_Y47_N27
\U_GCD|DATAPATH|Y_REG|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|Y_MUX|output[3]~16_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|y_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|Y_REG|output\(3));

-- Location: LCCOMB_X60_Y47_N6
\U_GCD|DATAPATH|X_REG|output[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|X_REG|output[3]~3_combout\ = (\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & ((\U_GCD|DATAPATH|SUB|Add0~6_combout\))) # (!\U_GCD|DATAPATH|SUB|LessThan0~14_combout\ & (\U_GCD|DATAPATH|SUB|Add1~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_GCD|DATAPATH|SUB|Add1~6_combout\,
	datac => \U_GCD|DATAPATH|SUB|Add0~6_combout\,
	datad => \U_GCD|DATAPATH|SUB|LessThan0~14_combout\,
	combout => \U_GCD|DATAPATH|X_REG|output[3]~3_combout\);

-- Location: LCCOMB_X60_Y47_N30
\U_GCD|DATAPATH|X_REG|output[3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|X_REG|output[3]~feeder_combout\ = \U_GCD|DATAPATH|X_REG|output[3]~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GCD|DATAPATH|X_REG|output[3]~3_combout\,
	combout => \U_GCD|DATAPATH|X_REG|output[3]~feeder_combout\);

-- Location: IOIBUF_X56_Y54_N1
\switch[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch(8),
	o => \switch[8]~input_o\);

-- Location: FF_X60_Y47_N31
\U_GCD|DATAPATH|X_REG|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|X_REG|output[3]~feeder_combout\,
	asdata => \switch[8]~input_o\,
	clrn => \ALT_INV_button[0]~input_o\,
	sload => \U_GCD|CONTROLLER|x_sel~0_combout\,
	ena => \U_GCD|CONTROLLER|x_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|X_REG|output\(3));

-- Location: FF_X56_Y47_N19
\U_GCD|DATAPATH|OUT_REG|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \U_GCD|DATAPATH|X_REG|output\(3),
	clrn => \ALT_INV_button[0]~input_o\,
	sload => VCC,
	ena => \U_GCD|CONTROLLER|state.FINAL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|OUT_REG|output\(3));

-- Location: FF_X56_Y47_N29
\U_GCD|DATAPATH|OUT_REG|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \U_GCD|DATAPATH|X_REG|output\(1),
	clrn => \ALT_INV_button[0]~input_o\,
	sload => VCC,
	ena => \U_GCD|CONTROLLER|state.FINAL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|OUT_REG|output\(1));

-- Location: FF_X56_Y47_N13
\U_GCD|DATAPATH|OUT_REG|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \U_GCD|DATAPATH|X_REG|output\(2),
	clrn => \ALT_INV_button[0]~input_o\,
	sload => VCC,
	ena => \U_GCD|CONTROLLER|state.FINAL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|OUT_REG|output\(2));

-- Location: FF_X56_Y47_N25
\U_GCD|DATAPATH|OUT_REG|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \U_GCD|DATAPATH|X_REG|output\(0),
	clrn => \ALT_INV_button[0]~input_o\,
	sload => VCC,
	ena => \U_GCD|CONTROLLER|state.FINAL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|OUT_REG|output\(0));

-- Location: LCCOMB_X56_Y47_N10
\U_LED4|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux6~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(3) & (\U_GCD|DATAPATH|OUT_REG|output\(0) & (\U_GCD|DATAPATH|OUT_REG|output\(1) $ (\U_GCD|DATAPATH|OUT_REG|output\(2))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(3) & 
-- (!\U_GCD|DATAPATH|OUT_REG|output\(1) & (\U_GCD|DATAPATH|OUT_REG|output\(2) $ (\U_GCD|DATAPATH|OUT_REG|output\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(3),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(1),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(2),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(0),
	combout => \U_LED4|Mux6~0_combout\);

-- Location: LCCOMB_X56_Y47_N14
\U_LED4|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux5~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(3) & ((\U_GCD|DATAPATH|OUT_REG|output\(0) & (\U_GCD|DATAPATH|OUT_REG|output\(1))) # (!\U_GCD|DATAPATH|OUT_REG|output\(0) & ((\U_GCD|DATAPATH|OUT_REG|output\(2)))))) # 
-- (!\U_GCD|DATAPATH|OUT_REG|output\(3) & (\U_GCD|DATAPATH|OUT_REG|output\(2) & (\U_GCD|DATAPATH|OUT_REG|output\(1) $ (\U_GCD|DATAPATH|OUT_REG|output\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(3),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(1),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(2),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(0),
	combout => \U_LED4|Mux5~0_combout\);

-- Location: LCCOMB_X56_Y47_N22
\U_LED4|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux4~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(3) & (\U_GCD|DATAPATH|OUT_REG|output\(2) & ((\U_GCD|DATAPATH|OUT_REG|output\(1)) # (!\U_GCD|DATAPATH|OUT_REG|output\(0))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(3) & 
-- (\U_GCD|DATAPATH|OUT_REG|output\(1) & (!\U_GCD|DATAPATH|OUT_REG|output\(2) & !\U_GCD|DATAPATH|OUT_REG|output\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(3),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(1),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(2),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(0),
	combout => \U_LED4|Mux4~0_combout\);

-- Location: LCCOMB_X56_Y47_N30
\U_LED4|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux3~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(0) & ((\U_GCD|DATAPATH|OUT_REG|output\(1) $ (!\U_GCD|DATAPATH|OUT_REG|output\(2))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(0) & ((\U_GCD|DATAPATH|OUT_REG|output\(3) & 
-- (\U_GCD|DATAPATH|OUT_REG|output\(1) & !\U_GCD|DATAPATH|OUT_REG|output\(2))) # (!\U_GCD|DATAPATH|OUT_REG|output\(3) & (!\U_GCD|DATAPATH|OUT_REG|output\(1) & \U_GCD|DATAPATH|OUT_REG|output\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(3),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(1),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(2),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(0),
	combout => \U_LED4|Mux3~0_combout\);

-- Location: LCCOMB_X56_Y47_N2
\U_LED4|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux2~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(1) & (!\U_GCD|DATAPATH|OUT_REG|output\(3) & ((\U_GCD|DATAPATH|OUT_REG|output\(0))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(1) & ((\U_GCD|DATAPATH|OUT_REG|output\(2) & 
-- (!\U_GCD|DATAPATH|OUT_REG|output\(3))) # (!\U_GCD|DATAPATH|OUT_REG|output\(2) & ((\U_GCD|DATAPATH|OUT_REG|output\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(3),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(1),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(2),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(0),
	combout => \U_LED4|Mux2~0_combout\);

-- Location: LCCOMB_X56_Y47_N0
\U_LED4|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux1~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(1) & (!\U_GCD|DATAPATH|OUT_REG|output\(3) & ((\U_GCD|DATAPATH|OUT_REG|output\(0)) # (!\U_GCD|DATAPATH|OUT_REG|output\(2))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(1) & 
-- (\U_GCD|DATAPATH|OUT_REG|output\(0) & (\U_GCD|DATAPATH|OUT_REG|output\(3) $ (!\U_GCD|DATAPATH|OUT_REG|output\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(3),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(1),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(2),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(0),
	combout => \U_LED4|Mux1~0_combout\);

-- Location: LCCOMB_X56_Y47_N24
\U_LED4|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux0~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(0) & ((\U_GCD|DATAPATH|OUT_REG|output\(3)) # (\U_GCD|DATAPATH|OUT_REG|output\(2) $ (\U_GCD|DATAPATH|OUT_REG|output\(1))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(0) & 
-- ((\U_GCD|DATAPATH|OUT_REG|output\(1)) # (\U_GCD|DATAPATH|OUT_REG|output\(3) $ (\U_GCD|DATAPATH|OUT_REG|output\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(3),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(2),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(0),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(1),
	combout => \U_LED4|Mux0~0_combout\);

-- Location: LCCOMB_X63_Y47_N26
\U_GCD|DATAPATH|OUT_REG|output[7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|OUT_REG|output[7]~feeder_combout\ = \U_GCD|DATAPATH|X_REG|output\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GCD|DATAPATH|X_REG|output\(7),
	combout => \U_GCD|DATAPATH|OUT_REG|output[7]~feeder_combout\);

-- Location: FF_X63_Y47_N27
\U_GCD|DATAPATH|OUT_REG|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|OUT_REG|output[7]~feeder_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|state.FINAL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|OUT_REG|output\(7));

-- Location: LCCOMB_X63_Y47_N24
\U_GCD|DATAPATH|OUT_REG|output[4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|OUT_REG|output[4]~feeder_combout\ = \U_GCD|DATAPATH|X_REG|output\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GCD|DATAPATH|X_REG|output\(4),
	combout => \U_GCD|DATAPATH|OUT_REG|output[4]~feeder_combout\);

-- Location: FF_X63_Y47_N25
\U_GCD|DATAPATH|OUT_REG|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|OUT_REG|output[4]~feeder_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|state.FINAL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|OUT_REG|output\(4));

-- Location: LCCOMB_X63_Y47_N22
\U_GCD|DATAPATH|OUT_REG|output[5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|OUT_REG|output[5]~feeder_combout\ = \U_GCD|DATAPATH|X_REG|output\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GCD|DATAPATH|X_REG|output\(5),
	combout => \U_GCD|DATAPATH|OUT_REG|output[5]~feeder_combout\);

-- Location: FF_X63_Y47_N23
\U_GCD|DATAPATH|OUT_REG|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|OUT_REG|output[5]~feeder_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|state.FINAL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|OUT_REG|output\(5));

-- Location: LCCOMB_X63_Y47_N28
\U_GCD|DATAPATH|OUT_REG|output[6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GCD|DATAPATH|OUT_REG|output[6]~feeder_combout\ = \U_GCD|DATAPATH|X_REG|output\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GCD|DATAPATH|X_REG|output\(6),
	combout => \U_GCD|DATAPATH|OUT_REG|output[6]~feeder_combout\);

-- Location: FF_X63_Y47_N29
\U_GCD|DATAPATH|OUT_REG|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_GCD|DATAPATH|OUT_REG|output[6]~feeder_combout\,
	clrn => \ALT_INV_button[0]~input_o\,
	ena => \U_GCD|CONTROLLER|state.FINAL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GCD|DATAPATH|OUT_REG|output\(6));

-- Location: LCCOMB_X63_Y47_N8
\U_LED5|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux6~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(7) & (\U_GCD|DATAPATH|OUT_REG|output\(4) & (\U_GCD|DATAPATH|OUT_REG|output\(5) $ (\U_GCD|DATAPATH|OUT_REG|output\(6))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(7) & 
-- (!\U_GCD|DATAPATH|OUT_REG|output\(5) & (\U_GCD|DATAPATH|OUT_REG|output\(4) $ (\U_GCD|DATAPATH|OUT_REG|output\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(7),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(4),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(5),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(6),
	combout => \U_LED5|Mux6~0_combout\);

-- Location: LCCOMB_X63_Y47_N18
\U_LED5|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux5~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(7) & ((\U_GCD|DATAPATH|OUT_REG|output\(4) & (\U_GCD|DATAPATH|OUT_REG|output\(5))) # (!\U_GCD|DATAPATH|OUT_REG|output\(4) & ((\U_GCD|DATAPATH|OUT_REG|output\(6)))))) # 
-- (!\U_GCD|DATAPATH|OUT_REG|output\(7) & (\U_GCD|DATAPATH|OUT_REG|output\(6) & (\U_GCD|DATAPATH|OUT_REG|output\(4) $ (\U_GCD|DATAPATH|OUT_REG|output\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(7),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(4),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(5),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(6),
	combout => \U_LED5|Mux5~0_combout\);

-- Location: LCCOMB_X63_Y47_N20
\U_LED5|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux4~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(7) & (\U_GCD|DATAPATH|OUT_REG|output\(6) & ((\U_GCD|DATAPATH|OUT_REG|output\(5)) # (!\U_GCD|DATAPATH|OUT_REG|output\(4))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(7) & 
-- (!\U_GCD|DATAPATH|OUT_REG|output\(4) & (\U_GCD|DATAPATH|OUT_REG|output\(5) & !\U_GCD|DATAPATH|OUT_REG|output\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(7),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(4),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(5),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(6),
	combout => \U_LED5|Mux4~0_combout\);

-- Location: LCCOMB_X63_Y47_N10
\U_LED5|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux3~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(4) & ((\U_GCD|DATAPATH|OUT_REG|output\(5) $ (!\U_GCD|DATAPATH|OUT_REG|output\(6))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(4) & ((\U_GCD|DATAPATH|OUT_REG|output\(7) & 
-- (\U_GCD|DATAPATH|OUT_REG|output\(5) & !\U_GCD|DATAPATH|OUT_REG|output\(6))) # (!\U_GCD|DATAPATH|OUT_REG|output\(7) & (!\U_GCD|DATAPATH|OUT_REG|output\(5) & \U_GCD|DATAPATH|OUT_REG|output\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(7),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(4),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(5),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(6),
	combout => \U_LED5|Mux3~0_combout\);

-- Location: LCCOMB_X63_Y47_N12
\U_LED5|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux2~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(5) & (!\U_GCD|DATAPATH|OUT_REG|output\(7) & (\U_GCD|DATAPATH|OUT_REG|output\(4)))) # (!\U_GCD|DATAPATH|OUT_REG|output\(5) & ((\U_GCD|DATAPATH|OUT_REG|output\(6) & 
-- (!\U_GCD|DATAPATH|OUT_REG|output\(7))) # (!\U_GCD|DATAPATH|OUT_REG|output\(6) & ((\U_GCD|DATAPATH|OUT_REG|output\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(7),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(4),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(5),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(6),
	combout => \U_LED5|Mux2~0_combout\);

-- Location: LCCOMB_X63_Y47_N30
\U_LED5|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux1~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(4) & (\U_GCD|DATAPATH|OUT_REG|output\(7) $ (((\U_GCD|DATAPATH|OUT_REG|output\(5)) # (!\U_GCD|DATAPATH|OUT_REG|output\(6)))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(4) & 
-- (!\U_GCD|DATAPATH|OUT_REG|output\(7) & (\U_GCD|DATAPATH|OUT_REG|output\(5) & !\U_GCD|DATAPATH|OUT_REG|output\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(7),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(4),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(5),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(6),
	combout => \U_LED5|Mux1~0_combout\);

-- Location: LCCOMB_X63_Y47_N4
\U_LED5|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux0~0_combout\ = (\U_GCD|DATAPATH|OUT_REG|output\(4) & ((\U_GCD|DATAPATH|OUT_REG|output\(7)) # (\U_GCD|DATAPATH|OUT_REG|output\(5) $ (\U_GCD|DATAPATH|OUT_REG|output\(6))))) # (!\U_GCD|DATAPATH|OUT_REG|output\(4) & 
-- ((\U_GCD|DATAPATH|OUT_REG|output\(5)) # (\U_GCD|DATAPATH|OUT_REG|output\(7) $ (\U_GCD|DATAPATH|OUT_REG|output\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GCD|DATAPATH|OUT_REG|output\(7),
	datab => \U_GCD|DATAPATH|OUT_REG|output\(4),
	datac => \U_GCD|DATAPATH|OUT_REG|output\(5),
	datad => \U_GCD|DATAPATH|OUT_REG|output\(6),
	combout => \U_LED5|Mux0~0_combout\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_led0(0) <= \led0[0]~output_o\;

ww_led0(1) <= \led0[1]~output_o\;

ww_led0(2) <= \led0[2]~output_o\;

ww_led0(3) <= \led0[3]~output_o\;

ww_led0(4) <= \led0[4]~output_o\;

ww_led0(5) <= \led0[5]~output_o\;

ww_led0(6) <= \led0[6]~output_o\;

ww_led0_dp <= \led0_dp~output_o\;

ww_led1(0) <= \led1[0]~output_o\;

ww_led1(1) <= \led1[1]~output_o\;

ww_led1(2) <= \led1[2]~output_o\;

ww_led1(3) <= \led1[3]~output_o\;

ww_led1(4) <= \led1[4]~output_o\;

ww_led1(5) <= \led1[5]~output_o\;

ww_led1(6) <= \led1[6]~output_o\;

ww_led1_dp <= \led1_dp~output_o\;

ww_led2(0) <= \led2[0]~output_o\;

ww_led2(1) <= \led2[1]~output_o\;

ww_led2(2) <= \led2[2]~output_o\;

ww_led2(3) <= \led2[3]~output_o\;

ww_led2(4) <= \led2[4]~output_o\;

ww_led2(5) <= \led2[5]~output_o\;

ww_led2(6) <= \led2[6]~output_o\;

ww_led2_dp <= \led2_dp~output_o\;

ww_led3(0) <= \led3[0]~output_o\;

ww_led3(1) <= \led3[1]~output_o\;

ww_led3(2) <= \led3[2]~output_o\;

ww_led3(3) <= \led3[3]~output_o\;

ww_led3(4) <= \led3[4]~output_o\;

ww_led3(5) <= \led3[5]~output_o\;

ww_led3(6) <= \led3[6]~output_o\;

ww_led3_dp <= \led3_dp~output_o\;

ww_led4(0) <= \led4[0]~output_o\;

ww_led4(1) <= \led4[1]~output_o\;

ww_led4(2) <= \led4[2]~output_o\;

ww_led4(3) <= \led4[3]~output_o\;

ww_led4(4) <= \led4[4]~output_o\;

ww_led4(5) <= \led4[5]~output_o\;

ww_led4(6) <= \led4[6]~output_o\;

ww_led4_dp <= \led4_dp~output_o\;

ww_led5(0) <= \led5[0]~output_o\;

ww_led5(1) <= \led5[1]~output_o\;

ww_led5(2) <= \led5[2]~output_o\;

ww_led5(3) <= \led5[3]~output_o\;

ww_led5(4) <= \led5[4]~output_o\;

ww_led5(5) <= \led5[5]~output_o\;

ww_led5(6) <= \led5[6]~output_o\;

ww_led5_dp <= \led5_dp~output_o\;
END structure;


