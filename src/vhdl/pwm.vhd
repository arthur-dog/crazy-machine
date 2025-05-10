library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity pwm is
    generic (
        BASE_CLOCK : natural := 50_000_000
    );
    port (
        clk_in  : in  std_logic;
        reset   : in  std_logic;
        duty    : in  ubyte;
        pwm_out : out std_logic
    );
end pwm;

architecture base of pwm is

    constant PWM_PERIOD : natural := BASE_CLOCK / 50000;

    subtype duty_hertz is natural range 0 to PWM_PERIOD;

    signal pwm_count : duty_hertz := 0;

begin
    pwm_process : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                pwm_count <= 0;
                pwm_out   <= '0';
            else
                pwm_out <= '0';
                if pwm_count < PWM_PERIOD then
                    pwm_count <= pwm_count + 1;
                else
                    pwm_count <= 0;
                end if;
                if pwm_count < map_from_zero_natural_range(to_integer(duty), UBYTE_SIZE, duty_hertz'high) then
                    pwm_out <= '1';
                else
                    pwm_out <= '0';
                end if;
            end if;
        end if;
    end process;
end base;

architecture servo of pwm is

    constant ONE_MS_FREQ    : natural := 1000 / 1;
    constant TWO_MS_FREQ    : natural := 1000 / 2;
    constant TWENTY_MS_FREQ : natural := 100 / 2;

    constant PWM_PERIOD  : natural := BASE_CLOCK / TWENTY_MS_FREQ;
    constant PWM_0_DEG   : natural := BASE_CLOCK / ONE_MS_FREQ;
    constant PWM_180_DEG : natural := BASE_CLOCK / TWO_MS_FREQ;

    subtype duty_hertz is natural range 0 to PWM_180_DEG;

    function duty_byte_to_duty_hertz (
        duty_byte : ubyte
    ) return duty_hertz is
    begin
        return map_range(to_integer(duty_byte), 0, UBYTE_SIZE, duty_hertz'low, duty_hertz'high);
    end function;

    signal pwm_count   : natural range 0 to PWM_PERIOD - 1;
    signal pulse_hertz : duty_hertz;

begin
    pwm_process : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                pwm_count <= 0;
                pwm_out   <= '0';
            else
                pulse_hertz <= duty_byte_to_duty_hertz(duty);
                pwm_out     <= '0';
                if pwm_count < PWM_PERIOD then
                    pwm_count <= pwm_count + 1;
                else
                    pwm_count <= 0;
                end if;
                if pwm_count < pulse_hertz then
                    pwm_out <= '1';
                else
                    pwm_out <= '0';
                end if;
            end if;
        end if;
    end process;

end servo;
