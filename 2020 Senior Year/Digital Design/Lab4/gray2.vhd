library ieee;
use ieee.std_logic_1164.all;

entity gray2 is
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        output : out std_logic_vector(3 downto 0));
end gray2;

architecture PROC2 of gray2 is

    type STATE_TYPE is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15);

    signal state, next_state : STATE_TYPE;

begin

    process(clk, rst)
    begin
        if (rst = '1') then
        state <= S0;                
        elsif(rising_edge(clk)) then
        state <= next_state;
        end if;
    end process;



    process(state)
    begin

        case state is
            when S0 =>
                output <= "0000";
                next_state <= S1;        
    ------------------------------------------------------

            when S1 =>
                output <= "0001";
                next_state <= S2;
                ------------------------------------------------------

            when S2 =>
                output <= "0011";
                next_state <= S3;
                ------------------------------------------------------

            when S3 =>
                output <= "0010";
                next_state <= S4;
                ------------------------------------------------------

            when S4 =>
                output <= "0110";
                next_state <= S5;
                ------------------------------------------------------

            when S5 =>
                output <= "0111";
                next_state <= S6;
                ------------------------------------------------------

            when S6 =>
                output <= "0101";
                next_state <= S7;
                ------------------------------------------------------

            when S7 =>
                output <= "0100";
                next_state <= S8;
                ------------------------------------------------------

            when S8 =>
                output <= "1100";
                next_state <= S9;
                ------------------------------------------------------

            when S9 =>
                output <= "1101";
                next_state <= S10;
                ------------------------------------------------------

            when S10 =>
                output <= "1111";
                next_state <= S11;
                ------------------------------------------------------

            when S11 =>
                output <= "1110";
                next_state <= S12;
                ------------------------------------------------------

            when S12 =>
                output <= "1010";
                next_state <= S13;
                ------------------------------------------------------

            when S13 =>
                output <= "1011";
                next_state <= S14;
                ------------------------------------------------------

            when S14 =>
                output <= "1001";
                next_state <= S15;
                ------------------------------------------------------

            when S15 =>
                output <= "1000";
                next_state <= S0;
    ------------------------------------------------------
            when others => null;
        end case;
    end process;
end PROC2;