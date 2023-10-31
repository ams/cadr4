-- Hex Schmitt-Trigger Inverters

library ieee;
use ieee.std_logic_1164.all;

entity sn7414 is
  port (
    g1a, g2a, g3a, g4a, g5a, g6a             : in  std_logic;
    g1q_n, g2q_n, g3q_n, g4q_n, g5q_n, g6q_n : out std_logic
    );
end sn7414;

architecture ttl of sn7414 is
begin

  g1q_n <= not g1a;
  g2q_n <= not g2a;
  g3q_n <= not g3a;
  g4q_n <= not g4a;
  g5q_n <= not g5a;
  g6q_n <= not g6a;

end ttl;
