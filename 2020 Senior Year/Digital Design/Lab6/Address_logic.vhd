library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGA_LIB.all;

entity logic is
    port(
        Hcount      : in std_logic_vector(9 downto 0);
        Vcount      : in std_logic_vector(9 downto 0);
        Video_On    : in std_logic;
        Position    : in std_logic_vector(2 downto 0); --which button is pressed
        Address     : out std_logic_vector(11 downto 0));
end logic;

architecture BHV of logic is

        signal down : integer range 0 to 639; --how far down to go
        signal right : integer range 0 to 479; --how far right to go

begin
    process(Hcount, Vcount, Video_On, Position)
    begin

        if(Video_On = '1')then
            case Position is
                when "000" =>
                    if(unsigned(Hcount) < 255 OR unsigned(Hcount) > 383 OR unsigned(Vcount) < 175 OR unsigned(Vcount) > 303)then
                        right <= 0;
                        down <= 0;
                    else
                        right   <= to_integer(unsigned(Hcount)) - 255;
                        down    <= to_integer(unsigned(Vcount)) - 175;
                    end if;

                when "001" =>
                    if(unsigned(Hcount) > 127 OR  unsigned(Vcount) > 127)then
                        right <= 0;
                        down <= 0;
                    else
                        right   <= to_integer(unsigned(Hcount));
                        down    <= to_integer(unsigned(Vcount));
                    end if;

                when "010" =>
                    if(unsigned(Hcount) < 511 OR unsigned(Vcount) > 127)then
                        right <= 0;
                        down <= 0;
                    else
                        right   <= to_integer(unsigned(Hcount)) - 511;
                        down    <= to_integer(unsigned(Vcount));
                    end if;

                when "011" =>
                    if(unsigned(Hcount) > 127 OR unsigned(Vcount) < 351)then
                        right <= 0;
                        down <= 0;
                    else
                        right   <= to_integer(unsigned(Hcount));
                        down    <= to_integer(unsigned(Vcount)) - 351;
                    end if;

                when "100" =>
                    if(unsigned(Hcount) < 511 OR unsigned(Vcount) < 351)then
                        right <= 0;
                        down <= 0;
                    else
                        right   <= to_integer(unsigned(Hcount)) - 511;
                        down    <= to_integer(unsigned(Vcount)) - 351;
                    end if;

                when others =>
                    Address <= (OTHERS => '0');
            end case;
        
            Address <= std_logic_vector(to_unsigned((right*down), 12));
        end if;
   
    end process;

end BHV;