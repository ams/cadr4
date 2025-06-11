-- Triple 3-Input Positive-AND Gates
-- Datasheet: https://www.ti.com/lit/gpn/SN74LS11 (PDIP (N) Package)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7411 is
  port (
    g1a : in  std_logic;
    g1b : in  std_logic;
    g1c : in  std_logic;
    g1y : out std_logic;

    g2a : in  std_logic;
    g2b : in  std_logic;
    g2c : in  std_logic;
    g2y : out std_logic;

    g3a : in  std_logic;
    g3b : in  std_logic;
    g3c : in  std_logic;
    g3y : out std_logic
    );
end;

architecture ttl of sn7411 is
begin

  g1y <= g1a and g1b and g1c;
  g2y <= g2a and g2b and g2c;
  g3y <= g3a and g3b and g3c;

end;
