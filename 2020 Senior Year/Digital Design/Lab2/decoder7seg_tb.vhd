library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder7seg_tb is
end decoder7seg_tb;

architecture TB of decoder7seg_tb is
    signal input : std_logic_vector(3 downto 0);
    signal output : std_logic_vector(6 downto 0);

begin  -- TB

    UUT : entity work.decoder7seg
        port map (
            input    => input,
            output   => output);
    
    process
    begin

        input <= "0000";
        wait for 10 ns;
        assert(output = "1000000") report "0 is incorrect";

        input <= "0001";
        wait for 10 ns;
        assert(output = "1111001") report "1 is incorrect";

        input <= "0010";
        wait for 10 ns;
        assert(output = "0100100") report "2 is incorrect";

        input <= "0011";
        wait for 10 ns;
        assert(output = "0110000") report "3 is incorrect";

        input <= "0100";
        wait for 10 ns;
        assert(output = "0011001") report "4 is incorrect";

        input <= "0101";
        wait for 10 ns;
        assert(output = "0010010") report "5 is incorrect";

        input <= "0110";
        wait for 10 ns;
        assert(output = "0000010") report "6 is incorrect";

        input <= "0111";
        wait for 10 ns;
        assert(output = "1111000") report "7 is incorrect";

        input <= "1000";
        wait for 10 ns;
        assert(output = "0000000") report "8 is incorrect";

        input <= "1001";
        wait for 10 ns;
        assert(output = "0011000") report "9 is incorrect";

        input <= "1010";
        wait for 10 ns;
        assert(output = "0001000") report "A is incorrect";

        input <= "1011";
        wait for 10 ns;
        assert(output = "0000011") report "B is incorrect";

        input <= "1100";
        wait for 10 ns;
        assert(output = "1000110") report "C is incorrect";

        input <= "1101";
        wait for 10 ns;
        assert(output = "0100001") report "D is incorrect";

        input <= "1110";
        wait for 10 ns;
        assert(output = "0000110") report "E is incorrect";

        input <= "1111";
        wait for 10 ns;
        assert(output = "0001110") report "F is incorrect";

        report "SIMULATION FINISHED!";

        wait;

    end process;

end TB;

-- & integer'image(to_integer(unsigned(output)));
-- put this after to find what output is and compare
-- to the chart in the lab document