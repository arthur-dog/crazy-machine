library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
library work;
use work.utils.all;

entity stepper_motor is
    port (
        clk_in           : in  std_logic;
        reset            : in  std_logic;
        clockwise        : in  std_logic;
        stepper_code_out : out std_logic_vector(3 downto 0)
    );
end stepper_motor;

architecture base of stepper_motor is

    signal stepper_code : unsigned(3 downto 0) := "0011";

begin
    stepper_process : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                stepper_code <= "0011";
            else
                if clockwise = '1' then
                    stepper_code <= rotate_left(stepper_code, 1);
                else
                    stepper_code <= rotate_right(stepper_code, 1);
                end if;
            end if;
            stepper_code_out <= std_logic_vector(stepper_code);
        end if;
    end process;

end base;
