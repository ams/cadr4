-- Datasheet: https://www.ti.com/lit/gpn/sn7400 (PDIP (N) Package)

-- Quadruple 2-Input Positive-NAND Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn7400 is
  port (
    g1a   : in  std_logic;
    g1b   : in  std_logic;
    g1q_n : out std_logic;

    g2a   : in  std_logic;
    g2b   : in  std_logic;
    g2q_n : out std_logic;

    g3a   : in  std_logic;
    g3b   : in  std_logic;
    g3q_n : out std_logic;

    g4a   : in  std_logic;
    g4b   : in  std_logic;
    g4q_n : out std_logic
    );
end;

architecture ttl of sn7400 is
begin

  g1q_n <= g1a nand g1b;
  g2q_n <= g2a nand g2b;
  g3q_n <= g3a nand g3b;
  g4q_n <= g4a nand g4b;

end;
