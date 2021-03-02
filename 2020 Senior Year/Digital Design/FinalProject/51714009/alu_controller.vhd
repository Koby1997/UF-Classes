library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity alu_controller is 
    port (
        IR5_0       : in std_logic_vector(5 downto 0);
        ALUOp       : in std_logic_vector(5 downto 0);
        Hi_en       : out std_logic;
        Lo_en       : out std_logic;
        ALU_LO_HI   : out std_logic_vector(1 downto 0);
        OPSelect    : out std_logic_vector(5 downto 0);

        IR20_16     : in std_logic_vector(4 downto 0) -- needed for last two branch instructions
    );
end alu_controller;

architecture BHV of alu_controller is
begin

    process(IR5_0, ALUOp)
    begin
        --defaults
        Hi_en       <= '0';
        Lo_en       <= '0';
        ALU_LO_HI   <= "00";
        OPSelect    <= "000000";

        if(ALUOp = "000000")then --R Type instruction
            case IR5_0 is -- look at MIPS pdf for each instruction
                when "100001" =>
                        OPselect <= addU;

                    when "100011" =>
                        OPselect <= subU;

                    when "011000" =>
                        OPselect <= multS;
                        Hi_en <= '1';
                        Lo_en <= '1';

                    when "011001" =>
                        OPselect <= multU;
                        Hi_en <= '1';
                        Lo_en <= '1';

                    when "100100" =>
                        OPselect <= andR;

                    when "100101" =>
                        OPselect <= orR;

                    when "100110" =>
                        OPselect <= xorR;

                    when "000010" =>
                        OPselect <= srLog;

                    when "000000" =>
                        OPselect <= slLog;

                    when "000011" =>
                        OPselect <= srArith;

                    when "101010" =>
                        OPselect <= sltS;

                    when "101011" =>
                        OPselect <= sltU;

                    when "010000" => 
                        OPselect <= mfHi;
                        ALU_LO_HI <= "10";

                    when "010010" =>
                        OPselect <= mfLo;
                        ALU_LO_HI <= "01";
                    
                    when others => null;
                end case;

            -- else, all of the I Type instructions
            elsif (ALUOp = "001001") then
                OPselect <= addIU;

            elsif (ALUOp = "010000") then
                OPselect <= subIU;

            elsif (ALUOp = "001100") then
                OPselect <= andI;

            elsif (ALUOp = "001101") then
                OPselect <= orI;
                
            elsif (ALUOp = "001110") then
                OPselect <= xorI;

            elsif (ALUOp = "001010") then
                OPselect <= sltIS;

            elsif (ALUOp = "001011") then
                OPselect <= sltIU;
                
            elsif (ALUOp = "000100") then
                OPselect <= beq;
                
            elsif (ALUOp = "000101") then
                OPselect <= bneq;

            elsif (ALUOp = "000110") then
                OPselect <= blt_eq0;
                
            elsif (ALUOp = "000111") then
                OPselect <= bgt0;

            elsif (ALUOp = "000001") then -- both BLT0 and BGTE0 have same ALUOp
                if(IR20_16 = "00001") then -- they have different 20-16 bits though so use those
                    OPselect <= bgt_eq0;

                else
                    OPselect <= blt0;
                end if;
            end if;

    end process;

end BHV;