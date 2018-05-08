LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_unit IS
  PORT ( instruction : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
         reg_write   : OUT STD_LOGIC;
		   alu_src     : OUT STD_LOGIC;
			reg_dst     : OUT STD_LOGIC;
			jump_sel    : OUT STD_LOGIC;
			branch_ctl  : OUT STD_LOGIC;
		   alu_op      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
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
					  '1' WHEN "001000", -- slt
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
	  alu_op <= "000" WHEN "000000", -- add
	            "000" WHEN "000001", -- addi
	            "001" WHEN "000010", -- sub
	            "001" WHEN "000011", -- subi
				   "010" WHEN "000100", -- and
	            "011" WHEN "000101", -- or
					"100" WHEN "001000", -- slt 
					"101" WHEN "001001", -- beq
					"110" WHEN "001010", -- bne
				   "000" WHEN OTHERS;
					
  WITH instruction SELECT
    jump_sel <= '1' WHEN "010000", -- j
	             '0' WHEN OTHERS;
  
  WITH instruction SELECT
     branch_ctl <= '1' WHEN "001001", -- beq
					    '1' WHEN "001010", -- bne
				       '0' WHEN OTHERS;
END dataflow;