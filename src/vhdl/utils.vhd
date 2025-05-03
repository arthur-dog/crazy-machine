library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package utils is

function map_range (
    input : unsigned;
    input_start : unsigned;
    input_end : unsigned;
    output_start : unsigned;
    output_end : unsigned
) return unsigned;

function percent_to_byte (
    percent : unsigned
) return unsigned;

end utils;

package body utils is

    function map_range (
    input : unsigned;
    input_start : unsigned;
    input_end : unsigned;
    output_start : unsigned;
    output_end : unsigned
) return
end utils;
