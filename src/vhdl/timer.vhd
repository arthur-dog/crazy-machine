library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity timer is
    generic (
        BASE_CLOCK : natural := 50e6
    );
    port (
        clk_in      : in  std_logic;
        activate    : in  std_logic;
        time_set_ms : in  natural;
        finished    : out std_logic;
        reset       : in  std_logic
    );
end timer;

architecture base of timer is

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
