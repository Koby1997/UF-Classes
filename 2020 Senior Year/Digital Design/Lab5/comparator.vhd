library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
    generic (
      width  :     positive := 32);
    port (
      x    : in  std_logic_vector(WIDTH-1 downto 0);
      y    : in  std_logic_vector(WIDTH-1 downto 0);
      x_lt_y : out std_logic;
      x_ne_y : out std_logic);
end comparator;

architecture BHV of comparator is

begin

    process(x,y)
    begin
        if(x < y) then
            x_lt_y <= '1';
        else
            x_lt_y <= '0';
        end if;

        if(x = y) then
            x_ne_y <= '0';
        else
            x_ne_y <= '1';
        end if;
    end process;

end BHV;
