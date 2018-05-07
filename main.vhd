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
-- CREATED		"Tue May 08 02:54:41 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY main IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		write_en :  IN  STD_LOGIC;
		aluSrc :  IN  STD_LOGIC;
		alu_opcode :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		immediate :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		read_reg_1 :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		read_reg_2 :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		write_reg :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		alu_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END main;

ARCHITECTURE bdf_type OF main IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT mux_0
	PORT(sel : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF mux_0: COMPONENT IS true;
ATTRIBUTE noopt OF mux_0: COMPONENT IS true;

COMPONENT alu
	PORT(a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 op : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 res : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT registers
	PORT(clk : IN STD_LOGIC;
		 write_en : IN STD_LOGIC;
		 read_reg_1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 read_reg_2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 write_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 write_reg : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 read_data_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 read_data_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 
alu_out <= SYNTHESIZED_WIRE_2;



b2v_inst : alu
PORT MAP(a => SYNTHESIZED_WIRE_0,
		 b => SYNTHESIZED_WIRE_1,
		 op => alu_opcode,
		 res => SYNTHESIZED_WIRE_2);


b2v_inst1 : registers
PORT MAP(clk => clk,
		 write_en => write_en,
		 read_reg_1 => read_reg_1,
		 read_reg_2 => read_reg_2,
		 write_data => SYNTHESIZED_WIRE_2,
		 write_reg => write_reg,
		 read_data_1 => SYNTHESIZED_WIRE_0,
		 read_data_2 => SYNTHESIZED_WIRE_3);


b2v_inst2 : mux_0
PORT MAP(sel => aluSrc,
		 a => SYNTHESIZED_WIRE_3,
		 b => immediate,
		 y => SYNTHESIZED_WIRE_1);


END bdf_type;