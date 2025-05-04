library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity pwm is
generic (
    BASE_CLOCK : unsigned := to_unsigned(50_000_000, 24)
);
port (
    clk_in  : in  std_logic;
    reset   : in  std_logic;
    duty    : in  ubyte;
    clk_out : out std_logic
);
end pwm;

architecture rtl of pwm is

    constant PWM_PERIOD : unsigned := (BASE_CLOCK / (100 / 2));
    constant PWM_0_DEG : unsigned := (BASE_CLOCK / (1000 / 1));
    constant PWM_180_DEG : unsigned := (BASE_CLOCK / (1000 / 2));

    subtype duty_hertz is integer range to_integer(PWM_0_DEG) to to_integer(PWM_180_DEG);

    function duty_byte_to_duty_hertz (
        duty_byte : ubyte
    ) return duty_hertz is
    begin
        return
        end function;



end rtl;
