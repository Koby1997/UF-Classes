library ieee;
use ieee.std_logic_1164.all;

entity ctrl2 is 
    generic (
        WIDTH :     positive := 32);
    port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        go    : in  std_logic;
        done  : out std_logic;

        -- control signals to/from datapath
        x_sel     : out std_logic;
        y_sel     : out std_logic;
        x_en      : out std_logic;
        y_en      : out std_logic;
        output_en : out std_logic;
        x_lt_y    : in std_logic;
        x_ne_y    : in std_logic);
end ctrl2;

architecture BHV of ctrl2 is
    type STATE_TYPE is (START, INIT, CHECK_COMP, X_LESS_THAN, X_GREATER_THAN, FINAL, STALL);
    signal state, next_state : STATE_TYPE;

begin

    process(clk, rst)
    begin
        if (rst = '1') then
        state <= INIT;
        elsif (rising_edge(clk)) then
        state <= next_state;
        end if;
    end process;

    process(go, state, x_lt_y, x_ne_y)
    begin
    
        x_sel       <= '0';
        y_sel       <= '0';
        output_en   <= '0';
        done        <= '0';

        next_state <= state;

        case state is
            when START =>
                done <= '0';
                x_en <= '1';
                y_en <= '1';

                if(go = '0') then
                    next_state <= START;
                else
                    next_state <= INIT;
                end if;

            --We now have starting values saved in the registers. So we
            --need to switch the muxes to always try to pass in the new value
            --we will use the enable to decide when it will actually get in the register
            when INIT =>
                x_en <= '0';
                y_en <= '0';
                x_sel <= '1';
                y_sel <= '1';

                if(go = '0') then
                    next_state <= INIT;
                else
                    next_state <= CHECK_COMP;
                end if;

            
            when CHECK_COMP =>
                if(x_ne_y = '0') then
                    next_state <= FINAL;
                elsif(x_lt_y = '1') then
                    next_state <= X_LESS_THAN;
                else
                    next_state <= X_GREATER_THAN;
                end if;

            
            when X_LESS_THAN =>
                y_sel <= '1';
                y_en <= '1';
                next_state <= INIT;



            when X_GREATER_THAN =>
                x_sel <= '1';
                x_en <= '1';
                next_state <= INIT;

            
            when FINAL =>
                output_en <= '1';
                done <= '0';
                if(go = '1') then
                    next_state <= STALL;
                else
                    next_state <= START;
                end if;


            when STALL =>
                done <= '1';
                if(go = '1') then
                    next_state <= STALL;
                else
                    next_state <= START;
                end if;


            when others => null;
        end case;
    end process;
end BHV;