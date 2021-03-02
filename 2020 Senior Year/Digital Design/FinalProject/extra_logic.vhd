library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extra_logic is
    port (
        in1    : in  std_logic;
        in2    : in  std_logic;
        in3    : in  std_logic;
        output : out std_logic);
end extra_logic;

architecture BHV of extra_logic is
begin
    process(in1, in2, in3)
    begin
        output <= ((in1 AND in2) OR in3);
    end process;
end BHV;