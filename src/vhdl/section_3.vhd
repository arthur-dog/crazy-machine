library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity section_3 is
    generic (
        SPEED               : ubyte       := percent_to_ubyte(50);
        DIRECTION           : t_direction := CLOCKWISE;
        ACTIVATION_DELAY_MS : natural     := 10e3
    );
    port (
        clk_in    : in  std_logic;
        reset     : in  std_logic;
        s2_fsr_in : in  std_logic;
        dc_ia_out : out std_logic;
        dc_ib_out : out std_logic
    );
end section_3;

architecture base of section_3 is

    signal reset_signal : std_logic := '1';

    signal timer_activate : std_logic;
    signal timer_reset    : std_logic;
    signal timer_finished : std_logic;

begin

    timer_1 : entity work.timer(base)
        port map (
            clk_in      => clk_in,
            activate    => s2_fsr_in,
            time_set_ms => ACTIVATION_DELAY_MS,
            finished    => timer_finished,
            reset       => timer_reset);

    dc_motor_1 : entity work.dc_motor(base)
        port map (
            clk_in    => clk_in,
            reset     => reset_signal,
            duty      => SPEED,
            direction => DIRECTION,
            input_a   => dc_ia_out,
            input_b   => dc_ib_out,
            sync_out  => open);

    trigger_p : process (clk_in)
    begin
        if rising_edge(clk_in) then

            -- keep the signals pulses
            if timer_activate = '1' then
                timer_activate <= '0';
            end if;
            if timer_reset = '1' then
                timer_reset <= '0';
            end if;

            if reset = '1' then         -- to latch the reset signal
                reset_signal <= '1';
            else
                if s2_fsr_in = '1' then       -- activate timer
                    timer_reset    <= '0';
                    timer_activate <= '1';
                end if;
                if timer_finished = '1' then  -- activate dc motor on completion
                    reset_signal <= '0';
                end if;
            end if;
        end if;
    end process;


end base;
