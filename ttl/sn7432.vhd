-- SN7432: Quadruple 2-Input Positive-OR Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7432 is
  port (
    g1a : in  std_logic; -- pin 1
    g1b : in  std_logic; -- pin 2
    g1y : out std_logic; -- pin 3

    g2a : in  std_logic; -- pin 4
    g2b : in  std_logic; -- pin 5
    g2y : out std_logic; -- pin 6

    g3a : in  std_logic; -- pin 9
    g3b : in  std_logic; -- pin 10
    g3y : out std_logic; -- pin 8

    g4a : in  std_logic; -- pin 12
    g4b : in  std_logic; -- pin 13
    g4y : out std_logic  -- pin 11
    );
end;

architecture ttl of sn7432 is
begin

  g1y <= g1a or g1b;
  g2y <= g2a or g2b;
  g3y <= g3a or g3b;
  g4y <= g4a or g4b;

end;
