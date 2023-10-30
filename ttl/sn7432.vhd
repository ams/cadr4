-- Quadruple 2-Input Positive-OR Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7432 is
  port (
    g1a, g1b : in  std_logic;
    g1y      : out std_logic;

    g2a, g2b : in  std_logic;
    g2y      : out std_logic;

    g3a, g3b : in  std_logic;
    g3y      : out std_logic;

    g4a, g4b : in  std_logic;
    g4y      : out std_logic
    );
end sn7432;

architecture ttl of sn7432 is
begin

  g1y <= g1a or g1b;
  g2y <= g2a or g2b;
  g3y <= g3a or g3b;
  g4y <= g4a or g4b;

end ttl;

