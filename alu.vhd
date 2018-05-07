LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY alu IS
PORT
	(	
		a, b	:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
		op		:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
		res	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY alu;

ARCHITECTURE behavior OF alu IS
	SIGNAL res_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	PROCESS(a, b, op)
		BEGIN
			IF (op = "00") THEN -- ADD
				res_sig <= a + b;
			ELSIF (op = "01") THEN -- SUB
				res_sig <= a - b;
			ELSIF (op = "10") THEN -- AND
				res_sig <= a AND b;			
			ELSIF (op = "11") THEN -- OR
				res_sig <= a OR b;
			END IF;
	END PROCESS;
	res <= res_sig;
END behavior;