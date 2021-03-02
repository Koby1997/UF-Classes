library ieee;
use ieee.std_logic_1164.all;

entity CGEN is
    port (
        C0 : in std_logic;
        P, G : in std_logic_vector(1 downto 0);
        C1, C2, BP, BG : out std_logic);
end CGEN;

architecture BHV of CGEN is

begin
BP <= P(1) and P(0);
BG <= G(1) or (P(1) and G(0));

C1 <= G(0) or (P(0) and C0);
C2 <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C0);

end BHV;