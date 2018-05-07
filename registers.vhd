-- https://cs.nyu.edu/courses/fall01/V22.0436-001/lectures/lecture-05.html
-- https://cs.nyu.edu/courses/fall01/V22.0436-001/lectures/figs/register-file.png

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY registers IS
	PORT	(	
				clk			:	IN		STD_LOGIC;
				write_en		:	IN		STD_LOGIC;
				write_reg	:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
				read_reg_1	:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
				read_reg_2	:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
				write_data	:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
				read_data_1	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				read_data_2	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
			);
			
END ENTITY registers;

ARCHITECTURE behavior OF registers IS

	-- define memory as array
	-- 8 x 4 = 32 bits memory
	TYPE reg_array IS ARRAY(3 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg_mem : reg_array;

BEGIN
	PROCESS(clk)
	BEGIN
		IF	(RISING_EDGE(clk) AND write_en = '1') THEN
			reg_mem(TO_INTEGER(UNSIGNED(write_reg))) <= write_data;
		END IF;
	END PROCESS;
	
	-- $zero handle
	WITH read_reg_1 SELECT
		read_data_1 <= "00000000" WHEN "00",
							reg_mem(TO_INTEGER(UNSIGNED(read_reg_1))) WHEN OTHERS;
	
	WITH read_reg_2 SELECT
		read_data_2 <= "00000000" WHEN "00",
							reg_mem(TO_INTEGER(UNSIGNED(read_reg_2))) WHEN OTHERS;

END behavior;
				