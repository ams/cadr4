-- Quadruple 2-input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity sn7428 is
  port (
    g1a   : in  std_logic;  -- Pin 2 (1A)
    g1b   : in  std_logic;  -- Pin 3 (1B)
    g1q_n : out std_logic;  -- Pin 1 (1Y)

    g2a   : in  std_logic;  -- Pin 5 (2A)
    g2b   : in  std_logic;  -- Pin 6 (2B)
    g2q_n : out std_logic;  -- Pin 4 (2Y)

    g3a   : in  std_logic;  -- Pin 8 (3A)
    g3b   : in  std_logic;  -- Pin 9 (3B)
    g3q_n : out std_logic;  -- Pin 10 (3Y)

    g4a   : in  std_logic;  -- Pin 11 (4A)
    g4b   : in  std_logic;  -- Pin 12 (4B)
    g4q_n : out std_logic   -- Pin 13 (4Y)
    );
end entity;

architecture functional of sn7428 is
  signal g1a_i, g1b_i, g2a_i, g2b_i, g3a_i, g3b_i, g4a_i, g4b_i : std_logic;
begin

  g1a_i <= ttl_input(g1a);
  g1b_i <= ttl_input(g1b);
  g2a_i <= ttl_input(g2a);
  g2b_i <= ttl_input(g2b);
  g3a_i <= ttl_input(g3a);
  g3b_i <= ttl_input(g3b);
  g4a_i <= ttl_input(g4a);
  g4b_i <= ttl_input(g4b);

  g1q_n <= g1a_i nor g1b_i;
  g2q_n <= g2a_i nor g2b_i;
  g3q_n <= g3a_i nor g3b_i;
  g4q_n <= g4a_i nor g4b_i;

end architecture;
