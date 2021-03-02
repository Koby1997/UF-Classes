library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is 
    generic (
        WIDTH :     positive := 32);
    port (
        clk         : in std_logic;
        rst         : in std_logic;
        inport0en   : in std_logic;
        inport1en   : in std_logic;
        addr        : in std_logic_vector(31 downto 0);
        switches    : in std_logic_vector(31 downto 0);
        wrdata      : in std_logic_vector(31 downto 0);
        MemWrite    : in std_logic;
        Outport     : out std_logic_vector(31 downto 0);
        rdata       : out std_logic_vector(31 downto 0));
end memory;


architecture str of memory is

    --here is where middle signals go
    signal INPORT0_OUT      : std_logic_vector(31 downto 0);
    signal INPORT1_OUT      : std_logic_vector(31 downto 0);
    signal RAM_OUT          : std_logic_vector(31 downto 0);
    signal SEL_REG_OUT      : std_logic_vector( 1 downto 0);
    signal MEM_LOGIC_OUTPORT_OUT : std_logic;
    signal MEM_LOGIC_RAM_OUT: std_logic;
    signal MEM_LOGIC_SEL_OUT: std_logic_vector( 1 downto 0);




begin

    INPORT0 : entity work.reg
        generic map (
            WIDTH  => 32)
        port map (
            clk    => clk,
            rst    => '0', -- never gets reset
            enable => inport0en,
            input  => switches,
            output => INPORT0_OUT);

    INPORT1 : entity work.reg
        generic map (
            WIDTH  => 32)
        port map (
            clk    => clk,
            rst    => '0', -- never gets reset
            enable => inport1en,
            input  => switches,
            output => INPORT1_OUT);

    OUTPORT1 : entity work.reg
        generic map (
            WIDTH  => 32)
        port map (
            clk    => clk,
            rst    => rst,
            enable => MEM_LOGIC_OUTPORT_OUT,
            input  => wrdata,
            output => Outport);

    RAM : entity work.RAM
        port map (
            address	=> addr(9 downto 2),
            clock	=> clk,
            data	=> wrdata,
            wren	=> MEM_LOGIC_RAM_OUT,
            q		=> RAM_OUT);


    MUX : entity work.mux4x1
        generic map (
            WIDTH  => 32)
        port map (
            in0    => INPORT0_OUT,
            in1    => INPORT1_OUT,
            in2    => RAM_OUT,
            in3    => "00000000000000000000000000000000", --really it is empty here
            sel    => MEM_LOGIC_SEL_OUT,
            output => rdata);

    -- SEL_REG : entity work.reg
    --     generic map (
    --         WIDTH  => 2)
    --     port map (
    --         clk    => clk,
    --         rst    => rst,
    --         enable => '1',
    --         input  => MEM_LOGIC_SEL_OUT,
    --         output => SEL_REG_OUT);

    MEM_LOGIC : entity work.memory_logic
        port map (
            clk         => clk,
            MemWrite    => MemWrite,
            addr        => addr,
            OutportWrEn => MEM_LOGIC_OUTPORT_OUT,
            RamWrEn     => MEM_LOGIC_RAM_OUT,
            sel         => MEM_LOGIC_SEL_OUT);

end str;