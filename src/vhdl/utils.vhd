library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package utils is

    subtype percent is natural range 0 to 100;
    subtype servo_range_degrees is natural range 0 to 180;
    subtype ubyte is unsigned(7 downto 0);

    function map_range (
        input_value  : unsigned;
        input_start  : unsigned;
        input_end    : unsigned;
        output_start : unsigned;
        output_end   : unsigned
    ) return unsigned;

    function percent_to_ubyte (
        percent_val : percent
    ) return ubyte;

    function servo_range_degrees_to_ubyte (
        degrees : servo_range_degrees
    ) return ubyte;

end utils;

package body utils is

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

    function percent_to_ubyte (
        percent_val : percent
    ) return ubyte is
    begin
        return resize(map_range(to_unsigned(percent_val, 8), to_unsigned(percent'low, 1), to_unsigned(percent'high, 8),
                                to_unsigned(0, 1), to_unsigned(255, 8)), 8);
    end function;

    function servo_range_degrees_to_ubyte (
        degrees : servo_range_degrees
    ) return ubyte is
    begin
        return resize(map_range(to_unsigned(degrees, 8), to_unsigned(servo_range_degrees'low, 1), to_unsigned(servo_range_degrees'high, 8),
                                to_unsigned(0, 1), to_unsigned(255, 8)), ubyte'length);
    end function;

end utils;
