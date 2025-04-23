library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity servo_test is
    Port (
        clk_50MHz  : in  STD_LOGIC;      -- 50 MHz clock
        sw0        : in  STD_LOGIC;      -- SW0 (switch input)
        servo_pwm  : out STD_LOGIC       -- PWM output to servo
    );
end servo_test;

architecture Behavioral of servo_test is

    -- PWM timing constants
    constant PWM_PERIOD     : integer := 1000000;  -- 20ms = 1,000,000 cycles @ 50MHz
    constant PULSE_0_DEG    : integer := 50000;    -- 1ms pulse (0°)
    constant PULSE_180_DEG  : integer := 100000;   -- 2ms pulse (180°)

    signal counter      : integer range 0 to PWM_PERIOD := 0;
    signal pulse_width  : integer := PULSE_0_DEG;
    signal pwm_out      : std_logic := '0';

begin

    -- PWM generation process
    process(clk_50MHz)
    begin
        if rising_edge(clk_50MHz) then
            -- Set pulse width based on switch
            if sw0 = '1' then
                pulse_width <= PULSE_180_DEG;
            else
                pulse_width <= PULSE_0_DEG;
            end if;

            -- Increment PWM counter
            if counter < PWM_PERIOD then
                counter <= counter + 1;
            else
                counter <= 0;
            end if;

            -- Output PWM signal
            if counter < pulse_width then
                pwm_out <= '1';
            else
                pwm_out <= '0';
            end if;
        end if;
    end process;

    servo_pwm <= pwm_out;

end Behavioral;
