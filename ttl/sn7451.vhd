-- Dual 2-Wide 2-Input AND-OR-INVERT Gates

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn7451 is
  port (
    g1a   : in  std_logic; -- Pin 2
    g1b   : in  std_logic; -- Pin 3
    g1c   : in  std_logic; -- Pin 4
    g1d   : in  std_logic; -- Pin 5
    g1y   : out std_logic; -- Pin 6

    g2a   : in  std_logic; -- Pin 9
    g2b   : in  std_logic; -- Pin 10
    g2c   : in  std_logic; -- Pin 13
    g2d   : in  std_logic; -- Pin 1
    g2y   : out std_logic  -- Pin 8
    );
end;

architecture ttl of sn7451 is
  signal g1a_i, g1b_i, g1c_i, g1d_i, g2a_i, g2b_i, g2c_i, g2d_i : std_logic;
begin

  g1a_i <= ttl_input(g1a);
  g1b_i <= ttl_input(g1b);
  g1c_i <= ttl_input(g1c);
  g1d_i <= ttl_input(g1d);
  g2a_i <= ttl_input(g2a);
  g2b_i <= ttl_input(g2b);
  g2c_i <= ttl_input(g2c);
  g2d_i <= ttl_input(g2d);

  -- Gate 1: (g1a AND g1b) OR (g1c AND g1d) then invert
  g1y <= not ((g1a_i and g1b_i) or (g1c_i and g1d_i));

  -- Gate 2: (g2a AND g2b) OR (g2c AND g2d) then invert
  g2y <= not ((g2a_i and g2b_i) or (g2c_i and g2d_i));

end;
