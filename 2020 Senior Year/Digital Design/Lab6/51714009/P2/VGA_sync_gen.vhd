library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGA_LIB.all;

entity sync_gen is
    port (
        clk         : in std_logic; --remember this is the pixel clock
        rst         : in std_logic;
        Hcount      : out std_logic_vector(9 downto 0);
        Vcount      : out std_logic_vector(9 downto 0);
        Horiz_Sync  : out std_logic;
        Vert_Sync   : out std_logic;
        Video_On    : out std_logic);
end sync_gen;

architecture BHV of sync_gen is

        --put signals here
        signal horizontal_count : integer range 0 to 639;
        signal vertical_count   : integer range 0 to 479;

begin

    process(clk, rst)
    begin

        if(rst = '1') then
            horizontal_count <= 0;
            vertical_count <= 0;
            Horiz_Sync <= '1';
            Vert_Sync <= '1';
            Video_On <= '0';
        elsif(rising_edge(clk)) then
            horizontal_count <= horizontal_count + 1;
            
            if(horizontal_count < H_DISPLAY_END AND vertical_count < V_DISPLAY_END)then
                Video_On <= '1';
            end if;


            if(horizontal_count < HSYNC_BEGIN)then
                --just count here? So do nothing
            elsif(horizontal_count = H_VERT_INC) then
                vertical_count <= vertical_count + 1;
            elsif(horizontal_count = HSYNC_END)then
                Horiz_Sync <= '0';
            elsif(horizontal_count = H_MAX) then
                horizontal_count <= 0;
            end if;



            if(vertical_count < VSYNC_BEGIN)then
                --just count here? So do nothing
            elsif(vertical_count = VSYNC_END)then
                Vert_Sync <= '0';
            elsif(vertical_count = V_MAX) then
                vertical_count <= 0;
            end if;


        end if;

    end process;

    Hcount <= std_logic_vector(to_unsigned(horizontal_count, 10));
    Vcount <= std_logic_vector(to_unsigned(vertical_count, 10)); 

end BHV;