library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity clk_gen is
    port (
        clk         : in std_logic;
        pixel_clock   : out std_logic;
        rst         : in std_logic);
end clk_gen;


architecture BHV of clk_gen is

signal count: integer:= 0;
signal temp : std_logic := '0';

begin
    process(clk,rst)
    begin
    if(rst = '1') then
            count <= 0;
            temp <= '0';
    elsif(rising_edge(clk)) then
            count <= count + 1;
            if (count = 1) then      -- (50000000/25000000)/2)
                    temp <= not temp;
                    count <= 0;
            end if;
    end if;
    pixel_clock <= temp;
    end process;

end BHV;