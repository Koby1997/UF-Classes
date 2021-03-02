library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity concat is
    port (
        in1    : in std_logic_vector(27 downto 0);
        in2    : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(31 downto 0));
end concat;

architecture BHV of concat is
begin
    process(in1, in2)
    begin
        output <= in2 & in1;
    end process;
end BHV;