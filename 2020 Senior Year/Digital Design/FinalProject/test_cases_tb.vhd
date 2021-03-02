library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity test_cases_tb is
    end test_cases_tb;

architecture tb of test_cases_tb is 
signal clk          : std_logic := '0';
signal rst          : std_logic := '0';
signal inport0_en   : std_logic;
signal inport1_en   : std_logic;
signal switches     : std_logic_vector(31 downto 0);
signal outPort      : std_logic_vector(31 downto 0);
signal switch       : std_logic_vector(9 downto 0);
signal button       : std_logic_vector(1 downto 0);
signal led0, led1, led2, led3, led4, led5   : std_logic_vector(6 downto 0);
signal dp0, dp1, dp2, dp3, dp4, dp5         : std_logic;
begin

U_TOP: entity work.top_level
    port map(
        clk50MHz => clk,
        switch => switch,
        button => button,
        led0   => led0,
        led0_dp => dp0,
        led1   => led1,
        led1_dp => dp1,
        led2   => led2,
        led2_dp => dp2,
        led3  => led3,
        led3_dp => dp3,
        led4  => led4,
        led4_dp => dp4,
        led5   => led5,
        led5_dp => dp5
    );
    button(0) <= not rst;

    clk <= not clk after 5 ns;


    process
    begin
    rst <= '1';
    wait until clk'event and clk = '1';
    wait until clk'event and clk = '1';

    rst <= '0';
    
    
    wait;
    end process;

end tb;