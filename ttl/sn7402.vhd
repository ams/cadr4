-- Quadruple 2-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7402 is
  port (
    g1q_n : out std_logic; -- Pin 1
    g1a   : in  std_logic; -- Pin 2
    g1b   : in  std_logic; -- Pin 3

    g2q_n : out std_logic; -- Pin 4
    g2a   : in  std_logic; -- Pin 5
    g2b   : in  std_logic; -- Pin 6

    g3b   : in  std_logic; -- Pin 8
    g3a   : in  std_logic; -- Pin 9
    g3q_n : out std_logic; -- Pin 10

    g4b   : in  std_logic; -- Pin 11
    g4a   : in  std_logic; -- Pin 12
    g4q_n : out std_logic  -- Pin 13
    );
end;

architecture ttl of sn7402 is
begin

  g1q_n <= not (g1a or g1b);
  g2q_n <= not (g2a or g2b);
  g3q_n <= not (g3a or g3b);
  g4q_n <= not (g4a or g4b);

end;
