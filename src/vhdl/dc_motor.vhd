library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity dc_motor is
    generic (
        BASE_CLOCK : natural := 50e6
    );
    port (
        clk_in    : in  std_logic;
        reset     : in  std_logic;
        duty      : in  ubyte;
        direction : in  t_direction;
        input_a   : out std_logic;
        input_b   : out std_logic;
        sync_out  : out std_logic
    );
end dc_motor;

architecture base of dc_motor is

    signal pwm_out : std_logic;

begin

    dc_pwm_inst : entity work.pwm(base)
        generic map (
            BASE_CLOCK => BASE_CLOCK)
        port map (
            clk_in   => clk_in,
            reset    => reset,
            duty     => duty,
            pwm_out  => pwm_out,
            sync_out => sync_out);

    dc_process : process (clk_in)
    begin
        if rising_edge(clk_in) then
            case direction is
                when CLOCKWISE =>
                input_a <= pwm_out;
                input_b <= '0';
                when ANTICLOCKWISE =>
                input_b <= pwm_out;
                input_a <= '0';
            end case;
        end if;

    end process;

end base;
