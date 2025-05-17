library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
library work;
use work.utils.all;

entity stepper_motor is
    generic (
        BASE_CLOCK    : natural := BASE_CLOCK_PHYS;
        STEPPER_HERTZ : natural := 100

    );
    port (
        clk_in           : in  std_logic;
        reset            : in  std_logic;
        direction        : in  t_direction;
        stepper_code_out : out std_logic_vector(3 downto 0)
    );
end stepper_motor;

architecture base of stepper_motor is

    constant CLOCK_DIVISOR : natural := BASE_CLOCK / STEPPER_HERTZ;

    signal divided_clk : std_logic;

    signal stepper_code : unsigned(3 downto 0) := "0011";

begin

    clock_divider_inst : entity work.clock_divider(base)
        port map (
            clk_50MHz          => clk_in,
            reset              => reset,
            clk_divider_factor => to_unsigned(CLOCK_DIVISOR, 32),
            clk_out            => divided_clk);

    stepper_process : process (divided_clk)
    begin
        if rising_edge(divided_clk) then
            if reset = '1' then
                stepper_code <= "0011";
            else
                case direction is
                    when CLOCKWISE =>
                        stepper_code <= rotate_left(stepper_code, 1);
                    when ANTICLOCKWISE =>
                        stepper_code <= rotate_right(stepper_code, 1);
                end case;
                stepper_code_out <= std_logic_vector(stepper_code);
            end if;
        end if;
    end process;

end base;
