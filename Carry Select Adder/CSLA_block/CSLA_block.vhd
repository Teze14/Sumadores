-- Jesus Emiliano García Jiménez 
-- A01751766
-- Carry Select Adder Blque

library ieee;
use ieee.std_logic_1164.all;

entity CSLA_block is 
	generic (N :integer :=8);
	port( A, B : in std_logic_vector(N-1 downto 0);
			Ci   : in std_logic;
		   S    : out std_logic_vector(N-1 downto 0);
			Co   : out std_logic);
end entity;

architecture RTL of CSLA_block is
	--declaramos componentes
	
	component RCA is 
		generic (N :integer :=4);
		port( A, B : in std_logic_vector(N-1 downto 0);
				Ci   : in std_logic;
				S    : out std_logic_vector(N-1 downto 0);
				Co   : out std_logic);
	end component;
	
	signal S_c0, S_c1 : std_logic_vector (N-1 downto 0);
	signal C_c0, C_c1 : std_logic;
	
	begin
			RCA_c0 : RCA generic map(N) port map (A, B, '0', S_c0, C_c0);
			RCA_c1 : RCA generic map(N) port map (A, B, '1', S_c1, C_c1);

			
			with Ci select
				Co <= C_c1 when '1',
					   C_c0 when '0';
			
			
			with Ci select
				S <= S_c1 when '1',
					  S_c0 when '0';
			
end architecture;

