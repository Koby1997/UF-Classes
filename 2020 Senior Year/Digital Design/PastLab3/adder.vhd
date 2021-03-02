library ieee;
use ieee.std_logic_1164.all;

entity adder is
    generic (
        WIDTH : positive := 8); 
    port (
        x, y  : in  std_logic_vector(WIDTH-1 downto 0);
        cin   : in  std_logic;
        s     : out std_logic_vector(WIDTH-1 downto 0);
        cout  : out std_logic);
end adder;

architecture RIPPLE_CARRY of adder is

    component fa
    port (
        x    : in  std_logic;
        y    : in  std_logic;
        cin  : in  std_logic;
        s    : out std_logic;
        cout : out std_logic);
    end component;

    signal CO : std_logic_vector(1 to WIDTH-1);
    
begin  -- RIPPLE_CARRY
    FA_0: fa port map (x(0), y(0), cin, s(0), CO(1));

    GEN: for i in 1 to WIDTH-2 generate
        FA_i: fa port map (x(i), y(i), CO(i), s(i), CO(i+1));
    end generate;
        FA_WIDTH: fa port map (x(WIDTH-1), y(WIDTH-1), CO(WIDTH-1), s(WIDTH-1), cout);

end RIPPLE_CARRY;





architecture HIERARCHICAL of adder is
    
    signal carry        : std_logic_vector(5 downto 0);
    signal CS           : std_logic_vector(3 downto 0);
    signal BPS, BGS     : std_logic_vector(1 downto 0);
    signal Couts        : std_logic_vector(5 downto 0);

    signal outputs      : std_logic_vector(3 downto 0);

    component CLA4
    port(
        x, y    : in std_logic_vector(3 downto 0);
        Cin     : in std_logic_vector(2 downto 0);

        S       : out std_logic_vector(3 downto 0);
        Cout    : out std_logic_vector(1 downto 0);
        BP, BG  : out std_logic;
        C1, C2  : out std_logic);
    end component;

    component CGEN
    port (
        C0 : in std_logic;
        P, G : in std_logic_vector(1 downto 0);

        C1, C2, BP, BG : out std_logic);
    end component;

    begin  -- HIERARCHICAL

    A1:     CLA4 port map(x => x(3 downto 0),
                        y => y(3 downto 0),
                        Cin(0) => Cin,
                        Cin(2 downto 1) => carry(1 downto 0),
                        S(3 downto 0) => s(3 downto 0), --outs
                        Cout(1 downto 0) => Couts(1 downto 0),
                        BP => BPS(0),
                        BG => BGS(0),
                        C1 => CS(0),
                        C2 => CS(1));

    
    G1:     CGEN port map(C0 => Cin,
                        P(0) => BPS(0),
                        P(1) => BPS(1),
                        G(0) => BGS(0),
                        G(1) => BGS(1),
                        C1 => cout,
                        C2 => outputs(1),
                        BP => outputs(2),
                        BG => outputs(3));


    A2:     CLA4 port map(x => x(7 downto 4),
                        y => y(7 downto 4),
                        Cin(0) => carry(1),
                        Cin(2 downto 1) => carry (3 downto 2),
                        S(3 downto 0) => s(7 downto 4),
                        Cout(0) => Couts(2),
                        Cout(1) => cout,
                        BP => BPS(1),
                        BG => BGS(1),
                        C1 => CS(2),
                        C2 => CS(3));

    end HIERARCHICAL;


    architecture CARRY_LOOKAHEAD of adder is

        begin  -- CARRY_LOOKAHEAD
        
            process(x, y, cin)
        
                -- generate and propagate bits
                variable g, p : std_logic_vector(WIDTH-1 downto 0);
        
                -- internal carry bits
                variable carry : std_logic_vector(WIDTH downto 0);
        
                -- and'd p sequences
                variable p_ands : std_logic_vector(WIDTH-1 downto 0);
        
            begin
        
                -- calculate generate (g) and propogate (p) values            
        
                for i in 0 to WIDTH-1 loop
                -- fill in code that defines each g and p bit
                    g(i) := x(i) and y(i);
                    p(i) := x(i) or y(i);
                end loop;  -- i
        
                carry(0) := cin;
        
                -- calculate each carry bit
        
                for i in 1 to WIDTH loop
        
                    -- calculate and'd p terms for ith carry logic      
                    -- the index j corresponds to the lowest Pj value in the sequence
                    -- e.g., PiPi-1...Pj
        
                    for j in 0 to i-1 loop
                        p_ands(j) := '1';
        
                        -- and everything from Pj to Pi-1
                        for k in j to i-1 loop
                        -- fill code
                        p_ands(j) := p_ands(j) and p(k);
                        
                        end loop;
                    end loop;
        
                    carry(i) := g(i-1);
        
                    -- handle all of the pg minterms
                    for j in 1 to i-1 loop
                    -- fill in code
                    carry(i) := carry(i) or (g(j-1) and p_ands(j)); 
                    end loop;
        
                    -- handle the final propagate of the carry in
                    carry(i) := carry(i) or (p_ands(0) and cin);
                end loop;  -- i
        
                -- set the outputs
                for i in 0 to WIDTH-1 loop
                -- fill in code
                s(i) <= x(i) xor y(i) xor carry(i);
                end loop;  -- i
        
                cout <= carry(WIDTH);
        
            end process;
        
        end CARRY_LOOKAHEAD;
        
        
        -- You don't have to change any of the code for the following
        -- architecture. However, read the lab instructions to create
        -- an RTL schematic of this entity so you can see how the
        -- synthesized circuit differs from the previous carry
        -- lookahead circuit.
        
        architecture CARRY_LOOKAHEAD_BAD_SYNTHESIS of adder is
        begin  -- CARRY_LOOKAHEAD_BAD_SYNTHESIS
        
            process(x, y, cin)
        
                -- generate and propagate bits
                variable g, p : std_logic_vector(WIDTH-1 downto 0);
        
                -- internal carry bits
                variable carry : std_logic_vector(WIDTH downto 0);
        
            begin
        
                -- calculate generate (g) and propogate (p) values
        
                for i in 0 to WIDTH-1 loop
                    g(i) := x(i) and y(i);
                    p(i) := x(i) or y(i);
                end loop;  -- i
        
                -- calculate carry bits (the order here is very important)
                -- Problem defining the carries this way causes the synthesis
                -- tool to chain everything together like a ripple carry.
                -- See RTL view in synthesis tool.
        
                carry(0) := cin;
                for i in 0 to WIDTH-1 loop
                    carry(i+1) := g(i) or (p(i) and carry(i));
                end loop;  -- i
        
                -- set the outputs
        
                for i in 0 to WIDTH-1 loop
                    s(i) <= x(i) xor y(i) xor carry(i);
                end loop;  -- i
        
                cout <= carry(WIDTH);
        
            end process;
        
        end CARRY_LOOKAHEAD_BAD_SYNTHESIS;