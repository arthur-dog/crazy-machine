library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity section_1 is
    generic (
        SERVO_START_POS : servo_range_degrees   := 0;
        SERVO_END_POS   : servo_range_degrees   := 120;
        SERVO_SPEED     : unsigned(31 downto 0) := to_unsigned(4, 32);
        BASE_CLOCK      : natural               := BASE_CLOCK_PHYS
    );
    port (
        clk_in        : in  std_logic;
        reset         : in  std_logic;
        fsr_in        : in  std_logic;
        servo_pwm_out : out std_logic
    );
end section_1;

architecture base of section_1 is

    signal sync_clk    : std_logic;
    signal divided_clk : std_logic;

    signal duty_val : ubyte := percent_to_ubyte(0);

    signal reset_signal : std_logic := '1';

begin


    clock_divider_inst : entity work.clock_divider(base)
        port map (
            clk_50MHz          => sync_clk,
            reset              => reset_signal,
            clk_divider_factor => SERVO_SPEED,
            clk_out            => divided_clk);

    duty_manager_inst : entity work.duty_manager(base)
        generic map (
            START_POS    => SERVO_START_POS,
            END_POS      => SERVO_END_POS,
            OSCILLATIONS => 1,
            STEP_SIZE    => 1)
        port map (
            clk_base => clk_in,
            clk_in   => divided_clk,
            reset    => reset_signal,
            duty_out => duty_val);

    dc_pwm_gen_inst : entity work.pwm(servo)
        generic map (
            BASE_CLOCK => BASE_CLOCK)
        port map (
            clk_in   => clk_in,
            reset    => '0', -- reset works by resetting duty manager
            duty     => duty_val,
            pwm_out  => pwm_out,
            sync_out => sync_out);

    trigger_p : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                reset_signal <= '1';
            else
                if fsr_in = '1' then -- single shot
                    reset_signal <= '0';
                    end if;
            end if;
        end if;
    end process;

end base;
