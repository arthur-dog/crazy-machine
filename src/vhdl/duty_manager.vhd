library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
library work;
use work.utils.all;

entity duty_manager is
    generic(
        START_POS    : servo_range_degrees := 0;
        END_POS      : servo_range_degrees := 120;
        OSCILLATIONS : natural             := 1;
        STEP_SIZE    : natural range 1 to 120
    );
    port (
        clk_in   : in  std_logic;
        reset    : in  std_logic;
        duty_out : out ubyte
    );
end duty_manager;

architecture simple_servo of duty_manager is

    subtype t_rotation is natural;
    type t_direction is (CLOCKWISE, ANTICLOCKWISE);

    signal oscillation_count : natural range 0 to OSCILLATIONS + 1 := 0;
    signal rotation          : t_rotation                          := START_POS;
    signal direction         : t_direction                         := CLOCKWISE;
    signal running           : boolean                             := true;

begin
    duty_sweep : process (clk_in)
    begin
        if rising_edge(clk_in) then
            if reset = '1' then
                oscillation_count <= 0;
                duty_out          <= to_unsigned(START_POS, ubyte'length);
                direction         <= CLOCKWISE;
                running           <= true;
            else
                if oscillation_count < OSCILLATIONS then
                    duty_out <= servo_range_degrees_to_ubyte(rotation);
                    case direction is
                        when CLOCKWISE =>
                            rotation <= rotation + STEP_SIZE;
                            if rotation >= END_POS then
                                direction         <= ANTICLOCKWISE;
                                oscillation_count <= oscillation_count + 1;
                                rotation          <= END_POS;
                            end if;
                        when ANTICLOCKWISE =>
                            rotation    <= rotation - STEP_SIZE;
                            if rotation <= START_POS then
                                direction         <= CLOCKWISE;
                                oscillation_count <= oscillation_count + 1;
                                rotation          <= START_POS;
                            end if;
                    end case;
                end if;
            end if;
        end if;
    end process;
end simple_servo;
