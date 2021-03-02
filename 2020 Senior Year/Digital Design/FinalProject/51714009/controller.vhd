library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity controller is 
    generic (
        WIDTH :     positive := 32);
    port (
        clk   : in  std_logic;
        rst   : in  std_logic;

        -- control signals to/from datapath
        ir31_26         : in std_logic_vector(5 downto 0);
        ir5_0           : in std_logic_vector(5 downto 0);
        -- left side
        PCWriteCond     : out std_logic;
        PCWrite         : out std_logic;
        IorD            : out std_logic;
        MemWrite        : out std_logic;
        MemToReg        : out std_logic;
        IRWrite         : out std_logic;
        -- right side
        JumpAndLink     : out std_logic;
        IsSigned        : out std_logic;
        PCSource        : out std_logic_vector(1 downto 0);
        ALUOp           : out std_logic_vector(5 downto 0);
        ALUSrcB         : out std_logic_vector(1 downto 0);
        ALUSrcA         : out std_logic;
        RegWrite        : out std_logic;
        RegDst          : out std_logic);
end controller;

architecture BHV of controller is
    type STATE_TYPE is (FETCH1, FETCH2, FETCH3, DECODE, R_COMPLETE,
                        ADDR_COMPU, BEQ_COMPLETE, LW_COMPLETE,
                        LW_COMPLETE2, SW_COMPLETE, I_COMPLETE, HALT);
    signal state, next_state : STATE_TYPE;

begin

    process(clk, rst)
    begin
        if (rst = '1') then
        state <= FETCH1;
        elsif (rising_edge(clk)) then
        state <= next_state;
        end if;
    end process;

    process(state, ir31_26)
    begin
        --defaults
        next_state <= state;

        PCWriteCond <= '0';
        PCWrite     <= '0';
        IorD        <= '0';
        MemWrite    <= '0';
        MemToReg    <= '0';
        IRWrite     <= '0';
        JumpAndLink <= '0';
        IsSigned    <= '0';
        PCSource    <= "00";
        ALUOp       <= "000000";
        ALUSrcB     <= "00";
        ALUSrcA     <= '0';
        RegWrite    <= '0';
        RegDst      <= '0';
        RegDst      <= '0';



        case state is
            when FETCH1 =>
                IorD <= '0';
                MemWrite <= '0';

                next_state <= FETCH2;

           
            when FETCH2 =>  --this is just a waiting cycle
                IRWrite <= '1';
                next_state <= FETCH3;

            when FETCH3 => -- PC = PC + 4
                ALUSrcA <= '0'; --chooses PC
                ALUSrcB <= "01";--chooses 4
                ALUOp   <= addU;--adds
                PCSource <= "00";--chooses result
                PCWrite <= '1';--writes to PC

                next_state <= DECODE;

            
            when DECODE =>
                --start with R Type
                if(ir31_26 = "000000")then
                    ALUSrcA <= '1'; --choose RegA
                    ALUSRCB <= "00"; --choose RegB
                    ALUOp   <= "000000";

                    if(ir5_0 = "011001" or ir5_0 = "011000") then--multiplication exception
                        next_state <= FETCH1;
                    else                                
                        next_state <= R_COMPLETE;
                    end if;

                    if(ir5_0 = "001000") then --this is for the Jump completion
                        PCWrite <= '1';
                        next_state <= FETCH1;
                    end if;
                
                    elsif(ir31_26 = "100011" or ir31_26 = "101011") then --Load or Store
                        ALUSrcA <= '1';--choose RegA
                        ALUSrcB <= "10";--choose extended
                        ALUOP   <= "100001";
                        next_state <= ADDR_COMPU;

                    elsif(ir31_26 = "000010") then--Unconditional jump
                        PCSource <= "10";
                        PCWrite <= '1';
                        next_state <= FETCH1;

                    elsif(ir31_26 = "000011") then --jump and link
                        JumpAndLink <= '1';
                        PCSource <= "10";
                        PCWrite <= '1';
                        next_state <= FETCH1;

                    elsif(ir31_26 = "000100" or ir31_26 = "000101") then -- branch if = or /=
                       ALUSrcB <= "11";
                       ALUOP   <= "001001";
                       next_state <= BEQ_COMPLETE;

                    elsif (ir31_26 = "111111") then --fake instruction
                        next_state <= HALT;
                        

                    else
                        ALUSrcA <= '1';
                        ALUSrcB <= "10";
                        ALUOp <= ir31_26;
                        next_state <= I_COMPLETE;
                    
                    end if;

                when R_COMPLETE =>
                    ALUOP <= "000000";
                    RegWrite <= '1';
                    RegDst <= '1';
                    next_state <= FETCH1;

                when ADDR_COMPU =>
                    IorD <= '1';
                    if(ir31_26 = "100011") then
                        next_state <= LW_COMPLETE;
                    else
                        ALUSrcA <= '1';
                        ALUSrcB <= "10";
                        ALUOP   <= "100001";
                        memWrite <= '1';
                        next_state <= SW_COMPLETE;
                    end if;
                    
                when BEQ_COMPLETE =>
                    ALUSrcA <= '1';
                    PCSource <= "01";
                    ALUOP <= ir31_26;
                    PCWriteCond <= '1';
                    next_state <= FETCH1;

                when LW_COMPLETE =>
                    memToReg <= '1';
                    RegWrite <= '1';
                    next_state <= LW_COMPLETE2;

                when LW_COMPLETE2 =>
                    memToReg <='1';
                    RegWrite <= '1';
                    next_state <= FETCH1;

                when SW_COMPLETE =>
                    IorD <= '1';
                    next_state <= FETCH1;
            

                when I_COMPLETE =>
                    RegWrite <= '1';
                    RegDst <= '0';
                    next_state <= FETCH1;
                
                when HALT =>
                    next_state <= HALT;
                
                when others => null;


        end case;
    end process;
end BHV;