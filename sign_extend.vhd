LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY sign_extend IS
	PORT ( a: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		    b: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END sign_extend;

ARCHITECTURE behavior OF sign_extend IS
	BEGIN
	b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(a), b'length));
END behavior;