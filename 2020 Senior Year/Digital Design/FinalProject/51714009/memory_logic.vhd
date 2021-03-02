library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_logic is 
    port (
        clk         : in std_logic;
        MemWrite    : in std_logic;
        addr        : in std_logic_vector(31 downto 0);
        OutportWrEn : out std_logic;
        RamWrEn     : out std_logic;
        sel         : out std_logic_vector(1 downto 0));
end memory_logic;

architecture BHV of memory_logic is

begin

    --process(MemWrite, addr)
    process(clk)
    begin
        if(rising_edge(clk)) then--??
            OutportWrEn <= '0';
            RamWrEn <= '0';
        
            if(addr = "00000000000000001111111111111000")then --0000FFF8
                sel <= "00"; --INPORT1;
            elsif(addr = "00000000000000001111111111111100")then --0000FFFC
                sel <= "01"; --INPORT2
                if(MemWrite = '1')then
                    OutportWrEn <= '1';
                end if;
            else
                sel <= "10";
            end if;

            if(MemWrite = '1')then
                RamWrEn <= '1';
            end if;
        end if;

    end process;

end BHV;