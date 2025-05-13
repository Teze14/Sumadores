-- Jesus Emiliano García Jiménez 
-- A01751766
-- Archivo Sumador Ripple Carry Adder
library ieee;
use ieee.std_logic_1164.all;

entity RCA is 
	generic (N :integer :=4);
	port( A, B : in std_logic_vector(N-1 downto 0);
			Ci   : in std_logic;
		   S    : out std_logic_vector(N-1 downto 0);
			Co   : out std_logic);
end entity;

architecture RTL of RCA is
	--declaramos componentes
	
	component FA is 
		port( A, B, Cin : in std_logic; 
		      S, Co: out std_logic);
	end component;
	
	-- declaramos las señales necesarias
	signal c: std_logic_vector(N downto 0);
	
	begin
			c(0) <= Ci;
			
			RCA : for i in 0 to N-1 generate
				inst: FA port map (A(i), B(i), c(i),  S(i), c(i+1));
			end generate;
			Co <= c(N);
			
--			--Instanciamos
--			I0: FA_Manchester port map(A(0), B(0), Ci,  S(0), c(1));
--			I1: FA_Manchester port map(A(1), B(1), c(1), S(1), c(2));
--			I2: FA_Manchester port map(A(2), B(2), c(2), S(2), c(3));
--			I3: FA_Manchester port map(A(3), B(3), c(3), S(3), c(4));
--			I4: FA_Manchester port map(A(4), B(4), c(4), S(4), c(5));
--			I5: FA_Manchester port map(A(5), B(5), c(5), S(5), c(6));
--			I6: FA_Manchester port map(A(6), B(6), c(6), S(6), c(7));
--			I7: FA_Manchester port map(A(7), B(7), c(7), S(7), Co);
end architecture;

