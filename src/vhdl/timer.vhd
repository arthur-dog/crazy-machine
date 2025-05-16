library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
library work;
use work.utils.all;

entity timer is
    generic (
        BASE_CLOCK : natural := BASE_CLOCK_PHYS
    );
    port (
        clk_in      : in  std_logic;
        activate    : in  std_logic;
        time_set_ms : in  natural;
        finished    : out std_logic;
        reset       : in  std_logic
    );
end timer;

-- the timer works by putting the desired milliseconds of delay into
-- `time_activate_ms` and sending `activate` high. after the specified time has
-- elapsed, `finished` goes high and will stay high until the `reset` port has
-- gone high. the user is then free to give it another delay and activate it
-- again using the aforementioned procedure.

architecture base of timer is

    -- calculate how many clock cycles are within one millisecond
    constant MILLISECOND             : real    := real(1e3);
    constant PERIODS_PER_MILLISECOND : natural := natural(real(BASE_CLOCK) / MILLISECOND);

    signal periods_to_count : natural := time_set_ms * PERIODS_PER_MILLISECOND;
    signal armed            : boolean := false;
    signal period_count     : natural := 0;

begin

    timing : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                periods_to_count <= 0;
                armed            <= false;
                period_count     <= 0;
                finished         <= '0';
            else
                if (armed = false) and (activate = '1') then
                    periods_to_count <= time_set_ms * PERIODS_PER_MILLISECOND - 1;
                    period_count     <= 1;
                    armed            <= true;
                end if;
                if armed = true then
                    period_count <= period_count + 1;
                    if period_count > periods_to_count then
                        armed    <= false;
                        finished <= '1';
                    end if;
                    if period_count > periods_to_count then
                        armed    <= false;
                        finished <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;

end base;
