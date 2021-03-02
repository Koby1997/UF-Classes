library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu_ns_tb is
end alu_ns_tb;

architecture TB of alu_ns_tb is

    component alu_ns

        generic (
            WIDTH : positive := 16
            );
        port (
            input1   : in  std_logic_vector(WIDTH-1 downto 0);
            input2   : in  std_logic_vector(WIDTH-1 downto 0);
            sel      : in  std_logic_vector(3 downto 0);
            output   : out std_logic_vector(WIDTH-1 downto 0);
            overflow : out std_logic
            );

    end component;

    constant WIDTH  : positive                           := 8;
    signal input1   : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal input2   : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal sel      : std_logic_vector(3 downto 0)       := (others => '0');
    signal output   : std_logic_vector(WIDTH-1 downto 0);
    signal overflow : std_logic;

    --signal oddInput : std_logic_vector(WIDTH-2 downto 0) := (others => '0');

begin  -- TB

    UUT : alu_ns
        generic map (WIDTH => WIDTH)
        port map (
            input1   => input1,
            input2   => input2,
            sel      => sel,
            output   => output,
            overflow => overflow);

    process
    begin

        -- test 2+6 (no overflow)
        sel    <= "0000";
        input1 <= conv_std_logic_vector(2, input1'length); --00000010
        input2 <= conv_std_logic_vector(6, input2'length); --00000110
        wait for 40 ns;
        assert(output = conv_std_logic_vector(8, output'length)) report "Error : 2+6 = " & integer'image(conv_integer(output)) & " instead of 8" severity warning;
        assert(overflow = '0') report "Error                                   : overflow incorrect for 2+8" severity warning;

        -- test 250+50 (with overflow)
        sel    <= "0000";
        input1 <= conv_std_logic_vector(250, input1'length);
        input2 <= conv_std_logic_vector(50, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(300, output'length)) report "Error : 250+50 = " & integer'image(conv_integer(output)) & " instead of 44" severity warning;
        assert(overflow = '1') report "Error                                     : overflow incorrect for 250+50" severity warning;
--------------------------------------------------------------------------------------------------------------------------


        -- test 32 - 31
        sel    <= "0001";
        input1 <= conv_std_logic_vector(32, input1'length);
        input2 <= conv_std_logic_vector(31, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(1, output'length)) report "Error : 32 - 31 = " & integer'image(conv_integer(output)) & " instead of 1" severity warning;
        assert(overflow = '0') report "Error                                   : overflow incorrect for 32 - 31" severity warning;

        -- test 250 - 50
        sel    <= "0001";
        input1 <= conv_std_logic_vector(250, input1'length);
        input2 <= conv_std_logic_vector(50, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(200, output'length)) report "Error : 250-50 = " & integer'image(conv_integer(output)) & " instead of 200" severity warning;
        assert(overflow = '0') report "Error                                     : overflow incorrect for 250-50" severity warning;

        -- test 5 - 10
        sel    <= "0001";
        input1 <= conv_std_logic_vector(5, input1'length);
        input2 <= conv_std_logic_vector(10, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(251, output'length)) report "Error : 5-10 = " & integer'image(conv_integer(output)) & " instead of 251" severity warning;
        assert(overflow = '0') report "Error                                     : overflow incorrect for 5-10" severity warning;

        -- test 0 - 1
        sel    <= "0001";
        input1 <= conv_std_logic_vector(0, input1'length);
        input2 <= conv_std_logic_vector(1, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(255, output'length)) report "Error : 0-255 = " & integer'image(conv_integer(output)) & " instead of 255" severity warning;
        assert(overflow = '0') report "Error                                     : overflow incorrect for 0-255" severity warning;

        -- test 0 - 255
        sel    <= "0001";
        input1 <= conv_std_logic_vector(0, input1'length);
        input2 <= conv_std_logic_vector(255, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(1, output'length)) report "Error : 0-255 = " & integer'image(conv_integer(output)) & " instead of 1" severity warning;
        assert(overflow = '0') report "Error                                     : overflow incorrect for 0-255" severity warning;
--------------------------------------------------------------------------------------------------------------------------


        -- test 5*6
        sel    <= "0010";
        input1 <= conv_std_logic_vector(5, input1'length);
        input2 <= conv_std_logic_vector(6, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(30, output'length)) report "Error : 5*6 = " & integer'image(conv_integer(output)) & " instead of 30" severity warning;
        assert(overflow = '0') report "Error                                    : overflow incorrect for 5*6" severity warning;
        
        -- test 50*60
        sel    <= "0010";
        input1 <= conv_std_logic_vector(64, input1'length);
        input2 <= conv_std_logic_vector(64, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(4096, output'length)) report "Error : 64*64 = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '1') report "Error                                      : overflow incorrect for 64*64" severity warning;
        
        -- add many more tests


        -- test 64*64
        sel    <= "0010";
        input1 <= conv_std_logic_vector(64, input1'length);
        input2 <= conv_std_logic_vector(64, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(4096, output'length)) report "Error : 64*64 = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '1') report "Error                                      : overflow incorrect for 64*64" severity warning;

        ------------------------------------------------------------------------------------------------------------------------


        -- test 32 AND 31 
        sel    <= "0011";
        input1 <= conv_std_logic_vector(32, input1'length); --100000 and 011111
        input2 <= conv_std_logic_vector(31, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(0, output'length)) report "Error : 32 AND 31 = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 32 AND 31." severity warning;

        -- test 21 AND 7
        sel    <= "0011";
        input1 <= conv_std_logic_vector(21, input1'length); --10101
        input2 <= conv_std_logic_vector(7, input2'length);  --00111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(5, output'length)) report "Error : 21 AND 7 = " & integer'image(conv_integer(output)) & " instead of 5" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 21 AND 7." severity warning;

        -- test 255 AND 255
        sel    <= "0011";
        input1 <= conv_std_logic_vector(255, input1'length); --11111111
        input2 <= conv_std_logic_vector(255, input2'length); --11111111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(255, output'length)) report "Error : 255 AND 255 = " & integer'image(conv_integer(output)) & " instead of 127" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 255 AND 255." severity warning;
--------------------------------------------------------------------------------------------------------------------------


        -- test 32 OR 31 
        sel    <= "0100";
        input1 <= conv_std_logic_vector(32, input1'length); --100000 OR 011111
        input2 <= conv_std_logic_vector(31, input2'length);
        wait for 40 ns;
        assert(output = conv_std_logic_vector(63, output'length)) report "Error : 32 OR 31 = " & integer'image(conv_integer(output)) & " instead of 63" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 32 OR 31." severity warning;

        -- test 21 OR 7
        sel    <= "0100";
        input1 <= conv_std_logic_vector(21, input1'length); --10101
        input2 <= conv_std_logic_vector(7, input2'length);  --00111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(23, output'length)) report "Error : 21 OR 7 = " & integer'image(conv_integer(output)) & " instead of 23" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 21 OR 7." severity warning;

        -- test 255 OR 255
        sel    <= "0100";
        input1 <= conv_std_logic_vector(255, input1'length); --11111111
        input2 <= conv_std_logic_vector(255, input2'length); --11111111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(255, output'length)) report "Error : 255 OR 255 = " & integer'image(conv_integer(output)) & " instead of 127" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect form 255 OR 255." severity warning;
--------------------------------------------------------------------------------------------------------------------------


        -- test 32 XOR 31 
        sel    <= "0101";
        input1 <= conv_std_logic_vector(32, input1'length); --00100000
        input2 <= conv_std_logic_vector(31, input2'length); --00011111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(63, output'length)) report "Error : 32 XOR 31 = " & integer'image(conv_integer(output)) & " instead of 63" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 32 XOR 31." severity warning;

        -- test 21 XOR 7
        sel    <= "0101";
        input1 <= conv_std_logic_vector(21, input1'length); --00010101
        input2 <= conv_std_logic_vector(7, input2'length);  --00000111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(18, output'length)) report "Error : 21 XOR 7 = " & integer'image(conv_integer(output)) & " instead of 18" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 21 XOR 7." severity warning;

        -- test 255 XOR 255
        sel    <= "0101";
        input1 <= conv_std_logic_vector(255, input1'length); --11111111
        input2 <= conv_std_logic_vector(255, input2'length); --11111111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(0, output'length)) report "Error : 255 XOR 255 = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 255 XOR 255." severity warning;
--------------------------------------------------------------------------------------------------------------------------


        -- test 32 NOR 31 
        sel    <= "0110";
        input1 <= conv_std_logic_vector(32, input1'length); --00100000 
        input2 <= conv_std_logic_vector(31, input2'length); --00011111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(192, output'length)) report "Error : 32 NOR 31 = " & integer'image(conv_integer(output)) & " instead of 192" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 32 NOR 31." severity warning;

        -- test 21 NOR 7
        sel    <= "0110";
        input1 <= conv_std_logic_vector(21, input1'length); --00010101
        input2 <= conv_std_logic_vector(7, input2'length);  --00000111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(232, output'length)) report "Error : 21 NOR 7 = " & integer'image(conv_integer(output)) & " instead of 232" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 21 NOR 7." severity warning;

        -- test 255 NOR 255
        sel    <= "0110";
        input1 <= conv_std_logic_vector(255, input1'length); --11111111
        input2 <= conv_std_logic_vector(255, input2'length); --11111111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(0, output'length)) report "Error : 255 NOR 255 = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for 255 NOR 255." severity warning;
        --------------------------------------------------------------------------------------------------------------------------


        -- test NOT 32 
        sel    <= "0111";
        input1 <= conv_std_logic_vector(32, input1'length); --00100000
        wait for 40 ns;
        assert(output = conv_std_logic_vector(223, output'length)) report "Error : NOT 32 = " & integer'image(conv_integer(output)) & " instead of 223" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for NOT 32." severity warning;

        -- test NOT 21
        sel    <= "0111";
        input1 <= conv_std_logic_vector(21, input1'length); --00010101
        wait for 40 ns;
        assert(output = conv_std_logic_vector(234, output'length)) report "Error : NOT 21 = " & integer'image(conv_integer(output)) & " instead of 234" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for NOT 27." severity warning;

        -- test NOT 255
        sel    <= "0111";
        input1 <= conv_std_logic_vector(255, input1'length); --11111111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(0, output'length)) report "Error : NOT 255 = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for NOT 255." severity warning;
        -------------------------------------------------------------------------------------------------------------------------


        -- test shift 31 left 
        sel    <= "1000";
        input1 <= conv_std_logic_vector(31, input1'length); --00011111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(62, output'length)) report "Error : SHIFT LEFT 31 = " & integer'image(conv_integer(output)) & " instead of 62" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for SHIFT LEFT 31." severity warning;

        -- test shift 7 left
        sel    <= "1000";
        input1 <= conv_std_logic_vector(7, input1'length);  --00000111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(14, output'length)) report "Error : SHIFT LEFT 7 " & integer'image(conv_integer(output)) & " instead of 14" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for SHIFT LEFT 7." severity warning;

        -- test shift 129 left
        sel    <= "1000";
        input1 <= conv_std_logic_vector(129, input1'length);  --10000001
        wait for 40 ns;
        assert(output = conv_std_logic_vector(2, output'length)) report "Error : SHIFT LEFT 129 " & integer'image(conv_integer(output)) & " instead of 2" severity warning;
        assert(overflow = '1') report "Error                                      : overflow incorrect for SHIFT LEFT 129." severity warning;

        -- test shift 255 left
        sel    <= "1000";
        input1 <= conv_std_logic_vector(255, input1'length);  --11111111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(254, output'length)) report "Error : SHIFT LEFT 255 " & integer'image(conv_integer(output)) & " instead of 254" severity warning;
        assert(overflow = '1') report "Error                                      : overflow incorrect for SHIFT LEFT 255." severity warning;
 --------------------------------------------------------------------------------------------------------------------------


        -- test shift 31 right 
        sel    <= "1001";
        input1 <= conv_std_logic_vector(31, input1'length); --00011111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(15, output'length)) report "Error : SHIFT RIGHT 31 = " & integer'image(conv_integer(output)) & " instead of 15" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for SHIFT RIGHT 31." severity warning;

        -- test shift 7 right
        sel    <= "1001";
        input1 <= conv_std_logic_vector(7, input1'length);  --00000111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(3, output'length)) report "Error : SHIFT RIGHT 7 " & integer'image(conv_integer(output)) & " instead of 3" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for SHIFT RIGHT 7." severity warning;

        -- test shift 255 right
        sel    <= "1001";
        input1 <= conv_std_logic_vector(255, input1'length);  --1111111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(127, output'length)) report "Error : SHIFT RIGHT 255 " & integer'image(conv_integer(output)) & " instead of 127" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for SHIFT RIGHT 255." severity warning;
--------------------------------------------------------------------------------------------------------------------------

--All of these test inputs that are an EVEN WIDTH
--I don't know how to test odd inputs yet

        -- test Swap 31 
        sel    <= "1010";
        input1 <= conv_std_logic_vector(31, input1'length); --00011111
        wait for 40 ns;                                      --11110001
        assert(output = conv_std_logic_vector(241, output'length)) report "Error : SWAP 31 = " & integer'image(conv_integer(output)) & " instead of 241" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for SWAP 31." severity warning;

        -- test SWAP 40
        sel    <= "1010";
        input1 <= conv_std_logic_vector(40, input1'length);  --00101000
        wait for 40 ns;
        assert(output = conv_std_logic_vector(130, output'length)) report "Error : SWAP 40 = " & integer'image(conv_integer(output)) & " instead of 130" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for SWAP 40." severity warning;

        -- test SWAP 85
        sel    <= "1010";
        input1 <= conv_std_logic_vector(85, input1'length);  --00101000
        wait for 40 ns;
        assert(output = conv_std_logic_vector(85, output'length)) report "Error : SWAP 85 = " & integer'image(conv_integer(output)) & " instead of 85" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for SWAP 85." severity warning;

        -- test SWAP 0
        sel    <= "1010";
        input1 <= conv_std_logic_vector(0, input1'length);  --00000000
        wait for 40 ns;
        assert(output = conv_std_logic_vector(0, output'length)) report "Error : SWAP 0 = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for SWAP 0." severity warning;
--------------------------------------------------------------------------------------------------------------------------


        -- reverse 254
        sel    <= "1011";
        input1 <= conv_std_logic_vector(254, input1'length); --11111110
        wait for 40 ns;
        assert(output = conv_std_logic_vector(127, output'length)) report "Error : REVERSE 254 = " & integer'image(conv_integer(output)) & " instead of 127" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for REVERSE 254." severity warning;

        -- reverse 7
        sel    <= "1011";
        input1 <= conv_std_logic_vector(7, input1'length);  --00000111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(224, output'length)) report "Error : REVERSE 7 " & integer'image(conv_integer(output)) & " instead of 224" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for REVERSE 7." severity warning;

        -- reverse 165
        sel    <= "1011";
        input1 <= conv_std_logic_vector(165, input1'length);  --10100101
        wait for 40 ns;
        assert(output = conv_std_logic_vector(165, output'length)) report "Error : REVERSE 165 " & integer'image(conv_integer(output)) & " instead of 165" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for REVERSE 165." severity warning;
--------------------------------------------------------------------------------------------------------------------------



        --TESTING FOR THE LAST 4 SELECT LINES. EVERYTHING SHOULD BE 0

        -- sel = 1100
        sel    <= "1100";
        input1 <= conv_std_logic_vector(255, input1'length); --11111111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(0, output'length)) report "Error : sel = 1100 This should always = 0. The output = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for sel = 1100." severity warning;

        -- sel = 1101
        sel    <= "1101";
        input1 <= conv_std_logic_vector(7, input1'length);  --00000111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(0, output'length)) report "Error : sel = 1101 This should always = 0. The output = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for sel = 1101." severity warning;

        -- sel = 1110 
        sel    <= "1110";
        input1 <= conv_std_logic_vector(31, input1'length); --00011111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(0, output'length)) report "Error : sel = 1101 This should always = 0. The output = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for sel = 1110." severity warning;

        -- sel = 1111
        sel    <= "1111";
        input1 <= conv_std_logic_vector(7, input1'length);  --00000111
        wait for 40 ns;
        assert(output = conv_std_logic_vector(0, output'length)) report "Error : sel = 1101 This should always = 0. The output = " & integer'image(conv_integer(output)) & " instead of 0" severity warning;
        assert(overflow = '0') report "Error                                      : overflow incorrect for sel = 1101." severity warning;


        report "SIMULATION FINISHED!!!";
        wait;

    end process;
end TB;