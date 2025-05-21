-- Dual 5-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn74260 is
  port (
    g1a, g1b, g1c, g1d, g1e : in  std_logic;
    g1y_n                   : out std_logic;

    g2a, g2b, g2c, g2d, g2e : in  std_logic;
    g2y_n                   : out std_logic
    );
end;

architecture ttl of sn74260 is
begin

  g1y_n <= not (g1a or g1b or g1c or g1d or g1e);
  g2y_n <= not (g2a or g2b or g2c or g2d or g2e);

end;
