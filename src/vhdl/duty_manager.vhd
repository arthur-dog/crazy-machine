library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
library work;
use work.utils.all;

entity duty_manager is
    generic(
        BASE_CLOCK    : natural             := BASE_CLOCK_PHYS;
        START_POS     : servo_range_degrees := 0;
        END_POS       : servo_range_degrees := 120;
        -- OSCILLATIONS is the count of how many times the duty will go from
        -- one end of the position range to the other. an `OSCILLATIONS` of 2
        -- will go from START_POS to END_POS and then back to START_POS, for
        -- instance.
        OSCILLATIONS  : natural             := 1;
        WAIT_TIME_MS  : natural             := 0;
        SPEED_DIVIDER : natural             := 0;
        STEP_SIZE     : natural range 1 to 120
    );
    port (
        -- `clk_base` is the main clock of the system, 50MHz. needed so it can
        -- be passed on to the timer
        clk_base : in  std_logic;
        clk_in   : in  std_logic;
        reset    : in  std_logic;
        duty_out : out ubyte
    );
end duty_manager;

architecture simple_servo of duty_manager is

    subtype t_rotation is natural;

    signal oscillation_count : natural range 0 to OSCILLATIONS + 1 := 0;
    signal rotation          : t_rotation                          := START_POS;
    signal direction         : t_direction                         := CLOCKWISE;
    signal running           : boolean                             := true;

    signal timer_reset    : std_logic;
    signal timer_activate : std_logic;
    signal timer_finished : std_logic;

    signal divided_clk_in : std_logic;

begin

    clock_divider_inst : entity work.clock_divider(base)
        port map (
            clk_50MHz          => clk_in,
            reset              => reset,
            clk_divider_factor => to_unsigned(SPEED_DIVIDER, 32),
            clk_out            => divided_clk_in);

    oscillation_timer_inst : entity work.timer(base)
        generic map (
            BASE_CLOCK => BASE_CLOCK_PHYS)
        port map (
            clk_in      => clk_base,
            activate    => timer_activate,
            time_set_ms => WAIT_TIME_MS,
            finished    => timer_finished,
            reset       => timer_reset);

    duty_sweep : process (divided_clk_in)
    begin
        if rising_edge(divided_clk_in) then
            if reset = '1' then
                oscillation_count <= 0;
                duty_out          <= to_unsigned(START_POS, ubyte'length);
                rotation          <= START_POS;
                direction         <= CLOCKWISE;
                running           <= true;
                timer_reset       <= '1';
                timer_activate    <= '0';
            else

                -- this makes sure the activation signal stays a pulse
                if timer_activate = '1' then
                    timer_activate <= '0';
                end if;
                -- this handles when the timer finishes, activating the duty
                -- manager again.
                if timer_finished = '1' then
                    timer_reset <= '1';
                    running     <= true;
                end if;

                duty_out <= servo_range_degrees_to_ubyte(rotation);
                if oscillation_count < OSCILLATIONS then
                    if running = true then
                        case direction is
                            when CLOCKWISE =>
                                rotation <= rotation + STEP_SIZE;
                                if rotation >= END_POS then
                                    direction         <= ANTICLOCKWISE;
                                    oscillation_count <= oscillation_count + 1;
                                    rotation          <= END_POS;
                                    timer_reset       <= '0';  -- prepare timer
                                    -- for activation

                                    timer_activate <= '1';
                                    running        <= false;
                                end if;
                            when ANTICLOCKWISE =>
                                rotation    <= rotation - STEP_SIZE;
                                if rotation <= START_POS then
                                    direction         <= CLOCKWISE;
                                    oscillation_count <= oscillation_count + 1;
                                    rotation          <= START_POS;
                                    timer_reset       <= '0';
                                    timer_activate    <= '1';
                                    running           <= false;
                                end if;
                        end case;
                    end if;
                end if;
            end if;
        end if;
    end process;

end simple_servo;
