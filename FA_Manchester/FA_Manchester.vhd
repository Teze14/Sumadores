-- Jesus Emiliano García Jiménez 
-- A01751766
-- Full Adder Manchester Carry Chain

library ieee;
use ieee.std_logic_1164.all;

entity FA_Manchester is 
	port( A, B, Ci: in std_logic; --definimos A, B como entradas "binarias"
		   S, Co:out std_logic);
end entity;

architecture RTL of FA_Manchester is
	
	signal P, G : std_logic;
	
	begin
		P  <= A xor B;
		G <= A and B;
		S <= P xor Ci;
		with P select
			Co <= G  when '0',
					Ci when '1';
end architecture;
