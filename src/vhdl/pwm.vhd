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

    signal pwm_count : ubyte;

begin
    pwm_process : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                pwm_count <= (others => '0');
                pwm_out   <= '0';
            else
                pwm_count <= pwm_count + 1;
                pwm_out   <= '0';
                if pwm_count = unsigned(to_signed(-2, pwm_count'length)) then
                    -- value just before all ones so we dont go over one
                    pwm_count <= (others => '0');
                end if;
                if pwm_count < duty then
                    pwm_out <= '1';
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
        return to_integer(map_range(duty_byte, to_unsigned(0, 1), to_unsigned(255, ubyte'length),
                                    to_unsigned(duty_hertz'low, 1), to_unsigned(duty_hertz'high, 24)));
    end function;

    signal pwm_count   : natural range 0 to PWM_PERIOD - 1;
    signal pulse_hertz : duty_hertz := duty_byte_to_duty_hertz(duty);

begin
    duty_conv_process : process (duty)
    begin
        pulse_hertz <= duty_byte_to_duty_hertz(duty);
    end process;

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
                if pwm_count < pulse_hertz then
                    pwm_out <= '1';
                else
                    pwm_out <= '0';
                end if;
            end if;
        end if;
    end process;

end servo;
