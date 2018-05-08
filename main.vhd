-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
-- CREATED		"Tue May 08 11:09:58 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY main IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		read_data_1 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		read_data_2 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		test :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		testx :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END main;

ARCHITECTURE bdf_type OF main IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT mux_0
	PORT(sel : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF mux_0: COMPONENT IS true;
ATTRIBUTE noopt OF mux_0: COMPONENT IS true;

COMPONENT mux_1
	PORT(sel : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 y : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF mux_1: COMPONENT IS true;
ATTRIBUTE noopt OF mux_1: COMPONENT IS true;

COMPONENT alu
	PORT(a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 op : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 res : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT registers
	PORT(clk : IN STD_LOGIC;
		 write_en : IN STD_LOGIC;
		 read_reg_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 read_reg_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 write_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 write_reg : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 read_data_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 read_data_2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT control_unit
	PORT(instruction : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 reg_write : OUT STD_LOGIC;
		 alu_src : OUT STD_LOGIC;
		 reg_dst : OUT STD_LOGIC;
		 alu_op : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT instructions_memory
	PORT(instruction_addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pc
	PORT(clk : IN STD_LOGIC;
		 current_instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 next_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sign_extend
	PORT(a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	instruction :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;


BEGIN 
read_data_1 <= SYNTHESIZED_WIRE_0;
read_data_2 <= SYNTHESIZED_WIRE_7;
test <= SYNTHESIZED_WIRE_5;



b2v_inst : alu
PORT MAP(a => SYNTHESIZED_WIRE_0,
		 b => SYNTHESIZED_WIRE_1,
		 op => SYNTHESIZED_WIRE_2,
		 res => SYNTHESIZED_WIRE_4);


b2v_inst1 : registers
PORT MAP(clk => clk,
		 write_en => SYNTHESIZED_WIRE_3,
		 read_reg_1 => instruction(25 DOWNTO 21),
		 read_reg_2 => instruction(20 DOWNTO 16),
		 write_data => SYNTHESIZED_WIRE_4,
		 write_reg => SYNTHESIZED_WIRE_5,
		 read_data_1 => SYNTHESIZED_WIRE_0,
		 read_data_2 => SYNTHESIZED_WIRE_7);


b2v_inst2 : mux_0
PORT MAP(sel => SYNTHESIZED_WIRE_6,
		 a => SYNTHESIZED_WIRE_7,
		 b => SYNTHESIZED_WIRE_8,
		 y => SYNTHESIZED_WIRE_1);


b2v_inst3 : control_unit
PORT MAP(instruction => instruction(31 DOWNTO 26),
		 reg_write => SYNTHESIZED_WIRE_3,
		 alu_src => SYNTHESIZED_WIRE_6,
		 reg_dst => SYNTHESIZED_WIRE_11,
		 alu_op => SYNTHESIZED_WIRE_2);


b2v_inst4 : instructions_memory
PORT MAP(instruction_addr => SYNTHESIZED_WIRE_12,
		 instruction => instruction);


b2v_inst5 : pc
PORT MAP(clk => clk,
		 current_instruction => SYNTHESIZED_WIRE_12,
		 next_instruction => SYNTHESIZED_WIRE_12);


b2v_inst6 : sign_extend
PORT MAP(a => instruction(15 DOWNTO 0),
		 b => SYNTHESIZED_WIRE_8);


b2v_inst7 : mux_1
PORT MAP(sel => SYNTHESIZED_WIRE_11,
		 a => instruction(20 DOWNTO 16),
		 b => instruction(15 DOWNTO 11),
		 y => SYNTHESIZED_WIRE_5);

testx <= instruction;

END bdf_type;