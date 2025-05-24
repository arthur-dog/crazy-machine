library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity section_2_b is
    generic (
        START_POS           : natural := 0;
        END_POS             : natural := 120;
        ACTIVATION_DELAY_MS : natural := 1;
        WAIT_TIME_MS        : natural := 1;
        SPEED_DIVIDER       : natural := 2 ** 1
    );
    port (
        clk_in      : in  std_logic;
        reset       : in  std_logic;
        limit_sw_in : in  std_logic;
        servo_out   : out std_logic
    );
end section_2_b;

architecture base of section_2_b is

    signal sync_clk   : std_logic;
    signal duty_cycle : ubyte;

    signal timer_reset    : std_logic := '1';
    signal timer_activate : std_logic := '0';
    signal timer_finished : std_logic := '0';

    signal reset_signal : std_logic := '1';

begin

    timer_inst : entity work.timer(base)
        port map (
            clk_in      => clk_in,
            activate    => timer_activate,
            time_set_ms => WAIT_TIME_MS,
            finished    => timer_finished,
            reset       => timer_reset);

    duty_manager_inst : entity work.duty_manager(simple_servo)
        generic map (
            START_POS     => START_POS,
            END_POS       => END_POS,
            OSCILLATIONS  => 4,
            WAIT_TIME_MS  => WAIT_TIME_MS,
            SPEED_DIVIDER => SPEED_DIVIDER,
            STEP_SIZE     => 1)
        port map (
            clk_base => clk_in,
            clk_in   => sync_clk,
            reset    => reset_signal,
            duty_out => duty_cycle);

    pwm_staircase_inst : entity work.pwm(base)
        port map (
            clk_in   => clk_in,
            reset    => '0',  -- duty manager resetting works to reset pwm
            duty     => duty_cycle,
            pwm_out  => servo_out,
            sync_out => sync_clk);

    trigger_p : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if timer_finished = '1' then
                timer_reset <= '0';
                reset_signal   <= '0';
            end if;
            if timer_reset = '1' then
                timer_reset <= '0';
            end if;
            if timer_activate = '1' then
                timer_activate <= '0';
            end if;
            if reset = '1' then
                reset_signal <= '1';
                timer_reset  <= '0';
            else
                if limit_sw_in = '0' then  -- single shot
                    timer_activate <= '1';
                end if;
            end if;
        end if;
    end process;

end base;
