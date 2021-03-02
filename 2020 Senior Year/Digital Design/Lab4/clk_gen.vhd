library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity clk_gen is
    generic (
        ms_period : positive);          -- amount of ms for button to be
                                        -- pressed before creating clock pulse
    port (
        clk50MHz : in  std_logic;
        rst      : in  std_logic;
        button_n : in  std_logic;
        clk_out  : out std_logic);
end clk_gen;



architecture STR of clk_gen is

signal clk_converter : std_logic;

component clk_div
    generic(clk_in_freq  : natural;
            clk_out_freq : natural);
    port (
        clk_in  : in  std_logic;
        clk_out : out std_logic;
        rst     : in  std_logic);
    end component;

component partOneCounter
    generic (time_ms : natural := ms_period); -- worst case is you pushed after the 1st clk
    port (
        clk    : in  std_logic;
        button    : in  std_logic;
        output : out std_logic);
    end component;

begin

    DIV1:   clk_div generic map(clk_in_freq => 50000000,
                                clk_out_freq => 1000)
                    port map(clk_in => clk50MHz,
                            rst => rst,
                            clk_out => clk_converter);

    COUNT1: partOneCounter generic map(time_ms => ms_period)
                        port map(clk => clk_converter,
                                    button => button_n,
                                    output => clk_out);

end STR;