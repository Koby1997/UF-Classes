library ieee;
use ieee.std_logic_1164.all;

-- DO NOT CHANGE ANYTHING IN THE ENTITY

entity adder is
  port (
    input1    : in  std_logic_vector(3 downto 0);
    input2    : in  std_logic_vector(3 downto 0);
    carry_in  : in  std_logic;
    sum       : out std_logic_vector(3 downto 0);
    carry_out : out std_logic);
end adder;

-- DEFINE A RIPPLE-CARRY ADDER USING A STRUCTURE DESCRIPTION THAT CONSISTS OF 4
-- FULL ADDERS

architecture STR of adder is  


  signal c_out : std_logic_vector(2 downto 0);

  component FA
  port (
    input1    : in  std_logic;
    input2    : in  std_logic;
    carry_in  : in  std_logic;
    sum       : out std_logic;
    carry_out : out std_logic);
  end component;


begin  -- STR
  FA0:  FA port map(
      input1 => input1(0),
      input2 => input2(0),
      carry_in => carry_in,
      sum => sum(0),
      carry_out => c_out(0));

  FA1:  FA port map(
      input1 => input1(1),
      input2 => input2(1),
      carry_in => c_out(0),
      sum => sum(1),
      carry_out => c_out(1));

  FA2:  FA port map(
      input1 => input1(2),
      input2 => input2(2),
      carry_in => c_out(1),
      sum => sum(2),
      carry_out => c_out(2));

  FA3:  FA port map(
      input1 => input1(3),
      input2 => input2(3),
      carry_in => c_out(2),
      sum => sum(3),
      carry_out => carry_out);

end STR;