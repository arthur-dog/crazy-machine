library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity line_sensor_servo is
    Port (
        clk_50MHz    : in  STD_LOGIC;     -- 50 MHz clock input
        reset        : in  STD_LOGIC;     -- Active-high reset
        line_sensor  : in  STD_LOGIC;     -- Line sensor input
        led_out      : out STD_LOGIC;     -- LED output
        servo_pwm    : out STD_LOGIC      -- PWM signal to servo
    );
end line_sensor_servo;

architecture Behavioral of line_sensor_servo is

    -- Timing constants for PWM
    constant PWM_PERIOD     : integer := 1000000;  -- 20ms
    constant PULSE_0DEG     : integer := 50000;    -- 1ms = 0°
    constant PULSE_180DEG   : integer := 100000;   -- 2ms = 1
	 80°

    -- Internal signals
    signal pwm_counter : integer range 0 to PWM_PERIOD := 0;
    signal pulse_width : integer := PULSE_0DEG;
    signal pwm_signal  : std_logic := '0';
    signal led_reg     : std_logic := '0';

begin

    process(clk_50MHz, reset)
    begin
        if reset = '1' then
            pwm_counter <= 0;
            pwm_signal  <= '0';
            pulse_width <= PULSE_0DEG;
            led_reg     <= '0';
        elsif rising_edge(clk_50MHz) then
            -- IMMEDIATE response to line sensor at each clock
            if line_sensor = '0' then
                pulse_width <= PULSE_0DEG;     -- Go to 0°
                led_reg     <= '1';            -- LED ON
            else
                pulse_width <= PULSE_180DEG;   -- Go to 180°
                led_reg     <= '0';            -- LED OFF
            end if;

            -- PWM counter
            if pwm_counter < PWM_PERIOD then
                pwm_counter <= pwm_counter + 1;
            else
                pwm_counter <= 0;
            end if;

            -- Generate PWM pulse
            if pwm_counter < pulse_width then
                pwm_signal <= '1';
            else
                pwm_signal <= '0';
            end if;
        end if;
    end process;

    -- Final outputs
    servo_pwm <= pwm_signal;
    led_out   <= led_reg;

end Behavioral;
