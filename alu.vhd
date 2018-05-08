LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY alu IS
PORT
	(	
		a, b	:	IN		STD_LOGIC_VECTOR(31 DOWNTO 0);
		op		:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);
		zero  :  OUT   STD_LOGIC;
		res	:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ENTITY alu;

ARCHITECTURE behavior OF alu IS
	SIGNAL res_sig : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL zero_sig : STD_LOGIC := '0';
BEGIN
	PROCESS(a, b, op)
		BEGIN
			IF (op = "000") THEN -- ADD
				res_sig <= a + b;
			ELSIF (op = "001") THEN -- SUB
				res_sig <= a - b;
			ELSIF (op = "010") THEN -- AND
				res_sig <= a AND b;			
			ELSIF (op = "011") THEN -- OR
				res_sig <= a OR b;
			ELSIF ((op = "100") AND (a < b)) THEN -- slt
			   IF (a < b) THEN
			       res_sig <= "00000000000000000000000000000001";
				ELSE
				    res_sig <= "00000000000000000000000000000000";
				END IF;
			ELSIF (op = "101") THEN -- beq
  			    IF (a = b) THEN
				     zero_sig <= '1';
				 ELSE
				     zero_sig <= '0';
				 END IF;
			ELSIF (op = "110") THEN -- bne
			    IF (a = b) THEN
				     zero_sig <= '0';
				 ELSE
				     zero_sig <= '1';
				 END IF;
			ELSE
			    res_sig <= "00000000000000000000000000000000";
				 zero_sig <= '0';
			END IF;
	END PROCESS;
	res <= res_sig;
	zero <= zero_sig;
END behavior;