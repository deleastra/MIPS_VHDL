LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mux IS
  GENERIC (n: NATURAL:= 1); -- number of bits in the choices
  PORT (  a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			 sel  : IN STD_LOGIC;
			 y    : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0));
END ENTITY mux;

ARCHITECTURE dataflow OF mux IS
BEGIN
	y <= a WHEN (sel = '0') ELSE b;
END dataflow;