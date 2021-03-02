library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity alu_sla is
    generic (
        WIDTH : positive := 16
    );
    port (
        input1 : in std_logic_vector(WIDTH-1 downto 0);
        input2 : in std_logic_vector(WIDTH-1 downto 0);
        sel : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(WIDTH-1 downto 0);
        overflow : out std_logic
);
end alu_sla;

architecture BHV of alu_sla is

begin
    process(input1, input2, sel)
        variable tempAdd : std_logic_vector(WIDTH downto 0);
        variable tempMul : std_logic_vector(2*WIDTH-1 downto 0);
        variable checkHighHalf : std_logic_vector(WIDTH-1 downto 0);

    begin
        overflow <= '0';

        case sel is
            when "0000" => --input1 + input2
                tempAdd := ('0' & input1) + ('0' & input2);
                output <= std_logic_vector(tempAdd(WIDTH-1 downto 0));
                overflow <= tempAdd(WIDTH);

            when "0001" => --input1 - input2
                output <= std_logic_vector(input1 - input2);

            when "0010" => --input1 * input2 (lower half)
                tempMul := input1 * input2;
                output <= std_logic_vector(tempMul(WIDTH-1 downto 0));

                checkHighHalf := tempMul(2*WIDTH-1 downto WIDTH);
                if(checkHighHalf > 0) then
                    overflow <= '1';
                else
                    overflow <= '0';
                end if;


            when "0011" => --input1 and input2
                output <= input1 AND input2;

            when "0100" => --input1 or input2
                output <= input1 OR input2;

            when "0101" => --input1 xor input2
                output <= input1 XOR input2;

            when "0110" => --input1 nor input2
                output <= input1 NOR input2;

            when "0111" => --not input1
                output <= NOT input1;

            when "1000" => --shift input1 left by 1 bit
                overflow <= input1(WIDTH-1);
                output <= input1(WIDTH-2 downto 0) & '0';

            when "1001" => --shift input1 right by 1 bit
                output <= '0' & input1(WIDTH-1 downto 1);

            when "1010" => --swap high-half bits of input1 with low-half
                if((WIDTH mod 2) = 1) then   --odd number of bits
                    output <= input1((((WIDTH-1)/2)-1) downto 0) & input1(WIDTH-1 downto (WIDTH-1)/2);
                else                        --even number of bits
                    output <= input1((WIDTH/2)-1 downto 0) & input1(WIDTH-1 downto WIDTH/2);
                end if;

            when "1011" => --reverse bits in input1
                for i in 0 to WIDTH-1 loop
                    output(i) <= input1((WIDTH-1)-i);
                end loop;

            when others =>
                output <= (OTHERS => '0');
        end case;
    end process;
end BHV;