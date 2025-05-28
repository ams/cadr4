-- Quadruple 2-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn7400 is
  port (
    g1a   : in  std_logic; -- Pin 2
    g1b   : in  std_logic; -- Pin 1
    g1q_n : out std_logic; -- Pin 3

    g2a   : in  std_logic; -- Pin 5
    g2b   : in  std_logic; -- Pin 4
    g2q_n : out std_logic; -- Pin 6

    g3a   : in  std_logic; -- Pin 10
    g3b   : in  std_logic; -- Pin 9
    g3q_n : out std_logic; -- Pin 8

    g4a   : in  std_logic; -- Pin 12
    g4b   : in  std_logic; -- Pin 13
    g4q_n : out std_logic  -- Pin 11
    );
end;

architecture ttl of sn7400 is
begin

  g1q_n <= not (g1a and g1b);
  g2q_n <= not (g2a and g2b);
  g3q_n <= not (g3a and g3b);
  g4q_n <= not (g4a and g4b);

end;
