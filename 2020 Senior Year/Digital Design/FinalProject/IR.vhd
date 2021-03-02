library ieee;
use ieee.std_logic_1164.all;

entity IR is
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    enable : in  std_logic;
    input  : in  std_logic_vector(31 downto 0);
    output1 : out std_logic_vector(25 downto 0);
    output2 : out std_logic_vector(5 downto 0);
    output3 : out std_logic_vector(4 downto 0);
    output4 : out std_logic_vector(4 downto 0);
    output5 : out std_logic_vector(4 downto 0);
    output6 : out std_logic_vector(15 downto 0);
    output7 : out std_logic_vector(4 downto 0));
end IR;


architecture BHV of IR is
begin
  process(clk, rst)
  begin
    if (rst = '1') then
      output1   <= (others => '0');
      output2   <= (others => '0');
      output3   <= (others => '0');
      output4   <= (others => '0');
      output5   <= (others => '0');
      output6   <= (others => '0');
      output7   <= (others => '0');

    elsif (rising_edge(clk)) then
      if (enable = '1') then
        output1 <= input(25 downto 0);
        output2 <= input(31 downto 26);
        output3 <= input(25 downto 21);
        output4 <= input(20 downto 16);
        output5 <= input(15 downto 11);
        output6 <= input(15 downto 0);
        output7 <= input(10 downto 6);
      end if;
    end if;
  end process;
end BHV;