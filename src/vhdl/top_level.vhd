library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

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

architecture rtl of top_level is

    signal duty_repr     : ubyte    := percent_to_ubyte(30);
    signal divided_clk : std_logic;

    constant clock_divisor : unsigned := "1000";
    alias clk_50MHz : std_logic is MAX10_CLK1_50;

begin
    clock_div_inst : entity work.clock_divider(rtl)
        port map (
            clk_50MHz          => clk_50MHz,
            reset              => GPIO(2),
            clk_divider_factor => std_logic_vector(clock_divisor),
            clk_out            => divided_clk);
    pwm_basic : entity work.pwm(base)
        port map (
            clk_in => clk_50MHz,
            reset => GPIO(2),
            duty => duty_repr,
            pwm_out => GPIO(3)
        );

    cycle_duty : process (divided_clk)
    begin
        if rising_edge(divided_clk) then
            duty_repr <= duty_repr + 10;
            end if;
    end process;
end rtl;
