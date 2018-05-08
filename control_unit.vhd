LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_unit IS
  PORT ( instruction : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
         reg_write   : OUT STD_LOGIC;
		   alu_src     : OUT STD_LOGIC;
		   alu_op      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END ENTITY control_unit;

ARCHITECTURE dataflow OF control_unit IS
BEGIN
  WITH instruction SELECT
    reg_write <= '1' WHEN "00000", -- add
	              '1' WHEN "00001", -- addi
					  '1' WHEN "00010", -- sub
					  '1' WHEN "00011", -- subi
					  '1' WHEN "00100", -- and
					  '1' WHEN "00101", -- or
					  '0' WHEN OTHERS;
					  
  WITH instruction SELECT  
	 alu_src <= '1' WHEN "00001", -- addi
	            '1' WHEN "00011", -- subi
					'0' WHEN OTHERS;
					
  WITH instruction SELECT
	  alu_op <= "00" WHEN "00000", -- add
	            "00" WHEN "00001", -- addi
	            "01" WHEN "00010", -- sub
	            "01" WHEN "00011", -- subi
				   "10" WHEN "00100", -- and
	            "11" WHEN "00101", -- or
				   "00" WHEN OTHERS;
END dataflow;