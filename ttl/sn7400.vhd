-- Quadruple 2-Input Positive-NAND Gates
-- Pin numbers as wired by dip_74s00: each gate has its A and B inputs swapped with
-- respect to the datasheet naming (SDLS025D: 1A=1 1B=2 2A=4 2B=5 3A=10 3B=9 4A=13
-- 4B=12), which is equivalent for a NAND gate.

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity sn7400 is
  port (
    g1a   : in  std_logic; -- Pin 2 (1B)
    g1b   : in  std_logic; -- Pin 1 (1A)
    g1q_n : out std_logic; -- Pin 3 (1Y)

    g2a   : in  std_logic; -- Pin 5 (2B)
    g2b   : in  std_logic; -- Pin 4 (2A)
    g2q_n : out std_logic; -- Pin 6 (2Y)

    g3a   : in  std_logic; -- Pin 9 (3B)
    g3b   : in  std_logic; -- Pin 10 (3A)
    g3q_n : out std_logic; -- Pin 8 (3Y)

    g4a   : in  std_logic; -- Pin 12 (4B)
    g4b   : in  std_logic; -- Pin 13 (4A)
    g4q_n : out std_logic  -- Pin 11 (4Y)
    );
end entity;

architecture functional of sn7400 is
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

  g1q_n <= not (g1a_i and g1b_i);
  g2q_n <= not (g2a_i and g2b_i);
  g3q_n <= not (g3a_i and g3b_i);
  g4q_n <= not (g4a_i and g4b_i);

end architecture;
