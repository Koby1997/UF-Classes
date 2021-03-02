library ieee;
use ieee.std_logic_1164.all;

entity HYBRID is
    port (
        x, y    : in std_logic_vector(7 downto 0);
        cin     : in std_logic;

        s       : out std_logic_vector(7 downto 0);
        cout    : out std_logic);
end HYBRID;

architecture BHV of HYBRID is

    signal carry    : std_logic_vector(3 downto 0);


    component CLA
    port (
        x, y : in std_logic_vector(1 downto 0);
        Cin : in std_logic;

        S : out std_logic_vector(1 downto 0);
        Cout : out std_logic;
        BP : out std_logic;
        BG : out std_logic);
    end component;

begin
    
    C1: CLA port map(x => x(1 downto 0), y => y(1 downto 0), Cin => carry(0),
                     S => s(1 downto 0), Cout => carry(1));

    C2: CLA port map(x => x(3 downto 2), y => y(3 downto 2), Cin => carry(1),
                     S => s(3 downto 2), Cout => carry(2));

    C3: CLA port map(x => x(5 downto 4), y => y(5 downto 4), Cin => carry(2),
                     S => s(5 downto 4), Cout => carry(3));

    C4: CLA port map(x => x(7 downto 6), y => y(7 downto 6), Cin => carry(3),
                     S => s(7 downto 6), Cout => cout);

end BHV;