-- Quadruple 2-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn7400 is
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

architecture ttl of sn7400 is
begin

  g1q_n <= not (g1a and g1b);
  g2q_n <= not (g2a and g2b);
  g3q_n <= not (g3a and g3b);
  g4q_n <= not (g4a and g4b);

end;
