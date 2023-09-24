-- Copyright (C) 2019  Intel Corporation. All rights reserved.
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
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "05/26/2021 23:31:55"

-- 
-- Device: Altera 5M160ZT100C4 Package TQFP100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	ALU_16 IS
    PORT (
	a : IN std_logic_vector(15 DOWNTO 0);
	b : IN std_logic_vector(15 DOWNTO 0);
	opcode : IN std_logic_vector(2 DOWNTO 0);
	f : OUT std_logic_vector(15 DOWNTO 0);
	overflow : OUT std_logic
	);
END ALU_16;

-- Design Ports Information


ARCHITECTURE structure OF ALU_16 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_opcode : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_f : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_overflow : std_logic;
SIGNAL \G1:0:ALU16|stage6|Mux0~2_combout\ : std_logic;
SIGNAL \G1:0:ALU16|stage6|Mux0~3_combout\ : std_logic;
SIGNAL \G1:0:ALU16|stage6|Mux0~4_combout\ : std_logic;
SIGNAL \G1:1:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \controlcircuit|Mux0~0_combout\ : std_logic;
SIGNAL \G1:0:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:0:ALU16|stage4|cout~1_combout\ : std_logic;
SIGNAL \controlcircuit|Mux1~0_combout\ : std_logic;
SIGNAL \G1:1:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:1:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:1:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:2:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:2:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \controlcircuit|Mux3~0_combout\ : std_logic;
SIGNAL \G1:1:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:2:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:2:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:3:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:2:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:3:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:3:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:3:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:3:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:4:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:4:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:4:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:4:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:5:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:4:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:5:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:5:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:5:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:6:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:5:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:6:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:6:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:6:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:7:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:6:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:7:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:7:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:7:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:7:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:8:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:8:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:8:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:8:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:8:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:9:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:9:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:9:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:9:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:10:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:10:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:9:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:10:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:10:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:11:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:11:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:10:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:11:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:11:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:12:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:11:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:12:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:12:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:12:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:13:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:12:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:13:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:13:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:13:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:14:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:13:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:14:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:14:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:14:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:14:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \G1:15:ALU16|stage6|Mux0~0_combout\ : std_logic;
SIGNAL \G1:15:ALU16|stage1|f~0_combout\ : std_logic;
SIGNAL \G1:15:ALU16|stage4|ff~0_combout\ : std_logic;
SIGNAL \G1:15:ALU16|stage6|Mux0~1_combout\ : std_logic;
SIGNAL \G1:15:ALU16|stage4|cout~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \b~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \opcode~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \a~combout\ : std_logic_vector(15 DOWNTO 0);

BEGIN

ww_a <= a;
ww_b <= b;
ww_opcode <= opcode;
f <= ww_f;
overflow <= ww_overflow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_38,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opcode[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opcode(1),
	combout => \opcode~combout\(1));

-- Location: PIN_54,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opcode[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opcode(2),
	combout => \opcode~combout\(2));

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opcode[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opcode(0),
	combout => \opcode~combout\(0));

-- Location: PIN_85,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(0),
	combout => \b~combout\(0));

-- Location: LC_X5_Y3_N9
\G1:0:ALU16|stage6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \G1:0:ALU16|stage6|Mux0~2_combout\ = (\opcode~combout\(1) & (\b~combout\(0) & ((!\opcode~combout\(0)) # (!\opcode~combout\(2))))) # (!\opcode~combout\(1) & ((\b~combout\(0) & ((\opcode~combout\(0)))) # (!\b~combout\(0) & (\opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7a44",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(0),
	datad => \b~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:0:ALU16|stage6|Mux0~2_combout\);

-- Location: LC_X5_Y3_N7
\G1:0:ALU16|stage6|Mux0~3\ : maxv_lcell
-- Equation(s):
-- \G1:0:ALU16|stage6|Mux0~3_combout\ = (\opcode~combout\(1) & (\b~combout\(0) $ (((!\opcode~combout\(0)) # (!\opcode~combout\(2)))))) # (!\opcode~combout\(1) & ((\b~combout\(0) & (!\opcode~combout\(2))) # (!\b~combout\(0) & ((\opcode~combout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "917a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(0),
	datad => \b~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:0:ALU16|stage6|Mux0~3_combout\);

-- Location: PIN_86,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(0),
	combout => \a~combout\(0));

-- Location: LC_X5_Y3_N4
\G1:0:ALU16|stage6|Mux0~4\ : maxv_lcell
-- Equation(s):
-- \G1:0:ALU16|stage6|Mux0~4_combout\ = ((\a~combout\(0) & ((\G1:0:ALU16|stage6|Mux0~3_combout\))) # (!\a~combout\(0) & (\G1:0:ALU16|stage6|Mux0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f0cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \G1:0:ALU16|stage6|Mux0~2_combout\,
	datac => \G1:0:ALU16|stage6|Mux0~3_combout\,
	datad => \a~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:0:ALU16|stage6|Mux0~4_combout\);

-- Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(1),
	combout => \b~combout\(1));

-- Location: LC_X5_Y3_N5
\G1:1:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:1:ALU16|stage1|f~0_combout\ = \b~combout\(1) $ (((\opcode~combout\(2) & ((!\opcode~combout\(1)))) # (!\opcode~combout\(2) & (\opcode~combout\(0) & \opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9a66",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(1),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(0),
	datad => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:1:ALU16|stage1|f~0_combout\);

-- Location: LC_X4_Y1_N5
\controlcircuit|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \controlcircuit|Mux0~0_combout\ = (((\opcode~combout\(2) & \opcode~combout\(0))) # (!\opcode~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cf0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \controlcircuit|Mux0~0_combout\);

-- Location: LC_X5_Y3_N2
\G1:0:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:0:ALU16|stage4|cout~0_combout\ = (\b~combout\(0) & (\a~combout\(0) & ((\opcode~combout\(1)) # (!\opcode~combout\(2))))) # (!\b~combout\(0) & ((\opcode~combout\(1) & ((!\opcode~combout\(2)))) # (!\opcode~combout\(1) & (!\a~combout\(0) & 
-- \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8c1a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \a~combout\(0),
	datac => \opcode~combout\(2),
	datad => \b~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:0:ALU16|stage4|cout~0_combout\);

-- Location: LC_X5_Y3_N0
\G1:0:ALU16|stage4|cout~1\ : maxv_lcell
-- Equation(s):
-- \G1:0:ALU16|stage4|cout~1_combout\ = (\G1:0:ALU16|stage4|cout~0_combout\ & (((\b~combout\(0)) # (\opcode~combout\(0))) # (!\opcode~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fd00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \b~combout\(0),
	datac => \opcode~combout\(0),
	datad => \G1:0:ALU16|stage4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:0:ALU16|stage4|cout~1_combout\);

-- Location: LC_X6_Y2_N4
\controlcircuit|Mux1~0\ : maxv_lcell
-- Equation(s):
-- \controlcircuit|Mux1~0_combout\ = ((\opcode~combout\(1) & (\opcode~combout\(2) & !\opcode~combout\(0))) # (!\opcode~combout\(1) & ((\opcode~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0fc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \controlcircuit|Mux1~0_combout\);

-- Location: LC_X5_Y3_N6
\G1:1:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:1:ALU16|stage6|Mux0~0_combout\ = ((\controlcircuit|Mux0~0_combout\ & ((\controlcircuit|Mux1~0_combout\))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:0:ALU16|stage4|cout~1_combout\ & !\controlcircuit|Mux1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc30",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \controlcircuit|Mux0~0_combout\,
	datac => \G1:0:ALU16|stage4|cout~1_combout\,
	datad => \controlcircuit|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:1:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(1),
	combout => \a~combout\(1));

-- Location: LC_X5_Y3_N1
\G1:1:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:1:ALU16|stage4|ff~0_combout\ = \a~combout\(1) $ (((!\opcode~combout\(1) & (\opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9c9c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \a~combout\(1),
	datac => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:1:ALU16|stage4|ff~0_combout\);

-- Location: LC_X5_Y3_N8
\G1:1:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:1:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:1:ALU16|stage1|f~0_combout\ & ((\G1:1:ALU16|stage6|Mux0~0_combout\) # (\G1:1:ALU16|stage4|ff~0_combout\))) # (!\G1:1:ALU16|stage1|f~0_combout\ & 
-- (\G1:1:ALU16|stage6|Mux0~0_combout\ & \G1:1:ALU16|stage4|ff~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:1:ALU16|stage1|f~0_combout\ $ (\G1:1:ALU16|stage6|Mux0~0_combout\ $ (\G1:1:ALU16|stage4|ff~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e992",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:1:ALU16|stage1|f~0_combout\,
	datab => \controlcircuit|Mux0~0_combout\,
	datac => \G1:1:ALU16|stage6|Mux0~0_combout\,
	datad => \G1:1:ALU16|stage4|ff~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:1:ALU16|stage6|Mux0~1_combout\);

-- Location: PIN_61,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(2),
	combout => \b~combout\(2));

-- Location: LC_X5_Y2_N5
\G1:2:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:2:ALU16|stage1|f~0_combout\ = \b~combout\(2) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c738",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \b~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:2:ALU16|stage1|f~0_combout\);

-- Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(2),
	combout => \a~combout\(2));

-- Location: LC_X5_Y2_N4
\G1:2:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:2:ALU16|stage4|ff~0_combout\ = (\a~combout\(2) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc3c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\(2),
	datac => \opcode~combout\(2),
	datad => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:2:ALU16|stage4|ff~0_combout\);

-- Location: LC_X6_Y2_N9
\controlcircuit|Mux3~0\ : maxv_lcell
-- Equation(s):
-- \controlcircuit|Mux3~0_combout\ = ((\opcode~combout\(2) & (!\opcode~combout\(1))) # (!\opcode~combout\(2) & (\opcode~combout\(1) & \opcode~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3c0c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \controlcircuit|Mux3~0_combout\);

-- Location: LC_X5_Y3_N3
\G1:1:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:1:ALU16|stage4|cout~0_combout\ = (\G1:1:ALU16|stage4|ff~0_combout\ & ((\G1:0:ALU16|stage4|cout~1_combout\) # (\b~combout\(1) $ (\controlcircuit|Mux3~0_combout\)))) # (!\G1:1:ALU16|stage4|ff~0_combout\ & (\G1:0:ALU16|stage4|cout~1_combout\ & 
-- (\b~combout\(1) $ (\controlcircuit|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d4e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(1),
	datab => \G1:1:ALU16|stage4|ff~0_combout\,
	datac => \G1:0:ALU16|stage4|cout~1_combout\,
	datad => \controlcircuit|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:1:ALU16|stage4|cout~0_combout\);

-- Location: LC_X5_Y2_N2
\G1:2:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:2:ALU16|stage6|Mux0~0_combout\ = ((\controlcircuit|Mux0~0_combout\ & ((\controlcircuit|Mux1~0_combout\))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:1:ALU16|stage4|cout~0_combout\ & !\controlcircuit|Mux1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc30",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \controlcircuit|Mux0~0_combout\,
	datac => \G1:1:ALU16|stage4|cout~0_combout\,
	datad => \controlcircuit|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:2:ALU16|stage6|Mux0~0_combout\);

-- Location: LC_X5_Y2_N1
\G1:2:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:2:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:2:ALU16|stage1|f~0_combout\ & ((\G1:2:ALU16|stage4|ff~0_combout\) # (\G1:2:ALU16|stage6|Mux0~0_combout\))) # (!\G1:2:ALU16|stage1|f~0_combout\ & 
-- (\G1:2:ALU16|stage4|ff~0_combout\ & \G1:2:ALU16|stage6|Mux0~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:2:ALU16|stage1|f~0_combout\ $ (\G1:2:ALU16|stage4|ff~0_combout\ $ (\G1:2:ALU16|stage6|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e992",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:2:ALU16|stage1|f~0_combout\,
	datab => \controlcircuit|Mux0~0_combout\,
	datac => \G1:2:ALU16|stage4|ff~0_combout\,
	datad => \G1:2:ALU16|stage6|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:2:ALU16|stage6|Mux0~1_combout\);

-- Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(3),
	combout => \b~combout\(3));

-- Location: LC_X5_Y2_N8
\G1:3:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:3:ALU16|stage1|f~0_combout\ = \b~combout\(3) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c738",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \b~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:3:ALU16|stage1|f~0_combout\);

-- Location: LC_X5_Y2_N6
\G1:2:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:2:ALU16|stage4|cout~0_combout\ = (\G1:1:ALU16|stage4|cout~0_combout\ & ((\G1:2:ALU16|stage4|ff~0_combout\) # (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(2))))) # (!\G1:1:ALU16|stage4|cout~0_combout\ & (\G1:2:ALU16|stage4|ff~0_combout\ & 
-- (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d4e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux3~0_combout\,
	datab => \G1:1:ALU16|stage4|cout~0_combout\,
	datac => \G1:2:ALU16|stage4|ff~0_combout\,
	datad => \b~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:2:ALU16|stage4|cout~0_combout\);

-- Location: LC_X5_Y2_N7
\G1:3:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:3:ALU16|stage6|Mux0~0_combout\ = ((\controlcircuit|Mux0~0_combout\ & ((\controlcircuit|Mux1~0_combout\))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:2:ALU16|stage4|cout~0_combout\ & !\controlcircuit|Mux1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc30",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \controlcircuit|Mux0~0_combout\,
	datac => \G1:2:ALU16|stage4|cout~0_combout\,
	datad => \controlcircuit|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:3:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(3),
	combout => \a~combout\(3));

-- Location: LC_X5_Y2_N9
\G1:3:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:3:ALU16|stage4|ff~0_combout\ = \a~combout\(3) $ (((!\opcode~combout\(1) & (\opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9a9a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(3),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:3:ALU16|stage4|ff~0_combout\);

-- Location: LC_X5_Y2_N0
\G1:3:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:3:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:3:ALU16|stage1|f~0_combout\ & ((\G1:3:ALU16|stage6|Mux0~0_combout\) # (\G1:3:ALU16|stage4|ff~0_combout\))) # (!\G1:3:ALU16|stage1|f~0_combout\ & 
-- (\G1:3:ALU16|stage6|Mux0~0_combout\ & \G1:3:ALU16|stage4|ff~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:3:ALU16|stage1|f~0_combout\ $ (\G1:3:ALU16|stage6|Mux0~0_combout\ $ (\G1:3:ALU16|stage4|ff~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e992",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:3:ALU16|stage1|f~0_combout\,
	datab => \controlcircuit|Mux0~0_combout\,
	datac => \G1:3:ALU16|stage6|Mux0~0_combout\,
	datad => \G1:3:ALU16|stage4|ff~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:3:ALU16|stage6|Mux0~1_combout\);

-- Location: LC_X5_Y2_N3
\G1:3:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:3:ALU16|stage4|cout~0_combout\ = (\G1:3:ALU16|stage4|ff~0_combout\ & ((\G1:2:ALU16|stage4|cout~0_combout\) # (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(3))))) # (!\G1:3:ALU16|stage4|ff~0_combout\ & (\G1:2:ALU16|stage4|cout~0_combout\ & 
-- (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d4e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux3~0_combout\,
	datab => \G1:3:ALU16|stage4|ff~0_combout\,
	datac => \G1:2:ALU16|stage4|cout~0_combout\,
	datad => \b~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:3:ALU16|stage4|cout~0_combout\);

-- Location: LC_X7_Y2_N6
\G1:4:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:4:ALU16|stage6|Mux0~0_combout\ = ((\controlcircuit|Mux1~0_combout\ & ((\controlcircuit|Mux0~0_combout\))) # (!\controlcircuit|Mux1~0_combout\ & (\G1:3:ALU16|stage4|cout~0_combout\ & !\controlcircuit|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f00c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \G1:3:ALU16|stage4|cout~0_combout\,
	datac => \controlcircuit|Mux1~0_combout\,
	datad => \controlcircuit|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:4:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_70,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(4),
	combout => \a~combout\(4));

-- Location: LC_X7_Y2_N4
\G1:4:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:4:ALU16|stage4|ff~0_combout\ = (\a~combout\(4) $ (((\opcode~combout\(2) & !\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f30c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \a~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:4:ALU16|stage4|ff~0_combout\);

-- Location: PIN_62,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(4),
	combout => \b~combout\(4));

-- Location: LC_X7_Y2_N3
\G1:4:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:4:ALU16|stage1|f~0_combout\ = \b~combout\(4) $ (((\opcode~combout\(2) & ((!\opcode~combout\(1)))) # (!\opcode~combout\(2) & (\opcode~combout\(0) & \opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d32c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \b~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:4:ALU16|stage1|f~0_combout\);

-- Location: LC_X7_Y2_N5
\G1:4:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:4:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:4:ALU16|stage6|Mux0~0_combout\ & ((\G1:4:ALU16|stage4|ff~0_combout\) # (\G1:4:ALU16|stage1|f~0_combout\))) # (!\G1:4:ALU16|stage6|Mux0~0_combout\ & 
-- (\G1:4:ALU16|stage4|ff~0_combout\ & \G1:4:ALU16|stage1|f~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:4:ALU16|stage6|Mux0~0_combout\ $ (\G1:4:ALU16|stage4|ff~0_combout\ $ (\G1:4:ALU16|stage1|f~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e994",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux0~0_combout\,
	datab => \G1:4:ALU16|stage6|Mux0~0_combout\,
	datac => \G1:4:ALU16|stage4|ff~0_combout\,
	datad => \G1:4:ALU16|stage1|f~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:4:ALU16|stage6|Mux0~1_combout\);

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(5),
	combout => \a~combout\(5));

-- Location: LC_X7_Y2_N8
\G1:5:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:5:ALU16|stage4|ff~0_combout\ = \a~combout\(5) $ (((!\opcode~combout\(1) & (\opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b4b4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \opcode~combout\(2),
	datac => \a~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:5:ALU16|stage4|ff~0_combout\);

-- Location: LC_X7_Y2_N9
\G1:4:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:4:ALU16|stage4|cout~0_combout\ = (\G1:4:ALU16|stage4|ff~0_combout\ & ((\G1:3:ALU16|stage4|cout~0_combout\) # (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(4))))) # (!\G1:4:ALU16|stage4|ff~0_combout\ & (\G1:3:ALU16|stage4|cout~0_combout\ & 
-- (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:4:ALU16|stage4|ff~0_combout\,
	datab => \G1:3:ALU16|stage4|cout~0_combout\,
	datac => \controlcircuit|Mux3~0_combout\,
	datad => \b~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:4:ALU16|stage4|cout~0_combout\);

-- Location: LC_X7_Y2_N1
\G1:5:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:5:ALU16|stage6|Mux0~0_combout\ = ((\controlcircuit|Mux1~0_combout\ & (\controlcircuit|Mux0~0_combout\)) # (!\controlcircuit|Mux1~0_combout\ & (!\controlcircuit|Mux0~0_combout\ & \G1:4:ALU16|stage4|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \controlcircuit|Mux1~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \G1:4:ALU16|stage4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:5:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(5),
	combout => \b~combout\(5));

-- Location: LC_X7_Y2_N2
\G1:5:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:5:ALU16|stage1|f~0_combout\ = \b~combout\(5) $ (((\opcode~combout\(2) & ((!\opcode~combout\(1)))) # (!\opcode~combout\(2) & (\opcode~combout\(0) & \opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d32c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(1),
	datad => \b~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:5:ALU16|stage1|f~0_combout\);

-- Location: LC_X7_Y2_N0
\G1:5:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:5:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:5:ALU16|stage4|ff~0_combout\ & ((\G1:5:ALU16|stage6|Mux0~0_combout\) # (\G1:5:ALU16|stage1|f~0_combout\))) # (!\G1:5:ALU16|stage4|ff~0_combout\ & 
-- (\G1:5:ALU16|stage6|Mux0~0_combout\ & \G1:5:ALU16|stage1|f~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:5:ALU16|stage4|ff~0_combout\ $ (\G1:5:ALU16|stage6|Mux0~0_combout\ $ (\G1:5:ALU16|stage1|f~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e986",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:5:ALU16|stage4|ff~0_combout\,
	datab => \G1:5:ALU16|stage6|Mux0~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \G1:5:ALU16|stage1|f~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:5:ALU16|stage6|Mux0~1_combout\);

-- Location: PIN_50,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(6),
	combout => \a~combout\(6));

-- Location: LC_X7_Y1_N9
\G1:6:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:6:ALU16|stage4|ff~0_combout\ = (\a~combout\(6) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cf30",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \a~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:6:ALU16|stage4|ff~0_combout\);

-- Location: LC_X7_Y2_N7
\G1:5:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:5:ALU16|stage4|cout~0_combout\ = (\G1:5:ALU16|stage4|ff~0_combout\ & ((\G1:4:ALU16|stage4|cout~0_combout\) # (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(5))))) # (!\G1:5:ALU16|stage4|ff~0_combout\ & (\G1:4:ALU16|stage4|cout~0_combout\ & 
-- (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:5:ALU16|stage4|ff~0_combout\,
	datab => \G1:4:ALU16|stage4|cout~0_combout\,
	datac => \controlcircuit|Mux3~0_combout\,
	datad => \b~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:5:ALU16|stage4|cout~0_combout\);

-- Location: LC_X7_Y1_N0
\G1:6:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:6:ALU16|stage6|Mux0~0_combout\ = (\controlcircuit|Mux0~0_combout\ & (((\controlcircuit|Mux1~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (((\G1:5:ALU16|stage4|cout~0_combout\ & !\controlcircuit|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aa50",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux0~0_combout\,
	datac => \G1:5:ALU16|stage4|cout~0_combout\,
	datad => \controlcircuit|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:6:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_56,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(6),
	combout => \b~combout\(6));

-- Location: LC_X7_Y1_N2
\G1:6:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:6:ALU16|stage1|f~0_combout\ = \b~combout\(6) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c738",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \b~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:6:ALU16|stage1|f~0_combout\);

-- Location: LC_X7_Y1_N3
\G1:6:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:6:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:6:ALU16|stage4|ff~0_combout\ & ((\G1:6:ALU16|stage6|Mux0~0_combout\) # (\G1:6:ALU16|stage1|f~0_combout\))) # (!\G1:6:ALU16|stage4|ff~0_combout\ & 
-- (\G1:6:ALU16|stage6|Mux0~0_combout\ & \G1:6:ALU16|stage1|f~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:6:ALU16|stage4|ff~0_combout\ $ (\G1:6:ALU16|stage6|Mux0~0_combout\ $ (\G1:6:ALU16|stage1|f~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e994",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux0~0_combout\,
	datab => \G1:6:ALU16|stage4|ff~0_combout\,
	datac => \G1:6:ALU16|stage6|Mux0~0_combout\,
	datad => \G1:6:ALU16|stage1|f~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:6:ALU16|stage6|Mux0~1_combout\);

-- Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(7),
	combout => \a~combout\(7));

-- Location: LC_X7_Y1_N1
\G1:7:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:7:ALU16|stage4|ff~0_combout\ = (\a~combout\(7) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cf30",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \a~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:7:ALU16|stage4|ff~0_combout\);

-- Location: LC_X7_Y1_N7
\G1:6:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:6:ALU16|stage4|cout~0_combout\ = (\G1:6:ALU16|stage4|ff~0_combout\ & ((\G1:5:ALU16|stage4|cout~0_combout\) # (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(6))))) # (!\G1:6:ALU16|stage4|ff~0_combout\ & (\G1:5:ALU16|stage4|cout~0_combout\ & 
-- (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d4e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux3~0_combout\,
	datab => \G1:6:ALU16|stage4|ff~0_combout\,
	datac => \G1:5:ALU16|stage4|cout~0_combout\,
	datad => \b~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:6:ALU16|stage4|cout~0_combout\);

-- Location: LC_X7_Y1_N6
\G1:7:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:7:ALU16|stage6|Mux0~0_combout\ = (\controlcircuit|Mux0~0_combout\ & (((\controlcircuit|Mux1~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (((\G1:6:ALU16|stage4|cout~0_combout\ & !\controlcircuit|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aa50",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux0~0_combout\,
	datac => \G1:6:ALU16|stage4|cout~0_combout\,
	datad => \controlcircuit|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:7:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_49,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(7),
	combout => \b~combout\(7));

-- Location: LC_X7_Y1_N8
\G1:7:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:7:ALU16|stage1|f~0_combout\ = \b~combout\(7) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c738",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \b~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:7:ALU16|stage1|f~0_combout\);

-- Location: LC_X7_Y1_N5
\G1:7:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:7:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:7:ALU16|stage4|ff~0_combout\ & ((\G1:7:ALU16|stage6|Mux0~0_combout\) # (\G1:7:ALU16|stage1|f~0_combout\))) # (!\G1:7:ALU16|stage4|ff~0_combout\ & 
-- (\G1:7:ALU16|stage6|Mux0~0_combout\ & \G1:7:ALU16|stage1|f~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:7:ALU16|stage4|ff~0_combout\ $ (\G1:7:ALU16|stage6|Mux0~0_combout\ $ (\G1:7:ALU16|stage1|f~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e994",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux0~0_combout\,
	datab => \G1:7:ALU16|stage4|ff~0_combout\,
	datac => \G1:7:ALU16|stage6|Mux0~0_combout\,
	datad => \G1:7:ALU16|stage1|f~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:7:ALU16|stage6|Mux0~1_combout\);

-- Location: LC_X7_Y1_N4
\G1:7:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:7:ALU16|stage4|cout~0_combout\ = (\G1:6:ALU16|stage4|cout~0_combout\ & ((\G1:7:ALU16|stage4|ff~0_combout\) # (\b~combout\(7) $ (\controlcircuit|Mux3~0_combout\)))) # (!\G1:6:ALU16|stage4|cout~0_combout\ & (\G1:7:ALU16|stage4|ff~0_combout\ & 
-- (\b~combout\(7) $ (\controlcircuit|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "de48",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(7),
	datab => \G1:6:ALU16|stage4|cout~0_combout\,
	datac => \controlcircuit|Mux3~0_combout\,
	datad => \G1:7:ALU16|stage4|ff~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:7:ALU16|stage4|cout~0_combout\);

-- Location: LC_X6_Y2_N3
\G1:8:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:8:ALU16|stage6|Mux0~0_combout\ = ((\controlcircuit|Mux1~0_combout\ & ((\controlcircuit|Mux0~0_combout\))) # (!\controlcircuit|Mux1~0_combout\ & (\G1:7:ALU16|stage4|cout~0_combout\ & !\controlcircuit|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f00a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:7:ALU16|stage4|cout~0_combout\,
	datac => \controlcircuit|Mux1~0_combout\,
	datad => \controlcircuit|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:8:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(8),
	combout => \a~combout\(8));

-- Location: LC_X6_Y2_N6
\G1:8:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:8:ALU16|stage4|ff~0_combout\ = (\a~combout\(8) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\(8),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:8:ALU16|stage4|ff~0_combout\);

-- Location: PIN_67,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(8),
	combout => \b~combout\(8));

-- Location: LC_X6_Y2_N8
\G1:8:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:8:ALU16|stage1|f~0_combout\ = \b~combout\(8) $ (((\opcode~combout\(2) & ((!\opcode~combout\(1)))) # (!\opcode~combout\(2) & (\opcode~combout\(0) & \opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b54a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(2),
	datab => \opcode~combout\(0),
	datac => \opcode~combout\(1),
	datad => \b~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:8:ALU16|stage1|f~0_combout\);

-- Location: LC_X6_Y2_N7
\G1:8:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:8:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:8:ALU16|stage6|Mux0~0_combout\ & ((\G1:8:ALU16|stage4|ff~0_combout\) # (\G1:8:ALU16|stage1|f~0_combout\))) # (!\G1:8:ALU16|stage6|Mux0~0_combout\ & 
-- (\G1:8:ALU16|stage4|ff~0_combout\ & \G1:8:ALU16|stage1|f~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:8:ALU16|stage6|Mux0~0_combout\ $ (\G1:8:ALU16|stage4|ff~0_combout\ $ (\G1:8:ALU16|stage1|f~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e994",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux0~0_combout\,
	datab => \G1:8:ALU16|stage6|Mux0~0_combout\,
	datac => \G1:8:ALU16|stage4|ff~0_combout\,
	datad => \G1:8:ALU16|stage1|f~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:8:ALU16|stage6|Mux0~1_combout\);

-- Location: LC_X6_Y2_N5
\G1:8:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:8:ALU16|stage4|cout~0_combout\ = (\G1:7:ALU16|stage4|cout~0_combout\ & ((\G1:8:ALU16|stage4|ff~0_combout\) # (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(8))))) # (!\G1:7:ALU16|stage4|cout~0_combout\ & (\G1:8:ALU16|stage4|ff~0_combout\ & 
-- (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b2e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:7:ALU16|stage4|cout~0_combout\,
	datab => \controlcircuit|Mux3~0_combout\,
	datac => \G1:8:ALU16|stage4|ff~0_combout\,
	datad => \b~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:8:ALU16|stage4|cout~0_combout\);

-- Location: LC_X6_Y3_N9
\G1:9:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:9:ALU16|stage6|Mux0~0_combout\ = (\controlcircuit|Mux1~0_combout\ & (((\controlcircuit|Mux0~0_combout\)))) # (!\controlcircuit|Mux1~0_combout\ & (((!\controlcircuit|Mux0~0_combout\ & \G1:8:ALU16|stage4|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a5a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux1~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \G1:8:ALU16|stage4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:9:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_83,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(9),
	combout => \a~combout\(9));

-- Location: LC_X6_Y3_N0
\G1:9:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:9:ALU16|stage4|ff~0_combout\ = \a~combout\(9) $ (((\opcode~combout\(2) & (!\opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d2d2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(2),
	datab => \opcode~combout\(1),
	datac => \a~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:9:ALU16|stage4|ff~0_combout\);

-- Location: PIN_64,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(9),
	combout => \b~combout\(9));

-- Location: LC_X6_Y3_N1
\G1:9:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:9:ALU16|stage1|f~0_combout\ = \b~combout\(9) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c738",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	datad => \b~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:9:ALU16|stage1|f~0_combout\);

-- Location: LC_X6_Y3_N5
\G1:9:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:9:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:9:ALU16|stage6|Mux0~0_combout\ & ((\G1:9:ALU16|stage4|ff~0_combout\) # (\G1:9:ALU16|stage1|f~0_combout\))) # (!\G1:9:ALU16|stage6|Mux0~0_combout\ & 
-- (\G1:9:ALU16|stage4|ff~0_combout\ & \G1:9:ALU16|stage1|f~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:9:ALU16|stage6|Mux0~0_combout\ $ (\G1:9:ALU16|stage4|ff~0_combout\ $ (\G1:9:ALU16|stage1|f~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e994",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux0~0_combout\,
	datab => \G1:9:ALU16|stage6|Mux0~0_combout\,
	datac => \G1:9:ALU16|stage4|ff~0_combout\,
	datad => \G1:9:ALU16|stage1|f~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:9:ALU16|stage6|Mux0~1_combout\);

-- Location: PIN_68,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(10),
	combout => \a~combout\(10));

-- Location: LC_X6_Y3_N8
\G1:10:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:10:ALU16|stage4|ff~0_combout\ = \a~combout\(10) $ (((!\opcode~combout\(1) & (\opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9a9a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(10),
	datab => \opcode~combout\(1),
	datac => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:10:ALU16|stage4|ff~0_combout\);

-- Location: PIN_81,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(10),
	combout => \b~combout\(10));

-- Location: LC_X6_Y3_N7
\G1:10:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:10:ALU16|stage1|f~0_combout\ = \b~combout\(10) $ (((\opcode~combout\(2) & (!\opcode~combout\(1))) # (!\opcode~combout\(2) & (\opcode~combout\(1) & \opcode~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "96d2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(2),
	datab => \opcode~combout\(1),
	datac => \b~combout\(10),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:10:ALU16|stage1|f~0_combout\);

-- Location: LC_X6_Y3_N4
\G1:9:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:9:ALU16|stage4|cout~0_combout\ = (\G1:8:ALU16|stage4|cout~0_combout\ & ((\G1:9:ALU16|stage4|ff~0_combout\) # (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(9))))) # (!\G1:8:ALU16|stage4|cout~0_combout\ & (\G1:9:ALU16|stage4|ff~0_combout\ & 
-- (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d4e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux3~0_combout\,
	datab => \G1:8:ALU16|stage4|cout~0_combout\,
	datac => \G1:9:ALU16|stage4|ff~0_combout\,
	datad => \b~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:9:ALU16|stage4|cout~0_combout\);

-- Location: LC_X6_Y3_N3
\G1:10:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:10:ALU16|stage6|Mux0~0_combout\ = ((\controlcircuit|Mux0~0_combout\ & ((\controlcircuit|Mux1~0_combout\))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:9:ALU16|stage4|cout~0_combout\ & !\controlcircuit|Mux1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f00c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \G1:9:ALU16|stage4|cout~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \controlcircuit|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:10:ALU16|stage6|Mux0~0_combout\);

-- Location: LC_X6_Y3_N2
\G1:10:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:10:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:10:ALU16|stage4|ff~0_combout\ & ((\G1:10:ALU16|stage1|f~0_combout\) # (\G1:10:ALU16|stage6|Mux0~0_combout\))) # (!\G1:10:ALU16|stage4|ff~0_combout\ & 
-- (\G1:10:ALU16|stage1|f~0_combout\ & \G1:10:ALU16|stage6|Mux0~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:10:ALU16|stage4|ff~0_combout\ $ (\G1:10:ALU16|stage1|f~0_combout\ $ (\G1:10:ALU16|stage6|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e986",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:10:ALU16|stage4|ff~0_combout\,
	datab => \G1:10:ALU16|stage1|f~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \G1:10:ALU16|stage6|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:10:ALU16|stage6|Mux0~1_combout\);

-- Location: PIN_6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(11),
	combout => \a~combout\(11));

-- Location: LC_X4_Y3_N4
\G1:11:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:11:ALU16|stage4|ff~0_combout\ = (\a~combout\(11) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\(11),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:11:ALU16|stage4|ff~0_combout\);

-- Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(11),
	combout => \b~combout\(11));

-- Location: LC_X4_Y3_N2
\G1:11:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:11:ALU16|stage1|f~0_combout\ = \b~combout\(11) $ (((\opcode~combout\(1) & (\opcode~combout\(0) & !\opcode~combout\(2))) # (!\opcode~combout\(1) & ((\opcode~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c36c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(0),
	datab => \b~combout\(11),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:11:ALU16|stage1|f~0_combout\);

-- Location: LC_X6_Y3_N6
\G1:10:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:10:ALU16|stage4|cout~0_combout\ = (\G1:10:ALU16|stage4|ff~0_combout\ & ((\G1:9:ALU16|stage4|cout~0_combout\) # (\b~combout\(10) $ (\controlcircuit|Mux3~0_combout\)))) # (!\G1:10:ALU16|stage4|ff~0_combout\ & (\G1:9:ALU16|stage4|cout~0_combout\ & 
-- (\b~combout\(10) $ (\controlcircuit|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:10:ALU16|stage4|ff~0_combout\,
	datab => \G1:9:ALU16|stage4|cout~0_combout\,
	datac => \b~combout\(10),
	datad => \controlcircuit|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:10:ALU16|stage4|cout~0_combout\);

-- Location: LC_X4_Y3_N8
\G1:11:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:11:ALU16|stage6|Mux0~0_combout\ = (\controlcircuit|Mux1~0_combout\ & (((\controlcircuit|Mux0~0_combout\)))) # (!\controlcircuit|Mux1~0_combout\ & (((!\controlcircuit|Mux0~0_combout\ & \G1:10:ALU16|stage4|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a5a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux1~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \G1:10:ALU16|stage4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:11:ALU16|stage6|Mux0~0_combout\);

-- Location: LC_X4_Y3_N3
\G1:11:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:11:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:11:ALU16|stage4|ff~0_combout\ & ((\G1:11:ALU16|stage1|f~0_combout\) # (\G1:11:ALU16|stage6|Mux0~0_combout\))) # (!\G1:11:ALU16|stage4|ff~0_combout\ & 
-- (\G1:11:ALU16|stage1|f~0_combout\ & \G1:11:ALU16|stage6|Mux0~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:11:ALU16|stage4|ff~0_combout\ $ (\G1:11:ALU16|stage1|f~0_combout\ $ (\G1:11:ALU16|stage6|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e986",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:11:ALU16|stage4|ff~0_combout\,
	datab => \G1:11:ALU16|stage1|f~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \G1:11:ALU16|stage6|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:11:ALU16|stage6|Mux0~1_combout\);

-- Location: PIN_96,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(12),
	combout => \b~combout\(12));

-- Location: LC_X4_Y3_N7
\G1:12:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:12:ALU16|stage1|f~0_combout\ = \b~combout\(12) $ (((\opcode~combout\(2) & ((!\opcode~combout\(1)))) # (!\opcode~combout\(2) & (\opcode~combout\(0) & \opcode~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "9a66",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(12),
	datab => \opcode~combout\(2),
	datac => \opcode~combout\(0),
	datad => \opcode~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:12:ALU16|stage1|f~0_combout\);

-- Location: LC_X4_Y3_N1
\G1:11:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:11:ALU16|stage4|cout~0_combout\ = (\G1:11:ALU16|stage4|ff~0_combout\ & ((\G1:10:ALU16|stage4|cout~0_combout\) # (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(11))))) # (!\G1:11:ALU16|stage4|ff~0_combout\ & (\G1:10:ALU16|stage4|cout~0_combout\ & 
-- (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f660",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux3~0_combout\,
	datab => \b~combout\(11),
	datac => \G1:11:ALU16|stage4|ff~0_combout\,
	datad => \G1:10:ALU16|stage4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:11:ALU16|stage4|cout~0_combout\);

-- Location: LC_X4_Y3_N0
\G1:12:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:12:ALU16|stage6|Mux0~0_combout\ = (\controlcircuit|Mux1~0_combout\ & (((\controlcircuit|Mux0~0_combout\)))) # (!\controlcircuit|Mux1~0_combout\ & (((!\controlcircuit|Mux0~0_combout\ & \G1:11:ALU16|stage4|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a5a0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux1~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \G1:11:ALU16|stage4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:12:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(12),
	combout => \a~combout\(12));

-- Location: LC_X4_Y3_N9
\G1:12:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:12:ALU16|stage4|ff~0_combout\ = (\a~combout\(12) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a5f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datac => \a~combout\(12),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:12:ALU16|stage4|ff~0_combout\);

-- Location: LC_X4_Y3_N5
\G1:12:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:12:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:12:ALU16|stage1|f~0_combout\ & ((\G1:12:ALU16|stage6|Mux0~0_combout\) # (\G1:12:ALU16|stage4|ff~0_combout\))) # (!\G1:12:ALU16|stage1|f~0_combout\ & 
-- (\G1:12:ALU16|stage6|Mux0~0_combout\ & \G1:12:ALU16|stage4|ff~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:12:ALU16|stage1|f~0_combout\ $ (\G1:12:ALU16|stage6|Mux0~0_combout\ $ (\G1:12:ALU16|stage4|ff~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e994",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux0~0_combout\,
	datab => \G1:12:ALU16|stage1|f~0_combout\,
	datac => \G1:12:ALU16|stage6|Mux0~0_combout\,
	datad => \G1:12:ALU16|stage4|ff~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:12:ALU16|stage6|Mux0~1_combout\);

-- Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(13),
	combout => \b~combout\(13));

-- Location: LC_X4_Y2_N5
\G1:13:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:13:ALU16|stage1|f~0_combout\ = \b~combout\(13) $ (((\opcode~combout\(1) & (!\opcode~combout\(2) & \opcode~combout\(0))) # (!\opcode~combout\(1) & (\opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "96b4",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(1),
	datab => \opcode~combout\(2),
	datac => \b~combout\(13),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:13:ALU16|stage1|f~0_combout\);

-- Location: LC_X4_Y3_N6
\G1:12:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:12:ALU16|stage4|cout~0_combout\ = (\G1:12:ALU16|stage4|ff~0_combout\ & ((\G1:11:ALU16|stage4|cout~0_combout\) # (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(12))))) # (!\G1:12:ALU16|stage4|ff~0_combout\ & (\G1:11:ALU16|stage4|cout~0_combout\ & 
-- (\controlcircuit|Mux3~0_combout\ $ (\b~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "de48",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux3~0_combout\,
	datab => \G1:12:ALU16|stage4|ff~0_combout\,
	datac => \b~combout\(12),
	datad => \G1:11:ALU16|stage4|cout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:12:ALU16|stage4|cout~0_combout\);

-- Location: LC_X4_Y2_N9
\G1:13:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:13:ALU16|stage6|Mux0~0_combout\ = ((\controlcircuit|Mux0~0_combout\ & ((\controlcircuit|Mux1~0_combout\))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:12:ALU16|stage4|cout~0_combout\ & !\controlcircuit|Mux1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f00a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:12:ALU16|stage4|cout~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \controlcircuit|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:13:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_92,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(13),
	combout => \a~combout\(13));

-- Location: LC_X4_Y2_N2
\G1:13:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:13:ALU16|stage4|ff~0_combout\ = (\a~combout\(13) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \a~combout\(13),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:13:ALU16|stage4|ff~0_combout\);

-- Location: LC_X4_Y2_N0
\G1:13:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:13:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:13:ALU16|stage1|f~0_combout\ & ((\G1:13:ALU16|stage6|Mux0~0_combout\) # (\G1:13:ALU16|stage4|ff~0_combout\))) # (!\G1:13:ALU16|stage1|f~0_combout\ & 
-- (\G1:13:ALU16|stage6|Mux0~0_combout\ & \G1:13:ALU16|stage4|ff~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:13:ALU16|stage1|f~0_combout\ $ (\G1:13:ALU16|stage6|Mux0~0_combout\ $ (\G1:13:ALU16|stage4|ff~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e986",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:13:ALU16|stage1|f~0_combout\,
	datab => \G1:13:ALU16|stage6|Mux0~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \G1:13:ALU16|stage4|ff~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:13:ALU16|stage6|Mux0~1_combout\);

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(14),
	combout => \a~combout\(14));

-- Location: LC_X4_Y2_N4
\G1:14:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:14:ALU16|stage4|ff~0_combout\ = \a~combout\(14) $ ((((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a5aa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(14),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:14:ALU16|stage4|ff~0_combout\);

-- Location: LC_X4_Y2_N8
\G1:13:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:13:ALU16|stage4|cout~0_combout\ = (\G1:12:ALU16|stage4|cout~0_combout\ & ((\G1:13:ALU16|stage4|ff~0_combout\) # (\b~combout\(13) $ (\controlcircuit|Mux3~0_combout\)))) # (!\G1:12:ALU16|stage4|cout~0_combout\ & (\G1:13:ALU16|stage4|ff~0_combout\ & 
-- (\b~combout\(13) $ (\controlcircuit|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:12:ALU16|stage4|cout~0_combout\,
	datab => \G1:13:ALU16|stage4|ff~0_combout\,
	datac => \b~combout\(13),
	datad => \controlcircuit|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:13:ALU16|stage4|cout~0_combout\);

-- Location: LC_X4_Y2_N1
\G1:14:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:14:ALU16|stage6|Mux0~0_combout\ = ((\controlcircuit|Mux0~0_combout\ & ((\controlcircuit|Mux1~0_combout\))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:13:ALU16|stage4|cout~0_combout\ & !\controlcircuit|Mux1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f00a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:13:ALU16|stage4|cout~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \controlcircuit|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:14:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(14),
	combout => \b~combout\(14));

-- Location: LC_X4_Y2_N3
\G1:14:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:14:ALU16|stage1|f~0_combout\ = \b~combout\(14) $ (((\opcode~combout\(2) & (!\opcode~combout\(1))) # (!\opcode~combout\(2) & (\opcode~combout\(1) & \opcode~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "96c6",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(2),
	datab => \b~combout\(14),
	datac => \opcode~combout\(1),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:14:ALU16|stage1|f~0_combout\);

-- Location: LC_X4_Y2_N7
\G1:14:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:14:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:14:ALU16|stage4|ff~0_combout\ & ((\G1:14:ALU16|stage6|Mux0~0_combout\) # (\G1:14:ALU16|stage1|f~0_combout\))) # (!\G1:14:ALU16|stage4|ff~0_combout\ & 
-- (\G1:14:ALU16|stage6|Mux0~0_combout\ & \G1:14:ALU16|stage1|f~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:14:ALU16|stage4|ff~0_combout\ $ (\G1:14:ALU16|stage6|Mux0~0_combout\ $ (\G1:14:ALU16|stage1|f~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e986",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:14:ALU16|stage4|ff~0_combout\,
	datab => \G1:14:ALU16|stage6|Mux0~0_combout\,
	datac => \controlcircuit|Mux0~0_combout\,
	datad => \G1:14:ALU16|stage1|f~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:14:ALU16|stage6|Mux0~1_combout\);

-- Location: LC_X4_Y2_N6
\G1:14:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:14:ALU16|stage4|cout~0_combout\ = (\G1:13:ALU16|stage4|cout~0_combout\ & ((\G1:14:ALU16|stage4|ff~0_combout\) # (\b~combout\(14) $ (\controlcircuit|Mux3~0_combout\)))) # (!\G1:13:ALU16|stage4|cout~0_combout\ & (\G1:14:ALU16|stage4|ff~0_combout\ & 
-- (\b~combout\(14) $ (\controlcircuit|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b2e8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:13:ALU16|stage4|cout~0_combout\,
	datab => \b~combout\(14),
	datac => \G1:14:ALU16|stage4|ff~0_combout\,
	datad => \controlcircuit|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:14:ALU16|stage4|cout~0_combout\);

-- Location: LC_X4_Y1_N4
\G1:15:ALU16|stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \G1:15:ALU16|stage6|Mux0~0_combout\ = (\controlcircuit|Mux0~0_combout\ & (((\controlcircuit|Mux1~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (((\G1:14:ALU16|stage4|cout~0_combout\ & !\controlcircuit|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aa50",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \controlcircuit|Mux0~0_combout\,
	datac => \G1:14:ALU16|stage4|cout~0_combout\,
	datad => \controlcircuit|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:15:ALU16|stage6|Mux0~0_combout\);

-- Location: PIN_42,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b(15),
	combout => \b~combout\(15));

-- Location: LC_X4_Y1_N9
\G1:15:ALU16|stage1|f~0\ : maxv_lcell
-- Equation(s):
-- \G1:15:ALU16|stage1|f~0_combout\ = \b~combout\(15) $ (((\opcode~combout\(2) & (!\opcode~combout\(1))) # (!\opcode~combout\(2) & (\opcode~combout\(1) & \opcode~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "96d2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \opcode~combout\(2),
	datab => \opcode~combout\(1),
	datac => \b~combout\(15),
	datad => \opcode~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:15:ALU16|stage1|f~0_combout\);

-- Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a(15),
	combout => \a~combout\(15));

-- Location: LC_X4_Y1_N0
\G1:15:ALU16|stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \G1:15:ALU16|stage4|ff~0_combout\ = (\a~combout\(15) $ (((!\opcode~combout\(1) & \opcode~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c3f0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \opcode~combout\(1),
	datac => \a~combout\(15),
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:15:ALU16|stage4|ff~0_combout\);

-- Location: LC_X4_Y1_N6
\G1:15:ALU16|stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \G1:15:ALU16|stage6|Mux0~1_combout\ = (\controlcircuit|Mux0~0_combout\ & ((\G1:15:ALU16|stage6|Mux0~0_combout\ & ((\G1:15:ALU16|stage1|f~0_combout\) # (\G1:15:ALU16|stage4|ff~0_combout\))) # (!\G1:15:ALU16|stage6|Mux0~0_combout\ & 
-- (\G1:15:ALU16|stage1|f~0_combout\ & \G1:15:ALU16|stage4|ff~0_combout\)))) # (!\controlcircuit|Mux0~0_combout\ & (\G1:15:ALU16|stage6|Mux0~0_combout\ $ (\G1:15:ALU16|stage1|f~0_combout\ $ (\G1:15:ALU16|stage4|ff~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e896",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:15:ALU16|stage6|Mux0~0_combout\,
	datab => \G1:15:ALU16|stage1|f~0_combout\,
	datac => \G1:15:ALU16|stage4|ff~0_combout\,
	datad => \controlcircuit|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:15:ALU16|stage6|Mux0~1_combout\);

-- Location: LC_X4_Y1_N8
\G1:15:ALU16|stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \G1:15:ALU16|stage4|cout~0_combout\ = (\G1:14:ALU16|stage4|cout~0_combout\ & ((\G1:15:ALU16|stage4|ff~0_combout\) # (\b~combout\(15) $ (\controlcircuit|Mux3~0_combout\)))) # (!\G1:14:ALU16|stage4|cout~0_combout\ & (\G1:15:ALU16|stage4|ff~0_combout\ & 
-- (\b~combout\(15) $ (\controlcircuit|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8ee8",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:14:ALU16|stage4|cout~0_combout\,
	datab => \G1:15:ALU16|stage4|ff~0_combout\,
	datac => \b~combout\(15),
	datad => \controlcircuit|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \G1:15:ALU16|stage4|cout~0_combout\);

-- Location: LC_X4_Y1_N7
\Mux0~0\ : maxv_lcell
-- Equation(s):
-- \Mux0~0_combout\ = (\opcode~combout\(1) & (!\opcode~combout\(2) & (\G1:15:ALU16|stage4|cout~0_combout\ $ (\G1:14:ALU16|stage4|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0048",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G1:15:ALU16|stage4|cout~0_combout\,
	datab => \opcode~combout\(1),
	datac => \G1:14:ALU16|stage4|cout~0_combout\,
	datad => \opcode~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Mux0~0_combout\);

-- Location: PIN_90,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:0:ALU16|stage6|Mux0~4_combout\,
	oe => VCC,
	padio => ww_f(0));

-- Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:1:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(1));

-- Location: PIN_44,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:2:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(2));

-- Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:3:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(3));

-- Location: PIN_73,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:4:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(4));

-- Location: PIN_66,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:5:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(5));

-- Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:6:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(6));

-- Location: PIN_69,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:7:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(7));

-- Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[8]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:8:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(8));

-- Location: PIN_76,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[9]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:9:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(9));

-- Location: PIN_84,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[10]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:10:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(10));

-- Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[11]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:11:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(11));

-- Location: PIN_91,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[12]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:12:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(12));

-- Location: PIN_41,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[13]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:13:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(13));

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[14]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:14:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(14));

-- Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\f[15]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \G1:15:ALU16|stage6|Mux0~1_combout\,
	oe => VCC,
	padio => ww_f(15));

-- Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\overflow~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \Mux0~0_combout\,
	oe => VCC,
	padio => ww_overflow);
END structure;


