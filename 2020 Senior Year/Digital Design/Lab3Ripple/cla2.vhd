library ieee;
use ieee.std_logic_1164.all;

entity CLA is
    port (
        x, y : in std_logic_vector(1 downto 0);
        Cin : in std_logic := '0';
        
        S : out std_logic_vector(1 downto 0);
        Cout : out std_logic;
        BP : out std_logic;
        BG : out std_logic);
end CLA;

architecture BHV of CLA is

begin

    process(x,y,Cin)

        variable p1, p0, g1, g0 : std_logic; -- for finding BG and BP

        variable c : std_logic; -- for the carry when adding the 2 bit numbers

    begin

    g0 := x(0) and y(1);
    g1 := x(1) and y(1);
    p0 := x(0) or y(0);
    p1 := x(1) or y(1);

    BP <= p1 and p0;
    BG <= g1 or (p1 and g0);

    S(0) <= x(0) xor y(0) xor Cin;      -- just do full-adder logic twice
    c := (x(0) and y(0)) or (Cin and (x(0) or y(0)));

    S(1) <= x(1) xor y(1) xor c;        -- second time, but now using new carry c
    Cout <= (x(1) and y(1)) or (c and (x(1) or y(1)));

    end process;

end BHV;