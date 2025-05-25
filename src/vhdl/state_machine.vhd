library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.utils.all;

entity cm_state_machine is
    generic (
        SECTION_2_B_WAIT_TIME_MS : natural := 3000;
        SECTION_3_WAIT_TIME_MS   : natural := 9000;
        SECTION_4_WAIT_TIME_MS   : natural := 30000  -- 30 seconds for the spiral
                                                    -- to complete

    );
    port (
        clk_in : in std_logic;

        s1_fsr      : in  std_logic;
        s1_activate : out std_logic;

        s2_a_limit_sw : in  std_logic;
        s2_a_activate : out std_logic;

        s2_b_activate : out std_logic;

        s3_activate : out std_logic;

        s4_line_sensor : in  std_logic;
        s4_activate    : out std_logic;

        reset_in  : in  std_logic;
        reset_out : out std_logic

    );
end cm_state_machine;

architecture base of cm_state_machine is

    type t_cm_state is (RESET, SECTION_1, SECTION_2_A, SECTION_2_B, SECTION_3, SECTION_4);

    signal cm_state : t_cm_state := RESET;

    signal timer_activate, timer_reset, timer_finished : std_logic;
    signal timer_set_ms                                : natural;
    signal timer_prepping                              : boolean := false;

begin

    timer_inst : entity work.timer(base)
        port map (
            clk_in      => clk_in,
            activate    => timer_activate,
            time_set_ms => timer_set_ms,
            finished    => timer_finished,
            reset       => timer_reset);

    cm_state_machine_p : process (clk_in) is
    begin
        if rising_edge(clk_in) then
            if timer_activate = '1' then
                timer_activate <= '0';
            end if;
            if timer_reset = '1' then
                timer_reset <= '0';
            end if;
            if reset_in = '1' then
                cm_state <= RESET;
            end if;
            if cm_state /= RESET then
                if reset_in = '0' then
                    reset_out <= '0';
                end if;
            end if;
            case cm_state is
                when RESET =>
                    timer_reset <= '1';
                    reset_out   <= '1';
                    cm_state    <= SECTION_1;

                when SECTION_1 =>
                    if s1_fsr = '1' then
                        s1_activate <= '1';
                        cm_state    <= SECTION_2_A;
                    end if;

                when SECTION_2_A =>
                    if s2_a_limit_sw = '0' then
                        s2_a_activate  <= '1';
                        timer_set_ms   <= SECTION_2_B_WAIT_TIME_MS;
                        timer_activate <= '1';
                        cm_state       <= SECTION_2_B;
                    end if;

                when SECTION_2_B =>
                    timer_set_ms <= SECTION_3_WAIT_TIME_MS;
                    if timer_prepping = true then
                        timer_activate <= '1';
                        timer_prepping <= false;
                        cm_state       <= SECTION_3;
                    end if;
                    if timer_finished = '1' then
                        timer_prepping <= true;
                        timer_reset    <= '1';
                        s2_b_activate  <= '1';
                    end if;

                when SECTION_3 =>
                    if timer_finished = '1' then
                        s3_activate <= '1';
                        timer_reset <= '1';
                        cm_state    <= SECTION_4;
                    end if;

                when SECTION_4 =>
                    if timer_finished = '1' then
                        cm_state <= RESET;
                    end if;
                    if timer_prepping = true then
                        timer_activate <= '1';
                        timer_prepping <= false;
                    end if;
                    if s4_line_sensor = '1' then
                        s4_activate    <= '1';
                        timer_reset    <= '1';
                        timer_set_ms  <= SECTION_4_WAIT_TIME_MS;
                        timer_prepping <= true;
                    end if;
            end case;
        end if;

    end process;
end base;
