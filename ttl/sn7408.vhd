-- Datasheet: https://www.ti.com/lit/gpn/SN74LS08 (PDIP (N) Package)
-- SN7408: Quadruple 2-Input Positive-AND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7408 is
  port (
    g1a : in  std_logic; -- Pin 1
    g1b : in  std_logic; -- Pin 2
    g1q : out std_logic; -- Pin 3

    g2a : in  std_logic; -- Pin 4
    g2b : in  std_logic; -- Pin 5
    g2q : out std_logic; -- Pin 6

    g3a : in  std_logic; -- Pin 9
    g3b : in  std_logic; -- Pin 10
    g3q : out std_logic; -- Pin 8

    g4a : in  std_logic; -- Pin 12
    g4b : in  std_logic; -- Pin 13
    g4q : out std_logic  -- Pin 11
    );
end;

architecture ttl of sn7408 is
begin

  g1q <= g1a and g1b;
  g2q <= g2a and g2b;
  g3q <= g3a and g3b;
  g4q <= g4a and g4b;

end;
