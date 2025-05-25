library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity top_level is
    port (
        MAX10_CLK1_50 : in    std_logic;
        KEY           : in    std_logic_vector(1 downto 0);
        GPIO          : inout std_logic_vector(35 downto 0);
        DUTY_OUT      : out   std_logic_vector(7 downto 0)
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

    signal reset_signal : std_logic := '0';

begin

    section_2_a_inst : entity work.section_2_a(base)
        generic map (
            START_POS     => 20,
            END_POS       => 120,
            WAIT_TIME_MS  => 5,
            SPEED_DIVIDER => 0)
        port map (
            clk_in         => clk_50MHz,
            reset          => reset_signal,
            limit_sw_in    => s2_a_limit_sw,
            servo_out      => s2_a_servo,
            debug_duty_out => DUTY_OUT);

    reset_signal <= not reset_pin;
end base;
