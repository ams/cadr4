-- Triple 3-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn7410 is
  port (
    g1a   : in  std_logic; -- Pin 1
    g1b   : in  std_logic; -- Pin 2
    g1c   : in  std_logic; -- Pin 13
    g1y_n : out std_logic; -- Pin 12

    g2a   : in  std_logic; -- Pin 3
    g2b   : in  std_logic; -- Pin 4
    g2c   : in  std_logic; -- Pin 5
    g2y_n : out std_logic; -- Pin 6

    g3a   : in  std_logic; -- Pin 9
    g3b   : in  std_logic; -- Pin 10
    g3c   : in  std_logic; -- Pin 11
    g3y_n : out std_logic  -- Pin 8
    );
end;

architecture ttl of sn7410 is
  signal g1a_i, g1b_i, g1c_i, g2a_i, g2b_i, g2c_i, g3a_i, g3b_i, g3c_i : std_logic;
begin

  g1a_i <= 'H';
  g1b_i <= 'H';
  g1c_i <= 'H';
  g2a_i <= 'H';
  g2b_i <= 'H';
  g2c_i <= 'H';
  g3a_i <= 'H';
  g3b_i <= 'H';
  g3c_i <= 'H';

  g1a_i <= g1a;
  g1b_i <= g1b;
  g1c_i <= g1c;
  g2a_i <= g2a;
  g2b_i <= g2b;
  g2c_i <= g2c;
  g3a_i <= g3a;
  g3b_i <= g3b;
  g3c_i <= g3c;

  g1y_n <= not (g1a_i and g1b_i and g1c_i);
  g2y_n <= not (g2a_i and g2b_i and g2c_i);
  g3y_n <= not (g3a_i and g3b_i and g3c_i);

end;
