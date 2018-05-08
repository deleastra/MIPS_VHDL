LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY instructions_memory IS
  PORT ( instruction_addr  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
         instruction       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY instructions_memory;

ARCHITECTURE dataflow OF instructions_memory IS
    TYPE mem_array IS ARRAY(0 TO 31) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL instruction_mem : mem_array := (
	 "00000100001000010000001111101000", -- 0 -- addi $1, $1, 1000
	 "00000100010000100000011111010000", -- addi $2, $2, 2000
	 "00000000001000100001100000000000", -- add $3, $1, $2
	 "10000000011000000000000000000000", -- just read $3
	 "00000000000000000000000000011011",
	 "00000000000000000000000000011010",
	 "00000000000000000000000000011001",
	 "00000000000000000000000000011000",
	 "00000000000000000000000000010111",
	 "00000000000000000000000000010110",
	 "00000000000000000000000000010101", -- 10
	 "00000000000000000000000000010100",
	 "00000000000000000000000000010011",
	 "00000000000000000000000000010010",
	 "00000000000000000000000000010001",
	 "00000000000000000000000000010000",
	 "00000000000000000000000000001111",
	 "00000000000000000000000000001110",
	 "00000000000000000000000000001101",
	 "00000000000000000000000000001100",
	 "00000000000000000000000000001011", -- 20
	 "00000000000000000000000000001010",
	 "00000000000000000000000000001001",
	 "00000000000000000000000000001000",
	 "00000000000000000000000000000111",
	 "00000000000000000000000000000110",
	 "00000000000000000000000000000101",
	 "00000000000000000000000000000100",
	 "00000000000000000000000000000011",  
	 "00000000000000000000000000000010",  
	 "00000000000000000000000000000001",  
	 "00000000000000000000000000000000"); 
BEGIN
    instruction <= instruction_mem(TO_INTEGER(UNSIGNED(instruction_addr)));
END dataflow;