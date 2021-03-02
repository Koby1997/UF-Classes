library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_left_two is
    generic (
        WIDTH : positive := 32);
    port (
        input    : in  std_logic_vector(WIDTH-1 downto 0);
        output : out std_logic_vector(WIDTH-1 downto 0));
end shift_left_two;

architecture BHV of shift_left_two is
begin
    process(input)
    begin
        output <= input(WIDTH-3 downto 0) & "00";
    end process;
end BHV;