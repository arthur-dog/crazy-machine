library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity pwm is
    generic (
        BASE_CLOCK : natural := BASE_CLOCK_PHYS
    );
    port (
        clk_in   : in  std_logic;
        reset    : in  std_logic;
        duty     : in  ubyte;
        pwm_out  : out std_logic;
        sync_out : out std_logic
    );
end pwm;

architecture base of pwm is

    -- we want 50Hz for our PWM, so divide our base clock by 50 to get the
    -- amount of clock cycles needed
    constant PWM_PERIOD : natural := BASE_CLOCK / 50;

    subtype duty_hertz is natural range 0 to PWM_PERIOD;

    signal pwm_count : duty_hertz := 0;

    signal stored_duty : ubyte := duty;

begin
    pwm_process : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                pwm_count   <= 0;
                pwm_out     <= '0';
                stored_duty <= duty;  -- we do this so we dont change the duty
                -- of a wave mid period, which would mess
                -- with its form.
            else
                pwm_out <= '0';
                if pwm_count < PWM_PERIOD then
                    pwm_count <= pwm_count + 1;  -- creates the period
                else
                    pwm_count   <= 0;
                    stored_duty <= duty;
                end if;
                if pwm_count < map_from_zero_natural_range(to_integer(stored_duty), UBYTE_SIZE, duty_hertz'high) then
                    pwm_out <= '1';
                else
                    pwm_out <= '0';
                end if;
            end if;
        end if;
    end process;

    -- provide a clock matching the period of the PWM signal. taking the PWM
    -- signal directly as a clock for the duty_manager for some reason does not
    -- work, although it would be the more elegant solution.
    sync_process : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if pwm_count < PWM_PERIOD / 2 then
                sync_out <= '1';
            else
                sync_out <= '0';
            end if;
        end if;
    end process;
end base;

-- servo motors require a different pwm than normal pwm signals. it needs a
-- 20ms period, with 0% duty being a 1ms pulse and 100% duty being a 2ms pulse.

architecture servo of pwm is

    constant ONE_MS_FREQ    : natural := 1000 / 1;
    constant TWO_MS_FREQ    : natural := 1000 / 2;
    constant TWENTY_MS_FREQ : natural := 1000 / 20;

    -- calculate the number of clock cycles needed to get a pulse of 1ms, 2ms,
    -- and the 20ms period
    constant PWM_PERIOD  : natural := BASE_CLOCK / TWENTY_MS_FREQ;
    constant PWM_0_DEG   : natural := BASE_CLOCK / ONE_MS_FREQ;
    constant PWM_180_DEG : natural := BASE_CLOCK / TWO_MS_FREQ;

    subtype duty_hertz is natural range PWM_0_DEG to PWM_180_DEG;

    function duty_byte_to_duty_hertz (
        duty_byte : ubyte
    ) return duty_hertz is
    begin
        return map_range(to_integer(duty_byte), 0, UBYTE_SIZE, duty_hertz'low, duty_hertz'high);
    end function;

    signal pwm_count   : natural range 0 to PWM_PERIOD - 1;  -- so we dont go over
    signal pulse_hertz : duty_hertz;
    signal stored_duty : ubyte := duty;

begin
    pwm_process : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                pwm_count   <= 0;
                pwm_out     <= '0';
                stored_duty <= duty;
            else
                pulse_hertz <= duty_byte_to_duty_hertz(stored_duty);
                pwm_out     <= '0';
                if pwm_count < PWM_PERIOD then
                    pwm_count <= pwm_count + 1;
                else
                    pwm_count   <= 0;
                    stored_duty <= duty;
                end if;
                if pwm_count < pulse_hertz then
                    pwm_out <= '1';
                else
                    pwm_out <= '0';
                end if;
            end if;
        end if;
    end process;

    sync_process : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if pwm_count < PWM_PERIOD / 2 then
                sync_out <= '1';
            else
                sync_out <= '0';
            end if;
        end if;
    end process;



end servo;
