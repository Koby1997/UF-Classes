library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd is
    generic (
        WIDTH : positive := 16);
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        go     : in  std_logic;
        done   : out std_logic;
        x      : in  std_logic_vector(WIDTH-1 downto 0);
        y      : in  std_logic_vector(WIDTH-1 downto 0);
        output : out std_logic_vector(WIDTH-1 downto 0));
end gcd;

architecture FSMD of gcd is
    type STATE_TYPE is (START, INIT, LOOP_COND, LOOP_BODY, CHANGE_X, CHANGE_Y, RESULT, STALL);
    signal state : STATE_TYPE;

    signal reg_x, reg_y, temp : unsigned(WIDTH-1 downto 0);

begin  -- FSMD

    process(clk, rst)


    begin
        if (rst = '1') then
            state <= START;
            done <= '0';
            output <= (OTHERS => '0');
            reg_x <= to_unsigned(0,WIDTH);
            reg_y <= to_unsigned(0,WIDTH);
            temp <= to_unsigned(0,WIDTH);

        elsif(rising_edge(clk)) then
            case state is
                when START =>
                    done <= '0';
                    if(go = '0') then
                        state <= START;
                    else
                        state <= INIT;
                    end if;


                when INIT =>
                    reg_x <= unsigned(x);
                    reg_y <= unsigned(y);

                    state <= LOOP_COND;


                when LOOP_COND =>
                    if(reg_x = reg_y) then
                        state <= RESULT;
                    else
                        state <= LOOP_BODY;
                    end if;


                when LOOP_BODY =>
                    if(reg_x < reg_y) then
                        state <= CHANGE_Y;
                    else
                        state <= CHANGE_X;
                    end if;


                when CHANGE_Y =>
                    reg_y <= reg_y - reg_x;
                    state <= LOOP_COND;
                    

                when CHANGE_X =>
                    reg_x <= reg_x - reg_y;
                    state <= LOOP_COND;


                when RESULT =>
                    output <= std_logic_vector(reg_x);
                    done <= '1';
                    state <= STALL;


                when STALL =>
                    if(go = '1') then
                        state <= STALL;
                    else
                        state <= START;
                    end if;







                when OTHERS => null;
            end case;
        end if;
    end process;
end FSMD;










architecture FSM_D1 of gcd is

    signal x_sel        : std_logic;
    signal y_sel        : std_logic;
    signal x_en         : std_logic;
    signal y_en         : std_logic;
    signal output_en    : std_logic;
    signal x_lt_y       : std_logic;
    signal x_ne_y       : std_logic;

begin  -- FSM_D1

    DATAPATH    : entity work.datapath1
        generic map (
            WIDTH  => WIDTH)
        port map(
            clk     => clk,
            rst     => rst,
            x       => x,
            y       => y,
            output  => output,
    
            -- signals to/from controller
    
            x_sel     => x_sel,
            y_sel     => y_sel,
            x_en      => x_en,
            y_en      => y_en,
            output_en => output_en,
            x_lt_y    => x_lt_y,
            x_ne_y    => x_ne_y);


    CONTROLLER  : entity work.ctrl1
        generic map (
            WIDTH => WIDTH)
        port map (
            clk   => clk,
            rst   => rst,
            go    => go,
            done  => done,

            -- control signals to/from datapath
            x_sel     => x_sel,
            y_sel     => y_sel,
            x_en      => x_en,
            y_en      => y_en,
            output_en => output_en,
            x_lt_y    => x_lt_y,
            x_ne_y    => x_ne_y);

end FSM_D1;






















architecture FSM_D2 of gcd is

    signal x_sel        : std_logic;
    signal y_sel        : std_logic;
    signal x_en         : std_logic;
    signal y_en         : std_logic;
    signal output_en    : std_logic;
    signal x_lt_y       : std_logic;
    signal x_ne_y       : std_logic;

begin  -- FSM_D2

    DATAPATH    : entity work.datapath2
        generic map (
            WIDTH  => WIDTH)
        port map(
            clk     => clk,
            rst     => rst,
            x       => x,
            y       => y,
            output  => output,
    
            -- signals to/from controller
    
            x_sel     => x_sel,
            y_sel     => y_sel,
            x_en      => x_en,
            y_en      => y_en,
            output_en => output_en,
            x_lt_y    => x_lt_y,
            x_ne_y    => x_ne_y);


    CONTROLLER  : entity work.ctrl2
        generic map (
            WIDTH => WIDTH)
        port map (
            clk   => clk,
            rst   => rst,
            go    => go,
            done  => done,

            -- control signals to/from datapath
            x_sel     => x_sel,
            y_sel     => y_sel,
            x_en      => x_en,
            y_en      => y_en,
            output_en => output_en,
            x_lt_y    => x_lt_y,
            x_ne_y    => x_ne_y);

end FSM_D2;


-- EXTRA CREDIT
architecture FSMD2 of gcd is

begin  -- FSMD2



end FSMD2;