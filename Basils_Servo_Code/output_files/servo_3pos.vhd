library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity servo_3pos is
    Port (
        clk_50MHz : in  STD_LOGIC;      -- 50 MHz clock
        sw0       : in  STD_LOGIC;      -- Position select (LSB)
        sw1       : in  STD_LOGIC;      -- Position select (MSB / priority)
        servo_pwm : out STD_LOGIC       -- PWM output to servo
    );
end servo_3pos;

architecture Behavioral of servo_3pos is

    -- PWM timing constants
    constant PWM_PERIOD      : integer := 1000000;  -- 20ms = 1,000,000 @ 50MHz
    constant PULSE_0_DEG     : integer := 50000;    -- 1ms = 0°
    constant PULSE_90_DEG    : integer := 75000;    -- 1.5ms = 90°
    constant PULSE_180_DEG   : integer := 100000;   -- 2ms = 180°

    signal counter      : integer range 0 to PWM_PERIOD := 0;
    signal pulse_width  : integer := PULSE_0_DEG;
    signal pwm_out      : std_logic := '0';

begin

    -- PWM signal generation
    process(clk_50MHz)
    begin
        if rising_edge(clk_50MHz) then
            -- Determine pulse width based on switches
            if sw1 = '1' then
                pulse_width <= PULSE_180_DEG;  -- Priority: go to 180°
            elsif sw0 = '1' then
                pulse_width <= PULSE_90_DEG;
            else
                pulse_width <= PULSE_0_DEG;
            end if;

            -- PWM timing counter
            if counter < PWM_PERIOD then
                counter <= counter + 1;
            else
                counter <= 0;
            end if;

            -- Generate PWM signal
            if counter < pulse_width then
                pwm_out <= '1';
            else
                pwm_out <= '0';
            end if;
        end if;
    end process;

    servo_pwm <= pwm_out;

end Behavioral;
