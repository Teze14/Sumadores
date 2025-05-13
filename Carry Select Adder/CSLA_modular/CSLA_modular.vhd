library ieee;
use ieee.std_logic_1164.all;

entity CSLA_variable is
  port (
    A, B : in std_logic_vector(15 downto 0);
    Ci   : in std_logic;
    S    : out std_logic_vector(15 downto 0);
    Co   : out std_logic
  );
end entity;

architecture RTL of CSLA_variable is

  component CSLA_block
    generic (N : integer := 4);
    port (
      A, B : in std_logic_vector(N-1 downto 0);
      Ci   : in std_logic;
      S    : out std_logic_vector(N-1 downto 0);
      Co   : out std_logic
    );
  end component;

  signal c : std_logic_vector(4 downto 0);

begin

  c(0) <= Ci;

  -- Bloque 0
  B0: CSLA_block generic map(N => 4)
    port map(
      A => A(3 downto 0),
      B => B(3 downto 0),
      Ci => c(0),
      S => S(3 downto 0),
      Co => c(1)
    );

  -- Bloque 1
  B1: CSLA_block generic map(N => 4)
    port map(
      A => A(7 downto 4),
      B => B(7 downto 4),
      Ci => c(1),
      S => S(7 downto 4),
      Co => c(2)
    );

  -- Bloque 2
  B2: CSLA_block generic map(N => 4)
    port map(
      A => A(11 downto 8),
      B => B(11 downto 8),
      Ci => c(2),
      S => S(11 downto 8),
      Co => c(3)
    );

  -- Bloque 3
  B3: CSLA_block generic map(N => 4)
    port map(
      A => A(15 downto 12),
      B => B(15 downto 12),
      Ci => c(3),
      S => S(15 downto 12),
      Co => c(4)
    );

  Co <= c(4);

end architecture;
