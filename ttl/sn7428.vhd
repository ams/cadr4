-- Quadruple 2-input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

-- Datasheet: Texas Instruments SN5428 Quadruple 2-Input Positive-NOR Buffers, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN5428

library ieee;
use ieee.std_logic_1164.all;

entity sn7428 is
  port (
    g1a   : in  std_logic := 'H'; -- Pin 1
    g1b   : in  std_logic := 'H'; -- Pin 2
    g1q_n : out std_logic; -- Pin 3

    g2a   : in  std_logic := 'H'; -- Pin 4
    g2b   : in  std_logic := 'H'; -- Pin 5
    g2q_n : out std_logic; -- Pin 6

    g3a   : in  std_logic := 'H'; -- Pin 9
    g3b   : in  std_logic := 'H'; -- Pin 10
    g3q_n : out std_logic; -- Pin 8

    g4a   : in  std_logic := 'H'; -- Pin 12
    g4b   : in  std_logic := 'H'; -- Pin 13
    g4q_n : out std_logic  -- Pin 11
    );
end;

architecture ttl of sn7428 is
begin

  g1q_n <= g1a nor g1b;
  g2q_n <= g2a nor g2b;
  g3q_n <= g3a nor g3b;
  g4q_n <= g4a nor g4b;

end;
