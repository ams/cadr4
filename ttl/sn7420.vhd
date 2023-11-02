-- Dual 4-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7420 is
  port (
    g1a, g1b, g1c, g1d : in  std_logic;
    g1y_n              : out std_logic;

    g2a, g2b, g2c, g2d : in  std_logic;
    g2y_n              : out std_logic
    );
end;

architecture ttl of sn7420 is
begin

  g1y_n <= not (g1a and g1b and g1c and g1d);
  g2y_n <= not (g2a and g2b and g2c and g2d);

end;
