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

-- DATE "02/19/2020 16:16:46"

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
	clk50MHz : IN std_logic;
	rst : IN std_logic;
	switch : IN std_logic_vector(9 DOWNTO 0);
	button : IN std_logic_vector(1 DOWNTO 0);
	led0 : BUFFER std_logic_vector(6 DOWNTO 0);
	led0_dp : BUFFER std_logic;
	led1 : BUFFER std_logic_vector(6 DOWNTO 0);
	led1_dp : BUFFER std_logic;
	led2 : BUFFER std_logic_vector(6 DOWNTO 0);
	led2_dp : BUFFER std_logic;
	led3 : BUFFER std_logic_vector(6 DOWNTO 0);
	led3_dp : BUFFER std_logic;
	led4 : BUFFER std_logic_vector(6 DOWNTO 0);
	led4_dp : BUFFER std_logic;
	led5 : BUFFER std_logic_vector(6 DOWNTO 0);
	led5_dp : BUFFER std_logic
	);
END top_level;

-- Design Ports Information
-- switch[0]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[1]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[2]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[3]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button[0]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
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
-- rst	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[6]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[7]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[8]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[9]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button[1]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[4]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch[5]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk50MHz	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_clk50MHz : std_logic;
SIGNAL ww_rst : std_logic;
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
SIGNAL \U_COUNTER|count[3]~25clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U_CLK_GEN|COUNT1|timeReached~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U_CLK_GEN|DIV1|temp~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk50MHz~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \switch[0]~input_o\ : std_logic;
SIGNAL \switch[1]~input_o\ : std_logic;
SIGNAL \switch[2]~input_o\ : std_logic;
SIGNAL \switch[3]~input_o\ : std_logic;
SIGNAL \button[0]~input_o\ : std_logic;
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
SIGNAL \clk50MHz~input_o\ : std_logic;
SIGNAL \clk50MHz~inputclkctrl_outclk\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~0_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|count~6_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~1\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~2_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~3\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~4_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~5\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~6_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|count~5_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~7\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~8_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~9\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~10_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|count~4_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~11\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~12_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~13\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~14_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|count~3_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~15\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~16_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|count~2_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~17\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~18_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~19\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~20_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~21\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~22_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~23\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~24_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~25\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~27\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~28_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|count~0_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~29\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~30_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~31\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~32_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~33\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~34_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~35\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~36_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~37\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~38_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~39\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~40_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~41\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~42_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~43\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~44_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~45\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~46_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~47\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~48_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~49\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~50_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~51\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~52_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~53\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~54_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Equal0~1_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~55\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~56_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~57\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~58_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~59\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~60_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~61\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~62_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Equal0~0_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Equal0~3_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Equal0~2_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Equal0~4_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Add0~26_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|count~1_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Equal0~5_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Equal0~6_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Equal0~7_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Equal0~8_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|Equal0~9_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|temp~0_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|temp~feeder_combout\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|temp~q\ : std_logic;
SIGNAL \U_CLK_GEN|DIV1|temp~clkctrl_outclk\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~0_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|count~6_combout\ : std_logic;
SIGNAL \button[1]~input_o\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~1\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~2_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|count~7_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~3\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~4_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~5\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~6_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|count~5_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~7\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~8_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~9\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~10_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|count~4_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~11\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~12_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|count~3_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~13\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~14_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|count~2_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~8_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~9_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~15\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~16_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|count~1_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~17\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~18_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|count~0_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~19\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~20_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~21\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~22_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~23\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~24_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~25\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~26_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~27\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~28_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~29\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~30_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~31\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~32_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~33\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~34_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~35\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~36_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~37\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~38_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~39\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~40_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~41\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~42_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~43\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~44_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~45\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~46_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~47\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~48_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~49\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~50_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~51\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~52_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~53\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~54_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~55\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~56_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~57\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~58_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~59\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~60_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~61\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Add0~62_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~0_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~1_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~3_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~2_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~4_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~6_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~5_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~7_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|Equal0~10_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|timeReached~q\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\ : std_logic;
SIGNAL \U_QUIZ|state.S3~feeder_combout\ : std_logic;
SIGNAL \U_QUIZ|state.S3~q\ : std_logic;
SIGNAL \U_QUIZ|state.S4~feeder_combout\ : std_logic;
SIGNAL \U_QUIZ|state.S4~q\ : std_logic;
SIGNAL \U_QUIZ|state.S5~q\ : std_logic;
SIGNAL \U_QUIZ|state.S6~feeder_combout\ : std_logic;
SIGNAL \U_QUIZ|state.S6~q\ : std_logic;
SIGNAL \U_QUIZ|state.S7~q\ : std_logic;
SIGNAL \U_QUIZ|state.S8~q\ : std_logic;
SIGNAL \U_QUIZ|state.S9~q\ : std_logic;
SIGNAL \U_QUIZ|state.S0~0_combout\ : std_logic;
SIGNAL \U_QUIZ|state.S0~q\ : std_logic;
SIGNAL \U_QUIZ|state.S1~0_combout\ : std_logic;
SIGNAL \U_QUIZ|state.S1~q\ : std_logic;
SIGNAL \U_QUIZ|state.S2~feeder_combout\ : std_logic;
SIGNAL \U_QUIZ|state.S2~q\ : std_logic;
SIGNAL \U_QUIZ|WideOr1~combout\ : std_logic;
SIGNAL \U_QUIZ|WideOr2~0_combout\ : std_logic;
SIGNAL \U_QUIZ|WideOr2~combout\ : std_logic;
SIGNAL \U_QUIZ|WideOr0~0_combout\ : std_logic;
SIGNAL \U_QUIZ|WideOr3~0_combout\ : std_logic;
SIGNAL \U_LED3|Mux6~0_combout\ : std_logic;
SIGNAL \U_LED3|Mux5~0_combout\ : std_logic;
SIGNAL \U_LED3|Mux4~0_combout\ : std_logic;
SIGNAL \U_LED3|Mux3~0_combout\ : std_logic;
SIGNAL \U_LED3|Mux2~0_combout\ : std_logic;
SIGNAL \U_LED3|Mux1~0_combout\ : std_logic;
SIGNAL \U_LED3|Mux0~0_combout\ : std_logic;
SIGNAL \switch[4]~input_o\ : std_logic;
SIGNAL \U_COUNTER|count[3]~25_combout\ : std_logic;
SIGNAL \switch[8]~input_o\ : std_logic;
SIGNAL \switch[5]~input_o\ : std_logic;
SIGNAL \switch[6]~input_o\ : std_logic;
SIGNAL \U_COUNTER|count[3]~25clkctrl_outclk\ : std_logic;
SIGNAL \U_COUNTER|count[0]~1_combout\ : std_logic;
SIGNAL \U_COUNTER|count[0]~4_combout\ : std_logic;
SIGNAL \U_COUNTER|count[0]~0_combout\ : std_logic;
SIGNAL \U_COUNTER|count[0]~_emulated_q\ : std_logic;
SIGNAL \U_COUNTER|count[0]~3_combout\ : std_logic;
SIGNAL \U_COUNTER|count[0]~2_combout\ : std_logic;
SIGNAL \switch[9]~input_o\ : std_logic;
SIGNAL \U_COUNTER|count[3]~16_combout\ : std_logic;
SIGNAL \switch[7]~input_o\ : std_logic;
SIGNAL \U_COUNTER|count[1]~6_combout\ : std_logic;
SIGNAL \U_COUNTER|Add0~1_cout\ : std_logic;
SIGNAL \U_COUNTER|Add0~2_combout\ : std_logic;
SIGNAL \U_COUNTER|count[1]~9_combout\ : std_logic;
SIGNAL \U_COUNTER|count[1]~_emulated_q\ : std_logic;
SIGNAL \U_COUNTER|count[1]~8_combout\ : std_logic;
SIGNAL \U_COUNTER|count[1]~7_combout\ : std_logic;
SIGNAL \U_COUNTER|Add0~3\ : std_logic;
SIGNAL \U_COUNTER|Add0~5\ : std_logic;
SIGNAL \U_COUNTER|Add0~6_combout\ : std_logic;
SIGNAL \U_COUNTER|count[3]~19_combout\ : std_logic;
SIGNAL \U_COUNTER|count[3]~_emulated_q\ : std_logic;
SIGNAL \U_COUNTER|count[3]~18_combout\ : std_logic;
SIGNAL \U_COUNTER|count[3]~17_combout\ : std_logic;
SIGNAL \U_COUNTER|count~26_combout\ : std_logic;
SIGNAL \U_COUNTER|count~27_combout\ : std_logic;
SIGNAL \U_COUNTER|Add0~4_combout\ : std_logic;
SIGNAL \U_COUNTER|count[2]~11_combout\ : std_logic;
SIGNAL \U_COUNTER|count[2]~14_combout\ : std_logic;
SIGNAL \U_COUNTER|count[2]~_emulated_q\ : std_logic;
SIGNAL \U_COUNTER|count[2]~13_combout\ : std_logic;
SIGNAL \U_COUNTER|count[2]~12_combout\ : std_logic;
SIGNAL \U_LED4|Mux6~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux5~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux4~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux3~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux2~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux1~0_combout\ : std_logic;
SIGNAL \U_LED4|Mux0~0_combout\ : std_logic;
SIGNAL \U_GRAY|state.S10~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S10~q\ : std_logic;
SIGNAL \U_GRAY|state.S11~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S11~q\ : std_logic;
SIGNAL \U_GRAY|state.S12~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S12~q\ : std_logic;
SIGNAL \U_GRAY|state.S13~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S13~q\ : std_logic;
SIGNAL \U_GRAY|state.S14~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S14~q\ : std_logic;
SIGNAL \U_GRAY|state.S15~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S15~q\ : std_logic;
SIGNAL \U_GRAY|state.S0~0_combout\ : std_logic;
SIGNAL \U_GRAY|state.S0~q\ : std_logic;
SIGNAL \U_GRAY|state.S1~0_combout\ : std_logic;
SIGNAL \U_GRAY|state.S1~q\ : std_logic;
SIGNAL \U_GRAY|state.S2~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S2~q\ : std_logic;
SIGNAL \U_GRAY|state.S3~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S3~q\ : std_logic;
SIGNAL \U_GRAY|state.S4~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S4~q\ : std_logic;
SIGNAL \U_GRAY|state.S5~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S5~q\ : std_logic;
SIGNAL \U_GRAY|state.S6~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S6~q\ : std_logic;
SIGNAL \U_GRAY|state.S7~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S7~q\ : std_logic;
SIGNAL \U_GRAY|state.S8~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S8~q\ : std_logic;
SIGNAL \U_GRAY|state.S9~feeder_combout\ : std_logic;
SIGNAL \U_GRAY|state.S9~q\ : std_logic;
SIGNAL \U_GRAY|WideOr2~1_combout\ : std_logic;
SIGNAL \U_GRAY|WideOr2~0_combout\ : std_logic;
SIGNAL \U_GRAY|WideOr2~combout\ : std_logic;
SIGNAL \U_GRAY|WideOr3~0_combout\ : std_logic;
SIGNAL \U_GRAY|WideOr3~combout\ : std_logic;
SIGNAL \U_GRAY|WideOr1~0_combout\ : std_logic;
SIGNAL \U_GRAY|WideOr0~0_combout\ : std_logic;
SIGNAL \U_GRAY|WideOr1~combout\ : std_logic;
SIGNAL \U_GRAY|WideOr0~1_combout\ : std_logic;
SIGNAL \U_GRAY|WideOr0~combout\ : std_logic;
SIGNAL \U_LED5|Mux6~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux5~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux4~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux3~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux2~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux1~0_combout\ : std_logic;
SIGNAL \U_LED5|Mux0~0_combout\ : std_logic;
SIGNAL \U_CLK_GEN|COUNT1|count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U_CLK_GEN|DIV1|count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U_COUNTER|ALT_INV_count[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_button[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \U_LED5|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \U_LED5|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \U_LED5|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \U_LED4|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \U_LED3|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \U_LED3|ALT_INV_Mux4~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk50MHz <= clk50MHz;
ww_rst <= rst;
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

\U_COUNTER|count[3]~25clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \U_COUNTER|count[3]~25_combout\);

\U_CLK_GEN|COUNT1|timeReached~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \U_CLK_GEN|COUNT1|timeReached~q\);

\U_CLK_GEN|DIV1|temp~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \U_CLK_GEN|DIV1|temp~q\);

\clk50MHz~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk50MHz~input_o\);
\U_COUNTER|ALT_INV_count[0]~0_combout\ <= NOT \U_COUNTER|count[0]~0_combout\;
\ALT_INV_button[1]~input_o\ <= NOT \button[1]~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\U_LED5|ALT_INV_Mux3~0_combout\ <= NOT \U_LED5|Mux3~0_combout\;
\U_LED5|ALT_INV_Mux4~0_combout\ <= NOT \U_LED5|Mux4~0_combout\;
\U_LED5|ALT_INV_Mux5~0_combout\ <= NOT \U_LED5|Mux5~0_combout\;
\U_LED4|ALT_INV_Mux0~0_combout\ <= NOT \U_LED4|Mux0~0_combout\;
\U_LED3|ALT_INV_Mux1~0_combout\ <= NOT \U_LED3|Mux1~0_combout\;
\U_LED3|ALT_INV_Mux4~0_combout\ <= NOT \U_LED3|Mux4~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y42_N12
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
	i => \U_LED3|Mux6~0_combout\,
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
	i => \U_LED3|Mux5~0_combout\,
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
	i => \U_LED3|ALT_INV_Mux4~0_combout\,
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
	i => \U_LED3|Mux3~0_combout\,
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
	i => \U_LED3|Mux2~0_combout\,
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
	i => \U_LED3|ALT_INV_Mux1~0_combout\,
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
	i => \U_LED3|Mux0~0_combout\,
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
	i => \U_LED5|ALT_INV_Mux5~0_combout\,
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
	i => \U_LED5|ALT_INV_Mux4~0_combout\,
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
	i => \U_LED5|ALT_INV_Mux3~0_combout\,
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
	i => \U_LED5|Mux0~0_combout\,
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
	i => VCC,
	devoe => ww_devoe,
	o => \led5_dp~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\clk50MHz~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk50MHz,
	o => \clk50MHz~input_o\);

-- Location: CLKCTRL_G19
\clk50MHz~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk50MHz~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk50MHz~inputclkctrl_outclk\);

-- Location: LCCOMB_X46_Y53_N0
\U_CLK_GEN|DIV1|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~0_combout\ = \U_CLK_GEN|DIV1|count\(0) $ (VCC)
-- \U_CLK_GEN|DIV1|Add0~1\ = CARRY(\U_CLK_GEN|DIV1|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(0),
	datad => VCC,
	combout => \U_CLK_GEN|DIV1|Add0~0_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~1\);

-- Location: LCCOMB_X45_Y53_N4
\U_CLK_GEN|DIV1|count~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|count~6_combout\ = (\U_CLK_GEN|DIV1|Add0~0_combout\ & ((!\U_CLK_GEN|DIV1|Equal0~4_combout\) # (!\U_CLK_GEN|DIV1|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|Equal0~9_combout\,
	datab => \U_CLK_GEN|DIV1|Add0~0_combout\,
	datad => \U_CLK_GEN|DIV1|Equal0~4_combout\,
	combout => \U_CLK_GEN|DIV1|count~6_combout\);

-- Location: IOIBUF_X46_Y54_N29
\rst~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X46_Y53_N11
\U_CLK_GEN|DIV1|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	asdata => \U_CLK_GEN|DIV1|count~6_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(0));

-- Location: LCCOMB_X46_Y53_N2
\U_CLK_GEN|DIV1|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~2_combout\ = (\U_CLK_GEN|DIV1|count\(1) & (!\U_CLK_GEN|DIV1|Add0~1\)) # (!\U_CLK_GEN|DIV1|count\(1) & ((\U_CLK_GEN|DIV1|Add0~1\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~3\ = CARRY((!\U_CLK_GEN|DIV1|Add0~1\) # (!\U_CLK_GEN|DIV1|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(1),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~1\,
	combout => \U_CLK_GEN|DIV1|Add0~2_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~3\);

-- Location: FF_X46_Y53_N3
\U_CLK_GEN|DIV1|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(1));

-- Location: LCCOMB_X46_Y53_N4
\U_CLK_GEN|DIV1|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~4_combout\ = (\U_CLK_GEN|DIV1|count\(2) & (\U_CLK_GEN|DIV1|Add0~3\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(2) & (!\U_CLK_GEN|DIV1|Add0~3\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~5\ = CARRY((\U_CLK_GEN|DIV1|count\(2) & !\U_CLK_GEN|DIV1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(2),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~3\,
	combout => \U_CLK_GEN|DIV1|Add0~4_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~5\);

-- Location: FF_X46_Y53_N5
\U_CLK_GEN|DIV1|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~4_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(2));

-- Location: LCCOMB_X46_Y53_N6
\U_CLK_GEN|DIV1|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~6_combout\ = (\U_CLK_GEN|DIV1|count\(3) & (!\U_CLK_GEN|DIV1|Add0~5\)) # (!\U_CLK_GEN|DIV1|count\(3) & ((\U_CLK_GEN|DIV1|Add0~5\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~7\ = CARRY((!\U_CLK_GEN|DIV1|Add0~5\) # (!\U_CLK_GEN|DIV1|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(3),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~5\,
	combout => \U_CLK_GEN|DIV1|Add0~6_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~7\);

-- Location: LCCOMB_X45_Y53_N0
\U_CLK_GEN|DIV1|count~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|count~5_combout\ = (\U_CLK_GEN|DIV1|Add0~6_combout\ & ((!\U_CLK_GEN|DIV1|Equal0~4_combout\) # (!\U_CLK_GEN|DIV1|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|Equal0~9_combout\,
	datab => \U_CLK_GEN|DIV1|Equal0~4_combout\,
	datad => \U_CLK_GEN|DIV1|Add0~6_combout\,
	combout => \U_CLK_GEN|DIV1|count~5_combout\);

-- Location: FF_X46_Y53_N1
\U_CLK_GEN|DIV1|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	asdata => \U_CLK_GEN|DIV1|count~5_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(3));

-- Location: LCCOMB_X46_Y53_N8
\U_CLK_GEN|DIV1|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~8_combout\ = (\U_CLK_GEN|DIV1|count\(4) & (\U_CLK_GEN|DIV1|Add0~7\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(4) & (!\U_CLK_GEN|DIV1|Add0~7\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~9\ = CARRY((\U_CLK_GEN|DIV1|count\(4) & !\U_CLK_GEN|DIV1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(4),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~7\,
	combout => \U_CLK_GEN|DIV1|Add0~8_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~9\);

-- Location: FF_X46_Y53_N9
\U_CLK_GEN|DIV1|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~8_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(4));

-- Location: LCCOMB_X46_Y53_N10
\U_CLK_GEN|DIV1|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~10_combout\ = (\U_CLK_GEN|DIV1|count\(5) & (!\U_CLK_GEN|DIV1|Add0~9\)) # (!\U_CLK_GEN|DIV1|count\(5) & ((\U_CLK_GEN|DIV1|Add0~9\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~11\ = CARRY((!\U_CLK_GEN|DIV1|Add0~9\) # (!\U_CLK_GEN|DIV1|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(5),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~9\,
	combout => \U_CLK_GEN|DIV1|Add0~10_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~11\);

-- Location: LCCOMB_X45_Y53_N6
\U_CLK_GEN|DIV1|count~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|count~4_combout\ = (\U_CLK_GEN|DIV1|Add0~10_combout\ & ((!\U_CLK_GEN|DIV1|Equal0~4_combout\) # (!\U_CLK_GEN|DIV1|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|Equal0~9_combout\,
	datac => \U_CLK_GEN|DIV1|Add0~10_combout\,
	datad => \U_CLK_GEN|DIV1|Equal0~4_combout\,
	combout => \U_CLK_GEN|DIV1|count~4_combout\);

-- Location: FF_X46_Y53_N17
\U_CLK_GEN|DIV1|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	asdata => \U_CLK_GEN|DIV1|count~4_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(5));

-- Location: LCCOMB_X46_Y53_N12
\U_CLK_GEN|DIV1|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~12_combout\ = (\U_CLK_GEN|DIV1|count\(6) & (\U_CLK_GEN|DIV1|Add0~11\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(6) & (!\U_CLK_GEN|DIV1|Add0~11\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~13\ = CARRY((\U_CLK_GEN|DIV1|count\(6) & !\U_CLK_GEN|DIV1|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(6),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~11\,
	combout => \U_CLK_GEN|DIV1|Add0~12_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~13\);

-- Location: FF_X46_Y53_N13
\U_CLK_GEN|DIV1|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~12_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(6));

-- Location: LCCOMB_X46_Y53_N14
\U_CLK_GEN|DIV1|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~14_combout\ = (\U_CLK_GEN|DIV1|count\(7) & (!\U_CLK_GEN|DIV1|Add0~13\)) # (!\U_CLK_GEN|DIV1|count\(7) & ((\U_CLK_GEN|DIV1|Add0~13\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~15\ = CARRY((!\U_CLK_GEN|DIV1|Add0~13\) # (!\U_CLK_GEN|DIV1|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(7),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~13\,
	combout => \U_CLK_GEN|DIV1|Add0~14_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~15\);

-- Location: LCCOMB_X45_Y53_N14
\U_CLK_GEN|DIV1|count~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|count~3_combout\ = (\U_CLK_GEN|DIV1|Add0~14_combout\ & ((!\U_CLK_GEN|DIV1|Equal0~4_combout\) # (!\U_CLK_GEN|DIV1|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|Equal0~9_combout\,
	datac => \U_CLK_GEN|DIV1|Add0~14_combout\,
	datad => \U_CLK_GEN|DIV1|Equal0~4_combout\,
	combout => \U_CLK_GEN|DIV1|count~3_combout\);

-- Location: FF_X45_Y53_N15
\U_CLK_GEN|DIV1|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|count~3_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(7));

-- Location: LCCOMB_X46_Y53_N16
\U_CLK_GEN|DIV1|Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~16_combout\ = (\U_CLK_GEN|DIV1|count\(8) & (\U_CLK_GEN|DIV1|Add0~15\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(8) & (!\U_CLK_GEN|DIV1|Add0~15\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~17\ = CARRY((\U_CLK_GEN|DIV1|count\(8) & !\U_CLK_GEN|DIV1|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(8),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~15\,
	combout => \U_CLK_GEN|DIV1|Add0~16_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~17\);

-- Location: LCCOMB_X45_Y53_N2
\U_CLK_GEN|DIV1|count~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|count~2_combout\ = (\U_CLK_GEN|DIV1|Add0~16_combout\ & ((!\U_CLK_GEN|DIV1|Equal0~4_combout\) # (!\U_CLK_GEN|DIV1|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|Equal0~9_combout\,
	datac => \U_CLK_GEN|DIV1|Add0~16_combout\,
	datad => \U_CLK_GEN|DIV1|Equal0~4_combout\,
	combout => \U_CLK_GEN|DIV1|count~2_combout\);

-- Location: FF_X45_Y53_N3
\U_CLK_GEN|DIV1|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|count~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(8));

-- Location: LCCOMB_X46_Y53_N18
\U_CLK_GEN|DIV1|Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~18_combout\ = (\U_CLK_GEN|DIV1|count\(9) & (!\U_CLK_GEN|DIV1|Add0~17\)) # (!\U_CLK_GEN|DIV1|count\(9) & ((\U_CLK_GEN|DIV1|Add0~17\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~19\ = CARRY((!\U_CLK_GEN|DIV1|Add0~17\) # (!\U_CLK_GEN|DIV1|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(9),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~17\,
	combout => \U_CLK_GEN|DIV1|Add0~18_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~19\);

-- Location: FF_X46_Y53_N19
\U_CLK_GEN|DIV1|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~18_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(9));

-- Location: LCCOMB_X46_Y53_N20
\U_CLK_GEN|DIV1|Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~20_combout\ = (\U_CLK_GEN|DIV1|count\(10) & (\U_CLK_GEN|DIV1|Add0~19\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(10) & (!\U_CLK_GEN|DIV1|Add0~19\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~21\ = CARRY((\U_CLK_GEN|DIV1|count\(10) & !\U_CLK_GEN|DIV1|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(10),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~19\,
	combout => \U_CLK_GEN|DIV1|Add0~20_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~21\);

-- Location: FF_X46_Y53_N21
\U_CLK_GEN|DIV1|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~20_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(10));

-- Location: LCCOMB_X46_Y53_N22
\U_CLK_GEN|DIV1|Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~22_combout\ = (\U_CLK_GEN|DIV1|count\(11) & (!\U_CLK_GEN|DIV1|Add0~21\)) # (!\U_CLK_GEN|DIV1|count\(11) & ((\U_CLK_GEN|DIV1|Add0~21\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~23\ = CARRY((!\U_CLK_GEN|DIV1|Add0~21\) # (!\U_CLK_GEN|DIV1|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(11),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~21\,
	combout => \U_CLK_GEN|DIV1|Add0~22_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~23\);

-- Location: FF_X46_Y53_N23
\U_CLK_GEN|DIV1|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~22_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(11));

-- Location: LCCOMB_X46_Y53_N24
\U_CLK_GEN|DIV1|Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~24_combout\ = (\U_CLK_GEN|DIV1|count\(12) & (\U_CLK_GEN|DIV1|Add0~23\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(12) & (!\U_CLK_GEN|DIV1|Add0~23\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~25\ = CARRY((\U_CLK_GEN|DIV1|count\(12) & !\U_CLK_GEN|DIV1|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(12),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~23\,
	combout => \U_CLK_GEN|DIV1|Add0~24_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~25\);

-- Location: FF_X46_Y53_N25
\U_CLK_GEN|DIV1|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~24_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(12));

-- Location: LCCOMB_X46_Y53_N26
\U_CLK_GEN|DIV1|Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~26_combout\ = (\U_CLK_GEN|DIV1|count\(13) & (!\U_CLK_GEN|DIV1|Add0~25\)) # (!\U_CLK_GEN|DIV1|count\(13) & ((\U_CLK_GEN|DIV1|Add0~25\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~27\ = CARRY((!\U_CLK_GEN|DIV1|Add0~25\) # (!\U_CLK_GEN|DIV1|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(13),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~25\,
	combout => \U_CLK_GEN|DIV1|Add0~26_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~27\);

-- Location: LCCOMB_X46_Y53_N28
\U_CLK_GEN|DIV1|Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~28_combout\ = (\U_CLK_GEN|DIV1|count\(14) & (\U_CLK_GEN|DIV1|Add0~27\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(14) & (!\U_CLK_GEN|DIV1|Add0~27\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~29\ = CARRY((\U_CLK_GEN|DIV1|count\(14) & !\U_CLK_GEN|DIV1|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(14),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~27\,
	combout => \U_CLK_GEN|DIV1|Add0~28_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~29\);

-- Location: LCCOMB_X45_Y53_N16
\U_CLK_GEN|DIV1|count~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|count~0_combout\ = (\U_CLK_GEN|DIV1|Add0~28_combout\ & ((!\U_CLK_GEN|DIV1|Equal0~4_combout\) # (!\U_CLK_GEN|DIV1|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|Equal0~9_combout\,
	datab => \U_CLK_GEN|DIV1|Equal0~4_combout\,
	datad => \U_CLK_GEN|DIV1|Add0~28_combout\,
	combout => \U_CLK_GEN|DIV1|count~0_combout\);

-- Location: FF_X45_Y53_N17
\U_CLK_GEN|DIV1|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|count~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(14));

-- Location: LCCOMB_X46_Y53_N30
\U_CLK_GEN|DIV1|Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~30_combout\ = (\U_CLK_GEN|DIV1|count\(15) & (!\U_CLK_GEN|DIV1|Add0~29\)) # (!\U_CLK_GEN|DIV1|count\(15) & ((\U_CLK_GEN|DIV1|Add0~29\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~31\ = CARRY((!\U_CLK_GEN|DIV1|Add0~29\) # (!\U_CLK_GEN|DIV1|count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(15),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~29\,
	combout => \U_CLK_GEN|DIV1|Add0~30_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~31\);

-- Location: FF_X46_Y53_N31
\U_CLK_GEN|DIV1|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~30_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(15));

-- Location: LCCOMB_X46_Y52_N0
\U_CLK_GEN|DIV1|Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~32_combout\ = (\U_CLK_GEN|DIV1|count\(16) & (\U_CLK_GEN|DIV1|Add0~31\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(16) & (!\U_CLK_GEN|DIV1|Add0~31\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~33\ = CARRY((\U_CLK_GEN|DIV1|count\(16) & !\U_CLK_GEN|DIV1|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(16),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~31\,
	combout => \U_CLK_GEN|DIV1|Add0~32_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~33\);

-- Location: FF_X46_Y52_N1
\U_CLK_GEN|DIV1|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~32_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(16));

-- Location: LCCOMB_X46_Y52_N2
\U_CLK_GEN|DIV1|Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~34_combout\ = (\U_CLK_GEN|DIV1|count\(17) & (!\U_CLK_GEN|DIV1|Add0~33\)) # (!\U_CLK_GEN|DIV1|count\(17) & ((\U_CLK_GEN|DIV1|Add0~33\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~35\ = CARRY((!\U_CLK_GEN|DIV1|Add0~33\) # (!\U_CLK_GEN|DIV1|count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(17),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~33\,
	combout => \U_CLK_GEN|DIV1|Add0~34_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~35\);

-- Location: FF_X46_Y52_N3
\U_CLK_GEN|DIV1|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~34_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(17));

-- Location: LCCOMB_X46_Y52_N4
\U_CLK_GEN|DIV1|Add0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~36_combout\ = (\U_CLK_GEN|DIV1|count\(18) & (\U_CLK_GEN|DIV1|Add0~35\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(18) & (!\U_CLK_GEN|DIV1|Add0~35\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~37\ = CARRY((\U_CLK_GEN|DIV1|count\(18) & !\U_CLK_GEN|DIV1|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(18),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~35\,
	combout => \U_CLK_GEN|DIV1|Add0~36_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~37\);

-- Location: FF_X46_Y52_N5
\U_CLK_GEN|DIV1|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~36_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(18));

-- Location: LCCOMB_X46_Y52_N6
\U_CLK_GEN|DIV1|Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~38_combout\ = (\U_CLK_GEN|DIV1|count\(19) & (!\U_CLK_GEN|DIV1|Add0~37\)) # (!\U_CLK_GEN|DIV1|count\(19) & ((\U_CLK_GEN|DIV1|Add0~37\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~39\ = CARRY((!\U_CLK_GEN|DIV1|Add0~37\) # (!\U_CLK_GEN|DIV1|count\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(19),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~37\,
	combout => \U_CLK_GEN|DIV1|Add0~38_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~39\);

-- Location: FF_X46_Y52_N7
\U_CLK_GEN|DIV1|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~38_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(19));

-- Location: LCCOMB_X46_Y52_N8
\U_CLK_GEN|DIV1|Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~40_combout\ = (\U_CLK_GEN|DIV1|count\(20) & (\U_CLK_GEN|DIV1|Add0~39\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(20) & (!\U_CLK_GEN|DIV1|Add0~39\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~41\ = CARRY((\U_CLK_GEN|DIV1|count\(20) & !\U_CLK_GEN|DIV1|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(20),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~39\,
	combout => \U_CLK_GEN|DIV1|Add0~40_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~41\);

-- Location: FF_X46_Y52_N9
\U_CLK_GEN|DIV1|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~40_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(20));

-- Location: LCCOMB_X46_Y52_N10
\U_CLK_GEN|DIV1|Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~42_combout\ = (\U_CLK_GEN|DIV1|count\(21) & (!\U_CLK_GEN|DIV1|Add0~41\)) # (!\U_CLK_GEN|DIV1|count\(21) & ((\U_CLK_GEN|DIV1|Add0~41\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~43\ = CARRY((!\U_CLK_GEN|DIV1|Add0~41\) # (!\U_CLK_GEN|DIV1|count\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(21),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~41\,
	combout => \U_CLK_GEN|DIV1|Add0~42_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~43\);

-- Location: FF_X46_Y52_N11
\U_CLK_GEN|DIV1|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~42_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(21));

-- Location: LCCOMB_X46_Y52_N12
\U_CLK_GEN|DIV1|Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~44_combout\ = (\U_CLK_GEN|DIV1|count\(22) & (\U_CLK_GEN|DIV1|Add0~43\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(22) & (!\U_CLK_GEN|DIV1|Add0~43\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~45\ = CARRY((\U_CLK_GEN|DIV1|count\(22) & !\U_CLK_GEN|DIV1|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(22),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~43\,
	combout => \U_CLK_GEN|DIV1|Add0~44_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~45\);

-- Location: FF_X46_Y52_N13
\U_CLK_GEN|DIV1|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~44_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(22));

-- Location: LCCOMB_X46_Y52_N14
\U_CLK_GEN|DIV1|Add0~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~46_combout\ = (\U_CLK_GEN|DIV1|count\(23) & (!\U_CLK_GEN|DIV1|Add0~45\)) # (!\U_CLK_GEN|DIV1|count\(23) & ((\U_CLK_GEN|DIV1|Add0~45\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~47\ = CARRY((!\U_CLK_GEN|DIV1|Add0~45\) # (!\U_CLK_GEN|DIV1|count\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(23),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~45\,
	combout => \U_CLK_GEN|DIV1|Add0~46_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~47\);

-- Location: FF_X46_Y52_N15
\U_CLK_GEN|DIV1|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~46_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(23));

-- Location: LCCOMB_X46_Y52_N16
\U_CLK_GEN|DIV1|Add0~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~48_combout\ = (\U_CLK_GEN|DIV1|count\(24) & (\U_CLK_GEN|DIV1|Add0~47\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(24) & (!\U_CLK_GEN|DIV1|Add0~47\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~49\ = CARRY((\U_CLK_GEN|DIV1|count\(24) & !\U_CLK_GEN|DIV1|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(24),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~47\,
	combout => \U_CLK_GEN|DIV1|Add0~48_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~49\);

-- Location: FF_X46_Y52_N17
\U_CLK_GEN|DIV1|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~48_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(24));

-- Location: LCCOMB_X46_Y52_N18
\U_CLK_GEN|DIV1|Add0~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~50_combout\ = (\U_CLK_GEN|DIV1|count\(25) & (!\U_CLK_GEN|DIV1|Add0~49\)) # (!\U_CLK_GEN|DIV1|count\(25) & ((\U_CLK_GEN|DIV1|Add0~49\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~51\ = CARRY((!\U_CLK_GEN|DIV1|Add0~49\) # (!\U_CLK_GEN|DIV1|count\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(25),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~49\,
	combout => \U_CLK_GEN|DIV1|Add0~50_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~51\);

-- Location: FF_X46_Y52_N19
\U_CLK_GEN|DIV1|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~50_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(25));

-- Location: LCCOMB_X46_Y52_N20
\U_CLK_GEN|DIV1|Add0~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~52_combout\ = (\U_CLK_GEN|DIV1|count\(26) & (\U_CLK_GEN|DIV1|Add0~51\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(26) & (!\U_CLK_GEN|DIV1|Add0~51\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~53\ = CARRY((\U_CLK_GEN|DIV1|count\(26) & !\U_CLK_GEN|DIV1|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(26),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~51\,
	combout => \U_CLK_GEN|DIV1|Add0~52_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~53\);

-- Location: FF_X46_Y52_N21
\U_CLK_GEN|DIV1|count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~52_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(26));

-- Location: LCCOMB_X46_Y52_N22
\U_CLK_GEN|DIV1|Add0~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~54_combout\ = (\U_CLK_GEN|DIV1|count\(27) & (!\U_CLK_GEN|DIV1|Add0~53\)) # (!\U_CLK_GEN|DIV1|count\(27) & ((\U_CLK_GEN|DIV1|Add0~53\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~55\ = CARRY((!\U_CLK_GEN|DIV1|Add0~53\) # (!\U_CLK_GEN|DIV1|count\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(27),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~53\,
	combout => \U_CLK_GEN|DIV1|Add0~54_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~55\);

-- Location: FF_X46_Y52_N23
\U_CLK_GEN|DIV1|count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~54_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(27));

-- Location: LCCOMB_X45_Y52_N0
\U_CLK_GEN|DIV1|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Equal0~1_combout\ = (!\U_CLK_GEN|DIV1|count\(26) & (!\U_CLK_GEN|DIV1|count\(25) & (!\U_CLK_GEN|DIV1|count\(27) & !\U_CLK_GEN|DIV1|count\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(26),
	datab => \U_CLK_GEN|DIV1|count\(25),
	datac => \U_CLK_GEN|DIV1|count\(27),
	datad => \U_CLK_GEN|DIV1|count\(24),
	combout => \U_CLK_GEN|DIV1|Equal0~1_combout\);

-- Location: LCCOMB_X46_Y52_N24
\U_CLK_GEN|DIV1|Add0~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~56_combout\ = (\U_CLK_GEN|DIV1|count\(28) & (\U_CLK_GEN|DIV1|Add0~55\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(28) & (!\U_CLK_GEN|DIV1|Add0~55\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~57\ = CARRY((\U_CLK_GEN|DIV1|count\(28) & !\U_CLK_GEN|DIV1|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(28),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~55\,
	combout => \U_CLK_GEN|DIV1|Add0~56_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~57\);

-- Location: FF_X46_Y52_N25
\U_CLK_GEN|DIV1|count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~56_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(28));

-- Location: LCCOMB_X46_Y52_N26
\U_CLK_GEN|DIV1|Add0~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~58_combout\ = (\U_CLK_GEN|DIV1|count\(29) & (!\U_CLK_GEN|DIV1|Add0~57\)) # (!\U_CLK_GEN|DIV1|count\(29) & ((\U_CLK_GEN|DIV1|Add0~57\) # (GND)))
-- \U_CLK_GEN|DIV1|Add0~59\ = CARRY((!\U_CLK_GEN|DIV1|Add0~57\) # (!\U_CLK_GEN|DIV1|count\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(29),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~57\,
	combout => \U_CLK_GEN|DIV1|Add0~58_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~59\);

-- Location: FF_X46_Y52_N27
\U_CLK_GEN|DIV1|count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~58_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(29));

-- Location: LCCOMB_X46_Y52_N28
\U_CLK_GEN|DIV1|Add0~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~60_combout\ = (\U_CLK_GEN|DIV1|count\(30) & (\U_CLK_GEN|DIV1|Add0~59\ $ (GND))) # (!\U_CLK_GEN|DIV1|count\(30) & (!\U_CLK_GEN|DIV1|Add0~59\ & VCC))
-- \U_CLK_GEN|DIV1|Add0~61\ = CARRY((\U_CLK_GEN|DIV1|count\(30) & !\U_CLK_GEN|DIV1|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|count\(30),
	datad => VCC,
	cin => \U_CLK_GEN|DIV1|Add0~59\,
	combout => \U_CLK_GEN|DIV1|Add0~60_combout\,
	cout => \U_CLK_GEN|DIV1|Add0~61\);

-- Location: FF_X46_Y52_N29
\U_CLK_GEN|DIV1|count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~60_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(30));

-- Location: LCCOMB_X46_Y52_N30
\U_CLK_GEN|DIV1|Add0~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Add0~62_combout\ = \U_CLK_GEN|DIV1|count\(31) $ (\U_CLK_GEN|DIV1|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(31),
	cin => \U_CLK_GEN|DIV1|Add0~61\,
	combout => \U_CLK_GEN|DIV1|Add0~62_combout\);

-- Location: FF_X46_Y52_N31
\U_CLK_GEN|DIV1|count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|Add0~62_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(31));

-- Location: LCCOMB_X47_Y52_N0
\U_CLK_GEN|DIV1|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Equal0~0_combout\ = (!\U_CLK_GEN|DIV1|count\(29) & (!\U_CLK_GEN|DIV1|count\(31) & (!\U_CLK_GEN|DIV1|count\(28) & !\U_CLK_GEN|DIV1|count\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(29),
	datab => \U_CLK_GEN|DIV1|count\(31),
	datac => \U_CLK_GEN|DIV1|count\(28),
	datad => \U_CLK_GEN|DIV1|count\(30),
	combout => \U_CLK_GEN|DIV1|Equal0~0_combout\);

-- Location: LCCOMB_X45_Y52_N18
\U_CLK_GEN|DIV1|Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Equal0~3_combout\ = (!\U_CLK_GEN|DIV1|count\(19) & (!\U_CLK_GEN|DIV1|count\(16) & (!\U_CLK_GEN|DIV1|count\(18) & !\U_CLK_GEN|DIV1|count\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(19),
	datab => \U_CLK_GEN|DIV1|count\(16),
	datac => \U_CLK_GEN|DIV1|count\(18),
	datad => \U_CLK_GEN|DIV1|count\(17),
	combout => \U_CLK_GEN|DIV1|Equal0~3_combout\);

-- Location: LCCOMB_X45_Y52_N8
\U_CLK_GEN|DIV1|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Equal0~2_combout\ = (!\U_CLK_GEN|DIV1|count\(21) & (!\U_CLK_GEN|DIV1|count\(20) & (!\U_CLK_GEN|DIV1|count\(23) & !\U_CLK_GEN|DIV1|count\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(21),
	datab => \U_CLK_GEN|DIV1|count\(20),
	datac => \U_CLK_GEN|DIV1|count\(23),
	datad => \U_CLK_GEN|DIV1|count\(22),
	combout => \U_CLK_GEN|DIV1|Equal0~2_combout\);

-- Location: LCCOMB_X45_Y53_N18
\U_CLK_GEN|DIV1|Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Equal0~4_combout\ = (\U_CLK_GEN|DIV1|Equal0~1_combout\ & (\U_CLK_GEN|DIV1|Equal0~0_combout\ & (\U_CLK_GEN|DIV1|Equal0~3_combout\ & \U_CLK_GEN|DIV1|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|Equal0~1_combout\,
	datab => \U_CLK_GEN|DIV1|Equal0~0_combout\,
	datac => \U_CLK_GEN|DIV1|Equal0~3_combout\,
	datad => \U_CLK_GEN|DIV1|Equal0~2_combout\,
	combout => \U_CLK_GEN|DIV1|Equal0~4_combout\);

-- Location: LCCOMB_X45_Y53_N12
\U_CLK_GEN|DIV1|count~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|count~1_combout\ = (\U_CLK_GEN|DIV1|Add0~26_combout\ & ((!\U_CLK_GEN|DIV1|Equal0~4_combout\) # (!\U_CLK_GEN|DIV1|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|Equal0~9_combout\,
	datab => \U_CLK_GEN|DIV1|Equal0~4_combout\,
	datad => \U_CLK_GEN|DIV1|Add0~26_combout\,
	combout => \U_CLK_GEN|DIV1|count~1_combout\);

-- Location: FF_X45_Y53_N13
\U_CLK_GEN|DIV1|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|count~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|count\(13));

-- Location: LCCOMB_X45_Y53_N22
\U_CLK_GEN|DIV1|Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Equal0~5_combout\ = (\U_CLK_GEN|DIV1|count\(13) & (\U_CLK_GEN|DIV1|count\(14) & (!\U_CLK_GEN|DIV1|count\(15) & !\U_CLK_GEN|DIV1|count\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(13),
	datab => \U_CLK_GEN|DIV1|count\(14),
	datac => \U_CLK_GEN|DIV1|count\(15),
	datad => \U_CLK_GEN|DIV1|count\(12),
	combout => \U_CLK_GEN|DIV1|Equal0~5_combout\);

-- Location: LCCOMB_X45_Y53_N20
\U_CLK_GEN|DIV1|Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Equal0~6_combout\ = (!\U_CLK_GEN|DIV1|count\(10) & (!\U_CLK_GEN|DIV1|count\(9) & (\U_CLK_GEN|DIV1|count\(8) & !\U_CLK_GEN|DIV1|count\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(10),
	datab => \U_CLK_GEN|DIV1|count\(9),
	datac => \U_CLK_GEN|DIV1|count\(8),
	datad => \U_CLK_GEN|DIV1|count\(11),
	combout => \U_CLK_GEN|DIV1|Equal0~6_combout\);

-- Location: LCCOMB_X45_Y53_N30
\U_CLK_GEN|DIV1|Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Equal0~7_combout\ = (!\U_CLK_GEN|DIV1|count\(4) & (\U_CLK_GEN|DIV1|count\(7) & (!\U_CLK_GEN|DIV1|count\(6) & \U_CLK_GEN|DIV1|count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(4),
	datab => \U_CLK_GEN|DIV1|count\(7),
	datac => \U_CLK_GEN|DIV1|count\(6),
	datad => \U_CLK_GEN|DIV1|count\(5),
	combout => \U_CLK_GEN|DIV1|Equal0~7_combout\);

-- Location: LCCOMB_X45_Y53_N24
\U_CLK_GEN|DIV1|Equal0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Equal0~8_combout\ = (!\U_CLK_GEN|DIV1|count\(2) & (\U_CLK_GEN|DIV1|count\(3) & (!\U_CLK_GEN|DIV1|count\(0) & !\U_CLK_GEN|DIV1|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|count\(2),
	datab => \U_CLK_GEN|DIV1|count\(3),
	datac => \U_CLK_GEN|DIV1|count\(0),
	datad => \U_CLK_GEN|DIV1|count\(1),
	combout => \U_CLK_GEN|DIV1|Equal0~8_combout\);

-- Location: LCCOMB_X45_Y53_N26
\U_CLK_GEN|DIV1|Equal0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|Equal0~9_combout\ = (\U_CLK_GEN|DIV1|Equal0~5_combout\ & (\U_CLK_GEN|DIV1|Equal0~6_combout\ & (\U_CLK_GEN|DIV1|Equal0~7_combout\ & \U_CLK_GEN|DIV1|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|Equal0~5_combout\,
	datab => \U_CLK_GEN|DIV1|Equal0~6_combout\,
	datac => \U_CLK_GEN|DIV1|Equal0~7_combout\,
	datad => \U_CLK_GEN|DIV1|Equal0~8_combout\,
	combout => \U_CLK_GEN|DIV1|Equal0~9_combout\);

-- Location: LCCOMB_X45_Y53_N10
\U_CLK_GEN|DIV1|temp~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|temp~0_combout\ = \U_CLK_GEN|DIV1|temp~q\ $ (((\U_CLK_GEN|DIV1|Equal0~9_combout\ & \U_CLK_GEN|DIV1|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|DIV1|Equal0~9_combout\,
	datac => \U_CLK_GEN|DIV1|temp~q\,
	datad => \U_CLK_GEN|DIV1|Equal0~4_combout\,
	combout => \U_CLK_GEN|DIV1|temp~0_combout\);

-- Location: LCCOMB_X45_Y53_N28
\U_CLK_GEN|DIV1|temp~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|DIV1|temp~feeder_combout\ = \U_CLK_GEN|DIV1|temp~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|DIV1|temp~0_combout\,
	combout => \U_CLK_GEN|DIV1|temp~feeder_combout\);

-- Location: FF_X45_Y53_N29
\U_CLK_GEN|DIV1|temp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50MHz~inputclkctrl_outclk\,
	d => \U_CLK_GEN|DIV1|temp~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|DIV1|temp~q\);

-- Location: CLKCTRL_G11
\U_CLK_GEN|DIV1|temp~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \U_CLK_GEN|DIV1|temp~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\);

-- Location: LCCOMB_X46_Y50_N0
\U_CLK_GEN|COUNT1|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~0_combout\ = \U_CLK_GEN|COUNT1|count\(0) $ (VCC)
-- \U_CLK_GEN|COUNT1|Add0~1\ = CARRY(\U_CLK_GEN|COUNT1|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(0),
	datad => VCC,
	combout => \U_CLK_GEN|COUNT1|Add0~0_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~1\);

-- Location: LCCOMB_X47_Y50_N0
\U_CLK_GEN|COUNT1|count~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|count~6_combout\ = (\U_CLK_GEN|COUNT1|Add0~0_combout\) # (\U_CLK_GEN|COUNT1|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_CLK_GEN|COUNT1|Add0~0_combout\,
	datad => \U_CLK_GEN|COUNT1|Equal0~10_combout\,
	combout => \U_CLK_GEN|COUNT1|count~6_combout\);

-- Location: IOIBUF_X49_Y54_N29
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

-- Location: FF_X46_Y50_N3
\U_CLK_GEN|COUNT1|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	asdata => \U_CLK_GEN|COUNT1|count~6_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(0));

-- Location: LCCOMB_X46_Y50_N2
\U_CLK_GEN|COUNT1|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~2_combout\ = (\U_CLK_GEN|COUNT1|count\(1) & (!\U_CLK_GEN|COUNT1|Add0~1\)) # (!\U_CLK_GEN|COUNT1|count\(1) & ((\U_CLK_GEN|COUNT1|Add0~1\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~3\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~1\) # (!\U_CLK_GEN|COUNT1|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(1),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~1\,
	combout => \U_CLK_GEN|COUNT1|Add0~2_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~3\);

-- Location: LCCOMB_X47_Y50_N20
\U_CLK_GEN|COUNT1|count~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|count~7_combout\ = (\U_CLK_GEN|COUNT1|Add0~2_combout\ & !\U_CLK_GEN|COUNT1|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|Add0~2_combout\,
	datad => \U_CLK_GEN|COUNT1|Equal0~10_combout\,
	combout => \U_CLK_GEN|COUNT1|count~7_combout\);

-- Location: FF_X46_Y50_N13
\U_CLK_GEN|COUNT1|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	asdata => \U_CLK_GEN|COUNT1|count~7_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(1));

-- Location: LCCOMB_X46_Y50_N4
\U_CLK_GEN|COUNT1|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~4_combout\ = (\U_CLK_GEN|COUNT1|count\(2) & (\U_CLK_GEN|COUNT1|Add0~3\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(2) & (!\U_CLK_GEN|COUNT1|Add0~3\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~5\ = CARRY((\U_CLK_GEN|COUNT1|count\(2) & !\U_CLK_GEN|COUNT1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(2),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~3\,
	combout => \U_CLK_GEN|COUNT1|Add0~4_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~5\);

-- Location: FF_X46_Y50_N5
\U_CLK_GEN|COUNT1|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~4_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(2));

-- Location: LCCOMB_X46_Y50_N6
\U_CLK_GEN|COUNT1|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~6_combout\ = (\U_CLK_GEN|COUNT1|count\(3) & (!\U_CLK_GEN|COUNT1|Add0~5\)) # (!\U_CLK_GEN|COUNT1|count\(3) & ((\U_CLK_GEN|COUNT1|Add0~5\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~7\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~5\) # (!\U_CLK_GEN|COUNT1|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(3),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~5\,
	combout => \U_CLK_GEN|COUNT1|Add0~6_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~7\);

-- Location: LCCOMB_X47_Y50_N4
\U_CLK_GEN|COUNT1|count~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|count~5_combout\ = (\U_CLK_GEN|COUNT1|Add0~6_combout\ & !\U_CLK_GEN|COUNT1|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_CLK_GEN|COUNT1|Add0~6_combout\,
	datad => \U_CLK_GEN|COUNT1|Equal0~10_combout\,
	combout => \U_CLK_GEN|COUNT1|count~5_combout\);

-- Location: FF_X47_Y50_N5
\U_CLK_GEN|COUNT1|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|count~5_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(3));

-- Location: LCCOMB_X46_Y50_N8
\U_CLK_GEN|COUNT1|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~8_combout\ = (\U_CLK_GEN|COUNT1|count\(4) & (\U_CLK_GEN|COUNT1|Add0~7\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(4) & (!\U_CLK_GEN|COUNT1|Add0~7\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~9\ = CARRY((\U_CLK_GEN|COUNT1|count\(4) & !\U_CLK_GEN|COUNT1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(4),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~7\,
	combout => \U_CLK_GEN|COUNT1|Add0~8_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~9\);

-- Location: FF_X46_Y50_N9
\U_CLK_GEN|COUNT1|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~8_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(4));

-- Location: LCCOMB_X46_Y50_N10
\U_CLK_GEN|COUNT1|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~10_combout\ = (\U_CLK_GEN|COUNT1|count\(5) & (!\U_CLK_GEN|COUNT1|Add0~9\)) # (!\U_CLK_GEN|COUNT1|count\(5) & ((\U_CLK_GEN|COUNT1|Add0~9\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~11\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~9\) # (!\U_CLK_GEN|COUNT1|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(5),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~9\,
	combout => \U_CLK_GEN|COUNT1|Add0~10_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~11\);

-- Location: LCCOMB_X47_Y50_N6
\U_CLK_GEN|COUNT1|count~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|count~4_combout\ = (\U_CLK_GEN|COUNT1|Add0~10_combout\ & !\U_CLK_GEN|COUNT1|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_CLK_GEN|COUNT1|Add0~10_combout\,
	datad => \U_CLK_GEN|COUNT1|Equal0~10_combout\,
	combout => \U_CLK_GEN|COUNT1|count~4_combout\);

-- Location: FF_X47_Y50_N7
\U_CLK_GEN|COUNT1|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|count~4_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(5));

-- Location: LCCOMB_X46_Y50_N12
\U_CLK_GEN|COUNT1|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~12_combout\ = (\U_CLK_GEN|COUNT1|count\(6) & (\U_CLK_GEN|COUNT1|Add0~11\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(6) & (!\U_CLK_GEN|COUNT1|Add0~11\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~13\ = CARRY((\U_CLK_GEN|COUNT1|count\(6) & !\U_CLK_GEN|COUNT1|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(6),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~11\,
	combout => \U_CLK_GEN|COUNT1|Add0~12_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~13\);

-- Location: LCCOMB_X47_Y50_N24
\U_CLK_GEN|COUNT1|count~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|count~3_combout\ = (!\U_CLK_GEN|COUNT1|Equal0~10_combout\ & \U_CLK_GEN|COUNT1|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_CLK_GEN|COUNT1|Equal0~10_combout\,
	datad => \U_CLK_GEN|COUNT1|Add0~12_combout\,
	combout => \U_CLK_GEN|COUNT1|count~3_combout\);

-- Location: FF_X47_Y50_N25
\U_CLK_GEN|COUNT1|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|count~3_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(6));

-- Location: LCCOMB_X46_Y50_N14
\U_CLK_GEN|COUNT1|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~14_combout\ = (\U_CLK_GEN|COUNT1|count\(7) & (!\U_CLK_GEN|COUNT1|Add0~13\)) # (!\U_CLK_GEN|COUNT1|count\(7) & ((\U_CLK_GEN|COUNT1|Add0~13\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~15\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~13\) # (!\U_CLK_GEN|COUNT1|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(7),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~13\,
	combout => \U_CLK_GEN|COUNT1|Add0~14_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~15\);

-- Location: LCCOMB_X47_Y50_N30
\U_CLK_GEN|COUNT1|count~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|count~2_combout\ = (!\U_CLK_GEN|COUNT1|Equal0~10_combout\ & \U_CLK_GEN|COUNT1|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_CLK_GEN|COUNT1|Equal0~10_combout\,
	datad => \U_CLK_GEN|COUNT1|Add0~14_combout\,
	combout => \U_CLK_GEN|COUNT1|count~2_combout\);

-- Location: FF_X47_Y50_N31
\U_CLK_GEN|COUNT1|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|count~2_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(7));

-- Location: LCCOMB_X47_Y50_N12
\U_CLK_GEN|COUNT1|Equal0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~8_combout\ = (!\U_CLK_GEN|COUNT1|count\(4) & (\U_CLK_GEN|COUNT1|count\(6) & (\U_CLK_GEN|COUNT1|count\(7) & \U_CLK_GEN|COUNT1|count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(4),
	datab => \U_CLK_GEN|COUNT1|count\(6),
	datac => \U_CLK_GEN|COUNT1|count\(7),
	datad => \U_CLK_GEN|COUNT1|count\(5),
	combout => \U_CLK_GEN|COUNT1|Equal0~8_combout\);

-- Location: LCCOMB_X47_Y50_N18
\U_CLK_GEN|COUNT1|Equal0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~9_combout\ = (\U_CLK_GEN|COUNT1|count\(0) & (!\U_CLK_GEN|COUNT1|count\(2) & (\U_CLK_GEN|COUNT1|count\(3) & !\U_CLK_GEN|COUNT1|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(0),
	datab => \U_CLK_GEN|COUNT1|count\(2),
	datac => \U_CLK_GEN|COUNT1|count\(3),
	datad => \U_CLK_GEN|COUNT1|count\(1),
	combout => \U_CLK_GEN|COUNT1|Equal0~9_combout\);

-- Location: LCCOMB_X46_Y50_N16
\U_CLK_GEN|COUNT1|Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~16_combout\ = (\U_CLK_GEN|COUNT1|count\(8) & (\U_CLK_GEN|COUNT1|Add0~15\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(8) & (!\U_CLK_GEN|COUNT1|Add0~15\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~17\ = CARRY((\U_CLK_GEN|COUNT1|count\(8) & !\U_CLK_GEN|COUNT1|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(8),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~15\,
	combout => \U_CLK_GEN|COUNT1|Add0~16_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~17\);

-- Location: LCCOMB_X47_Y50_N2
\U_CLK_GEN|COUNT1|count~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|count~1_combout\ = (\U_CLK_GEN|COUNT1|Add0~16_combout\ & !\U_CLK_GEN|COUNT1|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_CLK_GEN|COUNT1|Add0~16_combout\,
	datad => \U_CLK_GEN|COUNT1|Equal0~10_combout\,
	combout => \U_CLK_GEN|COUNT1|count~1_combout\);

-- Location: FF_X47_Y50_N3
\U_CLK_GEN|COUNT1|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|count~1_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(8));

-- Location: LCCOMB_X46_Y50_N18
\U_CLK_GEN|COUNT1|Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~18_combout\ = (\U_CLK_GEN|COUNT1|count\(9) & (!\U_CLK_GEN|COUNT1|Add0~17\)) # (!\U_CLK_GEN|COUNT1|count\(9) & ((\U_CLK_GEN|COUNT1|Add0~17\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~19\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~17\) # (!\U_CLK_GEN|COUNT1|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(9),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~17\,
	combout => \U_CLK_GEN|COUNT1|Add0~18_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~19\);

-- Location: LCCOMB_X47_Y50_N28
\U_CLK_GEN|COUNT1|count~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|count~0_combout\ = (!\U_CLK_GEN|COUNT1|Equal0~10_combout\ & \U_CLK_GEN|COUNT1|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|Equal0~10_combout\,
	datac => \U_CLK_GEN|COUNT1|Add0~18_combout\,
	combout => \U_CLK_GEN|COUNT1|count~0_combout\);

-- Location: FF_X47_Y50_N29
\U_CLK_GEN|COUNT1|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|count~0_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(9));

-- Location: LCCOMB_X46_Y50_N20
\U_CLK_GEN|COUNT1|Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~20_combout\ = (\U_CLK_GEN|COUNT1|count\(10) & (\U_CLK_GEN|COUNT1|Add0~19\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(10) & (!\U_CLK_GEN|COUNT1|Add0~19\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~21\ = CARRY((\U_CLK_GEN|COUNT1|count\(10) & !\U_CLK_GEN|COUNT1|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(10),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~19\,
	combout => \U_CLK_GEN|COUNT1|Add0~20_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~21\);

-- Location: FF_X46_Y50_N21
\U_CLK_GEN|COUNT1|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~20_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(10));

-- Location: LCCOMB_X46_Y50_N22
\U_CLK_GEN|COUNT1|Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~22_combout\ = (\U_CLK_GEN|COUNT1|count\(11) & (!\U_CLK_GEN|COUNT1|Add0~21\)) # (!\U_CLK_GEN|COUNT1|count\(11) & ((\U_CLK_GEN|COUNT1|Add0~21\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~23\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~21\) # (!\U_CLK_GEN|COUNT1|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(11),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~21\,
	combout => \U_CLK_GEN|COUNT1|Add0~22_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~23\);

-- Location: FF_X46_Y50_N23
\U_CLK_GEN|COUNT1|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~22_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(11));

-- Location: LCCOMB_X46_Y50_N24
\U_CLK_GEN|COUNT1|Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~24_combout\ = (\U_CLK_GEN|COUNT1|count\(12) & (\U_CLK_GEN|COUNT1|Add0~23\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(12) & (!\U_CLK_GEN|COUNT1|Add0~23\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~25\ = CARRY((\U_CLK_GEN|COUNT1|count\(12) & !\U_CLK_GEN|COUNT1|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(12),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~23\,
	combout => \U_CLK_GEN|COUNT1|Add0~24_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~25\);

-- Location: FF_X46_Y50_N25
\U_CLK_GEN|COUNT1|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~24_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(12));

-- Location: LCCOMB_X46_Y50_N26
\U_CLK_GEN|COUNT1|Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~26_combout\ = (\U_CLK_GEN|COUNT1|count\(13) & (!\U_CLK_GEN|COUNT1|Add0~25\)) # (!\U_CLK_GEN|COUNT1|count\(13) & ((\U_CLK_GEN|COUNT1|Add0~25\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~27\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~25\) # (!\U_CLK_GEN|COUNT1|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(13),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~25\,
	combout => \U_CLK_GEN|COUNT1|Add0~26_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~27\);

-- Location: FF_X46_Y50_N27
\U_CLK_GEN|COUNT1|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~26_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(13));

-- Location: LCCOMB_X46_Y50_N28
\U_CLK_GEN|COUNT1|Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~28_combout\ = (\U_CLK_GEN|COUNT1|count\(14) & (\U_CLK_GEN|COUNT1|Add0~27\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(14) & (!\U_CLK_GEN|COUNT1|Add0~27\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~29\ = CARRY((\U_CLK_GEN|COUNT1|count\(14) & !\U_CLK_GEN|COUNT1|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(14),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~27\,
	combout => \U_CLK_GEN|COUNT1|Add0~28_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~29\);

-- Location: FF_X46_Y50_N29
\U_CLK_GEN|COUNT1|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~28_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(14));

-- Location: LCCOMB_X46_Y50_N30
\U_CLK_GEN|COUNT1|Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~30_combout\ = (\U_CLK_GEN|COUNT1|count\(15) & (!\U_CLK_GEN|COUNT1|Add0~29\)) # (!\U_CLK_GEN|COUNT1|count\(15) & ((\U_CLK_GEN|COUNT1|Add0~29\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~31\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~29\) # (!\U_CLK_GEN|COUNT1|count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(15),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~29\,
	combout => \U_CLK_GEN|COUNT1|Add0~30_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~31\);

-- Location: FF_X46_Y50_N31
\U_CLK_GEN|COUNT1|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~30_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(15));

-- Location: LCCOMB_X46_Y49_N0
\U_CLK_GEN|COUNT1|Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~32_combout\ = (\U_CLK_GEN|COUNT1|count\(16) & (\U_CLK_GEN|COUNT1|Add0~31\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(16) & (!\U_CLK_GEN|COUNT1|Add0~31\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~33\ = CARRY((\U_CLK_GEN|COUNT1|count\(16) & !\U_CLK_GEN|COUNT1|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(16),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~31\,
	combout => \U_CLK_GEN|COUNT1|Add0~32_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~33\);

-- Location: FF_X46_Y49_N1
\U_CLK_GEN|COUNT1|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~32_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(16));

-- Location: LCCOMB_X46_Y49_N2
\U_CLK_GEN|COUNT1|Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~34_combout\ = (\U_CLK_GEN|COUNT1|count\(17) & (!\U_CLK_GEN|COUNT1|Add0~33\)) # (!\U_CLK_GEN|COUNT1|count\(17) & ((\U_CLK_GEN|COUNT1|Add0~33\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~35\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~33\) # (!\U_CLK_GEN|COUNT1|count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(17),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~33\,
	combout => \U_CLK_GEN|COUNT1|Add0~34_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~35\);

-- Location: FF_X46_Y49_N3
\U_CLK_GEN|COUNT1|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~34_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(17));

-- Location: LCCOMB_X46_Y49_N4
\U_CLK_GEN|COUNT1|Add0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~36_combout\ = (\U_CLK_GEN|COUNT1|count\(18) & (\U_CLK_GEN|COUNT1|Add0~35\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(18) & (!\U_CLK_GEN|COUNT1|Add0~35\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~37\ = CARRY((\U_CLK_GEN|COUNT1|count\(18) & !\U_CLK_GEN|COUNT1|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(18),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~35\,
	combout => \U_CLK_GEN|COUNT1|Add0~36_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~37\);

-- Location: FF_X46_Y49_N5
\U_CLK_GEN|COUNT1|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~36_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(18));

-- Location: LCCOMB_X46_Y49_N6
\U_CLK_GEN|COUNT1|Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~38_combout\ = (\U_CLK_GEN|COUNT1|count\(19) & (!\U_CLK_GEN|COUNT1|Add0~37\)) # (!\U_CLK_GEN|COUNT1|count\(19) & ((\U_CLK_GEN|COUNT1|Add0~37\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~39\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~37\) # (!\U_CLK_GEN|COUNT1|count\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(19),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~37\,
	combout => \U_CLK_GEN|COUNT1|Add0~38_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~39\);

-- Location: FF_X46_Y49_N7
\U_CLK_GEN|COUNT1|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~38_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(19));

-- Location: LCCOMB_X46_Y49_N8
\U_CLK_GEN|COUNT1|Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~40_combout\ = (\U_CLK_GEN|COUNT1|count\(20) & (\U_CLK_GEN|COUNT1|Add0~39\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(20) & (!\U_CLK_GEN|COUNT1|Add0~39\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~41\ = CARRY((\U_CLK_GEN|COUNT1|count\(20) & !\U_CLK_GEN|COUNT1|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(20),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~39\,
	combout => \U_CLK_GEN|COUNT1|Add0~40_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~41\);

-- Location: FF_X46_Y49_N9
\U_CLK_GEN|COUNT1|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~40_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(20));

-- Location: LCCOMB_X46_Y49_N10
\U_CLK_GEN|COUNT1|Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~42_combout\ = (\U_CLK_GEN|COUNT1|count\(21) & (!\U_CLK_GEN|COUNT1|Add0~41\)) # (!\U_CLK_GEN|COUNT1|count\(21) & ((\U_CLK_GEN|COUNT1|Add0~41\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~43\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~41\) # (!\U_CLK_GEN|COUNT1|count\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(21),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~41\,
	combout => \U_CLK_GEN|COUNT1|Add0~42_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~43\);

-- Location: FF_X46_Y49_N11
\U_CLK_GEN|COUNT1|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~42_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(21));

-- Location: LCCOMB_X46_Y49_N12
\U_CLK_GEN|COUNT1|Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~44_combout\ = (\U_CLK_GEN|COUNT1|count\(22) & (\U_CLK_GEN|COUNT1|Add0~43\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(22) & (!\U_CLK_GEN|COUNT1|Add0~43\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~45\ = CARRY((\U_CLK_GEN|COUNT1|count\(22) & !\U_CLK_GEN|COUNT1|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(22),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~43\,
	combout => \U_CLK_GEN|COUNT1|Add0~44_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~45\);

-- Location: FF_X46_Y49_N13
\U_CLK_GEN|COUNT1|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~44_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(22));

-- Location: LCCOMB_X46_Y49_N14
\U_CLK_GEN|COUNT1|Add0~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~46_combout\ = (\U_CLK_GEN|COUNT1|count\(23) & (!\U_CLK_GEN|COUNT1|Add0~45\)) # (!\U_CLK_GEN|COUNT1|count\(23) & ((\U_CLK_GEN|COUNT1|Add0~45\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~47\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~45\) # (!\U_CLK_GEN|COUNT1|count\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(23),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~45\,
	combout => \U_CLK_GEN|COUNT1|Add0~46_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~47\);

-- Location: FF_X46_Y49_N15
\U_CLK_GEN|COUNT1|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~46_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(23));

-- Location: LCCOMB_X46_Y49_N16
\U_CLK_GEN|COUNT1|Add0~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~48_combout\ = (\U_CLK_GEN|COUNT1|count\(24) & (\U_CLK_GEN|COUNT1|Add0~47\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(24) & (!\U_CLK_GEN|COUNT1|Add0~47\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~49\ = CARRY((\U_CLK_GEN|COUNT1|count\(24) & !\U_CLK_GEN|COUNT1|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(24),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~47\,
	combout => \U_CLK_GEN|COUNT1|Add0~48_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~49\);

-- Location: FF_X46_Y49_N17
\U_CLK_GEN|COUNT1|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~48_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(24));

-- Location: LCCOMB_X46_Y49_N18
\U_CLK_GEN|COUNT1|Add0~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~50_combout\ = (\U_CLK_GEN|COUNT1|count\(25) & (!\U_CLK_GEN|COUNT1|Add0~49\)) # (!\U_CLK_GEN|COUNT1|count\(25) & ((\U_CLK_GEN|COUNT1|Add0~49\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~51\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~49\) # (!\U_CLK_GEN|COUNT1|count\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(25),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~49\,
	combout => \U_CLK_GEN|COUNT1|Add0~50_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~51\);

-- Location: FF_X46_Y49_N19
\U_CLK_GEN|COUNT1|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~50_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(25));

-- Location: LCCOMB_X46_Y49_N20
\U_CLK_GEN|COUNT1|Add0~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~52_combout\ = (\U_CLK_GEN|COUNT1|count\(26) & (\U_CLK_GEN|COUNT1|Add0~51\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(26) & (!\U_CLK_GEN|COUNT1|Add0~51\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~53\ = CARRY((\U_CLK_GEN|COUNT1|count\(26) & !\U_CLK_GEN|COUNT1|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(26),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~51\,
	combout => \U_CLK_GEN|COUNT1|Add0~52_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~53\);

-- Location: FF_X46_Y49_N21
\U_CLK_GEN|COUNT1|count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~52_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(26));

-- Location: LCCOMB_X46_Y49_N22
\U_CLK_GEN|COUNT1|Add0~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~54_combout\ = (\U_CLK_GEN|COUNT1|count\(27) & (!\U_CLK_GEN|COUNT1|Add0~53\)) # (!\U_CLK_GEN|COUNT1|count\(27) & ((\U_CLK_GEN|COUNT1|Add0~53\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~55\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~53\) # (!\U_CLK_GEN|COUNT1|count\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(27),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~53\,
	combout => \U_CLK_GEN|COUNT1|Add0~54_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~55\);

-- Location: FF_X46_Y49_N23
\U_CLK_GEN|COUNT1|count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~54_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(27));

-- Location: LCCOMB_X46_Y49_N24
\U_CLK_GEN|COUNT1|Add0~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~56_combout\ = (\U_CLK_GEN|COUNT1|count\(28) & (\U_CLK_GEN|COUNT1|Add0~55\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(28) & (!\U_CLK_GEN|COUNT1|Add0~55\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~57\ = CARRY((\U_CLK_GEN|COUNT1|count\(28) & !\U_CLK_GEN|COUNT1|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(28),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~55\,
	combout => \U_CLK_GEN|COUNT1|Add0~56_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~57\);

-- Location: FF_X46_Y49_N25
\U_CLK_GEN|COUNT1|count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~56_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(28));

-- Location: LCCOMB_X46_Y49_N26
\U_CLK_GEN|COUNT1|Add0~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~58_combout\ = (\U_CLK_GEN|COUNT1|count\(29) & (!\U_CLK_GEN|COUNT1|Add0~57\)) # (!\U_CLK_GEN|COUNT1|count\(29) & ((\U_CLK_GEN|COUNT1|Add0~57\) # (GND)))
-- \U_CLK_GEN|COUNT1|Add0~59\ = CARRY((!\U_CLK_GEN|COUNT1|Add0~57\) # (!\U_CLK_GEN|COUNT1|count\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(29),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~57\,
	combout => \U_CLK_GEN|COUNT1|Add0~58_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~59\);

-- Location: FF_X46_Y49_N27
\U_CLK_GEN|COUNT1|count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~58_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(29));

-- Location: LCCOMB_X46_Y49_N28
\U_CLK_GEN|COUNT1|Add0~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~60_combout\ = (\U_CLK_GEN|COUNT1|count\(30) & (\U_CLK_GEN|COUNT1|Add0~59\ $ (GND))) # (!\U_CLK_GEN|COUNT1|count\(30) & (!\U_CLK_GEN|COUNT1|Add0~59\ & VCC))
-- \U_CLK_GEN|COUNT1|Add0~61\ = CARRY((\U_CLK_GEN|COUNT1|count\(30) & !\U_CLK_GEN|COUNT1|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_CLK_GEN|COUNT1|count\(30),
	datad => VCC,
	cin => \U_CLK_GEN|COUNT1|Add0~59\,
	combout => \U_CLK_GEN|COUNT1|Add0~60_combout\,
	cout => \U_CLK_GEN|COUNT1|Add0~61\);

-- Location: FF_X46_Y49_N29
\U_CLK_GEN|COUNT1|count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~60_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(30));

-- Location: LCCOMB_X46_Y49_N30
\U_CLK_GEN|COUNT1|Add0~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Add0~62_combout\ = \U_CLK_GEN|COUNT1|count\(31) $ (\U_CLK_GEN|COUNT1|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(31),
	cin => \U_CLK_GEN|COUNT1|Add0~61\,
	combout => \U_CLK_GEN|COUNT1|Add0~62_combout\);

-- Location: FF_X46_Y49_N31
\U_CLK_GEN|COUNT1|count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Add0~62_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|count\(31));

-- Location: LCCOMB_X47_Y50_N22
\U_CLK_GEN|COUNT1|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~0_combout\ = (!\U_CLK_GEN|COUNT1|count\(29) & (!\U_CLK_GEN|COUNT1|count\(28) & (!\U_CLK_GEN|COUNT1|count\(31) & !\U_CLK_GEN|COUNT1|count\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(29),
	datab => \U_CLK_GEN|COUNT1|count\(28),
	datac => \U_CLK_GEN|COUNT1|count\(31),
	datad => \U_CLK_GEN|COUNT1|count\(30),
	combout => \U_CLK_GEN|COUNT1|Equal0~0_combout\);

-- Location: LCCOMB_X47_Y49_N0
\U_CLK_GEN|COUNT1|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~1_combout\ = (!\U_CLK_GEN|COUNT1|count\(24) & (!\U_CLK_GEN|COUNT1|count\(25) & (!\U_CLK_GEN|COUNT1|count\(27) & !\U_CLK_GEN|COUNT1|count\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(24),
	datab => \U_CLK_GEN|COUNT1|count\(25),
	datac => \U_CLK_GEN|COUNT1|count\(27),
	datad => \U_CLK_GEN|COUNT1|count\(26),
	combout => \U_CLK_GEN|COUNT1|Equal0~1_combout\);

-- Location: LCCOMB_X47_Y50_N8
\U_CLK_GEN|COUNT1|Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~3_combout\ = (!\U_CLK_GEN|COUNT1|count\(17) & (!\U_CLK_GEN|COUNT1|count\(19) & (!\U_CLK_GEN|COUNT1|count\(18) & !\U_CLK_GEN|COUNT1|count\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(17),
	datab => \U_CLK_GEN|COUNT1|count\(19),
	datac => \U_CLK_GEN|COUNT1|count\(18),
	datad => \U_CLK_GEN|COUNT1|count\(16),
	combout => \U_CLK_GEN|COUNT1|Equal0~3_combout\);

-- Location: LCCOMB_X47_Y49_N10
\U_CLK_GEN|COUNT1|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~2_combout\ = (!\U_CLK_GEN|COUNT1|count\(20) & (!\U_CLK_GEN|COUNT1|count\(21) & (!\U_CLK_GEN|COUNT1|count\(23) & !\U_CLK_GEN|COUNT1|count\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(20),
	datab => \U_CLK_GEN|COUNT1|count\(21),
	datac => \U_CLK_GEN|COUNT1|count\(23),
	datad => \U_CLK_GEN|COUNT1|count\(22),
	combout => \U_CLK_GEN|COUNT1|Equal0~2_combout\);

-- Location: LCCOMB_X47_Y50_N14
\U_CLK_GEN|COUNT1|Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~4_combout\ = (\U_CLK_GEN|COUNT1|Equal0~0_combout\ & (\U_CLK_GEN|COUNT1|Equal0~1_combout\ & (\U_CLK_GEN|COUNT1|Equal0~3_combout\ & \U_CLK_GEN|COUNT1|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|Equal0~0_combout\,
	datab => \U_CLK_GEN|COUNT1|Equal0~1_combout\,
	datac => \U_CLK_GEN|COUNT1|Equal0~3_combout\,
	datad => \U_CLK_GEN|COUNT1|Equal0~2_combout\,
	combout => \U_CLK_GEN|COUNT1|Equal0~4_combout\);

-- Location: LCCOMB_X47_Y50_N26
\U_CLK_GEN|COUNT1|Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~6_combout\ = (\U_CLK_GEN|COUNT1|count\(9) & (\U_CLK_GEN|COUNT1|count\(8) & (!\U_CLK_GEN|COUNT1|count\(11) & !\U_CLK_GEN|COUNT1|count\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(9),
	datab => \U_CLK_GEN|COUNT1|count\(8),
	datac => \U_CLK_GEN|COUNT1|count\(11),
	datad => \U_CLK_GEN|COUNT1|count\(10),
	combout => \U_CLK_GEN|COUNT1|Equal0~6_combout\);

-- Location: LCCOMB_X45_Y50_N24
\U_CLK_GEN|COUNT1|Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~5_combout\ = (!\U_CLK_GEN|COUNT1|count\(15) & (!\U_CLK_GEN|COUNT1|count\(13) & (!\U_CLK_GEN|COUNT1|count\(12) & !\U_CLK_GEN|COUNT1|count\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|count\(15),
	datab => \U_CLK_GEN|COUNT1|count\(13),
	datac => \U_CLK_GEN|COUNT1|count\(12),
	datad => \U_CLK_GEN|COUNT1|count\(14),
	combout => \U_CLK_GEN|COUNT1|Equal0~5_combout\);

-- Location: LCCOMB_X47_Y50_N10
\U_CLK_GEN|COUNT1|Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~7_combout\ = (\U_CLK_GEN|COUNT1|Equal0~6_combout\ & \U_CLK_GEN|COUNT1|Equal0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_CLK_GEN|COUNT1|Equal0~6_combout\,
	datad => \U_CLK_GEN|COUNT1|Equal0~5_combout\,
	combout => \U_CLK_GEN|COUNT1|Equal0~7_combout\);

-- Location: LCCOMB_X47_Y50_N16
\U_CLK_GEN|COUNT1|Equal0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_CLK_GEN|COUNT1|Equal0~10_combout\ = (\U_CLK_GEN|COUNT1|Equal0~8_combout\ & (\U_CLK_GEN|COUNT1|Equal0~9_combout\ & (\U_CLK_GEN|COUNT1|Equal0~4_combout\ & \U_CLK_GEN|COUNT1|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_CLK_GEN|COUNT1|Equal0~8_combout\,
	datab => \U_CLK_GEN|COUNT1|Equal0~9_combout\,
	datac => \U_CLK_GEN|COUNT1|Equal0~4_combout\,
	datad => \U_CLK_GEN|COUNT1|Equal0~7_combout\,
	combout => \U_CLK_GEN|COUNT1|Equal0~10_combout\);

-- Location: FF_X47_Y50_N17
\U_CLK_GEN|COUNT1|timeReached\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|DIV1|temp~clkctrl_outclk\,
	d => \U_CLK_GEN|COUNT1|Equal0~10_combout\,
	clrn => \ALT_INV_button[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_CLK_GEN|COUNT1|timeReached~q\);

-- Location: CLKCTRL_G10
\U_CLK_GEN|COUNT1|timeReached~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\);

-- Location: LCCOMB_X50_Y52_N2
\U_QUIZ|state.S3~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|state.S3~feeder_combout\ = \U_QUIZ|state.S2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_QUIZ|state.S2~q\,
	combout => \U_QUIZ|state.S3~feeder_combout\);

-- Location: FF_X50_Y52_N3
\U_QUIZ|state.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_QUIZ|state.S3~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_QUIZ|state.S3~q\);

-- Location: LCCOMB_X50_Y52_N20
\U_QUIZ|state.S4~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|state.S4~feeder_combout\ = \U_QUIZ|state.S3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_QUIZ|state.S3~q\,
	combout => \U_QUIZ|state.S4~feeder_combout\);

-- Location: FF_X50_Y52_N21
\U_QUIZ|state.S4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_QUIZ|state.S4~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_QUIZ|state.S4~q\);

-- Location: FF_X50_Y52_N11
\U_QUIZ|state.S5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	asdata => \U_QUIZ|state.S4~q\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_QUIZ|state.S5~q\);

-- Location: LCCOMB_X50_Y52_N4
\U_QUIZ|state.S6~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|state.S6~feeder_combout\ = \U_QUIZ|state.S5~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_QUIZ|state.S5~q\,
	combout => \U_QUIZ|state.S6~feeder_combout\);

-- Location: FF_X50_Y52_N5
\U_QUIZ|state.S6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_QUIZ|state.S6~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_QUIZ|state.S6~q\);

-- Location: FF_X50_Y52_N9
\U_QUIZ|state.S7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	asdata => \U_QUIZ|state.S6~q\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_QUIZ|state.S7~q\);

-- Location: FF_X50_Y52_N23
\U_QUIZ|state.S8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	asdata => \U_QUIZ|state.S7~q\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_QUIZ|state.S8~q\);

-- Location: FF_X50_Y52_N25
\U_QUIZ|state.S9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	asdata => \U_QUIZ|state.S8~q\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_QUIZ|state.S9~q\);

-- Location: LCCOMB_X50_Y52_N18
\U_QUIZ|state.S0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|state.S0~0_combout\ = !\U_QUIZ|state.S9~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_QUIZ|state.S9~q\,
	combout => \U_QUIZ|state.S0~0_combout\);

-- Location: FF_X50_Y52_N19
\U_QUIZ|state.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_QUIZ|state.S0~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_QUIZ|state.S0~q\);

-- Location: LCCOMB_X50_Y52_N16
\U_QUIZ|state.S1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|state.S1~0_combout\ = !\U_QUIZ|state.S0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_QUIZ|state.S0~q\,
	combout => \U_QUIZ|state.S1~0_combout\);

-- Location: FF_X50_Y52_N17
\U_QUIZ|state.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_QUIZ|state.S1~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_QUIZ|state.S1~q\);

-- Location: LCCOMB_X50_Y52_N6
\U_QUIZ|state.S2~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|state.S2~feeder_combout\ = \U_QUIZ|state.S1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_QUIZ|state.S1~q\,
	combout => \U_QUIZ|state.S2~feeder_combout\);

-- Location: FF_X50_Y52_N7
\U_QUIZ|state.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_QUIZ|state.S2~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_QUIZ|state.S2~q\);

-- Location: LCCOMB_X50_Y52_N28
\U_QUIZ|WideOr1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|WideOr1~combout\ = (\U_QUIZ|state.S2~q\) # ((\U_QUIZ|state.S3~q\) # (!\U_QUIZ|state.S0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|state.S2~q\,
	datab => \U_QUIZ|state.S0~q\,
	datad => \U_QUIZ|state.S3~q\,
	combout => \U_QUIZ|WideOr1~combout\);

-- Location: LCCOMB_X50_Y52_N8
\U_QUIZ|WideOr2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|WideOr2~0_combout\ = (\U_QUIZ|state.S5~q\) # (((\U_QUIZ|state.S7~q\) # (\U_QUIZ|state.S3~q\)) # (!\U_QUIZ|state.S0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|state.S5~q\,
	datab => \U_QUIZ|state.S0~q\,
	datac => \U_QUIZ|state.S7~q\,
	datad => \U_QUIZ|state.S3~q\,
	combout => \U_QUIZ|WideOr2~0_combout\);

-- Location: LCCOMB_X50_Y52_N24
\U_QUIZ|WideOr2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|WideOr2~combout\ = (\U_QUIZ|state.S9~q\) # (\U_QUIZ|WideOr2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_QUIZ|state.S9~q\,
	datad => \U_QUIZ|WideOr2~0_combout\,
	combout => \U_QUIZ|WideOr2~combout\);

-- Location: LCCOMB_X50_Y52_N22
\U_QUIZ|WideOr0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|WideOr0~0_combout\ = (\U_QUIZ|state.S4~q\) # ((\U_QUIZ|state.S7~q\) # ((\U_QUIZ|state.S8~q\) # (!\U_QUIZ|state.S0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|state.S4~q\,
	datab => \U_QUIZ|state.S7~q\,
	datac => \U_QUIZ|state.S8~q\,
	datad => \U_QUIZ|state.S0~q\,
	combout => \U_QUIZ|WideOr0~0_combout\);

-- Location: LCCOMB_X50_Y52_N10
\U_QUIZ|WideOr3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_QUIZ|WideOr3~0_combout\ = (\U_QUIZ|state.S4~q\) # ((\U_QUIZ|state.S2~q\) # ((\U_QUIZ|state.S5~q\) # (\U_QUIZ|state.S1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|state.S4~q\,
	datab => \U_QUIZ|state.S2~q\,
	datac => \U_QUIZ|state.S5~q\,
	datad => \U_QUIZ|state.S1~q\,
	combout => \U_QUIZ|WideOr3~0_combout\);

-- Location: LCCOMB_X70_Y52_N12
\U_LED3|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED3|Mux6~0_combout\ = (\U_QUIZ|WideOr1~combout\ & (\U_QUIZ|WideOr2~combout\ & (\U_QUIZ|WideOr0~0_combout\ $ (!\U_QUIZ|WideOr3~0_combout\)))) # (!\U_QUIZ|WideOr1~combout\ & (\U_QUIZ|WideOr3~0_combout\ & (\U_QUIZ|WideOr2~combout\ $ 
-- (\U_QUIZ|WideOr0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|WideOr1~combout\,
	datab => \U_QUIZ|WideOr2~combout\,
	datac => \U_QUIZ|WideOr0~0_combout\,
	datad => \U_QUIZ|WideOr3~0_combout\,
	combout => \U_LED3|Mux6~0_combout\);

-- Location: LCCOMB_X70_Y52_N2
\U_LED3|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED3|Mux5~0_combout\ = (\U_QUIZ|WideOr1~combout\ & (\U_QUIZ|WideOr2~combout\ & (\U_QUIZ|WideOr0~0_combout\ $ (\U_QUIZ|WideOr3~0_combout\)))) # (!\U_QUIZ|WideOr1~combout\ & (!\U_QUIZ|WideOr2~combout\ & (\U_QUIZ|WideOr0~0_combout\ & 
-- \U_QUIZ|WideOr3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|WideOr1~combout\,
	datab => \U_QUIZ|WideOr2~combout\,
	datac => \U_QUIZ|WideOr0~0_combout\,
	datad => \U_QUIZ|WideOr3~0_combout\,
	combout => \U_LED3|Mux5~0_combout\);

-- Location: LCCOMB_X70_Y52_N4
\U_LED3|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED3|Mux4~0_combout\ = (\U_QUIZ|WideOr3~0_combout\) # ((\U_QUIZ|WideOr1~combout\ & ((!\U_QUIZ|WideOr0~0_combout\) # (!\U_QUIZ|WideOr2~combout\))) # (!\U_QUIZ|WideOr1~combout\ & ((\U_QUIZ|WideOr2~combout\) # (\U_QUIZ|WideOr0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|WideOr1~combout\,
	datab => \U_QUIZ|WideOr2~combout\,
	datac => \U_QUIZ|WideOr0~0_combout\,
	datad => \U_QUIZ|WideOr3~0_combout\,
	combout => \U_LED3|Mux4~0_combout\);

-- Location: LCCOMB_X70_Y52_N10
\U_LED3|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED3|Mux3~0_combout\ = (\U_QUIZ|WideOr1~combout\ & (!\U_QUIZ|WideOr0~0_combout\ & (\U_QUIZ|WideOr2~combout\ $ (\U_QUIZ|WideOr3~0_combout\)))) # (!\U_QUIZ|WideOr1~combout\ & ((\U_QUIZ|WideOr2~combout\ & ((\U_QUIZ|WideOr3~0_combout\))) # 
-- (!\U_QUIZ|WideOr2~combout\ & (\U_QUIZ|WideOr0~0_combout\ & !\U_QUIZ|WideOr3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|WideOr1~combout\,
	datab => \U_QUIZ|WideOr2~combout\,
	datac => \U_QUIZ|WideOr0~0_combout\,
	datad => \U_QUIZ|WideOr3~0_combout\,
	combout => \U_LED3|Mux3~0_combout\);

-- Location: LCCOMB_X70_Y52_N20
\U_LED3|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED3|Mux2~0_combout\ = (\U_QUIZ|WideOr2~combout\ & ((\U_QUIZ|WideOr1~combout\ & (!\U_QUIZ|WideOr0~0_combout\)) # (!\U_QUIZ|WideOr1~combout\ & ((\U_QUIZ|WideOr3~0_combout\))))) # (!\U_QUIZ|WideOr2~combout\ & (((!\U_QUIZ|WideOr0~0_combout\ & 
-- \U_QUIZ|WideOr3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|WideOr1~combout\,
	datab => \U_QUIZ|WideOr2~combout\,
	datac => \U_QUIZ|WideOr0~0_combout\,
	datad => \U_QUIZ|WideOr3~0_combout\,
	combout => \U_LED3|Mux2~0_combout\);

-- Location: LCCOMB_X70_Y52_N30
\U_LED3|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED3|Mux1~0_combout\ = (\U_QUIZ|WideOr1~combout\ & ((\U_QUIZ|WideOr2~combout\ $ (\U_QUIZ|WideOr0~0_combout\)) # (!\U_QUIZ|WideOr3~0_combout\))) # (!\U_QUIZ|WideOr1~combout\ & ((\U_QUIZ|WideOr0~0_combout\) # ((\U_QUIZ|WideOr2~combout\ & 
-- !\U_QUIZ|WideOr3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|WideOr1~combout\,
	datab => \U_QUIZ|WideOr2~combout\,
	datac => \U_QUIZ|WideOr0~0_combout\,
	datad => \U_QUIZ|WideOr3~0_combout\,
	combout => \U_LED3|Mux1~0_combout\);

-- Location: LCCOMB_X70_Y52_N8
\U_LED3|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED3|Mux0~0_combout\ = (\U_QUIZ|WideOr3~0_combout\ & (!\U_QUIZ|WideOr0~0_combout\ & (\U_QUIZ|WideOr1~combout\ $ (\U_QUIZ|WideOr2~combout\)))) # (!\U_QUIZ|WideOr3~0_combout\ & (\U_QUIZ|WideOr2~combout\ & (\U_QUIZ|WideOr1~combout\ $ 
-- (!\U_QUIZ|WideOr0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_QUIZ|WideOr1~combout\,
	datab => \U_QUIZ|WideOr2~combout\,
	datac => \U_QUIZ|WideOr0~0_combout\,
	datad => \U_QUIZ|WideOr3~0_combout\,
	combout => \U_LED3|Mux0~0_combout\);

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

-- Location: LCCOMB_X45_Y52_N24
\U_COUNTER|count[3]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[3]~25_combout\ = (\switch[4]~input_o\) # (\rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[4]~input_o\,
	datad => \rst~input_o\,
	combout => \U_COUNTER|count[3]~25_combout\);

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

-- Location: CLKCTRL_G14
\U_COUNTER|count[3]~25clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \U_COUNTER|count[3]~25clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \U_COUNTER|count[3]~25clkctrl_outclk\);

-- Location: LCCOMB_X45_Y52_N12
\U_COUNTER|count[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[0]~1_combout\ = (!\rst~input_o\ & ((GLOBAL(\U_COUNTER|count[3]~25clkctrl_outclk\) & ((\U_COUNTER|count[0]~1_combout\))) # (!GLOBAL(\U_COUNTER|count[3]~25clkctrl_outclk\) & (\switch[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[6]~input_o\,
	datab => \rst~input_o\,
	datac => \U_COUNTER|count[0]~1_combout\,
	datad => \U_COUNTER|count[3]~25clkctrl_outclk\,
	combout => \U_COUNTER|count[0]~1_combout\);

-- Location: LCCOMB_X45_Y52_N30
\U_COUNTER|count[0]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[0]~4_combout\ = \U_COUNTER|count[0]~1_combout\ $ (!\U_COUNTER|count[0]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_COUNTER|count[0]~1_combout\,
	datac => \U_COUNTER|count[0]~2_combout\,
	combout => \U_COUNTER|count[0]~4_combout\);

-- Location: LCCOMB_X45_Y52_N26
\U_COUNTER|count[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[0]~0_combout\ = (\rst~input_o\) # (!\U_COUNTER|count[3]~25_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \U_COUNTER|count[3]~25_combout\,
	combout => \U_COUNTER|count[0]~0_combout\);

-- Location: FF_X45_Y52_N31
\U_COUNTER|count[0]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_COUNTER|count[0]~4_combout\,
	clrn => \U_COUNTER|ALT_INV_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_COUNTER|count[0]~_emulated_q\);

-- Location: LCCOMB_X45_Y52_N16
\U_COUNTER|count[0]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[0]~3_combout\ = \U_COUNTER|count[0]~_emulated_q\ $ (\U_COUNTER|count[0]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_COUNTER|count[0]~_emulated_q\,
	datad => \U_COUNTER|count[0]~1_combout\,
	combout => \U_COUNTER|count[0]~3_combout\);

-- Location: LCCOMB_X45_Y52_N28
\U_COUNTER|count[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[0]~2_combout\ = (!\rst~input_o\ & ((\U_COUNTER|count[3]~25_combout\ & ((\U_COUNTER|count[0]~3_combout\))) # (!\U_COUNTER|count[3]~25_combout\ & (\switch[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[6]~input_o\,
	datab => \rst~input_o\,
	datac => \U_COUNTER|count[3]~25_combout\,
	datad => \U_COUNTER|count[0]~3_combout\,
	combout => \U_COUNTER|count[0]~2_combout\);

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

-- Location: LCCOMB_X45_Y52_N14
\U_COUNTER|count[3]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[3]~16_combout\ = (!\rst~input_o\ & ((GLOBAL(\U_COUNTER|count[3]~25clkctrl_outclk\) & ((\U_COUNTER|count[3]~16_combout\))) # (!GLOBAL(\U_COUNTER|count[3]~25clkctrl_outclk\) & (\switch[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[9]~input_o\,
	datab => \rst~input_o\,
	datac => \U_COUNTER|count[3]~16_combout\,
	datad => \U_COUNTER|count[3]~25clkctrl_outclk\,
	combout => \U_COUNTER|count[3]~16_combout\);

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

-- Location: LCCOMB_X44_Y52_N26
\U_COUNTER|count[1]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[1]~6_combout\ = (!\rst~input_o\ & ((GLOBAL(\U_COUNTER|count[3]~25clkctrl_outclk\) & ((\U_COUNTER|count[1]~6_combout\))) # (!GLOBAL(\U_COUNTER|count[3]~25clkctrl_outclk\) & (\switch[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \switch[7]~input_o\,
	datac => \U_COUNTER|count[1]~6_combout\,
	datad => \U_COUNTER|count[3]~25clkctrl_outclk\,
	combout => \U_COUNTER|count[1]~6_combout\);

-- Location: LCCOMB_X44_Y52_N6
\U_COUNTER|Add0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|Add0~1_cout\ = CARRY(\U_COUNTER|count[0]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_COUNTER|count[0]~2_combout\,
	datad => VCC,
	cout => \U_COUNTER|Add0~1_cout\);

-- Location: LCCOMB_X44_Y52_N8
\U_COUNTER|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|Add0~2_combout\ = (\U_COUNTER|count[1]~7_combout\ & ((\switch[5]~input_o\ & (\U_COUNTER|Add0~1_cout\ & VCC)) # (!\switch[5]~input_o\ & (!\U_COUNTER|Add0~1_cout\)))) # (!\U_COUNTER|count[1]~7_combout\ & ((\switch[5]~input_o\ & 
-- (!\U_COUNTER|Add0~1_cout\)) # (!\switch[5]~input_o\ & ((\U_COUNTER|Add0~1_cout\) # (GND)))))
-- \U_COUNTER|Add0~3\ = CARRY((\U_COUNTER|count[1]~7_combout\ & (!\switch[5]~input_o\ & !\U_COUNTER|Add0~1_cout\)) # (!\U_COUNTER|count[1]~7_combout\ & ((!\U_COUNTER|Add0~1_cout\) # (!\switch[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[1]~7_combout\,
	datab => \switch[5]~input_o\,
	datad => VCC,
	cin => \U_COUNTER|Add0~1_cout\,
	combout => \U_COUNTER|Add0~2_combout\,
	cout => \U_COUNTER|Add0~3\);

-- Location: LCCOMB_X44_Y52_N24
\U_COUNTER|count[1]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[1]~9_combout\ = \U_COUNTER|count[1]~6_combout\ $ (((\U_COUNTER|count~27_combout\ & (\switch[5]~input_o\)) # (!\U_COUNTER|count~27_combout\ & ((\U_COUNTER|Add0~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[5]~input_o\,
	datab => \U_COUNTER|Add0~2_combout\,
	datac => \U_COUNTER|count[1]~6_combout\,
	datad => \U_COUNTER|count~27_combout\,
	combout => \U_COUNTER|count[1]~9_combout\);

-- Location: FF_X44_Y52_N25
\U_COUNTER|count[1]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_COUNTER|count[1]~9_combout\,
	clrn => \U_COUNTER|ALT_INV_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_COUNTER|count[1]~_emulated_q\);

-- Location: LCCOMB_X44_Y52_N18
\U_COUNTER|count[1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[1]~8_combout\ = \U_COUNTER|count[1]~6_combout\ $ (\U_COUNTER|count[1]~_emulated_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_COUNTER|count[1]~6_combout\,
	datad => \U_COUNTER|count[1]~_emulated_q\,
	combout => \U_COUNTER|count[1]~8_combout\);

-- Location: LCCOMB_X44_Y52_N20
\U_COUNTER|count[1]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[1]~7_combout\ = (!\rst~input_o\ & ((\U_COUNTER|count[3]~25_combout\ & ((\U_COUNTER|count[1]~8_combout\))) # (!\U_COUNTER|count[3]~25_combout\ & (\switch[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[3]~25_combout\,
	datab => \switch[7]~input_o\,
	datac => \rst~input_o\,
	datad => \U_COUNTER|count[1]~8_combout\,
	combout => \U_COUNTER|count[1]~7_combout\);

-- Location: LCCOMB_X44_Y52_N10
\U_COUNTER|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|Add0~4_combout\ = ((\U_COUNTER|count[2]~12_combout\ $ (\switch[5]~input_o\ $ (!\U_COUNTER|Add0~3\)))) # (GND)
-- \U_COUNTER|Add0~5\ = CARRY((\U_COUNTER|count[2]~12_combout\ & ((\switch[5]~input_o\) # (!\U_COUNTER|Add0~3\))) # (!\U_COUNTER|count[2]~12_combout\ & (\switch[5]~input_o\ & !\U_COUNTER|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[2]~12_combout\,
	datab => \switch[5]~input_o\,
	datad => VCC,
	cin => \U_COUNTER|Add0~3\,
	combout => \U_COUNTER|Add0~4_combout\,
	cout => \U_COUNTER|Add0~5\);

-- Location: LCCOMB_X44_Y52_N12
\U_COUNTER|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|Add0~6_combout\ = \switch[5]~input_o\ $ (\U_COUNTER|Add0~5\ $ (\U_COUNTER|count[3]~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \switch[5]~input_o\,
	datad => \U_COUNTER|count[3]~17_combout\,
	cin => \U_COUNTER|Add0~5\,
	combout => \U_COUNTER|Add0~6_combout\);

-- Location: LCCOMB_X44_Y52_N28
\U_COUNTER|count[3]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[3]~19_combout\ = \U_COUNTER|count[3]~16_combout\ $ (((\U_COUNTER|count~27_combout\ & (\switch[5]~input_o\)) # (!\U_COUNTER|count~27_combout\ & ((\U_COUNTER|Add0~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[5]~input_o\,
	datab => \U_COUNTER|count~27_combout\,
	datac => \U_COUNTER|count[3]~16_combout\,
	datad => \U_COUNTER|Add0~6_combout\,
	combout => \U_COUNTER|count[3]~19_combout\);

-- Location: FF_X44_Y52_N29
\U_COUNTER|count[3]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_COUNTER|count[3]~19_combout\,
	clrn => \U_COUNTER|ALT_INV_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_COUNTER|count[3]~_emulated_q\);

-- Location: LCCOMB_X45_Y52_N2
\U_COUNTER|count[3]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[3]~18_combout\ = \U_COUNTER|count[3]~16_combout\ $ (\U_COUNTER|count[3]~_emulated_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_COUNTER|count[3]~16_combout\,
	datad => \U_COUNTER|count[3]~_emulated_q\,
	combout => \U_COUNTER|count[3]~18_combout\);

-- Location: LCCOMB_X45_Y52_N20
\U_COUNTER|count[3]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[3]~17_combout\ = (!\rst~input_o\ & ((\U_COUNTER|count[3]~25_combout\ & ((\U_COUNTER|count[3]~18_combout\))) # (!\U_COUNTER|count[3]~25_combout\ & (\switch[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[9]~input_o\,
	datab => \rst~input_o\,
	datac => \U_COUNTER|count[3]~25_combout\,
	datad => \U_COUNTER|count[3]~18_combout\,
	combout => \U_COUNTER|count[3]~17_combout\);

-- Location: LCCOMB_X44_Y52_N14
\U_COUNTER|count~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count~26_combout\ = (\U_COUNTER|count[1]~7_combout\ & (\U_COUNTER|count[2]~12_combout\ & !\switch[5]~input_o\)) # (!\U_COUNTER|count[1]~7_combout\ & (!\U_COUNTER|count[2]~12_combout\ & \switch[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[1]~7_combout\,
	datac => \U_COUNTER|count[2]~12_combout\,
	datad => \switch[5]~input_o\,
	combout => \U_COUNTER|count~26_combout\);

-- Location: LCCOMB_X44_Y52_N4
\U_COUNTER|count~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count~27_combout\ = (\U_COUNTER|count~26_combout\ & ((\U_COUNTER|count[0]~2_combout\ & (\U_COUNTER|count[3]~17_combout\ & \U_COUNTER|count[1]~7_combout\)) # (!\U_COUNTER|count[0]~2_combout\ & (!\U_COUNTER|count[3]~17_combout\ & 
-- !\U_COUNTER|count[1]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[0]~2_combout\,
	datab => \U_COUNTER|count[3]~17_combout\,
	datac => \U_COUNTER|count[1]~7_combout\,
	datad => \U_COUNTER|count~26_combout\,
	combout => \U_COUNTER|count~27_combout\);

-- Location: LCCOMB_X44_Y52_N16
\U_COUNTER|count[2]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[2]~11_combout\ = (!\rst~input_o\ & ((GLOBAL(\U_COUNTER|count[3]~25clkctrl_outclk\) & (\U_COUNTER|count[2]~11_combout\)) # (!GLOBAL(\U_COUNTER|count[3]~25clkctrl_outclk\) & ((\switch[8]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \U_COUNTER|count[2]~11_combout\,
	datac => \switch[8]~input_o\,
	datad => \U_COUNTER|count[3]~25clkctrl_outclk\,
	combout => \U_COUNTER|count[2]~11_combout\);

-- Location: LCCOMB_X44_Y52_N22
\U_COUNTER|count[2]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[2]~14_combout\ = \U_COUNTER|count[2]~11_combout\ $ (((\U_COUNTER|count~27_combout\ & (\switch[5]~input_o\)) # (!\U_COUNTER|count~27_combout\ & ((\U_COUNTER|Add0~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch[5]~input_o\,
	datab => \U_COUNTER|count~27_combout\,
	datac => \U_COUNTER|Add0~4_combout\,
	datad => \U_COUNTER|count[2]~11_combout\,
	combout => \U_COUNTER|count[2]~14_combout\);

-- Location: FF_X44_Y52_N23
\U_COUNTER|count[2]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_COUNTER|count[2]~14_combout\,
	clrn => \U_COUNTER|ALT_INV_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_COUNTER|count[2]~_emulated_q\);

-- Location: LCCOMB_X44_Y52_N0
\U_COUNTER|count[2]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[2]~13_combout\ = \U_COUNTER|count[2]~_emulated_q\ $ (\U_COUNTER|count[2]~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_COUNTER|count[2]~_emulated_q\,
	datad => \U_COUNTER|count[2]~11_combout\,
	combout => \U_COUNTER|count[2]~13_combout\);

-- Location: LCCOMB_X44_Y52_N2
\U_COUNTER|count[2]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_COUNTER|count[2]~12_combout\ = (!\rst~input_o\ & ((\U_COUNTER|count[3]~25_combout\ & ((\U_COUNTER|count[2]~13_combout\))) # (!\U_COUNTER|count[3]~25_combout\ & (\switch[8]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[3]~25_combout\,
	datab => \rst~input_o\,
	datac => \switch[8]~input_o\,
	datad => \U_COUNTER|count[2]~13_combout\,
	combout => \U_COUNTER|count[2]~12_combout\);

-- Location: LCCOMB_X45_Y52_N10
\U_LED4|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux6~0_combout\ = (\U_COUNTER|count[2]~12_combout\ & (!\U_COUNTER|count[1]~7_combout\ & (\U_COUNTER|count[3]~17_combout\ $ (!\U_COUNTER|count[0]~2_combout\)))) # (!\U_COUNTER|count[2]~12_combout\ & (\U_COUNTER|count[0]~2_combout\ & 
-- (\U_COUNTER|count[3]~17_combout\ $ (!\U_COUNTER|count[1]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[2]~12_combout\,
	datab => \U_COUNTER|count[3]~17_combout\,
	datac => \U_COUNTER|count[1]~7_combout\,
	datad => \U_COUNTER|count[0]~2_combout\,
	combout => \U_LED4|Mux6~0_combout\);

-- Location: LCCOMB_X45_Y51_N4
\U_LED4|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux5~0_combout\ = (\U_COUNTER|count[1]~7_combout\ & ((\U_COUNTER|count[0]~2_combout\ & (\U_COUNTER|count[3]~17_combout\)) # (!\U_COUNTER|count[0]~2_combout\ & ((\U_COUNTER|count[2]~12_combout\))))) # (!\U_COUNTER|count[1]~7_combout\ & 
-- (\U_COUNTER|count[2]~12_combout\ & (\U_COUNTER|count[0]~2_combout\ $ (\U_COUNTER|count[3]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[1]~7_combout\,
	datab => \U_COUNTER|count[0]~2_combout\,
	datac => \U_COUNTER|count[3]~17_combout\,
	datad => \U_COUNTER|count[2]~12_combout\,
	combout => \U_LED4|Mux5~0_combout\);

-- Location: LCCOMB_X46_Y51_N20
\U_LED4|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux4~0_combout\ = (\U_COUNTER|count[2]~12_combout\ & (\U_COUNTER|count[3]~17_combout\ & ((\U_COUNTER|count[1]~7_combout\) # (!\U_COUNTER|count[0]~2_combout\)))) # (!\U_COUNTER|count[2]~12_combout\ & (\U_COUNTER|count[1]~7_combout\ & 
-- (!\U_COUNTER|count[0]~2_combout\ & !\U_COUNTER|count[3]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[1]~7_combout\,
	datab => \U_COUNTER|count[0]~2_combout\,
	datac => \U_COUNTER|count[2]~12_combout\,
	datad => \U_COUNTER|count[3]~17_combout\,
	combout => \U_LED4|Mux4~0_combout\);

-- Location: LCCOMB_X45_Y51_N26
\U_LED4|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux3~0_combout\ = (\U_COUNTER|count[0]~2_combout\ & (\U_COUNTER|count[1]~7_combout\ $ (((!\U_COUNTER|count[2]~12_combout\))))) # (!\U_COUNTER|count[0]~2_combout\ & ((\U_COUNTER|count[1]~7_combout\ & (\U_COUNTER|count[3]~17_combout\ & 
-- !\U_COUNTER|count[2]~12_combout\)) # (!\U_COUNTER|count[1]~7_combout\ & (!\U_COUNTER|count[3]~17_combout\ & \U_COUNTER|count[2]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100101100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[1]~7_combout\,
	datab => \U_COUNTER|count[0]~2_combout\,
	datac => \U_COUNTER|count[3]~17_combout\,
	datad => \U_COUNTER|count[2]~12_combout\,
	combout => \U_LED4|Mux3~0_combout\);

-- Location: LCCOMB_X44_Y51_N20
\U_LED4|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux2~0_combout\ = (\U_COUNTER|count[1]~7_combout\ & (((!\U_COUNTER|count[3]~17_combout\ & \U_COUNTER|count[0]~2_combout\)))) # (!\U_COUNTER|count[1]~7_combout\ & ((\U_COUNTER|count[2]~12_combout\ & (!\U_COUNTER|count[3]~17_combout\)) # 
-- (!\U_COUNTER|count[2]~12_combout\ & ((\U_COUNTER|count[0]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[2]~12_combout\,
	datab => \U_COUNTER|count[1]~7_combout\,
	datac => \U_COUNTER|count[3]~17_combout\,
	datad => \U_COUNTER|count[0]~2_combout\,
	combout => \U_LED4|Mux2~0_combout\);

-- Location: LCCOMB_X45_Y51_N8
\U_LED4|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux1~0_combout\ = (\U_COUNTER|count[1]~7_combout\ & (!\U_COUNTER|count[3]~17_combout\ & ((\U_COUNTER|count[0]~2_combout\) # (!\U_COUNTER|count[2]~12_combout\)))) # (!\U_COUNTER|count[1]~7_combout\ & (\U_COUNTER|count[0]~2_combout\ & 
-- (\U_COUNTER|count[3]~17_combout\ $ (!\U_COUNTER|count[2]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[1]~7_combout\,
	datab => \U_COUNTER|count[0]~2_combout\,
	datac => \U_COUNTER|count[3]~17_combout\,
	datad => \U_COUNTER|count[2]~12_combout\,
	combout => \U_LED4|Mux1~0_combout\);

-- Location: LCCOMB_X45_Y51_N10
\U_LED4|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED4|Mux0~0_combout\ = (\U_COUNTER|count[0]~2_combout\ & ((\U_COUNTER|count[3]~17_combout\) # (\U_COUNTER|count[1]~7_combout\ $ (\U_COUNTER|count[2]~12_combout\)))) # (!\U_COUNTER|count[0]~2_combout\ & ((\U_COUNTER|count[1]~7_combout\) # 
-- (\U_COUNTER|count[3]~17_combout\ $ (\U_COUNTER|count[2]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_COUNTER|count[1]~7_combout\,
	datab => \U_COUNTER|count[0]~2_combout\,
	datac => \U_COUNTER|count[3]~17_combout\,
	datad => \U_COUNTER|count[2]~12_combout\,
	combout => \U_LED4|Mux0~0_combout\);

-- Location: LCCOMB_X47_Y53_N18
\U_GRAY|state.S10~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S10~feeder_combout\ = \U_GRAY|state.S9~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GRAY|state.S9~q\,
	combout => \U_GRAY|state.S10~feeder_combout\);

-- Location: FF_X47_Y53_N19
\U_GRAY|state.S10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S10~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S10~q\);

-- Location: LCCOMB_X47_Y53_N24
\U_GRAY|state.S11~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S11~feeder_combout\ = \U_GRAY|state.S10~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GRAY|state.S10~q\,
	combout => \U_GRAY|state.S11~feeder_combout\);

-- Location: FF_X47_Y53_N25
\U_GRAY|state.S11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S11~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S11~q\);

-- Location: LCCOMB_X47_Y53_N2
\U_GRAY|state.S12~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S12~feeder_combout\ = \U_GRAY|state.S11~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GRAY|state.S11~q\,
	combout => \U_GRAY|state.S12~feeder_combout\);

-- Location: FF_X47_Y53_N3
\U_GRAY|state.S12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S12~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S12~q\);

-- Location: LCCOMB_X47_Y53_N20
\U_GRAY|state.S13~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S13~feeder_combout\ = \U_GRAY|state.S12~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GRAY|state.S12~q\,
	combout => \U_GRAY|state.S13~feeder_combout\);

-- Location: FF_X47_Y53_N21
\U_GRAY|state.S13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S13~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S13~q\);

-- Location: LCCOMB_X47_Y53_N10
\U_GRAY|state.S14~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S14~feeder_combout\ = \U_GRAY|state.S13~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GRAY|state.S13~q\,
	combout => \U_GRAY|state.S14~feeder_combout\);

-- Location: FF_X47_Y53_N11
\U_GRAY|state.S14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S14~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S14~q\);

-- Location: LCCOMB_X47_Y53_N26
\U_GRAY|state.S15~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S15~feeder_combout\ = \U_GRAY|state.S14~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GRAY|state.S14~q\,
	combout => \U_GRAY|state.S15~feeder_combout\);

-- Location: FF_X47_Y53_N27
\U_GRAY|state.S15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S15~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S15~q\);

-- Location: LCCOMB_X47_Y53_N4
\U_GRAY|state.S0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S0~0_combout\ = !\U_GRAY|state.S15~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GRAY|state.S15~q\,
	combout => \U_GRAY|state.S0~0_combout\);

-- Location: FF_X47_Y53_N5
\U_GRAY|state.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S0~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S0~q\);

-- Location: LCCOMB_X47_Y53_N16
\U_GRAY|state.S1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S1~0_combout\ = !\U_GRAY|state.S0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GRAY|state.S0~q\,
	combout => \U_GRAY|state.S1~0_combout\);

-- Location: FF_X47_Y53_N17
\U_GRAY|state.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S1~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S1~q\);

-- Location: LCCOMB_X47_Y53_N14
\U_GRAY|state.S2~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S2~feeder_combout\ = \U_GRAY|state.S1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GRAY|state.S1~q\,
	combout => \U_GRAY|state.S2~feeder_combout\);

-- Location: FF_X47_Y53_N15
\U_GRAY|state.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S2~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S2~q\);

-- Location: LCCOMB_X47_Y53_N28
\U_GRAY|state.S3~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S3~feeder_combout\ = \U_GRAY|state.S2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GRAY|state.S2~q\,
	combout => \U_GRAY|state.S3~feeder_combout\);

-- Location: FF_X47_Y53_N29
\U_GRAY|state.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S3~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S3~q\);

-- Location: LCCOMB_X47_Y53_N22
\U_GRAY|state.S4~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S4~feeder_combout\ = \U_GRAY|state.S3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GRAY|state.S3~q\,
	combout => \U_GRAY|state.S4~feeder_combout\);

-- Location: FF_X47_Y53_N23
\U_GRAY|state.S4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S4~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S4~q\);

-- Location: LCCOMB_X47_Y53_N8
\U_GRAY|state.S5~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S5~feeder_combout\ = \U_GRAY|state.S4~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GRAY|state.S4~q\,
	combout => \U_GRAY|state.S5~feeder_combout\);

-- Location: FF_X47_Y53_N9
\U_GRAY|state.S5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S5~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S5~q\);

-- Location: LCCOMB_X47_Y53_N30
\U_GRAY|state.S6~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S6~feeder_combout\ = \U_GRAY|state.S5~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GRAY|state.S5~q\,
	combout => \U_GRAY|state.S6~feeder_combout\);

-- Location: FF_X47_Y53_N31
\U_GRAY|state.S6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S6~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S6~q\);

-- Location: LCCOMB_X47_Y53_N6
\U_GRAY|state.S7~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S7~feeder_combout\ = \U_GRAY|state.S6~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GRAY|state.S6~q\,
	combout => \U_GRAY|state.S7~feeder_combout\);

-- Location: FF_X47_Y53_N7
\U_GRAY|state.S7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S7~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S7~q\);

-- Location: LCCOMB_X47_Y53_N0
\U_GRAY|state.S8~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S8~feeder_combout\ = \U_GRAY|state.S7~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GRAY|state.S7~q\,
	combout => \U_GRAY|state.S8~feeder_combout\);

-- Location: FF_X47_Y53_N1
\U_GRAY|state.S8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S8~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S8~q\);

-- Location: LCCOMB_X47_Y53_N12
\U_GRAY|state.S9~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|state.S9~feeder_combout\ = \U_GRAY|state.S8~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_GRAY|state.S8~q\,
	combout => \U_GRAY|state.S9~feeder_combout\);

-- Location: FF_X47_Y53_N13
\U_GRAY|state.S9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U_CLK_GEN|COUNT1|timeReached~clkctrl_outclk\,
	d => \U_GRAY|state.S9~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_GRAY|state.S9~q\);

-- Location: LCCOMB_X63_Y43_N4
\U_GRAY|WideOr2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|WideOr2~1_combout\ = (\U_GRAY|state.S9~q\) # ((\U_GRAY|state.S6~q\) # ((\U_GRAY|state.S1~q\) # (\U_GRAY|state.S14~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|state.S9~q\,
	datab => \U_GRAY|state.S6~q\,
	datac => \U_GRAY|state.S1~q\,
	datad => \U_GRAY|state.S14~q\,
	combout => \U_GRAY|WideOr2~1_combout\);

-- Location: LCCOMB_X63_Y43_N10
\U_GRAY|WideOr2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|WideOr2~0_combout\ = (!\U_GRAY|state.S15~q\ & (!\U_GRAY|state.S8~q\ & (!\U_GRAY|state.S7~q\ & \U_GRAY|state.S0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|state.S15~q\,
	datab => \U_GRAY|state.S8~q\,
	datac => \U_GRAY|state.S7~q\,
	datad => \U_GRAY|state.S0~q\,
	combout => \U_GRAY|WideOr2~0_combout\);

-- Location: LCCOMB_X72_Y39_N26
\U_GRAY|WideOr2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|WideOr2~combout\ = (\U_GRAY|WideOr2~1_combout\) # (!\U_GRAY|WideOr2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GRAY|WideOr2~1_combout\,
	datad => \U_GRAY|WideOr2~0_combout\,
	combout => \U_GRAY|WideOr2~combout\);

-- Location: LCCOMB_X63_Y43_N12
\U_GRAY|WideOr3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|WideOr3~0_combout\ = (\U_GRAY|state.S4~q\) # ((\U_GRAY|state.S11~q\) # ((\U_GRAY|state.S12~q\) # (\U_GRAY|state.S3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|state.S4~q\,
	datab => \U_GRAY|state.S11~q\,
	datac => \U_GRAY|state.S12~q\,
	datad => \U_GRAY|state.S3~q\,
	combout => \U_GRAY|WideOr3~0_combout\);

-- Location: LCCOMB_X72_Y39_N20
\U_GRAY|WideOr3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|WideOr3~combout\ = (\U_GRAY|WideOr3~0_combout\) # (!\U_GRAY|WideOr2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GRAY|WideOr3~0_combout\,
	datad => \U_GRAY|WideOr2~0_combout\,
	combout => \U_GRAY|WideOr3~combout\);

-- Location: LCCOMB_X63_Y43_N18
\U_GRAY|WideOr1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|WideOr1~0_combout\ = (\U_GRAY|state.S13~q\) # ((\U_GRAY|state.S14~q\) # ((\U_GRAY|state.S12~q\) # (\U_GRAY|state.S15~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|state.S13~q\,
	datab => \U_GRAY|state.S14~q\,
	datac => \U_GRAY|state.S12~q\,
	datad => \U_GRAY|state.S15~q\,
	combout => \U_GRAY|WideOr1~0_combout\);

-- Location: LCCOMB_X63_Y43_N8
\U_GRAY|WideOr0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|WideOr0~0_combout\ = (!\U_GRAY|state.S1~q\ & (!\U_GRAY|state.S3~q\ & (!\U_GRAY|state.S2~q\ & \U_GRAY|state.S0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|state.S1~q\,
	datab => \U_GRAY|state.S3~q\,
	datac => \U_GRAY|state.S2~q\,
	datad => \U_GRAY|state.S0~q\,
	combout => \U_GRAY|WideOr0~0_combout\);

-- Location: LCCOMB_X72_Y39_N4
\U_GRAY|WideOr1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|WideOr1~combout\ = (\U_GRAY|WideOr1~0_combout\) # (!\U_GRAY|WideOr0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_GRAY|WideOr1~0_combout\,
	datad => \U_GRAY|WideOr0~0_combout\,
	combout => \U_GRAY|WideOr1~combout\);

-- Location: LCCOMB_X63_Y43_N22
\U_GRAY|WideOr0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|WideOr0~1_combout\ = (\U_GRAY|state.S4~q\) # ((\U_GRAY|state.S6~q\) # ((\U_GRAY|state.S7~q\) # (\U_GRAY|state.S5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|state.S4~q\,
	datab => \U_GRAY|state.S6~q\,
	datac => \U_GRAY|state.S7~q\,
	datad => \U_GRAY|state.S5~q\,
	combout => \U_GRAY|WideOr0~1_combout\);

-- Location: LCCOMB_X72_Y39_N10
\U_GRAY|WideOr0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_GRAY|WideOr0~combout\ = (\U_GRAY|WideOr0~1_combout\) # (!\U_GRAY|WideOr0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_GRAY|WideOr0~1_combout\,
	datad => \U_GRAY|WideOr0~0_combout\,
	combout => \U_GRAY|WideOr0~combout\);

-- Location: LCCOMB_X72_Y39_N24
\U_LED5|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux6~0_combout\ = (\U_GRAY|WideOr1~combout\ & (!\U_GRAY|WideOr3~combout\ & (\U_GRAY|WideOr2~combout\ $ (!\U_GRAY|WideOr0~combout\)))) # (!\U_GRAY|WideOr1~combout\ & (\U_GRAY|WideOr2~combout\ & (\U_GRAY|WideOr3~combout\ $ 
-- (!\U_GRAY|WideOr0~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|WideOr2~combout\,
	datab => \U_GRAY|WideOr3~combout\,
	datac => \U_GRAY|WideOr1~combout\,
	datad => \U_GRAY|WideOr0~combout\,
	combout => \U_LED5|Mux6~0_combout\);

-- Location: LCCOMB_X72_Y39_N22
\U_LED5|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux5~0_combout\ = (\U_GRAY|WideOr2~combout\ & ((\U_GRAY|WideOr1~combout\) # (\U_GRAY|WideOr3~combout\ $ (!\U_GRAY|WideOr0~combout\)))) # (!\U_GRAY|WideOr2~combout\ & ((\U_GRAY|WideOr3~combout\ & (\U_GRAY|WideOr1~combout\)) # 
-- (!\U_GRAY|WideOr3~combout\ & ((\U_GRAY|WideOr0~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|WideOr2~combout\,
	datab => \U_GRAY|WideOr3~combout\,
	datac => \U_GRAY|WideOr1~combout\,
	datad => \U_GRAY|WideOr0~combout\,
	combout => \U_LED5|Mux5~0_combout\);

-- Location: LCCOMB_X72_Y39_N0
\U_LED5|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux4~0_combout\ = (\U_GRAY|WideOr1~combout\ & ((\U_GRAY|WideOr2~combout\) # ((!\U_GRAY|WideOr0~combout\) # (!\U_GRAY|WideOr3~combout\)))) # (!\U_GRAY|WideOr1~combout\ & ((\U_GRAY|WideOr0~combout\) # ((\U_GRAY|WideOr2~combout\ & 
-- !\U_GRAY|WideOr3~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|WideOr2~combout\,
	datab => \U_GRAY|WideOr3~combout\,
	datac => \U_GRAY|WideOr1~combout\,
	datad => \U_GRAY|WideOr0~combout\,
	combout => \U_LED5|Mux4~0_combout\);

-- Location: LCCOMB_X72_Y39_N6
\U_LED5|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux3~0_combout\ = (\U_GRAY|WideOr3~combout\ & ((\U_GRAY|WideOr2~combout\ & ((\U_GRAY|WideOr1~combout\) # (!\U_GRAY|WideOr0~combout\))) # (!\U_GRAY|WideOr2~combout\ & ((\U_GRAY|WideOr0~combout\) # (!\U_GRAY|WideOr1~combout\))))) # 
-- (!\U_GRAY|WideOr3~combout\ & (\U_GRAY|WideOr2~combout\ $ ((\U_GRAY|WideOr1~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011010011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|WideOr2~combout\,
	datab => \U_GRAY|WideOr3~combout\,
	datac => \U_GRAY|WideOr1~combout\,
	datad => \U_GRAY|WideOr0~combout\,
	combout => \U_LED5|Mux3~0_combout\);

-- Location: LCCOMB_X72_Y39_N28
\U_LED5|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux2~0_combout\ = (\U_GRAY|WideOr2~combout\ & ((\U_GRAY|WideOr1~combout\ & (!\U_GRAY|WideOr3~combout\)) # (!\U_GRAY|WideOr1~combout\ & ((\U_GRAY|WideOr0~combout\))))) # (!\U_GRAY|WideOr2~combout\ & (!\U_GRAY|WideOr3~combout\ & 
-- ((\U_GRAY|WideOr0~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|WideOr2~combout\,
	datab => \U_GRAY|WideOr3~combout\,
	datac => \U_GRAY|WideOr1~combout\,
	datad => \U_GRAY|WideOr0~combout\,
	combout => \U_LED5|Mux2~0_combout\);

-- Location: LCCOMB_X72_Y39_N18
\U_LED5|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux1~0_combout\ = (\U_GRAY|WideOr2~combout\ & (!\U_GRAY|WideOr3~combout\ & (\U_GRAY|WideOr1~combout\ $ (!\U_GRAY|WideOr0~combout\)))) # (!\U_GRAY|WideOr2~combout\ & (\U_GRAY|WideOr0~combout\ & ((\U_GRAY|WideOr1~combout\) # 
-- (!\U_GRAY|WideOr3~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|WideOr2~combout\,
	datab => \U_GRAY|WideOr3~combout\,
	datac => \U_GRAY|WideOr1~combout\,
	datad => \U_GRAY|WideOr0~combout\,
	combout => \U_LED5|Mux1~0_combout\);

-- Location: LCCOMB_X72_Y39_N12
\U_LED5|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \U_LED5|Mux0~0_combout\ = (\U_GRAY|WideOr3~combout\ & (\U_GRAY|WideOr2~combout\ & (\U_GRAY|WideOr1~combout\ $ (!\U_GRAY|WideOr0~combout\)))) # (!\U_GRAY|WideOr3~combout\ & (\U_GRAY|WideOr0~combout\ & (\U_GRAY|WideOr2~combout\ $ 
-- (!\U_GRAY|WideOr1~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_GRAY|WideOr2~combout\,
	datab => \U_GRAY|WideOr3~combout\,
	datac => \U_GRAY|WideOr1~combout\,
	datad => \U_GRAY|WideOr0~combout\,
	combout => \U_LED5|Mux0~0_combout\);

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

-- Location: IOIBUF_X38_Y0_N22
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


