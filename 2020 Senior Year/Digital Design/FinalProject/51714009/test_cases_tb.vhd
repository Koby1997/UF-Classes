library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity test_cases_tb is
end test_cases_tb;

architecture tb of test_cases_tb is
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
        
        wait;
        end process;
    end tb;