-- Quadruple 2-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn7400 is
  port (
    g1a   : in  std_logic;
    g1b   : in  std_logic;
    g1q_n : out std_logic;

    g2a   : in  std_logic;
    g2b   : in  std_logic;
    g2q_n : out std_logic;

    g3a   : in  std_logic;
    g3b   : in  std_logic;
    g3q_n : out std_logic;

    g4a   : in  std_logic;
    g4b   : in  std_logic;
    g4q_n : out std_logic
    );
end;

architecture ttl of sn7400 is
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

  g1q_n <= not (g1a_i and g1b_i);
  g2q_n <= not (g2a_i and g2b_i);
  g3q_n <= not (g3a_i and g3b_i);
  g4q_n <= not (g4a_i and g4b_i);

end;
