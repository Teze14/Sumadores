-- Jesus Emiliano García Jiménez 
-- A01751766
-- Archivo Sumador del Carry Skip Adder 16 bits

library ieee;
use ieee.std_logic_1164.all;

entity CSKA_variable is 
	port( A, B : in std_logic_vector(15 downto 0);
			Ci   : in std_logic;
		   S    : out std_logic_vector(15 downto 0);
			Co   : out std_logic);
end entity;

architecture RTL of CSKA_variable is
	--declaramos componentes
	
	component CSKA_Block is 
		generic (N :integer :=4);
		port( A, B : in std_logic_vector(N-1 downto 0);
				Ci   : in std_logic;
				S    : out std_logic_vector(N-1 downto 0);
				Co   : out std_logic;
				PG   : out std_logic);
	end component;
	
	-- declaramos las señales necesarias
	signal c: std_logic_vector(4 downto 0);
	signal PG: std_logic_vector(3 downto 0);
	signal c_skip0, c_skip1, c_skip2: std_logic;
	
	begin
			C(0) <= Ci;
			
			Block0: CSKA_Block generic map (N => 4) port map(A(3 downto 0), B(3 downto 0), c(0), S(3 downto 0), PG(0), c(1));
			
			c_skip0 <= c(0) when PG(0) = '1' else c(1);
			
			Block1: CSKA_Block generic map (N => 4) port map(A(7 downto 4), B(7 downto 4), c_skip0, S(7 downto 4), PG(1), c(2));
			
			c_skip1 <= c_skip0 when PG(1) = '1' else c(2);
			
			Block2: CSKA_Block generic map (N => 4) port map(A(11 downto 8), B(11 downto 8), c_skip1, S(11 downto 8), PG(2), c(3));
			
			c_skip2 <= c_skip1 when PG(2) = '1' else c(3);
			
			Block3: CSKA_Block generic map (N => 4) port map(A(15 downto 12), B(15 downto 12), c_skip2, S(15 downto 12), PG(3), c(4));
			
			Co <= c_skip2 when PG(3) = '1' else c(4);
		
	
end architecture;

