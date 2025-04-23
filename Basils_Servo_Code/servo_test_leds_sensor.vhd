library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity servo_test_leds_sensor is
    Port (
        clk_50MHz    : in  STD_LOGIC;      -- 50 MHz clock
        sw0          : in  STD_LOGIC;      -- Switch for 45°
        sw1          : in  STD_LOGIC;      -- Switch for 90° override
        line_sensor  : in  STD_LOGIC;      -- Digital line sensor input
        led0         : out STD_LOGIC;      -- LEDR0 (sw0 state)
        led1         : out STD_LOGIC;      -- LEDR1 (sw1 state)
        led2         : out STD_LOGIC;      -- LEDR2 (line sensor detected)
        servo_pwm    : out STD_LOGIC       -- PWM output to servo
    );
end servo_test_leds_sensor;

architecture Behavioral of servo_test_leds_sensor is

    -- PWM timing constants
    constant PWM_PERIOD     : integer := 1000000;  -- 20ms = 1,000,000 @ 50MHz
    constant PULSE_0_DEG    : integer := 50000;    -- 1ms pulse = 0°
    constant PULSE_45_DEG   : integer := 75000;    -- 1.5ms pulse = ~45°
    constant PULSE_90_DEG   : integer := 100000;    -- 2ms pulse = ~90°

    signal counter      : integer range 0 to PWM_PERIOD := 0;
    signal pulse_width  : integer := PULSE_0_DEG;
    signal pwm_out      : std_logic := '0';

begin

    -- PWM signal generation
    process(clk_50MHz)
    begin
        if rising_edge(clk_50MHz) then
            -- Set servo angle
            if sw1 = '1' then
                pulse_width <= PULSE_90_DEG;   -- Override: full
            elsif sw0 = '1' then
                pulse_width <= PULSE_45_DEG;   -- Mid
            else
                pulse_width <= PULSE_0_DEG;    -- Min
            end if;

            -- PWM timing
            if counter < PWM_PERIOD then
                counter <= counter + 1;
            else
                counter <= 0;
            end if;

            -- PWM output
            if counter < pulse_width then
                pwm_out <= '1';
            else
                pwm_out <= '0';
            end if;
        end if;
    end process;

    -- LED outputs
    led0 <= sw0;  -- LEDR0 lights when SW0 is ON
    led1 <= sw1;  -- LEDR1 lights when SW1 is ON
    led2 <= not line_sensor;  -- LEDR2 lights when line is detected (sensor = 0)

    servo_pwm <= pwm_out;

end Behavioral;
