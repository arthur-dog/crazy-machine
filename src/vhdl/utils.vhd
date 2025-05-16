library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

package utils is

    type t_direction is (CLOCKWISE, ANTICLOCKWISE);

    subtype percent is natural range 0 to 100;
    subtype servo_range_degrees is natural range 0 to 120;

    -- `ubyte` is an important type because this is how the duty cycle of a pwm
    -- wave is represented. I believe that 255 degrees of precision is
    -- sufficient for our needs, and making it an `unsigned` type means we can
    -- cheaply perform arithmetic on it.
    subtype ubyte is unsigned(7 downto 0);

    constant UBYTE_SIZE      : natural;
    constant SCALING_FACTOR  : unsigned;
    constant BASE_CLOCK_PHYS : natural;


    function map_range (
        input_value  : unsigned;
        input_start  : unsigned;
        input_end    : unsigned;
        output_start : unsigned;
        output_end   : unsigned
    ) return unsigned;

    function map_range (
        input_value  : natural;
        input_start  : natural;
        input_end    : natural;
        output_start : natural;
        output_end   : natural
    ) return natural;

    function map_from_zero_natural_range (
        input_value : natural;
        input_high  : natural;
        output_high : natural
    ) return natural;

    function percent_to_ubyte (
        percent_val : percent
    ) return ubyte;

    function servo_range_degrees_to_ubyte (
        degrees : servo_range_degrees
    ) return ubyte;

end utils;

package body utils is

    -- maximum value storable in a byte, 255
    constant UBYTE_SIZE : natural := 2 ** ubyte'length - 1;

    -- because we are dealing with unsigned integers in the `map_range`
    -- function, we need to scale up floating point values to preserve the
    -- decimal places.
    constant SCALING_FACTOR : unsigned := to_unsigned(2**7, 24);

    -- base clock of the de10 lite, 50MHz
    constant BASE_CLOCK_PHYS : natural := 1e3;



    function map_range (
        input_value  : unsigned;
        input_start  : unsigned;
        input_end    : unsigned;
        output_start : unsigned;
        output_end   : unsigned
    ) return unsigned is
    begin
        return output_start + ((output_end - output_start) / (input_end - input_start)) * (input_value - input_start);
    end function;

    -- maps one numeric range to another by calculating the ratio between the
    -- ranges and mapping a from one range to another.
    -- since the ranges we are mapping are known at synthesis-time, we can use
    -- the `real` type to do the arithemtic with real numbers. we need to scale
    -- up the ratio `(output_end - output_start)/(input_end - input_start)` so
    -- we can do arithmetic with natural numbers which would otherwise truncate
    -- our decimal places. we use `SCALING_FACTOR` to do this. we then multiply
    -- the input value by the scaled ratio, and then scale it down again by
    -- dividing by `SCALING_FACTOR`.
    --
    -- This technique preserves the precision of the calculation, whilst also
    -- performing complex integer division at systhesis-time so we dont have a
    -- slow and complex resultant design.
    function map_range (
        input_value  : natural;
        input_start  : natural;
        input_end    : natural;
        output_start : natural;
        output_end   : natural
    ) return natural is
    begin
        return to_integer(output_start + integer(((real(output_end) - real(output_start)) / (real(input_end) - real(input_start))) * real(to_integer(SCALING_FACTOR))) *
                                         (input_value - input_start) / SCALING_FACTOR);
    end function;


    -- does the same thing as `map_range` except we can avoid some of the
    -- verboseness of that fuction if both of our ranges start at 0.
    function map_from_zero_natural_range(
        input_value : natural;
        input_high  : natural;
        output_high : natural

    ) return natural is
    begin
        return to_integer((input_value *
                           integer((real(output_high) * real(to_integer(SCALING_FACTOR))) / real(input_high))) /
                          SCALING_FACTOR);
    end function;

    -- helper functions that map scalar types to other scalar types. used
    -- primarily for computing duty values.
    function percent_to_ubyte (
        percent_val : percent
    ) return ubyte is
    begin
        return to_unsigned(map_from_zero_natural_range(percent_val, percent'high, UBYTE_SIZE), ubyte'length);
    end function;

    function servo_range_degrees_to_ubyte (
        degrees : servo_range_degrees
    ) return ubyte is
    begin
        return to_unsigned(map_from_zero_natural_range(degrees, servo_range_degrees'high, UBYTE_SIZE), ubyte'length);
    end function;

end utils;
