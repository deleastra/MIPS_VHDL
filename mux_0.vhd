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

LIBRARY altera;
USE altera.maxplus2.all; 

LIBRARY work;

ENTITY mux_0 IS 
PORT 
( 
	sel	:	IN	 STD_LOGIC;
	a	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	b	:	IN	 STD_LOGIC_VECTOR(31 DOWNTO 0);
	y	:	OUT	 STD_LOGIC_VECTOR(31 DOWNTO 0)
); 
END mux_0;

ARCHITECTURE bdf_type OF mux_0 IS 
BEGIN 

-- instantiate macrofunction 

b2v_inst2 : mux
GENERIC MAP(n => 32)
PORT MAP(sel => sel,
		 a => a,
		 b => b,
		 y => y);

END bdf_type; 