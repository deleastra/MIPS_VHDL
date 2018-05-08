LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_unit IS
  PORT ( instruction : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
         reg_write   : OUT STD_LOGIC;
		   alu_src     : OUT STD_LOGIC;
			reg_dst     : OUT STD_LOGIC;
			jump_sel    : OUT STD_LOGIC;
		   alu_op      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END ENTITY control_unit;

ARCHITECTURE dataflow OF control_unit IS
BEGIN
  WITH instruction SELECT
    reg_write <= '1' WHEN "000000", -- add
	              '1' WHEN "000001", -- addi
					  '1' WHEN "000010", -- sub
					  '1' WHEN "000011", -- subi
					  '1' WHEN "000100", -- and
					  '1' WHEN "000101", -- or
					  '0' WHEN OTHERS;
					  
  WITH instruction SELECT  
	 alu_src <= '1' WHEN "000001", -- addi
	            '1' WHEN "000011", -- subi
					'0' WHEN OTHERS;

  WITH instruction SELECT  
	 reg_dst <= '0' WHEN "000001", -- addi
	            '0' WHEN "000011", -- subi
					'1' WHEN OTHERS;
			
  WITH instruction SELECT
	  alu_op <= "00" WHEN "000000", -- add
	            "00" WHEN "000001", -- addi
	            "01" WHEN "000010", -- sub
	            "01" WHEN "000011", -- subi
				   "10" WHEN "000100", -- and
	            "11" WHEN "000101", -- or
				   "00" WHEN OTHERS;
					
  WITH instruction SELECT
    jump_sel <= '1' WHEN "001000", -- j
	             '0' WHEN OTHERS;
					  
END dataflow;