-- Quadruple 2-Input Positive-AND Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7408 is
  port (
    g1a, g1b : in  std_logic;
    g1q      : out std_logic;

    g2a, g2b : in  std_logic;
    g2q      : out std_logic;

    g3a, g3b : in  std_logic;
    g3q      : out std_logic;

    g4a, g4b : in  std_logic;
    g4q      : out std_logic
    );
end sn7408;

architecture ttl of sn7408 is
begin

  g1q <= g1a or g1b;
  g2q <= g2a or g2b;
  g3q <= g3a or g3b;
  g4q <= g4a or g4b;

end ttl;
