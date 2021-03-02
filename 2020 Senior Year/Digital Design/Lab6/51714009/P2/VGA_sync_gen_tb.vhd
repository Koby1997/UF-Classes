library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGA_LIB.all;

entity sync_gen_tb is
end sync_gen_tb;

architecture TB of sync_gen_tb is

    signal clk          : std_logic := '0';
    signal rst          : std_logic := '0';
    signal Hcount       : std_logic_vector(9 downto 0) := "0000000000";
    signal Vcount       : std_logic_vector(9 downto 0) := "0000000000";
    signal Horiz_Sync   : std_logic := '0';
    signal Vert_Sync    : std_logic := '0';
    signal Video_On     : std_logic := '0';
    signal Red          : std_logic_vector(3 downto 0) := "0000";
    signal Green        : std_logic_vector(3 downto 0) := "0000";
    signal Blue         : std_logic_vector(3 downto 0) := "0000";

begin


    UUT : entity work.sync_gen
    port map (
        clk         => clk,
        rst         => rst,
        Hcount      => Hcount,
        Vcount      => Vcount,
        Horiz_Sync  => Horiz_Sync,
        Vert_Sync   => Vert_Sync,
        Video_On    => Video_On);


    process
    begin  

        if (Video_ON = '1')then
            if (unsigned(Hcount) < 200)then
                Red <= "1111";
                Green <= "0000";
                Blue <= "0000";
            elsif (unsigned(Hcount) < 400)then
                Red <= "0000";
                Green <= "1111";
                Blue <= "0000";
            elsif (unsigned(Hcount) < 800)then
                Red <= "0000";
                Green <= "0000";
                Blue <= "1111";
            end if;
        end if;
        

    end process;

end TB;