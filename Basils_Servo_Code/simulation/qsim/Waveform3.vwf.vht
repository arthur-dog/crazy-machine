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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/24/2025 10:06:46"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          servo_test_leds_sensor
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY servo_test_leds_sensor_vhd_vec_tst IS
END servo_test_leds_sensor_vhd_vec_tst;
ARCHITECTURE servo_test_leds_sensor_arch OF servo_test_leds_sensor_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_50MHz : STD_LOGIC;
SIGNAL led0 : STD_LOGIC;
SIGNAL led1 : STD_LOGIC;
SIGNAL led2 : STD_LOGIC;
SIGNAL line_sensor : STD_LOGIC;
SIGNAL servo_pwm : STD_LOGIC;
SIGNAL sw0 : STD_LOGIC;
SIGNAL sw1 : STD_LOGIC;
COMPONENT servo_test_leds_sensor
	PORT (
	clk_50MHz : IN STD_LOGIC;
	led0 : BUFFER STD_LOGIC;
	led1 : BUFFER STD_LOGIC;
	led2 : BUFFER STD_LOGIC;
	line_sensor : IN STD_LOGIC;
	servo_pwm : BUFFER STD_LOGIC;
	sw0 : IN STD_LOGIC;
	sw1 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : servo_test_leds_sensor
	PORT MAP (
-- list connections between master ports and signals
	clk_50MHz => clk_50MHz,
	led0 => led0,
	led1 => led1,
	led2 => led2,
	line_sensor => line_sensor,
	servo_pwm => servo_pwm,
	sw0 => sw0,
	sw1 => sw1
	);

-- clk_50MHz
t_prcs_clk_50MHz: PROCESS
BEGIN
LOOP
	clk_50MHz <= '0';
	WAIT FOR 10000 ps;
	clk_50MHz <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk_50MHz;

-- line_sensor
t_prcs_line_sensor: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		line_sensor <= '0';
		WAIT FOR 40000 ps;
		line_sensor <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	line_sensor <= '0';
WAIT;
END PROCESS t_prcs_line_sensor;

-- sw0
t_prcs_sw0: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		sw0 <= '0';
		WAIT FOR 40000 ps;
		sw0 <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	sw0 <= '0';
WAIT;
END PROCESS t_prcs_sw0;

-- sw1
t_prcs_sw1: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		sw1 <= '0';
		WAIT FOR 80000 ps;
		sw1 <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	sw1 <= '0';
WAIT;
END PROCESS t_prcs_sw1;
END servo_test_leds_sensor_arch;
