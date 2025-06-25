-- Dual 4-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn7420 is
  port (
    g1a   : in  std_logic; -- Pin 1
    g1b   : in  std_logic; -- Pin 2
    g1c   : in  std_logic; -- Pin 4
    g1d   : in  std_logic; -- Pin 5
    g1y_n : out std_logic; -- Pin 6

    g2a   : in  std_logic; -- Pin 9
    g2b   : in  std_logic; -- Pin 10
    g2c   : in  std_logic; -- Pin 12
    g2d   : in  std_logic; -- Pin 13
    g2y_n : out std_logic  -- Pin 8
    );
end;

architecture ttl of sn7420 is
  signal g1a_i, g1b_i, g1c_i, g1d_i, g2a_i, g2b_i, g2c_i, g2d_i : std_logic;
begin

  g1a_i <= 'H';
  g1b_i <= 'H';
  g1c_i <= 'H';
  g1d_i <= 'H';
  g2a_i <= 'H';
  g2b_i <= 'H';
  g2c_i <= 'H';
  g2d_i <= 'H';

  g1a_i <= g1a;
  g1b_i <= g1b;
  g1c_i <= g1c;
  g1d_i <= g1d;
  g2a_i <= g2a;
  g2b_i <= g2b;
  g2c_i <= g2c;
  g2d_i <= g2d;

  g1y_n <= not (g1a_i and g1b_i and g1c_i and g1d_i);
  g2y_n <= not (g2a_i and g2b_i and g2c_i and g2d_i);

end;
