LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY pc IS
    PORT ( clk                 : IN  STD_LOGIC;
	        current_instruction : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
	        next_instruction    : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END ENTITY pc;

ARCHITECTURE behavior OF pc IS
    SIGNAL next_signal : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
BEGIN
    PROCESS(clk)
	 BEGIN
	     IF (FALLING_EDGE(clk)) THEN
		      next_signal <= STD_LOGIC_VECTOR(UNSIGNED(current_instruction) + TO_UNSIGNED(1, 5));
			END IF;
	 END PROCESS;
	 next_instruction <= next_signal;
END behavior;
