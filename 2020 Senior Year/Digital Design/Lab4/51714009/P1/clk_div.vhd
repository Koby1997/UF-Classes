library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity clk_div is
    generic(clk_in_freq  : natural;
            clk_out_freq : natural);
    port (
        clk_in  : in  std_logic;
        clk_out : out std_logic;
        rst     : in  std_logic);
end clk_div;


architecture BHV of clk_div is
  
signal count: integer:= 0;
signal temp : std_logic := '0';

begin
        process(clk_in,rst)
        begin
        if(rst = '1') then
                count <= 0;
                temp <= '0';
        elsif(rising_edge(clk_in)) then
                count <= count + 1;
                if (count = (clk_in_freq/clk_out_freq)/2) then
                        temp <= not temp;
                        count <= 0;
                end if;
        end if;
        clk_out <= temp;
        end process;

end BHV;
