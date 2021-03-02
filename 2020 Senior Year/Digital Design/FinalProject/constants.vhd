library ieee;
use ieee.std_logic_1164.all;

package constants is

    -- U = unsigned
    -- I = Immediate, or I Type instruction
    -- R = R Type instruction
    -- names are basically what the names are at the back of the instructions
    -- They are also in the same order as the documentation at the back of the instructions

    constant addU : std_logic_vector(5 downto 0) := "000000";
    constant addIU : std_logic_vector(5 downto 0) := "000001";
    constant subU : std_logic_vector(5 downto 0) := "000010";
    constant subIU : std_logic_vector(5 downto 0) := "000011";
    constant multS : std_logic_vector(5 downto 0) := "000100";
    constant multU : std_logic_vector(5 downto 0) := "000101";
    constant andR : std_logic_vector(5 downto 0) := "000110";
    constant andI : std_logic_vector(5 downto 0) := "000111";
    constant orR : std_logic_vector(5 downto 0) := "001000";
    constant orI : std_logic_vector(5 downto 0) := "001001";
    constant xorR : std_logic_vector(5 downto 0) := "001010";
    constant xorI : std_logic_vector(5 downto 0) := "001011";
    constant srLog : std_logic_vector(5 downto 0) := "001100";
    constant slLog : std_logic_vector(5 downto 0) := "001101";
    constant srArith : std_logic_vector(5 downto 0) := "001110";
    constant sltS : std_logic_vector(5 downto 0) := "001111";
    constant sltIS : std_logic_vector(5 downto 0) := "010000";
    constant sltIU : std_logic_vector(5 downto 0) := "010001";
    constant sltU : std_logic_vector(5 downto 0) := "010010";
    constant mfHi : std_logic_vector(5 downto 0) := "010011";
    constant mfLo : std_logic_vector(5 downto 0) := "010100";
    constant load : std_logic_vector(5 downto 0) := "010101";
    constant store : std_logic_vector(5 downto 0) := "010110";
    constant beq : std_logic_vector(5 downto 0) := "010111";
    constant bneq : std_logic_vector(5 downto 0) := "011000";
    constant blt_eq0 : std_logic_vector(5 downto 0) := "011001";
    constant bgt0 : std_logic_vector(5 downto 0) := "011010";
    constant blt0 : std_logic_vector(5 downto 0) := "011011";
    constant bgt_eq0 : std_logic_vector(5 downto 0) := "011100";

end constants;
