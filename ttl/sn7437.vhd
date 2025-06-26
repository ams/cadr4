-- Quadruple 2-Input Positive-NAND Buffers

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn7437 is
  port (
    g1a   : in  std_logic; -- Pin 1
    g1b   : in  std_logic; -- Pin 2
    g1y   : out std_logic; -- Pin 3

    g2a   : in  std_logic; -- Pin 4
    g2b   : in  std_logic; -- Pin 5
    g2y   : out std_logic; -- Pin 6

    g3a   : in  std_logic; -- Pin 9
    g3b   : in  std_logic; -- Pin 10
    g3y   : out std_logic; -- Pin 8

    g4a   : in  std_logic; -- Pin 12
    g4b   : in  std_logic; -- Pin 13
    g4y   : out std_logic  -- Pin 11
    );
end;

architecture ttl of sn7437 is
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

  g1y <= not (g1a_i and g1b_i);
  g2y <= not (g2a_i and g2b_i);
  g3y <= not (g3a_i and g3b_i);
  g4y <= not (g4a_i and g4b_i);

end;
