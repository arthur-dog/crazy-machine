library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity top_level is
    port (
        MAX10_CLK1_50 : in    std_logic;
        KEY           : in    std_logic_vector(1 downto 0);
        GPIO          : inout std_logic_vector(35 downto 0)
    );
end top_level;

architecture base of top_level is

    alias clk_50MHz : std_logic is MAX10_CLK1_50;
    alias reset_pin : std_logic is KEY(0);

    alias s1_servo : std_logic is GPIO(3);
    alias s1_fsr   : std_logic is GPIO(1);

    alias s2_a_limit_sw : std_logic is GPIO(5);
    alias s2_a_servo    : std_logic is GPIO(7);

    alias s2_b_line_sensor : std_logic is GPIO(9);
    alias s2_b_servo       : std_logic is GPIO(11);

    alias s3_dc_1_ia : std_logic is GPIO(13);
    alias s3_dc_1_ib : std_logic is GPIO(15);
    alias s3_dc_2_ia : std_logic is GPIO(17);
    alias s3_dc_2_ib : std_logic is GPIO(19);

    alias s4_line_sensor     : std_logic is GPIO(27);
    alias s4_stepper_motor_A : std_logic is GPIO(29);
    alias s4_stepper_motor_B : std_logic is GPIO(31);
    alias s4_stepper_motor_C : std_logic is GPIO(33);
    alias s4_stepper_motor_D : std_logic is GPIO(35);

    signal reset_signal, reset_activate : std_logic := '0';

    signal s1_activate, s2_a_activate, s2_b_activate, s3_activate, s4_activate : std_logic := '0';

begin


    cm_state_machine_inst : entity work.cm_state_machine(base)
        generic map (
            SECTION_2_B_WAIT_TIME_MS => 3000,
            SECTION_3_WAIT_TIME_MS   => 9000,
            SECTION_4_WAIT_TIME_MS   => 30_000)
        port map (
            clk_in         => clk_50MHz,
            s1_fsr         => s1_fsr,
            s1_activate    => s1_activate,
            s2_a_limit_sw  => s2_a_limit_sw,
            s2_a_activate  => s2_a_activate,
            s2_b_activate  => s2_b_activate,
            s3_activate    => s3_activate,
            s4_line_sensor => s4_line_sensor,
            s4_activate    => s4_activate,
            reset_in       => reset_signal,
            reset_out      => reset_activate);

    section_1_inst : entity work.section_1(base)
        generic map (
            SERVO_START_POS => 120,
            SERVO_END_POS   => 0,
            SPEED_DIVIDER   => 0)
        port map (
            clk_in        => clk_50MHz,
            reset         => reset_activate,
            activate      => s1_activate,
            servo_pwm_out => s1_servo);

    section_2_a_inst : entity work.section_2_a(base)
        generic map (
            START_POS     => 20,
            END_POS       => 120,
            WAIT_TIME_MS  => 1000,
            SPEED_DIVIDER => 0)
        port map (
            clk_in    => clk_50MHz,
            reset     => reset_activate,
            activate  => s2_a_activate,
            servo_out => s2_a_servo);

    section_2_b_inst : entity work.section_2_b(base)
        generic map (
            START_POS     => 20,
            END_POS       => 100,
            WAIT_TIME_MS  => 3000,
            SPEED_DIVIDER => 0)
        port map (
            clk_in    => clk_50MHz,
            reset     => reset_activate,
            activate  => s2_b_activate,
            servo_out => s2_b_servo);

    section_3_inst : entity work.section_3(base)
        generic map (
            SPEED     => percent_to_ubyte(50),
            DIRECTION => CLOCKWISE)
        port map (
            clk_in    => clk_50MHz,
            reset     => reset_activate,
            activate  => s3_activate,
            dc_ia_out => s3_dc_1_ia,
            dc_ib_out => s3_dc_1_ib);

    section_4_inst : entity work.section_4(base)
        generic map (
            SPEED_DIVIDER => 0,
            DIRECTION     => CLOCKWISE)
        port map (
            clk_in              => clk_50MHz,
            reset               => reset_activate,
            activate            => s4_activate,
            stepper_code_out(0) => s4_stepper_motor_A,
            stepper_code_out(1) => s4_stepper_motor_B,
            stepper_code_out(2) => s4_stepper_motor_C,
            stepper_code_out(3) => s4_stepper_motor_D);

    reset_signal <= not reset_pin;
end base;
