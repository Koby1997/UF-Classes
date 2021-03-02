library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor2 is
    generic (
        width   :   positive := 32);
    port (
        in1       : in std_logic_vector(WIDTH-1 downto 0);
        in2       : in std_logic_vector(WIDTH-1 downto 0);
        output    : out std_logic_vector(WIDTH-1 downto 0));
end subtractor2;

architecture BHV of subtractor2 is

begin
    process(in1,in2)
    begin
        if(in1 > in2) then
            output <= std_logic_vector(unsigned(in1) - unsigned(in2));
        else
            output <= std_logic_vector(unsigned(in2) - unsigned(in1));
        end if;
    end process;
end BHV;