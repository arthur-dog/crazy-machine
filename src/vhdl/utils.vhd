library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

package utils is


    subtype percent is natural range 0 to 100;
    subtype servo_range_degrees is natural range 0 to 120;
    subtype ubyte is unsigned(7 downto 0);

    constant UBYTE_SIZE     : natural;
    constant SCALING_FACTOR : unsigned;

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

    constant UBYTE_SIZE : natural := 2 ** ubyte'length - 1;

    constant SCALING_FACTOR : unsigned := to_unsigned(2 ** 7, 32);

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

    function map_range (
        input_value  : natural;
        input_start  : natural;
        input_end    : natural;
        output_start : natural;
        output_end   : natural
    ) return natural is
    begin
        return to_integer(((integer(real(output_start) + (((real(output_end) - real(output_start)) / (real(input_end) - real(input_start))) * real(to_integer(SCALING_FACTOR)))) *
                            to_integer((input_value - input_start) * SCALING_FACTOR))) / (SCALING_FACTOR * SCALING_FACTOR));
    end function;


    function map_from_zero_natural_range(
        input_value : natural;
        input_high  : natural;
        output_high : natural

    ) return natural is
    begin
        return to_integer(((input_value * SCALING_FACTOR) *
                           integer((real(output_high) * real(to_integer(SCALING_FACTOR))) / real(input_high))) /
                          (SCALING_FACTOR * SCALING_FACTOR));
    end function;

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
