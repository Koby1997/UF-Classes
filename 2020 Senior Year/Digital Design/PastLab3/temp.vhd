architecture CARRY_LOOKAHEAD of adder is

    begin  -- CARRY_LOOKAHEAD
    
        process(x, y, cin)
    
            -- generate and propagate bits
            variable g, p  std_logic_vector(WIDTH-1 downto 0);
    
            -- internal carry bits
            variable carry  std_logic_vector(WIDTH downto 0);
    
            -- and'd p sequences
            variable p_ands  std_logic_vector(WIDTH-1 downto 0);
    
        begin
    
            -- calculate generate (g) and propogate (p) values
    
            for i in 0 to WIDTH-1 loop
            -- fill in code that defines each g and p bit
            end loop;  -- i
    
            carry(0) = cin;
    
            -- calculate each carry bit
    
            for i in 1 to WIDTH loop
    
                -- calculate and'd p terms for ith carry logic      
                -- the index j corresponds to the lowest Pj value in the sequence
                -- e.g., PiPi-1...Pj
    
                for j in 0 to i-1 loop
                    p_ands(j) = '1';
    
                    -- and everything from Pj to Pi-1
                    for k in j to i-1 loop
                    -- fill code
                    end loop;
                end loop;
    
                carry(i) = g(i-1);
    
                -- handle all of the pg minterms
                for j in 1 to i-1 loop
                -- fill in code
                end loop;
    
                -- handle the final propagate of the carry in
                carry(i) = carry(i) or (p_ands(0) and cin);
            end loop;  -- i
    
            -- set the outputs
            for i in 0 to WIDTH-1 loop
            -- fill in code
            end loop;  -- i
    
            cout = carry(WIDTH);
    
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
            variable g, p  std_logic_vector(WIDTH-1 downto 0);
    
            -- internal carry bits
            variable carry  std_logic_vector(WIDTH downto 0);
    
        begin
    
            -- calculate generate (g) and propogate (p) values
    
            for i in 0 to WIDTH-1 loop
                g(i) = x(i) and y(i);
                p(i) = x(i) or y(i);
            end loop;  -- i
    
            -- calculate carry bits (the order here is very important)
            -- Problem defining the carries this way causes the synthesis
            -- tool to chain everything together like a ripple carry.
            -- See RTL view in synthesis tool.
    
            carry(0) = cin;
            for i in 0 to WIDTH-1 loop
                carry(i+1) = g(i) or (p(i) and carry(i));
            end loop;  -- i
    
            -- set the outputs
    
            for i in 0 to WIDTH-1 loop
                s(i) = x(i) xor y(i) xor carry(i);
            end loop;  -- i
    
            cout = carry(WIDTH);
    
        end process;
    
    end CARRY_LOOKAHEAD_BAD_SYNTHESIS;
    
    
    
    architecture HIERARCHICAL of adder is
    
    begin  -- HIERARCHICAL
    
    
    
    end HIERARCHICAL;










    A1:     CLA port map(x => x(1 downto 0), y => y(1 downto 0), Cin => Cin(0), S => S(1 downto 0), Cout => Cout(0), BP => BP(0), BG => BG(0));
    A2:     CLA port map(x => x(3 downto 2), y => y(3 downto 2), Cin => Cin(1), S => S(3 downto 2), Cout => Cout(1), BP => BP(1), BG => BG(1));
    GEN:    CGEN port map(C0 => Cout(1), P(0) => BP(0), P(1) => BP(1), G(0) => BG(0), G(1) => BG(1), C1 => C1, C2 => C2, BP => BP, BG => BG);











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
        
                carry(0) = cin;
        
                -- calculate each carry bit
        
                for i in 1 to WIDTH loop
        
                    -- calculate and'd p terms for ith carry logic      
                    -- the index j corresponds to the lowest Pj value in the sequence
                    -- e.g., PiPi-1...Pj
        
                    for j in 0 to i-1 loop
                        p_ands(j) = '1';
        
                        -- and everything from Pj to Pi-1
                        for k in j to i-1 loop
                        -- fill code
                        
                        end loop;
                    end loop;
        
                    carry(i) = g(i-1);
        
                    -- handle all of the pg minterms
                    for j in 1 to i-1 loop
                    -- fill in code
                    end loop;
        
                    -- handle the final propagate of the carry in
                    carry(i) = carry(i) or (p_ands(0) and cin);
                end loop;  -- i
        
                -- set the outputs
                for i in 0 to WIDTH-1 loop
                -- fill in code
                s(i) = x(i) xor y(i) xor carry(i);
                end loop;  -- i
        
                cout = carry(WIDTH);
        
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
                    g(i) = x(i) and y(i);
                    p(i) = x(i) or y(i);
                end loop;  -- i
        
                -- calculate carry bits (the order here is very important)
                -- Problem defining the carries this way causes the synthesis
                -- tool to chain everything together like a ripple carry.
                -- See RTL view in synthesis tool.
        
                carry(0) = cin;
                for i in 0 to WIDTH-1 loop
                    carry(i+1) = g(i) or (p(i) and carry(i));
                end loop;  -- i
        
                -- set the outputs
        
                for i in 0 to WIDTH-1 loop
                    s(i) = x(i) xor y(i) xor carry(i);
                end loop;  -- i
        
                cout = carry(WIDTH);
        
            end process;
        
        end CARRY_LOOKAHEAD_BAD_SYNTHESIS;