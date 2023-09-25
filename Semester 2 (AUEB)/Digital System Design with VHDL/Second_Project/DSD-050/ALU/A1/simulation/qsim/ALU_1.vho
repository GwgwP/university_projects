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

-- DATE "05/26/2021 23:04:42"

-- 
-- Device: Altera 5M40ZM64C4 Package MBGA64
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	ALU_1 IS
    PORT (
	a : IN std_logic;
	b : IN std_logic;
	sa : IN std_logic;
	sb : IN std_logic;
	cin : IN std_logic;
	operation : IN std_logic_vector(1 DOWNTO 0);
	result : OUT std_logic;
	cout : OUT std_logic
	);
END ALU_1;

-- Design Ports Information


ARCHITECTURE structure OF ALU_1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic;
SIGNAL ww_b : std_logic;
SIGNAL ww_sa : std_logic;
SIGNAL ww_sb : std_logic;
SIGNAL ww_cin : std_logic;
SIGNAL ww_operation : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_result : std_logic;
SIGNAL ww_cout : std_logic;
SIGNAL \sa~combout\ : std_logic;
SIGNAL \a~combout\ : std_logic;
SIGNAL \stage4|ff~0_combout\ : std_logic;
SIGNAL \b~combout\ : std_logic;
SIGNAL \cin~combout\ : std_logic;
SIGNAL \stage6|Mux0~0_combout\ : std_logic;
SIGNAL \sb~combout\ : std_logic;
SIGNAL \stage6|Mux0~1_combout\ : std_logic;
SIGNAL \stage6|Mux0~2_combout\ : std_logic;
SIGNAL \stage4|cout~0_combout\ : std_logic;
SIGNAL \operation~combout\ : std_logic_vector(1 DOWNTO 0);

BEGIN

ww_a <= a;
ww_b <= b;
ww_sa <= sa;
ww_sb <= sb;
ww_cin <= cin;
ww_operation <= operation;
result <= ww_result;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sa~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_sa,
	combout => \sa~combout\);

-- Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_a,
	combout => \a~combout\);

-- Location: LC_X5_Y2_N6
\stage4|ff~0\ : maxv_lcell
-- Equation(s):
-- \stage4|ff~0_combout\ = ((\sa~combout\ $ (\a~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \sa~combout\,
	datad => \a~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \stage4|ff~0_combout\);

-- Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\operation[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_operation(0),
	combout => \operation~combout\(0));

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\operation[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_operation(1),
	combout => \operation~combout\(1));

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_b,
	combout => \b~combout\);

-- Location: PIN_F5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\cin~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_cin,
	combout => \cin~combout\);

-- Location: LC_X5_Y2_N2
\stage6|Mux0~0\ : maxv_lcell
-- Equation(s):
-- \stage6|Mux0~0_combout\ = (\operation~combout\(0) & ((\sa~combout\ $ (\a~combout\)))) # (!\operation~combout\(0) & (\cin~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2ee2",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cin~combout\,
	datab => \operation~combout\(0),
	datac => \sa~combout\,
	datad => \a~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \stage6|Mux0~0_combout\);

-- Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sb~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_sb,
	combout => \sb~combout\);

-- Location: LC_X5_Y2_N8
\stage6|Mux0~1\ : maxv_lcell
-- Equation(s):
-- \stage6|Mux0~1_combout\ = \b~combout\ $ (\sb~combout\ $ (((\stage6|Mux0~0_combout\ & \operation~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "956a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\,
	datab => \stage6|Mux0~0_combout\,
	datac => \operation~combout\(1),
	datad => \sb~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \stage6|Mux0~1_combout\);

-- Location: LC_X5_Y2_N4
\stage6|Mux0~2\ : maxv_lcell
-- Equation(s):
-- \stage6|Mux0~2_combout\ = (\stage6|Mux0~1_combout\ & ((\operation~combout\(0)) # (\stage4|ff~0_combout\ $ (\operation~combout\(1))))) # (!\stage6|Mux0~1_combout\ & (\stage4|ff~0_combout\ & (\operation~combout\(0) $ (\operation~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "de28",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \stage4|ff~0_combout\,
	datab => \operation~combout\(0),
	datac => \operation~combout\(1),
	datad => \stage6|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \stage6|Mux0~2_combout\);

-- Location: LC_X5_Y2_N5
\stage4|cout~0\ : maxv_lcell
-- Equation(s):
-- \stage4|cout~0_combout\ = (\cin~combout\ & ((\stage4|ff~0_combout\) # (\b~combout\ $ (\sb~combout\)))) # (!\cin~combout\ & (\stage4|ff~0_combout\ & (\b~combout\ $ (\sb~combout\))))

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
	dataa => \b~combout\,
	datab => \cin~combout\,
	datac => \stage4|ff~0_combout\,
	datad => \sb~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \stage4|cout~0_combout\);

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\result~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \stage6|Mux0~2_combout\,
	oe => VCC,
	padio => ww_result);

-- Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\cout~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \stage4|cout~0_combout\,
	oe => VCC,
	padio => ww_cout);
END structure;


