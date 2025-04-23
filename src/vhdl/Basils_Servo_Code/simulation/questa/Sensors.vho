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

-- DATE "03/24/2025 10:09:33"

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

ENTITY 	line_sensor_servo IS
    PORT (
	clk_50MHz : IN std_logic;
	reset : IN std_logic;
	line_sensor : IN std_logic;
	led_out : BUFFER std_logic;
	servo_pwm : BUFFER std_logic
	);
END line_sensor_servo;

-- Design Ports Information
-- led_out	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- servo_pwm	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- line_sensor	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_50MHz	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF line_sensor_servo IS
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
SIGNAL ww_reset : std_logic;
SIGNAL ww_line_sensor : std_logic;
SIGNAL ww_led_out : std_logic;
SIGNAL ww_servo_pwm : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clk_50MHz~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \led_out~output_o\ : std_logic;
SIGNAL \servo_pwm~output_o\ : std_logic;
SIGNAL \clk_50MHz~input_o\ : std_logic;
SIGNAL \clk_50MHz~inputclkctrl_outclk\ : std_logic;
SIGNAL \line_sensor~input_o\ : std_logic;
SIGNAL \led_reg~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \led_reg~q\ : std_logic;
SIGNAL \pwm_counter[0]~20_combout\ : std_logic;
SIGNAL \pwm_counter[17]~55\ : std_logic;
SIGNAL \pwm_counter[18]~56_combout\ : std_logic;
SIGNAL \pwm_counter[18]~57\ : std_logic;
SIGNAL \pwm_counter[19]~58_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \pwm_counter[0]~21\ : std_logic;
SIGNAL \pwm_counter[1]~22_combout\ : std_logic;
SIGNAL \pwm_counter[1]~23\ : std_logic;
SIGNAL \pwm_counter[2]~24_combout\ : std_logic;
SIGNAL \pwm_counter[2]~25\ : std_logic;
SIGNAL \pwm_counter[3]~26_combout\ : std_logic;
SIGNAL \pwm_counter[3]~27\ : std_logic;
SIGNAL \pwm_counter[4]~28_combout\ : std_logic;
SIGNAL \pwm_counter[4]~29\ : std_logic;
SIGNAL \pwm_counter[5]~30_combout\ : std_logic;
SIGNAL \pwm_counter[5]~31\ : std_logic;
SIGNAL \pwm_counter[6]~32_combout\ : std_logic;
SIGNAL \pwm_counter[6]~33\ : std_logic;
SIGNAL \pwm_counter[7]~34_combout\ : std_logic;
SIGNAL \pwm_counter[7]~35\ : std_logic;
SIGNAL \pwm_counter[8]~36_combout\ : std_logic;
SIGNAL \pwm_counter[8]~37\ : std_logic;
SIGNAL \pwm_counter[9]~38_combout\ : std_logic;
SIGNAL \pwm_counter[9]~39\ : std_logic;
SIGNAL \pwm_counter[10]~40_combout\ : std_logic;
SIGNAL \pwm_counter[10]~41\ : std_logic;
SIGNAL \pwm_counter[11]~42_combout\ : std_logic;
SIGNAL \pwm_counter[11]~43\ : std_logic;
SIGNAL \pwm_counter[12]~44_combout\ : std_logic;
SIGNAL \pwm_counter[12]~45\ : std_logic;
SIGNAL \pwm_counter[13]~46_combout\ : std_logic;
SIGNAL \pwm_counter[13]~47\ : std_logic;
SIGNAL \pwm_counter[14]~48_combout\ : std_logic;
SIGNAL \pwm_counter[14]~49\ : std_logic;
SIGNAL \pwm_counter[15]~50_combout\ : std_logic;
SIGNAL \pwm_counter[15]~51\ : std_logic;
SIGNAL \pwm_counter[16]~52_combout\ : std_logic;
SIGNAL \pwm_counter[16]~53\ : std_logic;
SIGNAL \pwm_counter[17]~54_combout\ : std_logic;
SIGNAL \pulse_width[10]~feeder_combout\ : std_logic;
SIGNAL \LessThan1~6_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \LessThan1~5_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~7_combout\ : std_logic;
SIGNAL \LessThan1~8_combout\ : std_logic;
SIGNAL \pwm_signal~q\ : std_logic;
SIGNAL pwm_counter : std_logic_vector(19 DOWNTO 0);
SIGNAL pulse_width : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk_50MHz <= clk_50MHz;
ww_reset <= reset;
ww_line_sensor <= line_sensor;
led_out <= ww_led_out;
servo_pwm <= ww_servo_pwm;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\clk_50MHz~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_50MHz~input_o\);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y52_N4
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

-- Location: IOOBUF_X49_Y54_N9
\led_out~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \led_reg~q\,
	devoe => ww_devoe,
	o => \led_out~output_o\);

-- Location: IOOBUF_X24_Y0_N30
\servo_pwm~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pwm_signal~q\,
	devoe => ww_devoe,
	o => \servo_pwm~output_o\);

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

-- Location: LCCOMB_X27_Y6_N12
\led_reg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \led_reg~0_combout\ = !\line_sensor~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \line_sensor~input_o\,
	combout => \led_reg~0_combout\);

-- Location: IOIBUF_X51_Y54_N29
\reset~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X27_Y6_N13
led_reg : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \led_reg~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led_reg~q\);

-- Location: LCCOMB_X26_Y7_N12
\pwm_counter[0]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[0]~20_combout\ = pwm_counter(0) $ (VCC)
-- \pwm_counter[0]~21\ = CARRY(pwm_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(0),
	datad => VCC,
	combout => \pwm_counter[0]~20_combout\,
	cout => \pwm_counter[0]~21\);

-- Location: LCCOMB_X26_Y6_N14
\pwm_counter[17]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[17]~54_combout\ = (pwm_counter(17) & (!\pwm_counter[16]~53\)) # (!pwm_counter(17) & ((\pwm_counter[16]~53\) # (GND)))
-- \pwm_counter[17]~55\ = CARRY((!\pwm_counter[16]~53\) # (!pwm_counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(17),
	datad => VCC,
	cin => \pwm_counter[16]~53\,
	combout => \pwm_counter[17]~54_combout\,
	cout => \pwm_counter[17]~55\);

-- Location: LCCOMB_X26_Y6_N16
\pwm_counter[18]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[18]~56_combout\ = (pwm_counter(18) & (\pwm_counter[17]~55\ $ (GND))) # (!pwm_counter(18) & (!\pwm_counter[17]~55\ & VCC))
-- \pwm_counter[18]~57\ = CARRY((pwm_counter(18) & !\pwm_counter[17]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(18),
	datad => VCC,
	cin => \pwm_counter[17]~55\,
	combout => \pwm_counter[18]~56_combout\,
	cout => \pwm_counter[18]~57\);

-- Location: FF_X26_Y6_N17
\pwm_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[18]~56_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(18));

-- Location: LCCOMB_X26_Y6_N18
\pwm_counter[19]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[19]~58_combout\ = pwm_counter(19) $ (\pwm_counter[18]~57\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(19),
	cin => \pwm_counter[18]~57\,
	combout => \pwm_counter[19]~58_combout\);

-- Location: FF_X26_Y6_N19
\pwm_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[19]~58_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(19));

-- Location: LCCOMB_X26_Y6_N30
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (((!pwm_counter(15) & !pwm_counter(14))) # (!pwm_counter(16))) # (!pwm_counter(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(15),
	datab => pwm_counter(14),
	datac => pwm_counter(17),
	datad => pwm_counter(16),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X26_Y6_N28
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!pwm_counter(13) & (!pwm_counter(11) & (!pwm_counter(12) & !pwm_counter(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(13),
	datab => pwm_counter(11),
	datac => pwm_counter(12),
	datad => pwm_counter(10),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X26_Y7_N10
\LessThan0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = ((!pwm_counter(7) & (!pwm_counter(8) & !pwm_counter(6)))) # (!pwm_counter(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(7),
	datab => pwm_counter(8),
	datac => pwm_counter(9),
	datad => pwm_counter(6),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X26_Y6_N20
\LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (\LessThan0~1_combout\) # ((\LessThan0~0_combout\ & (!pwm_counter(15) & \LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~1_combout\,
	datab => \LessThan0~0_combout\,
	datac => pwm_counter(15),
	datad => \LessThan0~2_combout\,
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X26_Y6_N22
\LessThan0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (pwm_counter(18) & (pwm_counter(19) & !\LessThan0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(18),
	datac => pwm_counter(19),
	datad => \LessThan0~3_combout\,
	combout => \LessThan0~4_combout\);

-- Location: FF_X26_Y7_N13
\pwm_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[0]~20_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(0));

-- Location: LCCOMB_X26_Y7_N14
\pwm_counter[1]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[1]~22_combout\ = (pwm_counter(1) & (!\pwm_counter[0]~21\)) # (!pwm_counter(1) & ((\pwm_counter[0]~21\) # (GND)))
-- \pwm_counter[1]~23\ = CARRY((!\pwm_counter[0]~21\) # (!pwm_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(1),
	datad => VCC,
	cin => \pwm_counter[0]~21\,
	combout => \pwm_counter[1]~22_combout\,
	cout => \pwm_counter[1]~23\);

-- Location: FF_X26_Y7_N15
\pwm_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[1]~22_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(1));

-- Location: LCCOMB_X26_Y7_N16
\pwm_counter[2]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[2]~24_combout\ = (pwm_counter(2) & (\pwm_counter[1]~23\ $ (GND))) # (!pwm_counter(2) & (!\pwm_counter[1]~23\ & VCC))
-- \pwm_counter[2]~25\ = CARRY((pwm_counter(2) & !\pwm_counter[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(2),
	datad => VCC,
	cin => \pwm_counter[1]~23\,
	combout => \pwm_counter[2]~24_combout\,
	cout => \pwm_counter[2]~25\);

-- Location: FF_X26_Y7_N17
\pwm_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[2]~24_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(2));

-- Location: LCCOMB_X26_Y7_N18
\pwm_counter[3]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[3]~26_combout\ = (pwm_counter(3) & (!\pwm_counter[2]~25\)) # (!pwm_counter(3) & ((\pwm_counter[2]~25\) # (GND)))
-- \pwm_counter[3]~27\ = CARRY((!\pwm_counter[2]~25\) # (!pwm_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(3),
	datad => VCC,
	cin => \pwm_counter[2]~25\,
	combout => \pwm_counter[3]~26_combout\,
	cout => \pwm_counter[3]~27\);

-- Location: FF_X26_Y7_N19
\pwm_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[3]~26_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(3));

-- Location: LCCOMB_X26_Y7_N20
\pwm_counter[4]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[4]~28_combout\ = (pwm_counter(4) & (\pwm_counter[3]~27\ $ (GND))) # (!pwm_counter(4) & (!\pwm_counter[3]~27\ & VCC))
-- \pwm_counter[4]~29\ = CARRY((pwm_counter(4) & !\pwm_counter[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(4),
	datad => VCC,
	cin => \pwm_counter[3]~27\,
	combout => \pwm_counter[4]~28_combout\,
	cout => \pwm_counter[4]~29\);

-- Location: FF_X26_Y7_N21
\pwm_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[4]~28_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(4));

-- Location: LCCOMB_X26_Y7_N22
\pwm_counter[5]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[5]~30_combout\ = (pwm_counter(5) & (!\pwm_counter[4]~29\)) # (!pwm_counter(5) & ((\pwm_counter[4]~29\) # (GND)))
-- \pwm_counter[5]~31\ = CARRY((!\pwm_counter[4]~29\) # (!pwm_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(5),
	datad => VCC,
	cin => \pwm_counter[4]~29\,
	combout => \pwm_counter[5]~30_combout\,
	cout => \pwm_counter[5]~31\);

-- Location: FF_X26_Y7_N23
\pwm_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[5]~30_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(5));

-- Location: LCCOMB_X26_Y7_N24
\pwm_counter[6]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[6]~32_combout\ = (pwm_counter(6) & (\pwm_counter[5]~31\ $ (GND))) # (!pwm_counter(6) & (!\pwm_counter[5]~31\ & VCC))
-- \pwm_counter[6]~33\ = CARRY((pwm_counter(6) & !\pwm_counter[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(6),
	datad => VCC,
	cin => \pwm_counter[5]~31\,
	combout => \pwm_counter[6]~32_combout\,
	cout => \pwm_counter[6]~33\);

-- Location: FF_X26_Y7_N25
\pwm_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[6]~32_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(6));

-- Location: LCCOMB_X26_Y7_N26
\pwm_counter[7]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[7]~34_combout\ = (pwm_counter(7) & (!\pwm_counter[6]~33\)) # (!pwm_counter(7) & ((\pwm_counter[6]~33\) # (GND)))
-- \pwm_counter[7]~35\ = CARRY((!\pwm_counter[6]~33\) # (!pwm_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(7),
	datad => VCC,
	cin => \pwm_counter[6]~33\,
	combout => \pwm_counter[7]~34_combout\,
	cout => \pwm_counter[7]~35\);

-- Location: FF_X26_Y7_N27
\pwm_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[7]~34_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(7));

-- Location: LCCOMB_X26_Y7_N28
\pwm_counter[8]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[8]~36_combout\ = (pwm_counter(8) & (\pwm_counter[7]~35\ $ (GND))) # (!pwm_counter(8) & (!\pwm_counter[7]~35\ & VCC))
-- \pwm_counter[8]~37\ = CARRY((pwm_counter(8) & !\pwm_counter[7]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(8),
	datad => VCC,
	cin => \pwm_counter[7]~35\,
	combout => \pwm_counter[8]~36_combout\,
	cout => \pwm_counter[8]~37\);

-- Location: FF_X26_Y7_N29
\pwm_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[8]~36_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(8));

-- Location: LCCOMB_X26_Y7_N30
\pwm_counter[9]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[9]~38_combout\ = (pwm_counter(9) & (!\pwm_counter[8]~37\)) # (!pwm_counter(9) & ((\pwm_counter[8]~37\) # (GND)))
-- \pwm_counter[9]~39\ = CARRY((!\pwm_counter[8]~37\) # (!pwm_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(9),
	datad => VCC,
	cin => \pwm_counter[8]~37\,
	combout => \pwm_counter[9]~38_combout\,
	cout => \pwm_counter[9]~39\);

-- Location: FF_X26_Y7_N31
\pwm_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[9]~38_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(9));

-- Location: LCCOMB_X26_Y6_N0
\pwm_counter[10]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[10]~40_combout\ = (pwm_counter(10) & (\pwm_counter[9]~39\ $ (GND))) # (!pwm_counter(10) & (!\pwm_counter[9]~39\ & VCC))
-- \pwm_counter[10]~41\ = CARRY((pwm_counter(10) & !\pwm_counter[9]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(10),
	datad => VCC,
	cin => \pwm_counter[9]~39\,
	combout => \pwm_counter[10]~40_combout\,
	cout => \pwm_counter[10]~41\);

-- Location: FF_X26_Y6_N1
\pwm_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[10]~40_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(10));

-- Location: LCCOMB_X26_Y6_N2
\pwm_counter[11]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[11]~42_combout\ = (pwm_counter(11) & (!\pwm_counter[10]~41\)) # (!pwm_counter(11) & ((\pwm_counter[10]~41\) # (GND)))
-- \pwm_counter[11]~43\ = CARRY((!\pwm_counter[10]~41\) # (!pwm_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(11),
	datad => VCC,
	cin => \pwm_counter[10]~41\,
	combout => \pwm_counter[11]~42_combout\,
	cout => \pwm_counter[11]~43\);

-- Location: FF_X26_Y6_N3
\pwm_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[11]~42_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(11));

-- Location: LCCOMB_X26_Y6_N4
\pwm_counter[12]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[12]~44_combout\ = (pwm_counter(12) & (\pwm_counter[11]~43\ $ (GND))) # (!pwm_counter(12) & (!\pwm_counter[11]~43\ & VCC))
-- \pwm_counter[12]~45\ = CARRY((pwm_counter(12) & !\pwm_counter[11]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(12),
	datad => VCC,
	cin => \pwm_counter[11]~43\,
	combout => \pwm_counter[12]~44_combout\,
	cout => \pwm_counter[12]~45\);

-- Location: FF_X26_Y6_N5
\pwm_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[12]~44_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(12));

-- Location: LCCOMB_X26_Y6_N6
\pwm_counter[13]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[13]~46_combout\ = (pwm_counter(13) & (!\pwm_counter[12]~45\)) # (!pwm_counter(13) & ((\pwm_counter[12]~45\) # (GND)))
-- \pwm_counter[13]~47\ = CARRY((!\pwm_counter[12]~45\) # (!pwm_counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(13),
	datad => VCC,
	cin => \pwm_counter[12]~45\,
	combout => \pwm_counter[13]~46_combout\,
	cout => \pwm_counter[13]~47\);

-- Location: FF_X26_Y6_N7
\pwm_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[13]~46_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(13));

-- Location: LCCOMB_X26_Y6_N8
\pwm_counter[14]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[14]~48_combout\ = (pwm_counter(14) & (\pwm_counter[13]~47\ $ (GND))) # (!pwm_counter(14) & (!\pwm_counter[13]~47\ & VCC))
-- \pwm_counter[14]~49\ = CARRY((pwm_counter(14) & !\pwm_counter[13]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_counter(14),
	datad => VCC,
	cin => \pwm_counter[13]~47\,
	combout => \pwm_counter[14]~48_combout\,
	cout => \pwm_counter[14]~49\);

-- Location: FF_X26_Y6_N9
\pwm_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[14]~48_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(14));

-- Location: LCCOMB_X26_Y6_N10
\pwm_counter[15]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[15]~50_combout\ = (pwm_counter(15) & (!\pwm_counter[14]~49\)) # (!pwm_counter(15) & ((\pwm_counter[14]~49\) # (GND)))
-- \pwm_counter[15]~51\ = CARRY((!\pwm_counter[14]~49\) # (!pwm_counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(15),
	datad => VCC,
	cin => \pwm_counter[14]~49\,
	combout => \pwm_counter[15]~50_combout\,
	cout => \pwm_counter[15]~51\);

-- Location: FF_X26_Y6_N11
\pwm_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[15]~50_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(15));

-- Location: LCCOMB_X26_Y6_N12
\pwm_counter[16]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pwm_counter[16]~52_combout\ = (pwm_counter(16) & (\pwm_counter[15]~51\ $ (GND))) # (!pwm_counter(16) & (!\pwm_counter[15]~51\ & VCC))
-- \pwm_counter[16]~53\ = CARRY((pwm_counter(16) & !\pwm_counter[15]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(16),
	datad => VCC,
	cin => \pwm_counter[15]~51\,
	combout => \pwm_counter[16]~52_combout\,
	cout => \pwm_counter[16]~53\);

-- Location: FF_X26_Y6_N13
\pwm_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[16]~52_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(16));

-- Location: FF_X26_Y6_N15
\pwm_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pwm_counter[17]~54_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_counter(17));

-- Location: LCCOMB_X27_Y6_N4
\pulse_width[10]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pulse_width[10]~feeder_combout\ = \line_sensor~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \line_sensor~input_o\,
	combout => \pulse_width[10]~feeder_combout\);

-- Location: FF_X27_Y6_N5
\pulse_width[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \pulse_width[10]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pulse_width(10));

-- Location: LCCOMB_X26_Y6_N24
\LessThan1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~6_combout\ = (!pwm_counter(13) & (!pwm_counter(11) & (!pwm_counter(12) & pulse_width(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(13),
	datab => pwm_counter(11),
	datac => pwm_counter(12),
	datad => pulse_width(10),
	combout => \LessThan1~6_combout\);

-- Location: LCCOMB_X26_Y7_N8
\LessThan1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = (!pwm_counter(8) & (((!pwm_counter(5) & !pwm_counter(6))) # (!pwm_counter(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(5),
	datab => pwm_counter(8),
	datac => pwm_counter(6),
	datad => pwm_counter(7),
	combout => \LessThan1~4_combout\);

-- Location: LCCOMB_X26_Y6_N26
\LessThan1~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~5_combout\ = (\LessThan1~4_combout\) # ((!pwm_counter(9)) # (!pwm_counter(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~4_combout\,
	datab => pwm_counter(10),
	datac => pwm_counter(9),
	combout => \LessThan1~5_combout\);

-- Location: LCCOMB_X27_Y6_N30
\LessThan1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (pwm_counter(16) & (pulse_width(10) & (!pwm_counter(15)))) # (!pwm_counter(16) & ((pulse_width(10)) # ((!pwm_counter(14)) # (!pwm_counter(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110101011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(16),
	datab => pulse_width(10),
	datac => pwm_counter(15),
	datad => pwm_counter(14),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X26_Y7_N0
\LessThan1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (!pwm_counter(7) & (((!pwm_counter(5) & !pwm_counter(4))) # (!pwm_counter(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(7),
	datab => pwm_counter(6),
	datac => pwm_counter(5),
	datad => pwm_counter(4),
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X26_Y7_N6
\LessThan1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = ((\LessThan1~1_combout\) # (!pwm_counter(8))) # (!pwm_counter(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(9),
	datac => pwm_counter(8),
	datad => \LessThan1~1_combout\,
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X27_Y6_N28
\LessThan1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (\LessThan1~0_combout\) # ((!pwm_counter(16) & (\LessThan0~0_combout\ & \LessThan1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(16),
	datab => \LessThan0~0_combout\,
	datac => \LessThan1~0_combout\,
	datad => \LessThan1~2_combout\,
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X27_Y6_N10
\LessThan1~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~7_combout\ = (\LessThan1~3_combout\) # ((!pwm_counter(14) & (\LessThan1~6_combout\ & \LessThan1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(14),
	datab => \LessThan1~6_combout\,
	datac => \LessThan1~5_combout\,
	datad => \LessThan1~3_combout\,
	combout => \LessThan1~7_combout\);

-- Location: LCCOMB_X27_Y6_N6
\LessThan1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~8_combout\ = (!pwm_counter(17) & (!pwm_counter(19) & (!pwm_counter(18) & \LessThan1~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_counter(17),
	datab => pwm_counter(19),
	datac => pwm_counter(18),
	datad => \LessThan1~7_combout\,
	combout => \LessThan1~8_combout\);

-- Location: FF_X27_Y6_N7
pwm_signal : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~inputclkctrl_outclk\,
	d => \LessThan1~8_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pwm_signal~q\);

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

ww_led_out <= \led_out~output_o\;

ww_servo_pwm <= \servo_pwm~output_o\;
END structure;


