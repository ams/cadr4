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

  g1y_n <= not (g1a or g2a or g3a or g4a or g5a);

end;
