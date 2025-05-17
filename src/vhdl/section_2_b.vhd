library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity section_2_b is
    generic (
        START_POS : natural := 0;
        END_POS : natural := 120;
        WAIT_TIME_MS : natural := 1;
        SPEED_DIVIDER: natural := 2 ** 1
    );
    port (
        clk_in : in std_logic;
        reset : in std_logic;
        line_sensor_in : in std_logic;
        servo_out : out std_logic
    );
end section_2_b;

architecture base of section_2_b is

    signal sync_clk : std_logic;
    signal duty_cycle : ubyte;

    signal reset_signal : std_logic := '1';

begin

    duty_manager_inst: entity work.duty_manager(simple_servo)
        generic map (
            START_POS    => 0,
            END_POS      => 120,
            OSCILLATIONS => 4,
            WAIT_TIME_MS => 3000,
            SPEED_DIVIDER => SPEED_DIVIDER,
            STEP_SIZE    => 10)
        port map (
            clk_base => clk_in,
            clk_in   => sync_clk,
            reset    => reset_signal,
            duty_out => duty_cycle);

    pwm_cradle_inst : entity work.pwm(base)
        port map (
            clk_in   => clk_in,
            reset    => '0', -- duty manager resetting works to reset pwm
            duty     => duty_cycle,
            pwm_out  => servo_out,
            sync_out => sync_clk);

    trigger_p : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                reset_signal <= '1';
            else
                if line_sensor_in = '1' then    -- single shot
                    reset_signal <= '0';
                end if;
            end if;
        end if;
    end process;

end base;
