-- Triple 3-Input Positive-AND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7411 is
  port (
    g1a, g1b, g1c : in  std_logic;
    g1y           : out std_logic;
    g2a, g2b, g2c : in  std_logic;
    g2y           : out std_logic;
    g3a, g3b, g3c : in  std_logic;
    g3y           : out std_logic
    );
end sn7411;

architecture ttl of sn7411 is
begin

  g1y <= g1a and g1b and g1c;
  g2y <= g2a and g2b and g2c;
  g3y <= g3a and g3b and g3c;

end ttl;

