library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_level is
    Port (
        MAX10_CLK1_50 : in    std_logic;
        GPIO          : inout std_logic_vector(35 downto 0)
    );
end top_level;
