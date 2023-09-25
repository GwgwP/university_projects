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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/26/2021 23:04:39"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ALU_1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ALU_1_vhd_vec_tst IS
END ALU_1_vhd_vec_tst;
ARCHITECTURE ALU_1_arch OF ALU_1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC;
SIGNAL b : STD_LOGIC;
SIGNAL cin : STD_LOGIC;
SIGNAL cout : STD_LOGIC;
SIGNAL operation : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL result : STD_LOGIC;
SIGNAL sa : STD_LOGIC;
SIGNAL sb : STD_LOGIC;
COMPONENT ALU_1
	PORT (
	a : IN STD_LOGIC;
	b : IN STD_LOGIC;
	cin : IN STD_LOGIC;
	cout : OUT STD_LOGIC;
	operation : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	result : OUT STD_LOGIC;
	sa : IN STD_LOGIC;
	sb : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ALU_1
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	cin => cin,
	cout => cout,
	operation => operation,
	result => result,
	sa => sa,
	sb => sb
	);

-- a
t_prcs_a: PROCESS
BEGIN
LOOP
	a <= '0';
	WAIT FOR 40000 ps;
	a <= '1';
	WAIT FOR 40000 ps;
	IF (NOW >= 160000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_a;

-- sa
t_prcs_sa: PROCESS
BEGIN
	sa <= '0';
WAIT;
END PROCESS t_prcs_sa;

-- b
t_prcs_b: PROCESS
BEGIN
	b <= '0';
	WAIT FOR 80000 ps;
	b <= '1';
WAIT;
END PROCESS t_prcs_b;

-- sb
t_prcs_sb: PROCESS
BEGIN
	sb <= '0';
WAIT;
END PROCESS t_prcs_sb;

-- cin
t_prcs_cin: PROCESS
BEGIN
	cin <= '0';
WAIT;
END PROCESS t_prcs_cin;
-- operation[1]
t_prcs_operation_1: PROCESS
BEGIN
	operation(1) <= '1';
WAIT;
END PROCESS t_prcs_operation_1;
-- operation[0]
t_prcs_operation_0: PROCESS
BEGIN
	operation(0) <= '1';
WAIT;
END PROCESS t_prcs_operation_0;
END ALU_1_arch;
