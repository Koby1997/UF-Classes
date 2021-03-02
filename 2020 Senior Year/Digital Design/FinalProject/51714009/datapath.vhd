library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
    generic (
      WIDTH  :     positive := 32);
      port (
          clk     : in std_logic;
          rst     : in std_logic;
          button0 : in std_logic;
          button1 : in std_logic;
          switches: in std_logic_vector(31 downto 0);
          LEDs    : out std_logic_vector(31 downto 0);
  
          -- signals to/from controller
  
          PCWriteCond       : in std_logic;
          PCWrite           : in std_logic;
          IorD              : in std_logic;
          MemWrite          : in std_logic;
          MemToReg          : in std_logic;
          IRWrite           : in std_logic;
          JumpAndLink       : in std_logic;
          isSigned          : in std_logic;
          PCSource          : in std_logic_vector(1 downto 0);
          ALUOp             : in std_logic_vector(5 downto 0);
          ALUSrcB           : in std_logic_vector(1 downto 0);
          ALUSrcA           : in std_logic;
          RegWrite          : in std_logic;
          RegDst            : in std_logic;
          ir31_26           : out std_logic_vector(31 downto 26));
end datapath;

architecture STR of datapath is

    signal PC_OUT           : std_logic_vector(WIDTH-1 downto 0);
    signal MUX_ONE_OUT      : std_logic_vector(WIDTH-1 downto 0);
    signal MEM_OUT          : std_logic_vector(WIDTH-1 downto 0);
    signal IR_OUT           : std_logic_vector(WIDTH-1 downto 0);
    signal ir25_0           : std_logic_vector(25 downto 0);
    signal ir25_21          : std_logic_vector(25 downto 21);
    signal ir20_16          : std_logic_vector(20 downto 16);
    signal ir15_11          : std_logic_vector(15 downto 11);
    signal ir15_0           : std_logic_vector(15 downto 0);
    signal ir10_6           : std_logic_vector(10 downto 6);
    signal MDR_OUT          : std_logic_vector(WIDTH-1 downto 0);
    signal MUX_TWO_OUT      : std_logic_vector(4 downto 0);
    signal MUX_THREE_OUT    : std_logic_vector(WIDTH-1 downto 0);
    signal RF_OUT_1         : std_logic_vector(WIDTH-1 downto 0);
    signal RF_OUT_2         : std_logic_vector(WIDTH-1 downto 0);
    signal REG_A_OUT        : std_logic_vector(WIDTH-1 downto 0);
    signal REG_B_OUT        : std_logic_vector(WIDTH-1 downto 0);
    signal MUX_FOUR_OUT     : std_logic_vector(WIDTH-1 downto 0);
    signal EXTEND_OUT       : std_logic_vector(WIDTH-1 downto 0);
    signal SHIFT_ONE_OUT    : std_logic_vector(WIDTH-1 downto 0);
    signal MUX_FIVE_OUT     : std_logic_vector(WIDTH-1 downto 0);
    signal CONCAT_OUT       : std_logic_vector(WIDTH-1 downto 0);
    signal ALU_RESULT       : std_logic_vector(WIDTH-1 downto 0);
    signal ALU_RESULT_HI    : std_logic_vector(WIDTH-1 downto 0);
    signal ALU_BRANCH       : std_logic;
    signal ALU_OUT_OUT      : std_logic_vector(WIDTH-1 downto 0);
    signal LO_OUT           : std_logic_vector(WIDTH-1 downto 0);
    signal HI_OUT           : std_logic_vector(WIDTH-1 downto 0);
    signal MUX_SIX_OUT      : std_logic_vector(WIDTH-1 downto 0);
    signal MUX_SEVEN_OUT    : std_logic_vector(WIDTH-1 downto 0);
    signal WEIRD_SHIFT_OUT  : std_logic_vector(27 downto 0);
    signal EXTRA_LOGIC_OUT  : std_logic;

    --ALU Controller
    signal OPSelect         : std_logic_vector(5 downto 0);
    signal Hi_en            : std_logic;
    signal Lo_en            : std_logic;
    signal ALU_LO_HI        : std_logic_vector(1 downto 0);
    signal ir5_0            : std_logic_vector(5 downto 0);



begin

    EXTRA_LOGIC : entity work.extra_logic
        port map (
            in1    => ALU_BRANCH,
            in2    => PCWriteCond,
            in3    => PCWrite,
            output => EXTRA_LOGIC_OUT);

    
    PC  : entity work.reg
        generic map (
            WIDTH  => 32)
        port map (
            clk    => clk,
            rst    => rst,
            enable => EXTRA_LOGIC_OUT,
            input  => MUX_SIX_OUT,
            output => PC_OUT);

    MUX_ONE : entity work.mux2x1
        generic map (
            WIDTH => 32)
        port map (
            in0    => PC_OUT,
            in1    => ALU_OUT_OUT,
            sel    => IorD,
            output => MUX_ONE_OUT);

    --Here is where the Memory will go
    MEM : entity work.memory
        generic map (
            WIDTH => 32)
        port map (
            clk         => clk,
            rst         => rst,
            inport0en   => button0,
            inport1en   => button1,
            addr        => MUX_ONE_OUT,
            switches    => switches,
            wrdata      => REG_B_OUT,
            MemWrite    => MemWrite,
            Outport     => LEDs,
            rdata       => MEM_OUT);

    
    INSTRUCTION_REGISTER : entity work.reg
        generic map (
            WIDTH => 32)
        port map (
            clk     => clk,
            rst     => rst,
            enable  => IRWrite,
            input   => MEM_OUT,
            output  => IR_OUT);

            ir25_0  <= IR_OUT(25 downto 0);
            ir31_26 <= IR_OUT(31 downto 26);
            ir25_21 <= IR_OUT(25 downto 21);
            ir20_16 <= IR_OUT(20 downto 16);
            ir15_11 <= IR_OUT(15 downto 11);
            ir15_0  <= IR_OUT(15 downto 0);
            ir10_6  <= IR_OUT(10 downto 6);
            ir5_0   <= IR_OUT(5  downto 0);


    MDR : entity work.reg
    --Memory Data Register
        generic map (
            WIDTH  => 32)
        port map (
            clk    => clk,
            rst    => rst,
            enable => '1',
            input  => MEM_OUT,
            output => MDR_OUT);

    MUX_TWO : entity work.mux2x1
        generic map (
            WIDTH => 5)
        port map (
            in0    => ir20_16,
            in1    => ir15_11,
            sel    => RegDst,
            output => MUX_TWO_OUT);
    
   MUX_THREE : entity work.mux2x1
        generic map (
            WIDTH => 32)
        port map (
            in0    => MUX_SEVEN_OUT,
            in1    => MDR_OUT,
            sel    => MemToReg,
            output => MUX_THREE_OUT);


    REGISTERS_FILE : entity work.register_file
        port map (
            clk             => clk,
            rst             => rst,
            reg1            => ir25_21,
            reg2            => ir20_16,
            wr_reg          => MUX_TWO_OUT,
            wr_data         => MUX_THREE_OUT,
            RegWrite        => RegWrite,
            data1           => RF_OUT_1,
            data2           => RF_OUT_2,
            JumpAndLink     => JumpAndLink);

    REG_A : entity work.reg
        generic map (
            WIDTH  => 32)
        port map (
            clk    => clk,
            rst    => rst,
            enable => '1',
            input  => RF_OUT_1,
            output => REG_A_OUT);

    REG_B : entity work.reg
        generic map (
            WIDTH  => 32)
        port map (
            clk    => clk,
            rst    => rst,
            enable => '1',
            input  => RF_OUT_2,
            output => REG_B_OUT);


    MUX_FOUR : entity work.mux2x1
        generic map (
            WIDTH => 32)
        port map (
            in0    => PC_OUT,
            in1    => REG_A_OUT,
            sel    => ALUSrcA,
            output => MUX_FOUR_OUT);


    SIGN_EXTEND : entity work.sign_extend
        port map (
            input  => ir15_0,
            isSigned => isSigned,
            output => EXTEND_OUT);

    SHIFT_ONE : entity work.shift_left_two
        generic map (
            WIDTH => 32)
        port map (
            input  => EXTEND_OUT,
            output => SHIFT_ONE_OUT);

    MUX_FIVE : entity work.mux4x1
        generic map (
            WIDTH  => 32)
        port map (
            in0    => REG_B_OUT,
            in1    => "00000000000000000000000000000100", -- 4 but needs to be in 32 bits
            in2    => EXTEND_OUT,
            in3    => SHIFT_ONE_OUT,
            sel    => ALUSrcB,
            output => MUX_FIVE_OUT);


    ALU : entity work.alu
        generic map (
            WIDTH => 32)
        port map (
            input1          => MUX_FOUR_OUT,
            input2          => MUX_FIVE_OUT,
            sel             => OPSelect,
            shift_amount    => ir10_6,
            result          => ALU_RESULT,
            result_hi       => ALU_RESULT_HI,
            branch          => ALU_BRANCH);


    ALU_OUT : entity work.reg
        generic map (
            WIDTH  => 32)
        port map (
            clk    => clk,
            rst    => rst,
            enable => '1',
            input  => ALU_RESULT,
            output => ALU_OUT_OUT);

    LO : entity work.reg
        generic map (
            WIDTH  => 32)
        port map (
            clk    => clk,
            rst    => rst,
            enable => LO_en,
            input  => ALU_RESULT,
            output => LO_OUT);

    HI : entity work.reg
        generic map (
            WIDTH  => 32)
        port map (
            clk    => clk,
            rst    => rst,
            enable => HI_en,
            input  => ALU_RESULT_HI,
            output => HI_OUT);


    WEIRD_SHIFT : entity work.weird_shift
        port map (
            input  => ir25_0,
            output => WEIRD_SHIFT_OUT);


    CONCAT : entity work.concat
        port map (
            in1    => WEIRD_SHIFT_OUT,
            in2    => PC_OUT(31 downto 28),
            output => CONCAT_OUT);


    MUX_SIX : entity work.mux4x1
        generic map (
            WIDTH  => 32)
        port map (
            in0    => ALU_RESULT,
            in1    => ALU_OUT_OUT,
            in2    => CONCAT_OUT,
            in3    => CONCAT_OUT, --really just an empty space
            sel    => PCSource,
            output => MUX_SIX_OUT);


    MUX_SEVEN : entity work.mux4x1
        generic map (
            WIDTH  => 32)
        port map (
            in0    => ALU_RESULT,
            in1    => LO_OUT,
            in2    => HI_OUT,
            in3    => HI_OUT,--really just an empty space
            sel    => ALU_LO_HI,
            output => MUX_SEVEN_OUT);



    ALU_CONTROLLER : entity work.alu_controller
        port map (
            IR5_0       => ir5_0,
            ALUOp       => ALUOp,
            Hi_en       => Hi_en,
            Lo_en       => Lo_en,
            ALU_LO_HI   => ALU_LO_HI,
            OPSelect    => OPSelect,
            IR20_16     => ir20_16);


end STR;