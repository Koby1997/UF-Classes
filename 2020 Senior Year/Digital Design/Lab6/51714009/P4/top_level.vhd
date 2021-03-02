-- Greg Stitt
-- University of Florida

-- The following entity is the top-level entity for lab 2. No changes are
-- required, but you need to map the I/O to the appropriate pins on the
-- board. 

-- I/O Explanation (assumes the switches are on side of the
--                  board that is closest to you)
-- switch(9) is the leftmost switch
-- button(1) is the top button
-- led5 is the leftmost 7-segment LED
-- ledx_dp is the decimal point on the 7-segment LED for LED x

library ieee;
use ieee.std_logic_1164.all;

entity top_level is
    port (
        clk_50      : in std_logic;
        switch      : in  std_logic_vector(9 downto 0);
        button      : in  std_logic_vector(1 downto 0);
        v_sync      : out std_logic;
        h_sync      : out std_logic;
        Red         : out std_logic_vector(3 downto 0);
        Green       : out std_logic_vector(3 downto 0);
        Blue        : out std_logic_vector(3 downto 0));
end top_level;

architecture STR of top_level is

    component clk_gen
        port (
            clk         : in std_logic;
            pixel_clock   : out std_logic;
            rst         : in std_logic);
    end component;

    component sync_gen
        port (
            clk         : in std_logic; --remember this is the pixel clock
            rst         : in std_logic;
            Hcount      : out std_logic_vector(9 downto 0);
            Vcount      : out std_logic_vector(9 downto 0);
            Horiz_Sync  : out std_logic;
            Vert_Sync   : out std_logic;
            Video_On    : out std_logic);
        end component;

    component logic
        port(
            Hcount      : in std_logic_vector(9 downto 0);
            Vcount      : in std_logic_vector(9 downto 0);
            Video_On    : in std_logic;
            Position    : in std_logic_vector(2 downto 0);
            Address     : out std_logic_vector(11 downto 0));
    end component;

    component vga_rom
        port(
            address     : in std_logic_vector(11 downto 0);
            clock       : in std_logic := '1';
            q           : out std_logic_vector(11 downto 0));
    end component;




    signal Pclk : std_logic;
    signal Hout : std_logic_vector(9 downto 0);
    signal Vout : std_logic_vector(9 downto 0);
    signal Video_Out : std_logic;
    signal Addy : std_logic_vector(11 downto 0);
    signal Data_Out: std_logic_vector(11 downto 0);


begin  -- STR


    CLOCK_DIVIDER : clk_gen port map (
        clk         => clk_50,
        pixel_clock   => Pclk,
        rst         => button(0));


    SYNC_CONTROLLER : sync_gen port map (
        clk         => Pclk,
        rst         => button(0),
        Hcount      => Hout,
        Vcount      => Vout,
        Horiz_Sync  => h_sync,
        Vert_Sync   => v_sync,
        Video_On    => Video_Out);

    
    ADDRESS_LOGIC : logic port map(
        Hcount      => Hout,
        Vcount      => Vout,
        Video_On    => Video_Out,
        Position    => switch(2 downto 0),
        Address     => Addy);
    

    ROM : vga_rom port map(
        address     => Addy,
        clock       => Pclk,
        q           => Data_Out);

    Red <= Data_Out(11 downto 8);
    Green <= Data_Out(7 downto 4);
    Blue <= Data_Out(3 downto 0);

end STR;