-- SN7451: Dual 2-Wide 2-Input AND-OR-INVERT Gates
-- Datasheet: Texas Instruments SN74LS51 Dual 2-Wide 2-Input AND-OR-INVERT Gates, PDIP Package
-- URL: https://www.ti.com/lit/ds/symlink/sn74ls51.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7451 is
  port (
    g1a : in  std_logic; -- pin 1
    g1b : in  std_logic; -- pin 2
    g1c : in  std_logic; -- pin 9
    g1d : in  std_logic; -- pin 8
    g1y : out std_logic; -- pin 6

    g2a : in  std_logic; -- pin 10
    g2b : in  std_logic; -- pin 11
    g2c : in  std_logic; -- pin 3
    g2d : in  std_logic; -- pin 4
    g2y : out std_logic  -- pin 5
    );
end;

architecture ttl of sn7451 is
begin

  g1y <= not ((g1a and g1b) or (g1c and g1d));
  g2y <= not ((g2a and g2b) or (g2c and g2d));

end;
