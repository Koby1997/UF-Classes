library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter_tb is
end counter_tb;


architecture TB of counter_tb is
    signal clk    : std_logic := '0';
    signal rst    : std_logic := '0';
    signal up_n   : std_logic := '0';
    signal load_n : std_logic := '1';
    signal input  : std_logic_vector(3 downto 0);
    signal output : std_logic_vector(3 downto 0);

    signal done : std_logic := '0';
    
begin

    UUT : entity work.counter(BHV)
        port map (
            clk    => clk,
            rst    => rst,
            up_n   => up_n,
            load_n => load_n,
            input  => input,
            output => output);

    clk <= not clk and not done after 10 ns;

    up_n <= not up_n and not done after 1000 ns;

    load_n <= not load_n and not done after 40000 ns;

    done <= '1' after 50000 ns;

    input <= "1010";
    
    process
    begin
        rst <= '1';
        for i in 0 to 3 loop
            wait until rising_edge(clk);
        end loop;

        rst <= '0';
        wait until rising_edge(clk);

        wait;
               
    end process;
    
end TB;