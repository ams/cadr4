-- Datasheet: https://www.ti.com/lit/gpn/sn7402 (PDIP (N) Package)

-- Quadruple 2-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7402 is
  port (
    g1q_n : out std_logic; -- Pin 1
    g1a   : in  std_logic := 'H'; -- Pin 2
    g1b   : in  std_logic := 'H'; -- Pin 3

    g2q_n : out std_logic; -- Pin 4
    g2a   : in  std_logic := 'H'; -- Pin 5
    g2b   : in  std_logic := 'H'; -- Pin 6

    g3a   : in  std_logic := 'H'; -- Pin 8
    g3b   : in  std_logic := 'H'; -- Pin 9
    g3q_n : out std_logic; -- Pin 10

    g4a   : in  std_logic := 'H'; -- Pin 11
    g4b   : in  std_logic := 'H'; -- Pin 12
    g4q_n : out std_logic  -- Pin 13
    );
end;

architecture ttl of sn7402 is
begin

  g1q_n <= g1a nor g1b;
  g2q_n <= g2a nor g2b;
  g3q_n <= g3a nor g3b;
  g4q_n <= g4a nor g4b;

end;
