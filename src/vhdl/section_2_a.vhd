library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity section_2_a is
    generic (
        START_POS : natural := 0;
        END_POS : natural := 120;
        WAIT_TIME_MS : natural := 1
    );
    port (
        clk_in : in std_logic;
        reset : in std_logic;
        limit_sw_in : in std_logic;
        servo_out : in std_logic
    );
end section_2_a;

architecture base of section_2_a is

begin



end base;
