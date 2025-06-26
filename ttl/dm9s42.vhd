-- Dual 4-2 Input AND-OR gates
-- Fairchild 9S42
-- doc/ttl/dm9s42.pdf

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity dm9s42 is
  port (
    g1a1 : in  std_logic; -- Pin 1
    g1b1 : in  std_logic; -- Pin 2
    g2a1 : in  std_logic; -- Pin 3
    g2b1 : in  std_logic; -- Pin 4
    g2c1 : in  std_logic; -- Pin 5
    g2d1 : in  std_logic; -- Pin 6
    out1 : out std_logic; -- Pin 8
    g1a2 : in  std_logic; -- Pin 9
    g1b2 : in  std_logic; -- Pin 10
    g2a2 : in  std_logic; -- Pin 11
    g2b2 : in  std_logic; -- Pin 12
    g2c2 : in  std_logic; -- Pin 13
    g2d2 : in  std_logic; -- Pin 14
    out2 : out std_logic  -- Pin 15
    );
end entity;

architecture ttl of dm9s42 is
  signal g1a1_i, g1b1_i, g2a1_i, g2b1_i, g2c1_i, g2d1_i, g1a2_i, g1b2_i, g2a2_i, g2b2_i, g2c2_i, g2d2_i : std_logic;
begin

  g1a1_i <= ttl_input(g1a1);
  g1b1_i <= ttl_input(g1b1);
  g2a1_i <= ttl_input(g2a1);
  g2b1_i <= ttl_input(g2b1);
  g2c1_i <= ttl_input(g2c1);
  g2d1_i <= ttl_input(g2d1);
  g1a2_i <= ttl_input(g1a2);
  g1b2_i <= ttl_input(g1b2);
  g2a2_i <= ttl_input(g2a2);
  g2b2_i <= ttl_input(g2b2);
  g2c2_i <= ttl_input(g2c2);
  g2d2_i <= ttl_input(g2d2);

  -- Gate 1: (g1a1 AND g1b1) OR (g2a1 AND g2b1 AND g2c1 AND g2d1)
  out1 <= (g1a1_i and g1b1_i) or (g2a1_i and g2b1_i and g2c1_i and g2d1_i);

  -- Gate 2: (g1a2 AND g1b2) OR (g2a2 AND g2b2 AND g2c2 AND g2d2)
  out2 <= (g1a2_i and g1b2_i) or (g2a2_i and g2b2_i and g2c2_i and g2d2_i);

end architecture;
