-- Quadruple 2-input Exclusive-OR Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn7486 is
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
end sn7486;

architecture ttl of sn7486 is
begin

  g1y <= g1a xor g1b;
  g2y <= g2a xor g2b;
  g3y <= g3a xor g3b;
  g4y <= g4a xor g4b;

end ttl;
