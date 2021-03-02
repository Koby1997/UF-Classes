library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath2 is
    generic (
      WIDTH  :     positive := 16);
      port (
          clk     : in std_logic;
          rst     : in std_logic;
          x       : in std_logic_vector(WIDTH-1 downto 0);
          y       : in std_logic_vector(WIDTH-1 downto 0);
          output  : out std_logic_vector(WIDTH-1 downto 0);
  
          -- signals to/from controller
  
          x_sel     : in std_logic;
          y_sel     : in std_logic;
          x_en      : in std_logic;
          y_en      : in std_logic;
          output_en : in std_logic;
          x_lt_y    : out std_logic;
          x_ne_y    : out std_logic);
end datapath2;

architecture STR of datapath2 is

    signal SUB_OUT          :   std_logic_vector(WIDTH-1 downto 0);
    signal X_MUX_OUT        :   std_logic_vector(WIDTH-1 downto 0);
    signal Y_MUX_OUT        :   std_logic_vector(WIDTH-1 downto 0);
    signal X_REG_OUT        :   std_logic_vector(WIDTH-1 downto 0);
    signal Y_REG_OUT        :   std_logic_vector(WIDTH-1 downto 0);


begin

    -- I need:
    -- 2 mux
    -- 3 reg
    -- 1 subtractor
    -- 1 comparator

    X_MUX   : entity work.mux2x1
        generic map (
            WIDTH => WIDTH)
        port map (
            in1     => x,
            in2     => SUB_OUT,
            sel     => x_sel,
            output  => X_MUX_OUT);


    Y_MUX   : entity work.mux2x1
        generic map (
            WIDTH => WIDTH)
        port map (
            in1     => y,
            in2     => SUB_OUT,
            sel     => y_sel,
            output  => Y_MUX_OUT);


    X_REG   : entity work.reg
        generic map (
            WIDTH => WIDTH)
        port map (
            clk     => clk,
            rst     => rst,
            enable  => x_en,
            input   => X_MUX_OUT,
            output  => X_REG_OUT);
    

    Y_REG   : entity work.reg
        generic map (
            WIDTH => WIDTH)
        port map (
            clk     => clk,
            rst     => rst,
            enable  => y_en,
            input   => Y_MUX_OUT,
            output  => Y_REG_OUT);


    OUT_REG   : entity work.reg
        generic map (
            WIDTH => WIDTH)
        port map (
            clk     => clk,
            rst     => rst,
            enable  => output_en,
            input   => X_REG_OUT,
            output  => output);


    SUB    : entity work.subtractor2
        generic map (
            WIDTH => WIDTH)
        port map (
            in1     => X_REG_OUT,
            in2     => Y_REG_OUT,
            output  => SUB_OUT);


    COMP    : entity work.comparator
        generic map (
            WIDTH => WIDTH)
        port map (
            x       => X_REG_OUT, 
            y       => Y_REG_OUT, 
            x_lt_y  => x_lt_y, 
            x_ne_y  => x_ne_y);

end STR;