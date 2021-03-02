library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity gray1_tb is
end gray1_tb;


architecture TB of gray1_tb is
    signal clk    : std_logic := '0';
    signal rst    : std_logic := '0';
    signal output : std_logic_vector(3 downto 0);

    signal done : std_logic := '0';
    
begin

    UUT : entity work.gray1(PROC1)
        port map (
            clk    => clk,
            rst    => rst,
            output => output);

    clk <= not clk and not done after 10 ns;

    done <= '1' after 5000 ns;
    
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

