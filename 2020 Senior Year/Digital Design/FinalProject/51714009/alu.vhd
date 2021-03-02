library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity alu is
    generic (
        WIDTH : positive := 32
    );
    port (
        input1  : in std_logic_vector(WIDTH-1 downto 0);
        input2  : in std_logic_vector(WIDTH-1 downto 0);
        sel     : in std_logic_vector(5 downto 0);
        shift_amount : in std_logic_vector(4 downto 0);
        result  : out std_logic_vector(WIDTH-1 downto 0);
        result_hi: out std_logic_vector(WIDTH-1 downto 0);
        branch  : out std_logic
    );
end alu;

architecture BHV of alu is 
    --put signals here

begin

    process(input1, input2, sel, shift_amount)
        variable tempMath : std_logic_vector(63 downto 0);
        -- variable tempShiftLeft : unsigned(WIDTH-1 downto 0);
        -- variable tempAddOne : unsigned(WIDTH-1 downto 0);
        variable tempshift_amount : unsigned(4 downto 0);
        variable tempshift: unsigned(WIDTH-1 downto 0);


    begin
        branch <= '0';  -- defaults to avoid latches
        result <= (OTHERS => '0');
        result_hi <= (OTHERS => '0');

        case sel is
            when addU => -- add unsinged
                tempMath := std_logic_vector(resize(unsigned(input1), 64) + resize(unsigned(input2), 64));
                result      <= tempMath(31 downto 0);
                result_hi   <= tempMath(63 downto 32);

            when addIU => -- add immediate unsinged
                tempMath := std_logic_vector(resize(unsigned(input1), 64) + resize(unsigned(input2), 64));
                result      <= tempMath(31 downto 0);
                result_hi   <= tempMath(63 downto 32);

            when subU => -- sub unsigned
                tempMath := std_logic_vector(resize(unsigned(input1), 64) - resize(unsigned(input2), 64));
                result      <= tempMath(31 downto 0);
                result_hi   <= tempMath(63 downto 32);

            when subIU => -- sub Immediate unsigned
                tempMath := std_logic_vector(resize(unsigned(input1), 64) - resize(unsigned(input2), 64));
                result      <= tempMath(31 downto 0);
                result_hi   <= tempMath(63 downto 32);    

            when multS => -- multiply signed
                tempMath := std_logic_vector(signed(input1) * signed(input2));
                result      <= tempMath(31 downto 0);
                result_hi   <= tempMath(63 downto 32);
                
            when multU => -- multiply unsigned
                tempMath := std_logic_vector(unsigned(input1) * unsigned(input2));
                result      <= tempMath(31 downto 0);
                result_hi   <= tempMath(63 downto 32);

            when andR =>
                result <= input1 AND input2;

            when andI =>
                result <= input1 AND input2;

            when orR =>
                result <= input1 OR input2;

            when orI =>
                result <= input1 OR input2;

            when xorR =>
                result <= input1 XOR input2;

            when xorI =>
                result <= input1 XOR input2;

            when srLog => -- shift right logical
            result <= std_logic_vector(shift_right(unsigned(input2), to_integer(unsigned(shift_amount))));

            when slLog => -- shift left logical
            result <= std_logic_vector(shift_left(unsigned(input2), to_integer(unsigned(shift_amount))));

            when srArith => -- shift right arithmetic
            result <= std_logic_vector(shift_right(signed(input2), to_integer(unsigned(shift_amount))));
                

            when sltS => -- set on less than Signed
                if(signed(input1) < signed(input2)) then
                    result <= std_logic_vector(to_unsigned(1,32));
                end if;

            when sltIS => -- set on less than Immediate Signed
                if(signed(input1) < signed(input2)) then
                    result <= std_logic_vector(to_unsigned(1,32));
                end if;

            when sltIU => -- set on less than Immediate Unsigned
                if(unsigned(input1) < unsigned(input2)) then
                    result <= std_logic_vector(to_unsigned(1,32));
                end if;

            when sltU => -- set on less than Unsigned
                if(unsigned(input1) < unsigned(input2)) then
                    result <= std_logic_vector(to_unsigned(1,32));
                end if;

            when mfHi => -- Move from Hi
                result <= (OTHERS => '0');
                result(0) <= '1';

            when mfLo => -- Move from Lo
                result <= (OTHERS => '0');
            
            when beq => -- Branch if = 0
                if(unsigned(input1) = unsigned(input2))then
                    branch <= '1';
                else
                    branch <= '0';
                end if;

            when bneq => -- Branch if /= 0
                if(unsigned(input1) /= unsigned(input2))then
                    branch <= '1';
                else
                    branch <= '0';
                end if;

            when blt_eq0 => -- Branch if <= 0
                if(unsigned(input1) <= 0)then
                    branch <= '1';
                else
                    branch <= '0';
                end if;

            when bgt0 => --Branch if > 0
                if(unsigned(input1) > 0)then
                    branch <= '1';
                else
                    branch <= '0';
                end if;

            when blt0 => --Branch if < 0
                if(unsigned(input1) < 0)then
                    branch <= '1';
                else
                    branch <= '0';
                end if;

            when bgt_eq0 => --Branch if >= 0
                if(unsigned(input1) >= 0)then
                    branch <= '1';
                else
                    branch <= '0';
                end if;
                
            when others =>
                result <= (OTHERS => '0');
        end case;
    end process;
end BHV;