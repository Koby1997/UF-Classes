library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu_tb is
end alu_tb;

architecture TB of alu_tb is

    component alu

        generic (
            WIDTH : positive := 32
            );
        port (
            input1  : in  std_logic_vector(WIDTH-1 downto 0);
            input2  : in  std_logic_vector(WIDTH-1 downto 0);
            sel     : in  std_logic_vector(4 downto 0);
            shift_amount : in std_logic_vector(4 downto 0);
            result  : out std_logic_vector(WIDTH-1 downto 0);
            result_hi: out std_logic_vector(WIDTH-1 downto 0);
            branch  : out std_logic
            );

    end component;

    constant WIDTH  : positive                           := 32;
    signal input1   : std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
    signal input2   : std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
    signal sel      : std_logic_vector(4 downto 0)       := (OTHERS => '0');
    signal shift_amount : std_logic_vector(4 downto 0)   := (OTHERS => '0');
    signal result   : std_logic_vector(WIDTH-1 downto 0);
    signal result_hi: std_logic_vector(WIDTH-1 downto 0);
    signal branch   : std_logic;

begin  -- TB

    UUT : alu
        generic map (WIDTH => WIDTH)
        port map (
            input1   => input1,
            input2   => input2,
            sel      => sel,
            shift_amount => shift_amount,
            result   => result,
            result_hi=> result_hi,
            branch   => branch);

    process
    begin

        -- test 10+15
        sel    <= "00000";
        input1 <= conv_std_logic_vector(10, input1'length);
        input2 <= conv_std_logic_vector(15, input2'length);
        wait for 40 ns;
        assert(result = conv_std_logic_vector(25, result'length)) report "Error : 10+15 = " & integer'image(conv_integer(result)) & " instead of 25" severity warning;

--------------------------------------------------------------------------------------------------------------------------

        -- test 25 - 10
        sel    <= "00001";
        input1 <= conv_std_logic_vector(25, input1'length);
        input2 <= conv_std_logic_vector(10, input2'length);
        wait for 40 ns;
        assert(result = conv_std_logic_vector(15, result'length)) report "Error : 25 - 10 = " & integer'image(conv_integer(result)) & " instead of 15" severity warning;

--------------------------------------------------------------------------------------------------------------------------

        -- test 10 * -4 (signed)
        sel    <= "00010";
        input1 <= conv_std_logic_vector(10, input1'length);
        input2 <= "11111111111111111111111111111100";--   -4
        wait for 40 ns;
        assert(result = "11111111111111111111111111011000") report "Error : LO OF 10 * -4 = " & integer'image(conv_integer(result)) & " instead of -40" severity warning;
        assert(result_hi = "11111111111111111111111111111111") report "Error : HI OF : 10 * -4 = " & integer'image(conv_integer(result_hi)) & " instead of -1" severity warning;
        
        -- test 65536 * 131072
        sel    <= "00011";
        input1 <= conv_std_logic_vector(65536, input1'length);
        input2 <= conv_std_logic_vector(131072, input2'length);
        wait for 40 ns;
        assert(result = conv_std_logic_vector(0, result'length)) report "Error : 65536 * 131072 = " & integer'image(conv_integer(result)) & " instead of 0" severity warning;
        assert(result_hi = conv_std_logic_vector(2, result_hi'length)) report "Error : HI OF : 65536 * 131072 = " & integer'image(conv_integer(result_hi)) & " instead of 2" severity warning;

        ------------------------------------------------------------------------------------------------------------------------


        -- test 65535 AND 4294906420 
        sel    <= "00100";
        input1 <= conv_std_logic_vector(65535, input1'length);
        input2 <= "11111111111111110001001000110100";--4294906420
        wait for 40 ns;
        assert(result = conv_std_logic_vector(4660, result'length)) report "Error : 65535 AND 4294906420  = " & integer'image(conv_integer(result)) & " instead of 4660" severity warning;

        -------------------------------------------------------------------------------------------------------------------------


        -- test LSR 15 by 4
        sel    <= "00111";
        input1 <= conv_std_logic_vector(15, input1'length);
        shift_amount <= conv_std_logic_vector(4, shift_amount'length);
        wait for 40 ns;
        assert(result = conv_std_logic_vector(0, result'length)) report "Error : LSR 15 by 4 = " & integer'image(conv_integer(result)) & " instead of 0" severity warning;

        --------------------------------------------------------------------------------------------------------------------------
        

        -- test ASR 4026531848 by 1    0xF0000008
        sel    <= "01000";
        input1 <= "11110000000000000000000000001000";--4026531848
        shift_amount <= conv_std_logic_vector(1, shift_amount'length);
        wait for 40 ns;--below is 4160749572
        assert(result = "11111000000000000000000000000100") report "Error : ASR 4026531848 = " & integer'image(conv_integer(result)) & " instead of 4160749572" severity warning;

        -- test ASR 8 by 1    0x00000008
        sel    <= "01000";
        input1 <= conv_std_logic_vector(8, input1'length);
        shift_amount <= conv_std_logic_vector(1, shift_amount'length);
        wait for 40 ns;
        assert(result = conv_std_logic_vector(4, result'length)) report "Error : ASR 8 = " & integer'image(conv_integer(result)) & " instead of 4" severity warning;

 --------------------------------------------------------------------------------------------------------------------------

        -- test set on 10 < 15
        sel    <= "01011";
        input1 <= conv_std_logic_vector(10, input1'length);
        input2 <= conv_std_logic_vector(15, input2'length);
        wait for 40 ns;
        assert(result = conv_std_logic_vector(1, result'length)) report "Error : set on 10 < 15 = " & integer'image(conv_integer(result)) & " instead of 1" severity warning;

        -- test set on 15 < 10
        sel    <= "01011";
        input1 <= conv_std_logic_vector(15, input1'length);
        input2 <= conv_std_logic_vector(11, input2'length);
        wait for 40 ns;
        assert(result = conv_std_logic_vector(0, result'length)) report "Error : set on 15 < 10 = " & integer'image(conv_integer(result)) & " instead of 0" severity warning;
        

--------------------------------------------------------------------------------------------------------------------------

        -- test branch for 5 <= 0
        sel    <= "10000";
        input1 <= conv_std_logic_vector(5, input1'length);
        wait for 40 ns;
        assert(branch = '0') report "Error : Branch for 5 <= 0 = " & integer'image(conv_integer(branch)) & " instead of 0" severity warning;

        -- test branch for 5 > 0
        sel    <= "10001";
        input1 <= conv_std_logic_vector(5, input1'length);
        wait for 40 ns;
        assert(branch = '1') report "Error : Branch for 5 > 0 = " & integer'image(conv_integer(branch)) & " instead of 1" severity warning;


        report "SIMULATION FINISHED!!!";
        wait;

    end process;
end TB;