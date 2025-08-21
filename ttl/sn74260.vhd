-- Dual 5-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74260 is
  port (
    g1a   : in  std_logic; -- Pin 2
    g1b   : in  std_logic; -- Pin 3
    g1c   : in  std_logic; -- Pin 4
    g1d   : in  std_logic; -- Pin 5
    g1e   : in  std_logic; -- Pin 6
    g1y_n : out std_logic; -- Pin 1

    g2a   : in  std_logic; -- Pin 8
    g2b   : in  std_logic; -- Pin 9
    g2c   : in  std_logic; -- Pin 10
    g2d   : in  std_logic; -- Pin 11
    g2e   : in  std_logic; -- Pin 12
    g2y_n : out std_logic  -- Pin 13
    );
end entity;

architecture functional of sn74260 is
  signal g1a_i, g1b_i, g1c_i, g1d_i, g1e_i, g2a_i, g2b_i, g2c_i, g2d_i, g2e_i : std_logic;
begin

  g1a_i <= ttl_input(g1a);
  g1b_i <= ttl_input(g1b);
  g1c_i <= ttl_input(g1c);
  g1d_i <= ttl_input(g1d);
  g1e_i <= ttl_input(g1e);
  g2a_i <= ttl_input(g2a);
  g2b_i <= ttl_input(g2b);
  g2c_i <= ttl_input(g2c);
  g2d_i <= ttl_input(g2d);
  g2e_i <= ttl_input(g2e);

  g1y_n <= not (g1a_i or g1b_i or g1c_i or g1d_i or g1e_i);
  g2y_n <= not (g2a_i or g2b_i or g2c_i or g2d_i or g2e_i);

end architecture;
