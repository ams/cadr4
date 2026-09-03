-- Hex Inverters

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn7404 is
  port (
    g1a   : in  std_logic; -- Pin 1 (1A)
    g1q_n : out std_logic; -- Pin 2 (1Y)

    g2a   : in  std_logic; -- Pin 3 (2A)
    g2q_n : out std_logic; -- Pin 4 (2Y)

    g3a   : in  std_logic; -- Pin 5 (3A)
    g3q_n : out std_logic; -- Pin 6 (3Y)

    g4a   : in  std_logic; -- Pin 9 (4A)
    g4q_n : out std_logic; -- Pin 8 (4Y)

    g5a   : in  std_logic; -- Pin 11 (5A)
    g5q_n : out std_logic; -- Pin 10 (5Y)

    g6a   : in  std_logic; -- Pin 13 (6A)
    g6q_n : out std_logic  -- Pin 12 (6Y)
    );
end entity;

architecture functional of sn7404 is
  signal g1a_i, g2a_i, g3a_i, g4a_i, g5a_i, g6a_i : std_logic;
begin

  g1a_i <= ttl_input(g1a);
  g2a_i <= ttl_input(g2a);
  g3a_i <= ttl_input(g3a);
  g4a_i <= ttl_input(g4a);
  g5a_i <= ttl_input(g5a);
  g6a_i <= ttl_input(g6a);

  g1q_n <= not g1a_i;
  g2q_n <= not g2a_i;
  g3q_n <= not g3a_i;
  g4q_n <= not g4a_i;
  g5q_n <= not g5a_i;
  g6q_n <= not g6a_i;

end architecture;
