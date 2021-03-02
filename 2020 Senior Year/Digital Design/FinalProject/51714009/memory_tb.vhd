library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity memory_tb is
end memory_tb;

architecture tb of memory_tb is
    signal clk          : std_logic := '0';
    signal rst          : std_logic := '0';
    signal addr         : std_logic_vector(31 downto 0);
    signal switches     : std_logic_vector(31 downto 0);
    signal wrdata       : std_logic_vector(31 downto 0);
    signal rdata        : std_logic_vector(31 downto 0);
    signal outPort      : std_logic_vector(31 downto 0);
    signal MemWrite     : std_logic;
    signal inport0en    : std_logic;
    signal inport1en    : std_logic;
    begin

    U_MEM: entity work.memory
        port map(
            clk	=> clk,           
            rst => rst, 
            inport0en => inport0en, 
            inport1en => inport1en,          
            addr => addr,       
            switches => switches,
            wrdata  => wrdata,
            MemWrite => MemWrite,    
            outPort => outPort,
            rdata  => rdata      
                   
        );     

        clk <= not clk after 5 ns;

        process
        begin 
        rst <= '0';
        inport0en <= '0';
        inport1en <= '0';
        switches <= (others => '0');
        wrdata <= (others => '0');
        MemWrite <= '0';
        addr <= (others => '0');
        
        wait until clk'event and clk = '1';
        addr <= (others => '0');
        wrdata <= x"0A0A0A0A";
        MemWrite <= '1';
        
        wait until clk'event and clk = '1';
        wait until clk'event and clk = '1';
        addr <= x"00000004";
        wrdata <= x"F0F0F0F0";
        MemWrite <= '1';

        wait until clk'event and clk = '1';
        MemWrite <= '0';
        wait until clk'event and clk = '1';
        addr <= x"00000000";

        wait until clk'event and clk = '1';
        wait until clk'event and clk = '1';
        addr <= x"00000001";

        wait until clk'event and clk = '1';
        wait until clk'event and clk = '1';
        addr <= x"00000004";

        wait until clk'event and clk = '1';
        wait until clk'event and clk = '1';
        addr <= x"00000005";

        wait until clk'event and clk = '1';
        wait until clk'event and clk = '1';
        MemWrite <= '1';
        addr <= x"0000FFFC";
        wrdata <= x"00001111";

        wait until clk'event and clk = '1';
        MemWrite <= '0';
        inport0en <= '1';
        switches <= x"00010000";

        wait until clk'event and clk = '1';
        inport0en <= '0';

        wait until clk'event and clk = '1';
        inport1en <= '1';
        switches <= x"00000001";

        wait until clk'event and clk = '1';
        inport1en <= '0';

        wait until clk'event and clk = '1';
        addr <= x"0000FFF8";

        wait until clk'event and clk = '1';
        wait until clk'event and clk = '1';
        addr <= x"0000FFFC";

        wait until clk'event and clk = '1';
        wait;
        end process;
    end tb;