library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity all_together is
    port (
        clk                  : in std_logic;
        rst                  : in std_logic;
        inport0_en           : in std_logic;
        inport1_en           : in std_logic;
        switches             : in std_logic_vector(31 downto 0);
        outPort              : out std_logic_vector(31 downto 0)
    );
end all_together;


architecture STR of all_together is

    signal PCWriteCond  : std_logic;
    signal PCWrite      : std_logic;
    signal IorD         : std_logic;
    signal MemWrite     : std_logic;
    signal MemToReg     : std_logic;
    signal IRWrite      : std_logic;
    signal JumpAndLink  : std_logic;
    signal IsSigned     : std_logic;
    signal PCSource     : std_logic_vector(1 downto 0);
    signal ALUOp        : std_logic_vector(5 downto 0);
    signal ALUSrcB      : std_logic_vector(1 downto 0);
    signal ALUSrcA      : std_logic;
    signal RegWrite     : std_logic;
    signal RegDst       : std_logic;
    signal ir31_26      : std_logic_vector(31 downto 26);
    signal ir5_0        : std_logic_vector(5 downto 0);


begin

    CONTROLLER: entity work.controller
    port map(
        clk         => clk,
        rst         => rst,
        ir31_26     => ir31_26,
        ir5_0       => ir5_0,--last in
        PCWriteCond => PCWriteCond,
        PCWrite     => PCWrite,
        IorD        => IorD,
        MemWrite    => MemWrite,
        MemToReg    => MemToReg,
        IRWrite     => IRWrite,
        JumpAndLink => JumpAndLink,
        IsSigned    => IsSigned,
        PCSource    => PCSource,
        ALUOp       => ALUOp,
        ALUSrcB     => ALUSrcB,
        ALUSrcA     => ALUSrcA,
        RegWrite    => RegWrite,
        RegDst      => RegDst);


    DATAPATH: entity work.datapath
    generic map(
        WIDTH => 32)
    port map(
        clk         => clk,
        rst         => rst,
        button0     => inport0_en,
        button1     => inport1_en,
        switches    => switches,
        LEDs        => outPort,--only out
        PCWriteCond => PCWriteCond,
        PCWrite     => PCWrite,
        IorD        => IorD,
        MemWrite    => MemWrite,
        MemToReg    => MemToReg,
        IRWrite     => IRWrite,
        JumpAndLink => JumpAndLink,
        isSigned    => isSigned,
        PCSource    => PCSource,
        ALUOp       => ALUOp,
        ALUSrcB     => ALUSrcB,
        ALUSrcA     => ALUSrcA,
        RegWrite    => RegWrite,
        RegDst      => RegDst,
        ir31_26     => ir31_26);


end STR;