library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
    port(
        clk         : in std_logic;
        rst         : in std_logic;
        reg1        : in std_logic_vector(4 downto 0);
        reg2        : in std_logic_vector(4 downto 0);
        wr_reg      : in std_logic_vector(4 downto 0);
        wr_data     : in std_logic_vector(31 downto 0);
        RegWrite    : in std_logic; -- this is the enable from controller
        data1       : out std_logic_vector(31 downto 0);
        data2       : out std_logic_vector(31 downto 0);
        JumpAndLink : in std_logic
        -- PC_4        : in std_logic_vector(31 downto 0);
        );
end register_file;


architecture async_read of register_file is
    type reg_array is array(0 to 31) of std_logic_vector(31 downto 0);
    signal regs : reg_array;
begin
    process (clk, rst) is
    begin
        if (rst = '1') then
            for i in regs'range loop
                regs(i) <= (others => '0');
            end loop;
        elsif (rising_edge(clk)) then

            if (RegWrite = '1') then
                regs(to_integer(unsigned(wr_reg))) <= wr_data;
                regs(0) <= (others => '0');
            end if;  
            
            -- if(JumpAndLink = '1') then
            --     regs(31) <= PC_4;
            -- end if;

        end if;
    end process;

    data1 <= regs(to_integer(unsigned(reg1)));
    data2 <= regs(to_integer(unsigned(reg2)));
   
end async_read;
