library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity section_4 is
    generic (
        SPEED_DIVIDER : natural     := 0;
        DIRECTION     : t_direction := CLOCKWISE
    );
    port (
        clk_in           : in  std_logic;
        reset            : in  std_logic;
        activate   : in  std_logic;
        stepper_code_out : out std_logic_vector(3 downto 0)
    );
end section_4;

architecture base of section_4 is

    signal reset_signal : std_logic := '1';

    signal divided_clk : std_logic;

begin

    clock_divider_inst: entity work.clock_divider(base)
      port map (
        clk_50MHz          => clk_in,
        reset              => reset,
        clk_divider_factor => to_unsigned(SPEED_DIVIDER, 32),
        clk_out            => divided_clk);

    stepper_motor_inst: entity work.stepper_motor(base)
      generic map (
        STEPPER_HERTZ => 200)
      port map (
        clk_in           => divided_clk,
        reset            => reset_signal,
        direction        => DIRECTION,
        stepper_code_out => stepper_code_out);

    trigger_p : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                reset_signal <= '1';
            else
                if activate = '1' then  -- single shot
                    reset_signal <= '0';
                end if;
            end if;
        end if;
    end process;



end base;
