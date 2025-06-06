-- Quadruple 2-input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

-- Datasheet: Texas Instruments SN5428 Quadruple 2-Input Positive-NOR Buffers, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN5428

entity sn7428 is
  port (
    g1q_n : out std_logic;
    g1a   : in  std_logic;
    g1b   : in  std_logic;

    g2q_n : out std_logic;
    g2a   : in  std_logic;
    g2b   : in  std_logic;

    g3a   : in  std_logic; -- Pin 8
    g3b   : in  std_logic; -- Pin 9
    g3q_n : out std_logic; -- Pin 10

    g4a   : in  std_logic;
    g4b   : in  std_logic;
    g4q_n : out std_logic
    );
end;

architecture ttl of sn7428 is
begin

  g1q_n <= g1a nor g1b;
  g2q_n <= g2a nor g2b;
  g3q_n <= g3a nor g3b;
  g4q_n <= g4a nor g4b;

end;
