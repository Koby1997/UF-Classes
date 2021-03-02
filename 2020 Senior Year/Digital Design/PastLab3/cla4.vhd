library ieee;
use ieee.std_logic_1164.all;

entity CLA4 is
    port(
        x, y    : in std_logic_vector(3 downto 0);
        Cin     : in std_logic_vector(2 downto 0);

        S       : out std_logic_vector(3 downto 0);
        Cout    : out std_logic_vector(1 downto 0);
        BP, BG  : out std_logic;
        C1, C2  : out std_logic);
        
end CLA4;

architecture BHV of CLA4 is

    signal BPS, BGS : std_logic_vector(2 downto 0);
    

    component CLA
    port (
        x, y : in std_logic_vector(1 downto 0);
        Cin : in std_logic;
        
        S : out std_logic_vector(1 downto 0);
        Cout : out std_logic;
        BP : out std_logic;
        BG : out std_logic);
    end component;

    component CGEN
    port (
        C0 : in std_logic;
        P, G : in std_logic_vector(1 downto 0);

        C1, C2, BP, BG : out std_logic);
    end component;

begin

    A1:     CLA port map(x => x(1 downto 0),
                         y => y(1 downto 0),
                         Cin => Cin(1),
                         S(1 downto 0) => S(1 downto 0),
                         Cout => Cout(0),
                         BP => BPS(0),
                         BG => BGS(0));


    A2:     CLA port map(x => x(3 downto 2),
                         y => y(3 downto 2),
                         Cin => Cin(2),
                         S(1 downto 0) => S(3 downto 2),
                         Cout => Cout(1),
                         BP => BPS(1),
                         BG => BGS(1));


    GEN:    CGEN port map(C0 => Cin(0),
                         P(0) => BPS(0),
                         P(1) => BPS(1),
                         G(0) => BGS(0),
                         G(1) => BGS(1),
                         C1 => C1,
                         C2 => C2,
                         BP => BP,
                         BG => BG);

end BHV;