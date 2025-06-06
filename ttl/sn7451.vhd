-- SN7451: Dual 2-Wide 2-Input AND-OR-INVERT Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7451 is
  port (
    g1a : in  std_logic;
    g1b : in  std_logic;
    g1c : in  std_logic;
    g1d : in  std_logic;
    g1y : out std_logic;

    g2a : in  std_logic;
    g2b : in  std_logic;
    g2c : in  std_logic;
    g2d : in  std_logic;
    g2y : out std_logic
    );
end;

architecture ttl of sn7451 is
begin

  g1y <= not ((g1a and g1b) or (g1c and g1d));
  g2y <= not ((g2a and g2b) or (g2c and g2d));

end;
