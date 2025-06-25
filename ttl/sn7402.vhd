-- Quadruple 2-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn7402 is
  port (
    g1q_n : out std_logic; -- Pin 1
    g1a   : in  std_logic; -- Pin 2
    g1b   : in  std_logic; -- Pin 3

    g2q_n : out std_logic; -- Pin 4
    g2a   : in  std_logic; -- Pin 5
    g2b   : in  std_logic; -- Pin 6

    g3a   : in  std_logic; -- Pin 8
    g3b   : in  std_logic; -- Pin 9
    g3q_n : out std_logic; -- Pin 10

    g4a   : in  std_logic; -- Pin 11
    g4b   : in  std_logic; -- Pin 12
    g4q_n : out std_logic  -- Pin 13
    );
end;

architecture ttl of sn7402 is
  signal g1a_i, g1b_i, g2a_i, g2b_i, g3a_i, g3b_i, g4a_i, g4b_i : std_logic;
begin

  g1a_i <= 'H';
  g1b_i <= 'H';
  g2a_i <= 'H';
  g2b_i <= 'H';
  g3a_i <= 'H';
  g3b_i <= 'H';
  g4a_i <= 'H';
  g4b_i <= 'H';

  g1a_i <= g1a;
  g1b_i <= g1b;
  g2a_i <= g2a;
  g2b_i <= g2b;
  g3a_i <= g3a;
  g3b_i <= g3b;
  g4a_i <= g4a;
  g4b_i <= g4b;

  g1q_n <= not (g1a_i or g1b_i);
  g2q_n <= not (g2a_i or g2b_i);
  g3q_n <= not (g3a_i or g3b_i);
  g4q_n <= not (g4a_i or g4b_i);

end;
