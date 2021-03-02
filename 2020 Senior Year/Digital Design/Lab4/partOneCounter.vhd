library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity partOneCounter is
    generic (
        time_ms : natural := 1000);
    port (
        clk    : in  std_logic;
        button : in  std_logic;
        output : out std_logic);
end partOneCounter;

architecture BHV of partOneCounter is

    signal count: integer:= 0;
    signal timeReached: std_logic;

begin
    process(clk, button)
    begin
        if (button = '1') then
            count <= 0;
            timeReached <= '0';
        elsif (rising_edge(clk)) then
            if (count = (time_ms + 1)) then
                timeReached <= '1';
                count <= 1;
            else
                count <= count + 1;
                timeReached <= '0';       
            end if;
        end if;
    end process;

    output <= timeReached;

end BHV;