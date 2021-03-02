library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        up_n   : in  std_logic;         -- active low
        load_n : in  std_logic;         -- active low
        input  : in  std_logic_vector(3 downto 0);
        output : out std_logic_vector(3 downto 0));
end counter;

architecture BHV of counter is

    signal count : integer range 0 to 15;

begin
    process(clk, rst)
    begin
        if (rst = '1') then
            count <= 0;
        elsif (load_n = '0') then   --this takes priority over up_n
            count <= to_integer(unsigned(input));
        elsif (rising_edge(clk)) then
            if (up_n = '0') then    --active low, so count up
                if (count = 15) then --wrap around
                    count <= 0;
                else
                    count <= count + 1;
                end if;
            else
                if (count = 0) then --wrap around
                    count <= 15;
                else
                    count <= count - 1;
                end if;
            end if;
        end if;
    end process;

    output <= std_logic_vector(to_unsigned(count, 4));

end BHV;