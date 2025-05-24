library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity section_1 is
    generic (
        SERVO_START_POS : servo_range_degrees := 0;
        SERVO_END_POS   : servo_range_degrees := 120;
        SPEED_DIVIDER   : natural             := 0;
        BASE_CLOCK      : natural             := BASE_CLOCK_PHYS
    );
    port (
        clk_in        : in  std_logic;
        reset         : in  std_logic;
        fsr_in        : in  std_logic;
        servo_pwm_out : out std_logic
    );
end section_1;

architecture base of section_1 is

    signal sync_clk : std_logic;

    signal duty_val : ubyte := servo_range_degrees_to_ubyte(SERVO_START_POS);

    signal reset_signal_reading : std_logic := '1';
    signal reset_signal : std_logic := '1';
    signal fsr_sig : std_logic := '1';

begin

    duty_manager_inst : entity work.duty_manager(simple_servo)
        generic map (
            START_POS     => SERVO_START_POS,
            END_POS       => SERVO_END_POS,
            SPEED_DIVIDER => SPEED_DIVIDER,
            OSCILLATIONS  => 1,
            STEP_SIZE     => 10)
        port map (
            clk_base => clk_in,
            clk_in   => sync_clk,
            reset    => reset_signal,
            duty_out => duty_val);

    dc_pwm_gen_inst : entity work.pwm(servo)
        generic map (
            BASE_CLOCK => BASE_CLOCK)
        port map (
            clk_in   => clk_in,
            reset    => '0',  -- reset works by resetting duty manager
            duty     => duty_val,
            pwm_out  => servo_pwm_out,
            sync_out => sync_clk);

    trigger_p : process (clk_in)
    begin
        if rising_edge(clk_in) then
            fsr_sig <= fsr_in;
            reset_signal_reading <= reset;
            if reset_signal_reading = '1' then
                reset_signal <= '1';
            else
                if fsr_sig = '1' then    -- single shot
                    reset_signal <= '0';
                end if;
            end if;
        end if;
    end process;



end base;
