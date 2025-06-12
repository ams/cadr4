-- Quadruple 2-input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

-- Datasheet: Texas Instruments SN5428 Quadruple 2-Input Positive-NOR Buffers, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN5428

library ieee;
use ieee.std_logic_1164.all;

entity sn7428 is
  port (
    g1q_n : out std_logic; -- Pin 1
    g1a   : in  std_logic; -- Pin 2
    g1b   : in  std_logic; -- Pin 3

    g2q_n : out std_logic; -- Pin 4
    g2a   : in  std_logic; -- Pin 5
    g2b   : in  std_logic; -- Pin 6

    g3a   : in  std_logic; -- Pin 8
    g3b   : in  std_logic; -- Pin 9
    g3q_n : out std_logic; -- Pin 10

    g4a   : in  std_logic; -- Pin 11
    g4b   : in  std_logic; -- Pin 12
    g4q_n : out std_logic  -- Pin 13
    );
end;

architecture ttl of sn7428 is
begin

  gate1: entity work.gate_nor2(behavioral) port map (a => g1a, b => g1b, q => g1q_n);
  gate2: entity work.gate_nor2(behavioral) port map (a => g2a, b => g2b, q => g2q_n);
  gate3: entity work.gate_nor2(behavioral) port map (a => g3a, b => g3b, q => g3q_n);
  gate4: entity work.gate_nor2(behavioral) port map (a => g4a, b => g4b, q => g4q_n);

end;
