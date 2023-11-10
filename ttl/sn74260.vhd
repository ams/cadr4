-- Dual 5-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn74260 is
  port (
    g1a, g2a, g3a, g4a, g5a : in  std_logic;
    g1y_n                   : out std_logic
    );
end;

architecture ttl of sn74260 is
begin

  g1y_n <= g1a nor g2a nor g3a nor g4a nor g5a;

end;
