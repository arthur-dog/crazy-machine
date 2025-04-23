-- Copyright (C) 2024  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

-- DATE "03/24/2025 10:06:47"

-- 
-- Device: Altera 10M50DAF484C6GES Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	servo_test_leds_sensor IS
    PORT (
	clk_50MHz : IN std_logic;
	sw0 : IN std_logic;
	sw1 : IN std_logic;
	line_sensor : IN std_logic;
	led0 : BUFFER std_logic;
	led1 : BUFFER std_logic;
	led2 : BUFFER std_logic;
	servo_pwm : BUFFER std_logic
	);
END servo_test_leds_sensor;

-- Design Ports Information
-- led0	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led1	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led2	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- servo_pwm	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw0	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw1	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- line_sensor	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_50MHz	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF servo_test_leds_sensor IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_50MHz : std_logic;
SIGNAL ww_sw0 : std_logic;
SIGNAL ww_sw1 : std_logic;
SIGNAL ww_line_sensor : std_logic;
SIGNAL ww_led0 : std_logic;
SIGNAL ww_led1 : std_logic;
SIGNAL ww_led2 : std_logic;
SIGNAL ww_servo_pwm : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clk_50MHz~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \led0~output_o\ : std_logic;
SIGNAL \led1~output_o\ : std_logic;
SIGNAL \led2~output_o\ : std_logic;
SIGNAL \servo_pwm~output_o\ : std_logic;
SIGNAL \sw0~input_o\ : std_logic;
SIGNAL \sw1~input_o\ : std_logic;
SIGNAL \line_sensor~input_o\ : std_logic;
SIGNAL \clk_50MHz~input_o\ : std_logic;
SIGNAL \clk_50MHz~inputclkctrl_outclk\ : std_logic;
SIGNAL \counter[0]~20_combout\ : std_logic;
SIGNAL \counter[18]~57\ : std_logic;
SIGNAL \counter[19]~58_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \counter[0]~21\ : std_logic;
SIGNAL \counter[1]~22_combout\ : std_logic;
SIGNAL \counter[1]~23\ : std_logic;
SIGNAL \counter[2]~24_combout\ : std_logic;
SIGNAL \counter[2]~25\ : std_logic;
SIGNAL \counter[3]~26_combout\ : std_logic;
SIGNAL \counter[3]~27\ : std_logic;
SIGNAL \counter[4]~28_combout\ : std_logic;
SIGNAL \counter[4]~29\ : std_logic;
SIGNAL \counter[5]~30_combout\ : std_logic;
SIGNAL \counter[5]~31\ : std_logic;
SIGNAL \counter[6]~32_combout\ : std_logic;
SIGNAL \counter[6]~33\ : std_logic;
SIGNAL \counter[7]~34_combout\ : std_logic;
SIGNAL \counter[7]~35\ : std_logic;
SIGNAL \counter[8]~36_combout\ : std_logic;
SIGNAL \counter[8]~37\ : std_logic;
SIGNAL \counter[9]~38_combout\ : std_logic;
SIGNAL \counter[9]~39\ : std_logic;
SIGNAL \counter[10]~40_combout\ : std_logic;
SIGNAL \counter[10]~41\ : std_logic;
SIGNAL \counter[11]~42_combout\ : std_logic;
SIGNAL \counter[11]~43\ : std_logic;
SIGNAL \counter[12]~44_combout\ : std_logic;
SIGNAL \counter[12]~45\ : std_logic;
SIGNAL \counter[13]~46_combout\ : std_logic;
SIGNAL \counter[13]~47\ : std_logic;
SIGNAL \counter[14]~48_combout\ : std_logic;
SIGNAL \counter[14]~49\ : std_logic;
SIGNAL \counter[15]~50_combout\ : std_logic;
SIGNAL \counter[15]~51\ : std_logic;
SIGNAL \counter[16]~52_combout\ : std_logic;
SIGNAL \counter[16]~53\ : std_logic;
SIGNAL \counter[17]~54_combout\ : std_logic;
SIGNAL \counter[17]~55\ : std_logic;
SIGNAL \counter[18]~56_combout\ : std_logic;
SIGNAL \pulse_width~1_combout\ : std_logic;
SIGNAL \pulse_width~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~15_combout\ : std_logic;
SIGNAL \LessThan1~16_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \LessThan1~5_combout\ : std_logic;
SIGNAL \LessThan1~6_combout\ : std_logic;
SIGNAL \LessThan1~7_combout\ : std_logic;
SIGNAL \LessThan1~8_combout\ : std_logic;
SIGNAL \LessThan1~9_combout\ : std_logic;
SIGNAL \LessThan1~10_combout\ : std_logic;
SIGNAL \LessThan1~11_combout\ : std_logic;
SIGNAL \LessThan1~12_combout\ : std_logic;
SIGNAL \LessThan1~13_combout\ : std_logic;
SIGNAL \LessThan1~14_combout\ : std_logic;
SIGNAL \LessThan1~17_combout\ : std_logic;
SIGNAL \LessThan1~18_combout\ : std_logic;
SIGNAL \pwm_out~q\ : std_logic;
SIGNAL counter : std_logic_vector(19 DOWNTO 0);
SIGNAL pulse_width : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_line_sensor~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk_50MHz <= clk_50MHz;
ww_sw0 <= sw0;
ww_sw1 <= sw1;
ww_line_sensor <= line_sensor;
led0 <= ww_led0;
led1 <= ww_led1;
led2 <= ww_led2;
servo_pwm <= ww_servo_pwm;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\clk_50MHz~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_50MHz~input_o\);
\ALT_INV_line_sensor~input_o\ <= NOT \line_sensor~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y41_N16
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X46_Y54_N2
\led0~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sw0~input_o\,
	devoe => ww_devoe,
	o => \led0~output_o\);

-- Location: IOOBUF_X46_Y54_N23
\led1~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sw1~input_o\,
	devoe => ww_devoe,
	o => \led1~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\led2~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_line_sensor~input_o\,
	devoe => ww_devoe,
	o => \led2~output_o\);

-- Location: IOOBUF_X24_Y0_N30
\servo_pwm~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pwm_out~q\,
	devoe => ww_devoe,
	o => \servo_pwm~output_o\);

-- Location: IOIBUF_X22_Y39_N15
\sw0~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw0,
	o => \sw0~input_o\);

-- Location: IOIBUF_X51_Y54_N22
\sw1~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw1,
	o => \sw1~input_o\);

-- Location: IOIBUF_X31_Y0_N22
\line_sensor~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_line_sensor,
	o => \line_sensor~input_o\);

-- Location: IOIBUF_X34_Y0_N29
\clk_50MHz~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_50MHz,
	o => \clk_50MHz~input_o\);

-- Location: CLKCTRL_G19
\clk_50MHz~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_50MHz~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_50MHz~inputclkctrl_outclk\);

-- Location: LCCOMB_X21_Y28_N12
\counter[0]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[0]~20_combout\ = counter(0) $ (VCC)
-- \counter[0]~21\ = CARRY(counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datad => VCC,
	combout => \counter[0]~20_combout\,
	cout => \counter[0]~21\);

-- Location: LCCOMB_X21_Y27_N16
\counter[18]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[18]~56_combout\ = (counter(18) & (\counter[17]~55\ $ (GND))) # (!counter(18) & (!\counter[17]~55\ & VCC))
-- \counter[18]~57\ = CARRY((counter(18) & !\counter[17]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(18),
	datad => VCC,
	cin => \counter[17]~55\,
	combout => \counter[18]~56_combout\,
	cout => \counter[18]~57\);

-- Location: LCCOMB_X21_Y27_N18
\counter[19]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[19]~58_combout\ = \counter[18]~57\ $ (counter(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => counter(19),
	cin => \counter[18]~57\,
	combout => \counter[19]~58_combout\);

-- Location: FF_X21_Y27_N19
\counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[19]~58_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(19));

-- Location: LCCOMB_X21_Y27_N26
\LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (((!counter(14) & !counter(15))) # (!counter(17))) # (!counter(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(16),
	datab => counter(17),
	datac => counter(14),
	datad => counter(15),
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X21_Y27_N22
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!counter(13) & (!counter(11) & (!counter(12) & !counter(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(13),
	datab => counter(11),
	datac => counter(12),
	datad => counter(15),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X21_Y28_N8
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ((!counter(7) & (!counter(8) & !counter(6)))) # (!counter(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(7),
	datab => counter(8),
	datac => counter(9),
	datad => counter(6),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X21_Y27_N28
\LessThan0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!counter(10) & (\LessThan0~1_combout\ & \LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(10),
	datac => \LessThan0~1_combout\,
	datad => \LessThan0~0_combout\,
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X21_Y27_N20
\LessThan0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (counter(19) & (counter(18) & (!\LessThan0~3_combout\ & !\LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(19),
	datab => counter(18),
	datac => \LessThan0~3_combout\,
	datad => \LessThan0~2_combout\,
	combout => \LessThan0~4_combout\);

-- Location: FF_X21_Y28_N13
\counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[0]~20_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(0));

-- Location: LCCOMB_X21_Y28_N14
\counter[1]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[1]~22_combout\ = (counter(1) & (!\counter[0]~21\)) # (!counter(1) & ((\counter[0]~21\) # (GND)))
-- \counter[1]~23\ = CARRY((!\counter[0]~21\) # (!counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(1),
	datad => VCC,
	cin => \counter[0]~21\,
	combout => \counter[1]~22_combout\,
	cout => \counter[1]~23\);

-- Location: FF_X21_Y28_N15
\counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[1]~22_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(1));

-- Location: LCCOMB_X21_Y28_N16
\counter[2]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[2]~24_combout\ = (counter(2) & (\counter[1]~23\ $ (GND))) # (!counter(2) & (!\counter[1]~23\ & VCC))
-- \counter[2]~25\ = CARRY((counter(2) & !\counter[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(2),
	datad => VCC,
	cin => \counter[1]~23\,
	combout => \counter[2]~24_combout\,
	cout => \counter[2]~25\);

-- Location: FF_X21_Y28_N17
\counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[2]~24_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(2));

-- Location: LCCOMB_X21_Y28_N18
\counter[3]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[3]~26_combout\ = (counter(3) & (!\counter[2]~25\)) # (!counter(3) & ((\counter[2]~25\) # (GND)))
-- \counter[3]~27\ = CARRY((!\counter[2]~25\) # (!counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(3),
	datad => VCC,
	cin => \counter[2]~25\,
	combout => \counter[3]~26_combout\,
	cout => \counter[3]~27\);

-- Location: FF_X21_Y28_N19
\counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[3]~26_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(3));

-- Location: LCCOMB_X21_Y28_N20
\counter[4]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[4]~28_combout\ = (counter(4) & (\counter[3]~27\ $ (GND))) # (!counter(4) & (!\counter[3]~27\ & VCC))
-- \counter[4]~29\ = CARRY((counter(4) & !\counter[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(4),
	datad => VCC,
	cin => \counter[3]~27\,
	combout => \counter[4]~28_combout\,
	cout => \counter[4]~29\);

-- Location: FF_X21_Y28_N21
\counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[4]~28_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(4));

-- Location: LCCOMB_X21_Y28_N22
\counter[5]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[5]~30_combout\ = (counter(5) & (!\counter[4]~29\)) # (!counter(5) & ((\counter[4]~29\) # (GND)))
-- \counter[5]~31\ = CARRY((!\counter[4]~29\) # (!counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(5),
	datad => VCC,
	cin => \counter[4]~29\,
	combout => \counter[5]~30_combout\,
	cout => \counter[5]~31\);

-- Location: FF_X21_Y28_N23
\counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[5]~30_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(5));

-- Location: LCCOMB_X21_Y28_N24
\counter[6]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[6]~32_combout\ = (counter(6) & (\counter[5]~31\ $ (GND))) # (!counter(6) & (!\counter[5]~31\ & VCC))
-- \counter[6]~33\ = CARRY((counter(6) & !\counter[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(6),
	datad => VCC,
	cin => \counter[5]~31\,
	combout => \counter[6]~32_combout\,
	cout => \counter[6]~33\);

-- Location: FF_X21_Y28_N25
\counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[6]~32_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(6));

-- Location: LCCOMB_X21_Y28_N26
\counter[7]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[7]~34_combout\ = (counter(7) & (!\counter[6]~33\)) # (!counter(7) & ((\counter[6]~33\) # (GND)))
-- \counter[7]~35\ = CARRY((!\counter[6]~33\) # (!counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(7),
	datad => VCC,
	cin => \counter[6]~33\,
	combout => \counter[7]~34_combout\,
	cout => \counter[7]~35\);

-- Location: FF_X21_Y28_N27
\counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[7]~34_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(7));

-- Location: LCCOMB_X21_Y28_N28
\counter[8]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[8]~36_combout\ = (counter(8) & (\counter[7]~35\ $ (GND))) # (!counter(8) & (!\counter[7]~35\ & VCC))
-- \counter[8]~37\ = CARRY((counter(8) & !\counter[7]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(8),
	datad => VCC,
	cin => \counter[7]~35\,
	combout => \counter[8]~36_combout\,
	cout => \counter[8]~37\);

-- Location: FF_X21_Y28_N29
\counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[8]~36_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(8));

-- Location: LCCOMB_X21_Y28_N30
\counter[9]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[9]~38_combout\ = (counter(9) & (!\counter[8]~37\)) # (!counter(9) & ((\counter[8]~37\) # (GND)))
-- \counter[9]~39\ = CARRY((!\counter[8]~37\) # (!counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(9),
	datad => VCC,
	cin => \counter[8]~37\,
	combout => \counter[9]~38_combout\,
	cout => \counter[9]~39\);

-- Location: FF_X21_Y28_N31
\counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[9]~38_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(9));

-- Location: LCCOMB_X21_Y27_N0
\counter[10]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[10]~40_combout\ = (counter(10) & (\counter[9]~39\ $ (GND))) # (!counter(10) & (!\counter[9]~39\ & VCC))
-- \counter[10]~41\ = CARRY((counter(10) & !\counter[9]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(10),
	datad => VCC,
	cin => \counter[9]~39\,
	combout => \counter[10]~40_combout\,
	cout => \counter[10]~41\);

-- Location: FF_X21_Y27_N1
\counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[10]~40_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(10));

-- Location: LCCOMB_X21_Y27_N2
\counter[11]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[11]~42_combout\ = (counter(11) & (!\counter[10]~41\)) # (!counter(11) & ((\counter[10]~41\) # (GND)))
-- \counter[11]~43\ = CARRY((!\counter[10]~41\) # (!counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(11),
	datad => VCC,
	cin => \counter[10]~41\,
	combout => \counter[11]~42_combout\,
	cout => \counter[11]~43\);

-- Location: FF_X21_Y27_N3
\counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[11]~42_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(11));

-- Location: LCCOMB_X21_Y27_N4
\counter[12]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[12]~44_combout\ = (counter(12) & (\counter[11]~43\ $ (GND))) # (!counter(12) & (!\counter[11]~43\ & VCC))
-- \counter[12]~45\ = CARRY((counter(12) & !\counter[11]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(12),
	datad => VCC,
	cin => \counter[11]~43\,
	combout => \counter[12]~44_combout\,
	cout => \counter[12]~45\);

-- Location: FF_X21_Y27_N5
\counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[12]~44_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(12));

-- Location: LCCOMB_X21_Y27_N6
\counter[13]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[13]~46_combout\ = (counter(13) & (!\counter[12]~45\)) # (!counter(13) & ((\counter[12]~45\) # (GND)))
-- \counter[13]~47\ = CARRY((!\counter[12]~45\) # (!counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(13),
	datad => VCC,
	cin => \counter[12]~45\,
	combout => \counter[13]~46_combout\,
	cout => \counter[13]~47\);

-- Location: FF_X21_Y27_N7
\counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[13]~46_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(13));

-- Location: LCCOMB_X21_Y27_N8
\counter[14]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[14]~48_combout\ = (counter(14) & (\counter[13]~47\ $ (GND))) # (!counter(14) & (!\counter[13]~47\ & VCC))
-- \counter[14]~49\ = CARRY((counter(14) & !\counter[13]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(14),
	datad => VCC,
	cin => \counter[13]~47\,
	combout => \counter[14]~48_combout\,
	cout => \counter[14]~49\);

-- Location: FF_X21_Y27_N9
\counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[14]~48_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(14));

-- Location: LCCOMB_X21_Y27_N10
\counter[15]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[15]~50_combout\ = (counter(15) & (!\counter[14]~49\)) # (!counter(15) & ((\counter[14]~49\) # (GND)))
-- \counter[15]~51\ = CARRY((!\counter[14]~49\) # (!counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(15),
	datad => VCC,
	cin => \counter[14]~49\,
	combout => \counter[15]~50_combout\,
	cout => \counter[15]~51\);

-- Location: FF_X21_Y27_N11
\counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[15]~50_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(15));

-- Location: LCCOMB_X21_Y27_N12
\counter[16]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[16]~52_combout\ = (counter(16) & (\counter[15]~51\ $ (GND))) # (!counter(16) & (!\counter[15]~51\ & VCC))
-- \counter[16]~53\ = CARRY((counter(16) & !\counter[15]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(16),
	datad => VCC,
	cin => \counter[15]~51\,
	combout => \counter[16]~52_combout\,
	cout => \counter[16]~53\);

-- Location: FF_X21_Y27_N13
\counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[16]~52_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(16));

-- Location: LCCOMB_X21_Y27_N14
\counter[17]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[17]~54_combout\ = (counter(17) & (!\counter[16]~53\)) # (!counter(17) & ((\counter[16]~53\) # (GND)))
-- \counter[17]~55\ = CARRY((!\counter[16]~53\) # (!counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(17),
	datad => VCC,
	cin => \counter[16]~53\,
	combout => \counter[17]~54_combout\,
	cout => \counter[17]~55\);

-- Location: FF_X21_Y27_N15
\counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[17]~54_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(17));

-- Location: FF_X21_Y27_N17
\counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \counter[18]~56_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(18));

-- Location: LCCOMB_X21_Y28_N6
\pulse_width~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pulse_width~1_combout\ = (\sw0~input_o\ & !\sw1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sw0~input_o\,
	datad => \sw1~input_o\,
	combout => \pulse_width~1_combout\);

-- Location: FF_X22_Y28_N5
\pulse_width[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	asdata => \pulse_width~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pulse_width(15));

-- Location: LCCOMB_X21_Y28_N0
\pulse_width~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pulse_width~0_combout\ = (\sw0~input_o\) # (\sw1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sw0~input_o\,
	datad => \sw1~input_o\,
	combout => \pulse_width~0_combout\);

-- Location: FF_X22_Y28_N11
\pulse_width[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	asdata => \pulse_width~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pulse_width(10));

-- Location: LCCOMB_X22_Y28_N30
\LessThan1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (counter(15) & (!pulse_width(15) & (pulse_width(10) $ (!counter(16))))) # (!counter(15) & (pulse_width(15) & (pulse_width(10) $ (!counter(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(15),
	datab => pulse_width(15),
	datac => pulse_width(10),
	datad => counter(16),
	combout => \LessThan1~1_combout\);

-- Location: FF_X21_Y28_N1
\pulse_width[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pulse_width~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pulse_width(14));

-- Location: FF_X22_Y28_N1
\pulse_width[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	asdata => \pulse_width~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pulse_width(13));

-- Location: LCCOMB_X22_Y28_N0
\LessThan1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (!counter(13) & pulse_width(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(13),
	datac => pulse_width(13),
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X22_Y28_N14
\LessThan1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (\LessThan1~1_combout\ & ((pulse_width(14) & (!counter(14) & \LessThan1~2_combout\)) # (!pulse_width(14) & ((\LessThan1~2_combout\) # (!counter(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~1_combout\,
	datab => pulse_width(14),
	datac => counter(14),
	datad => \LessThan1~2_combout\,
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X22_Y28_N4
\LessThan1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (pulse_width(10) & (((!pulse_width(15) & !counter(15))) # (!counter(16)))) # (!pulse_width(10) & (!counter(16) & (!pulse_width(15) & !counter(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pulse_width(10),
	datab => counter(16),
	datac => pulse_width(15),
	datad => counter(15),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X21_Y27_N24
\LessThan1~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~15_combout\ = (!counter(11) & (!counter(12) & (counter(13) $ (!pulse_width(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(13),
	datab => counter(11),
	datac => counter(12),
	datad => pulse_width(13),
	combout => \LessThan1~15_combout\);

-- Location: LCCOMB_X22_Y28_N8
\LessThan1~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~16_combout\ = (\LessThan1~1_combout\ & (\LessThan1~15_combout\ & (pulse_width(14) $ (counter(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~1_combout\,
	datab => pulse_width(14),
	datac => counter(14),
	datad => \LessThan1~15_combout\,
	combout => \LessThan1~16_combout\);

-- Location: LCCOMB_X22_Y28_N24
\LessThan1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = (pulse_width(15) & ((counter(9)) # ((pulse_width(14)) # (counter(8))))) # (!pulse_width(15) & (counter(9) & ((pulse_width(14)) # (counter(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pulse_width(15),
	datab => counter(9),
	datac => pulse_width(14),
	datad => counter(8),
	combout => \LessThan1~4_combout\);

-- Location: LCCOMB_X22_Y28_N26
\LessThan1~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~5_combout\ = (!\LessThan1~4_combout\ & (pulse_width(10) $ (!counter(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => pulse_width(10),
	datac => counter(10),
	datad => \LessThan1~4_combout\,
	combout => \LessThan1~5_combout\);

-- Location: LCCOMB_X21_Y28_N2
\LessThan1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~6_combout\ = (counter(9) & (!pulse_width(15) & (pulse_width(14) $ (counter(8))))) # (!counter(9) & (pulse_width(15) & (pulse_width(14) $ (counter(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(9),
	datab => pulse_width(14),
	datac => counter(8),
	datad => pulse_width(15),
	combout => \LessThan1~6_combout\);

-- Location: LCCOMB_X21_Y28_N4
\LessThan1~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~7_combout\ = (pulse_width(10) & (((!counter(7) & \LessThan1~6_combout\)) # (!counter(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(10),
	datab => counter(7),
	datac => pulse_width(10),
	datad => \LessThan1~6_combout\,
	combout => \LessThan1~7_combout\);

-- Location: LCCOMB_X22_Y28_N16
\LessThan1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~8_combout\ = (pulse_width(15) & (!counter(9) & (counter(10) $ (!pulse_width(10))))) # (!pulse_width(15) & (counter(9) & (counter(10) $ (!pulse_width(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pulse_width(15),
	datab => counter(9),
	datac => counter(10),
	datad => pulse_width(10),
	combout => \LessThan1~8_combout\);

-- Location: LCCOMB_X22_Y28_N22
\LessThan1~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~9_combout\ = (\LessThan1~8_combout\ & (counter(8) $ (pulse_width(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(8),
	datac => pulse_width(14),
	datad => \LessThan1~8_combout\,
	combout => \LessThan1~9_combout\);

-- Location: FF_X22_Y28_N21
\pulse_width[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	asdata => \sw1~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pulse_width(4));

-- Location: LCCOMB_X22_Y28_N2
\LessThan1~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~10_combout\ = (counter(6) & (counter(4) & ((counter(3)) # (!pulse_width(13))))) # (!counter(6) & (pulse_width(13) & (!counter(4) & !counter(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pulse_width(13),
	datab => counter(6),
	datac => counter(4),
	datad => counter(3),
	combout => \LessThan1~10_combout\);

-- Location: LCCOMB_X22_Y28_N20
\LessThan1~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~11_combout\ = (counter(6) & (!pulse_width(4) & (counter(5) $ (\LessThan1~10_combout\)))) # (!counter(6) & (pulse_width(4) & (counter(5) $ (!\LessThan1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(5),
	datab => counter(6),
	datac => pulse_width(4),
	datad => \LessThan1~10_combout\,
	combout => \LessThan1~11_combout\);

-- Location: LCCOMB_X22_Y28_N28
\LessThan1~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~12_combout\ = (counter(5) & ((\LessThan1~10_combout\ & ((counter(6)))) # (!\LessThan1~10_combout\ & (pulse_width(4))))) # (!counter(5) & (pulse_width(4) & (counter(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pulse_width(4),
	datab => counter(6),
	datac => counter(5),
	datad => \LessThan1~10_combout\,
	combout => \LessThan1~12_combout\);

-- Location: LCCOMB_X22_Y28_N10
\LessThan1~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~13_combout\ = (counter(7) & (pulse_width(10) & ((\LessThan1~11_combout\) # (!\LessThan1~12_combout\)))) # (!counter(7) & (!pulse_width(10) & (\LessThan1~11_combout\ $ (!\LessThan1~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(7),
	datab => \LessThan1~11_combout\,
	datac => pulse_width(10),
	datad => \LessThan1~12_combout\,
	combout => \LessThan1~13_combout\);

-- Location: LCCOMB_X22_Y28_N6
\LessThan1~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~14_combout\ = (\LessThan1~5_combout\) # ((\LessThan1~7_combout\) # ((\LessThan1~9_combout\ & \LessThan1~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~5_combout\,
	datab => \LessThan1~7_combout\,
	datac => \LessThan1~9_combout\,
	datad => \LessThan1~13_combout\,
	combout => \LessThan1~14_combout\);

-- Location: LCCOMB_X22_Y28_N18
\LessThan1~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~17_combout\ = (\LessThan1~3_combout\) # ((\LessThan1~0_combout\) # ((\LessThan1~16_combout\ & \LessThan1~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~3_combout\,
	datab => \LessThan1~0_combout\,
	datac => \LessThan1~16_combout\,
	datad => \LessThan1~14_combout\,
	combout => \LessThan1~17_combout\);

-- Location: LCCOMB_X22_Y28_N12
\LessThan1~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~18_combout\ = (!counter(18) & (!counter(19) & (!counter(17) & \LessThan1~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(18),
	datab => counter(19),
	datac => counter(17),
	datad => \LessThan1~17_combout\,
	combout => \LessThan1~18_combout\);

-- Location: FF_X22_Y28_N13
pwm_out : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \LessThan1~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pwm_out~q\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_led0 <= \led0~output_o\;

ww_led1 <= \led1~output_o\;

ww_led2 <= \led2~output_o\;

ww_servo_pwm <= \servo_pwm~output_o\;
END structure;


