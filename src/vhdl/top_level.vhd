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
    constant clock_divisor              : unsigned := to_unsigned(4, 32);

    alias clk_50MHz : std_logic is MAX10_CLK1_50;
    alias reset_pin : std_logic is GPIO(2);

    alias s1_servo : std_logic is GPIO(3);
    alias s1_fsr   : std_logic is GPIO(1);

    alias s2_limit_sw    : std_logic is GPIO(5);
    alias s2_line_sensor : std_logic is GPIO(9);
    alias s2_servo_1     : std_logic is GPIO(7);
    alias s2_servo_2     : std_logic is GPIO(11);

    alias s3_dc_1_ia : std_logic is GPIO(13);
    alias s3_dc_1_ib : std_logic is GPIO(15);
    alias s3_dc_2_ia : std_logic is GPIO(17);
    alias s3_dc_2_ib : std_logic is GPIO(19);

    alias s4_line_sensor : std_logic is GPIO(27);
    alias s4_stepper_motor_A : std_logic is GPIO(29);
    alias s4_stepper_motor_B : std_logic is GPIO(31);
    alias s4_stepper_motor_C : std_logic is GPIO(33);
    alias s4_stepper_motor_D : std_logic is GPIO(35);

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

    clock_div_inst : entity work.clock_divider(base)
        port map (
            clk_50MHz          => sync_clk,
            reset              => reset_pin,
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
    pwm_basic : entity work.pwm(servo)
        generic map (
            BASE_CLOCK => BASE_CLOCK_PHYS
        )
        port map (
            clk_in   => clk_50MHz,
            reset    => reset_pin,
            duty     => duty_repr,
            pwm_out  => pwm_output,
            sync_out => sync_clk);
    duty_manager_inst : entity work.duty_manager(simple_servo)
        generic map (
            BASE_CLOCK => BASE_CLOCK_PHYS,
            START_POS    => 10,
            END_POS      => 120,
            WAIT_TIME_MS => 1,
            OSCILLATIONS => 3,
            STEP_SIZE    => 5)
        port map (
            clk_base => clk_50MHz,
            clk_in   => divided_clk,
            reset    => reset_pin,
            duty_out => duty_repr);

    s1_servo            <= pwm_output;
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
