library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity weird_shift is
    port (
        input    : in  std_logic_vector(25 downto 0);
        output : out std_logic_vector(27 downto 0));
end weird_shift;

architecture BHV of weird_shift is
begin
    process(input)
    begin
        output <= input & "00";
    end process;
end BHV;