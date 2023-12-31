-- Quadruple 2-input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn7428 is
  port (
    g1a, g1b : in  std_logic;
    g1q_n    : out std_logic;

    g2a, g2b : in  std_logic;
    g2q_n    : out std_logic;

    g3a, g3b : in  std_logic;
    g3q_n    : out std_logic;

    g4a, g4b : in  std_logic;
    g4q_n    : out std_logic
    );
end;

architecture ttl of sn7428 is
begin

  g1q_n <= g1a nor g1b;
  g2q_n <= g2a nor g2b;
  g3q_n <= g3a nor g3b;
  g4q_n <= g4a nor g4b;

end;
