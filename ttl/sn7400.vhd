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

  gate1: entity work.gate_nand2(behavioral) port map (a => g1a, b => g1b, q => g1q_n);
  gate2: entity work.gate_nand2(behavioral) port map (a => g2a, b => g2b, q => g2q_n);
  gate3: entity work.gate_nand2(behavioral) port map (a => g3a, b => g3b, q => g3q_n);
  gate4: entity work.gate_nand2(behavioral) port map (a => g4a, b => g4b, q => g4q_n);

end;
