-- SN74260: Dual 5-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn74260 is
  port (
    g1a : in  std_logic; -- pin 1
    g2a : in  std_logic; -- pin 2
    g3a : in  std_logic; -- pin 3
    g4a : in  std_logic; -- pin 12
    g5a : in  std_logic; -- pin 13
    g1y_n : out std_logic; -- pin 5

    g1b : in  std_logic; -- pin 6
    g2b : in  std_logic; -- pin 7
    g3b : in  std_logic; -- pin 8
    g4b : in  std_logic; -- pin 9
    g5b : in  std_logic; -- pin 10
    g2y_n : out std_logic  -- pin 4
    );
end;

architecture ttl of sn74260 is
begin

  g1y_n <= not (g1a or g2a or g3a or g4a or g5a);
  g2y_n <= not (g1b or g2b or g3b or g4b or g5b);

end;
