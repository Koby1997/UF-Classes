library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor1 is
    generic (
        width   :   positive := 32);
    port (
        in1       : in std_logic_vector(WIDTH-1 downto 0);
        in2       : in std_logic_vector(WIDTH-1 downto 0);
        output    : out std_logic_vector(WIDTH-1 downto 0));
end subtractor1;

architecture BHV of subtractor1 is

begin
    output <= std_logic_vector(unsigned(in1) - unsigned(in2));
end BHV;