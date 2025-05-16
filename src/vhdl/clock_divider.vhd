library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- sometimes we need to divide clock signals. this component allows us to do
-- that. giving it a division factor it divides the clock by that number. you
-- can only supply it numbers that are powers of 2, however.

entity clock_divider is
    port(
        clk_50MHz          : in  std_logic;
        reset              : in  std_logic;
        clk_divider_factor : in  unsigned(31 downto 0);
        clk_out            : out std_logic);
end clock_divider;

architecture base of clock_divider is
    signal r_clk_counter      : unsigned(31 downto 0);
    signal r_clk_divider      : unsigned(31 downto 0);
    signal r_clk_divider_half : unsigned(31 downto 0);

    signal result_clk : std_logic;

begin
    p_clk_divider : process(clk_50MHz)
    begin
        if rising_edge(clk_50MHz) then
            if reset = '1' then
                r_clk_counter      <= (others => '0');
                r_clk_divider      <= (others => '0');
                r_clk_divider_half <= (others => '0');
                result_clk            <= '1';
            else
                r_clk_divider      <= clk_divider_factor - 1;
                r_clk_divider_half <= shift_right(clk_divider_factor, 1);  -- half
                if r_clk_counter < r_clk_divider_half then
                    r_clk_counter <= r_clk_counter + 1;
                    result_clk       <= '0';
                elsif r_clk_counter = r_clk_divider then
                    r_clk_counter <= (others => '0');
                    result_clk       <= '1';
                else
                    r_clk_counter <= r_clk_counter + 1;
                    result_clk       <= '1';
                end if;
            end if;
        end if;
    end process p_clk_divider;

    -- have passthrough capability
    clk_out <= result_clk when clk_divider_factor > 0 else clk_50MHz;

end base;
