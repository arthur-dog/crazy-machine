library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_level is
    Port (
        MAX10_CLK1_50 : in    std_logic;
        GPIO          : inout std_logic_vector(35 downto 0)
        --Section 1:
        --GPIO[3]: servo
        --GPIO[1]: FSR
        --Section 2:
        --GPIO[5]: Limit sw
        --GPIO[7]: Servo 1
        --GPIO[9]: Line sensor
        --GPIO[11]: Servo 2
        --Section 3:
        --GPIO[13]: DC control[0]
        --GPIO[15]: DC control[1]
        --GPIO[17]: DC control[2]
        --GPIO[19]: DC control[3]
        --Section 4:
        --GPIO[27]: Line sensor
        --GPIO[29]: Stepper[0]
        --GPIO[31]: Stepper[1]
        --GPIO[33]: Stepper[2]
        --GPIO[35]: Stepper[3]
        --Global:
        --GPIO[2]: Reset
    );
end top_level;
