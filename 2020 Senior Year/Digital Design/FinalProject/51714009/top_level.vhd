library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity top_level is
    port (
        clk50MHz: in  std_logic;
        switch  : in  std_logic_vector(9 downto 0);
        button  : in  std_logic_vector(1 downto 0);
        led0    : out std_logic_vector(6 downto 0);
        led0_dp : out std_logic;
        led1    : out std_logic_vector(6 downto 0);
        led1_dp : out std_logic;
        led2    : out std_logic_vector(6 downto 0);
        led2_dp : out std_logic;
        led3    : out std_logic_vector(6 downto 0);
        led3_dp : out std_logic;
        led4    : out std_logic_vector(6 downto 0);
        led4_dp : out std_logic;
        led5    : out std_logic_vector(6 downto 0);
        led5_dp : out std_logic
        );
end top_level;

architecture str of top_level is
    signal switches       : std_logic_vector(31 downto 0);
    signal rst            : std_logic;
    signal inport0_en     : std_logic;
    signal inport1_en     : std_logic;
    signal Outport        : std_logic_vector(31 downto 0);

    component decoder7seg
        port (
            input  : in  std_logic_vector(3 downto 0);
            output : out std_logic_vector(6 downto 0));
    end component;

    begin
        
        rst <= not button(0);
        
        process(switch(8))
        begin
        if(switch(8) = '1') then
            if(switch(9) = '0') then
                inport0_en <= '1';
                inport1_en <= '0';
            else
                inport1_en <= '1';
                inport0_en <= '0';
            end if;
        else
            inport0_en <= '0';
            inport1_en <= '0';
        end if;
        end process;

        switches <= "000000000000000000000000" & switch(7 downto 0);

        U_MIPS: entity work.all_together
        port map(
            clk         => clk50MHz,
            rst         => rst,
            inport0_en  => inport0_en,
            inport1_en  => inport1_en,
            switches    => switches,
            outPort     => Outport
        );

        U_LED5 : decoder7seg port map (
            input  => Outport(23 downto 20),
            output => led5);

        U_LED4 : decoder7seg port map (
            input  => Outport(19 downto 16),
            output => led4);

        U_LED3 : decoder7seg port map (
            input  => Outport(15 downto 12),
            output => led3);
    
        U_LED2 : decoder7seg port map (
            input  => Outport(11 downto 8),
            output => led2);
        
        U_LED1 : decoder7seg port map (
            input  => Outport(7 downto 4),
            output => led1);
    
        U_LED0 : decoder7seg port map (
            input  => Outport(3 downto 0),
            output => led0);

            led3_dp <= '1';
            led2_dp <= '1';
            led1_dp <= '1';
            led0_dp <= '1';
            led4_dp <= '1';
            led5_dp <= '1';


    end str;