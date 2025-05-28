-- SN7408: Quadruple 2-Input Positive-AND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7408 is
  port (
    g1a : in  std_logic; -- pin 2
    g1b : in  std_logic; -- pin 1
    g1q : out std_logic; -- pin 3

    g2a : in  std_logic; -- pin 5
    g2b : in  std_logic; -- pin 4
    g2q : out std_logic; -- pin 6

    g3a : in  std_logic; -- pin 9
    g3b : in  std_logic; -- pin 10
    g3q : out std_logic; -- pin 8

    g4a : in  std_logic; -- pin 12
    g4b : in  std_logic; -- pin 13
    g4q : out std_logic  -- pin 11
    );
end;

architecture ttl of sn7408 is
begin

  g1q <= g1a and g1b;
  g2q <= g2a and g2b;
  g3q <= g3a and g3b;
  g4q <= g4a and g4b;

end;
