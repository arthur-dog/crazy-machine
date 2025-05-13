library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity top_level is
    Port (
        MAX10_CLK1_50 : in    std_logic;
        GPIO          : inout std_logic_vector(35 downto 0)
        --Section 1:
        --GPIO[3]: servo
        --GPIO[1]: FSR
        --Section 2:
        --GPIO[5]: Limit sw
        --GPIO[7]: Servo 1
        --GPIO[9]: Line sensor
        --GPIO[11]: Servo 2
        --Section 3:
        --GPIO[13]: DC control[0]
        --GPIO[15]: DC control[1]
        --GPIO[17]: DC control[2]
        --GPIO[19]: DC control[3]
        --Section 4:
        --GPIO[27]: Line sensor
        --GPIO[29]: Stepper[0]
        --GPIO[31]: Stepper[1]
        --GPIO[33]: Stepper[2]
        --GPIO[35]: Stepper[3]
        --Global:
        --GPIO[2]: Reset
    );
end top_level;

architecture rtl of top_level is

    signal duty_repr   : ubyte := percent_to_ubyte(50);
    constant duty_test : ubyte := servo_range_degrees_to_ubyte(15);
    signal divided_clk : std_logic;
    signal pwm_output  : std_logic;
    signal sync_clk    : std_logic;

    constant clock_divider_target_hertz : natural  := 1e6;
    constant clock_divisor              : unsigned := to_unsigned(50e5 / 50000, 32);
    alias clk_50MHz                     : std_logic is MAX10_CLK1_50;

begin



    -- timer_inst : entity work.timer(base)
    --     generic map (
    --         BASE_CLOCK => 50e3
    --     )
    --     port map (
    --         clk_in => clk_50MHz,
    --         activate => '1',
    --         time_set_ms => 2,
    --         finished => GPIO(3),
    --         reset => GPIO(2)
    --     );

    clock_div_inst : entity work.clock_divider(rtl)
        port map (
            clk_50MHz          => clk_50MHz,
            reset              => GPIO(2),
            clk_divider_factor => clock_divisor,
            clk_out            => divided_clk
        );
    -- stepper_motor_inst : entity work.stepper_motor(base)
    --     port map (
    --         clk_in => divided_clk,
    --         reset => GPIO(2),
    --         clockwise => '1',
    --         stepper_code_out => GPIO(35 downto 32)
    --     );
    pwm_basic : entity work.pwm(base)
        generic map (
            BASE_CLOCK => 50e4
        )
        port map (
            clk_in   => clk_50MHz,
            reset    => GPIO(2),
            duty     => duty_repr,
            pwm_out  => pwm_output,
            sync_out => sync_clk);
    duty_manager_inst : entity work.duty_manager(simple_servo)
        generic map (
            START_POS    => 10,
            END_POS      => 120,
            OSCILLATIONS => 1,
            STEP_SIZE    => 5)
        port map (
            clk_in   => sync_clk,
            reset    => GPIO(2),
            duty_out => duty_repr);

    GPIO(3)            <= pwm_output;
    GPIO(4)            <= divided_clk;
    GPIO(18 downto 11) <= std_logic_vector(duty_repr);
    GPIO(5)            <= sync_clk;

    -- cycle_duty : process (divided_clk)
    -- begin
    --     if rising_edge(divided_clk) then
    --         duty_repr <= duty_repr + 10;
    --     end if;
    -- end process;
end rtl;
