library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stepper_controller is
    Port (
        clk      : in  STD_LOGIC;       -- 50MHz clock
        reset    : in  STD_LOGIC;
        step_out : out STD_LOGIC_VECTOR(3 downto 0)  -- IN4 to IN1
    );
end stepper_controller;

architecture Behavioral of stepper_controller is

    type step_array is array(0 to 3) of STD_LOGIC_VECTOR(3 downto 0);
    constant steps : step_array := (
        "1001",  -- Step DA
        "1100",  -- Step CD
        "0110",  -- Step BC
        "0011"   -- Step AB
    );

    signal step_index : integer range 0 to 3 := 0;
    signal counter    : integer range 0 to 25_000_000 := 0;  -- ~0.5 sec delay at 50MHz
    signal step_sig   : STD_LOGIC_VECTOR(3 downto 0);

begin

    process(clk, reset)
    begin
        if reset = '1' then
            step_index <= 0;
            counter    <= 0;
        elsif rising_edge(clk) then
            if counter = 25_000_000 then
                counter    <= 0;
                step_index <= (step_index + 1) mod 4;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    step_sig <= steps(step_index);
    step_out <= step_sig;

end Behavioral;
