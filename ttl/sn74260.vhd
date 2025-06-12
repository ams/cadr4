-- SN74260: Dual 5-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn74260 is
  port (
    g1a   : in  std_logic; -- Pin 1
    g1b   : in  std_logic; -- Pin 2
    g1c   : in  std_logic; -- Pin 3
    g1d   : in  std_logic; -- Pin 12
    g1e   : in  std_logic; -- Pin 13
    g1y_n : out std_logic; -- Pin 5

    g2a   : in  std_logic; -- Pin 4
    g2b   : in  std_logic; -- Pin 8
    g2c   : in  std_logic; -- Pin 9
    g2d   : in  std_logic; -- Pin 10
    g2e   : in  std_logic; -- Pin 11
    g2y_n : out std_logic  -- Pin 6
    );
end;

architecture ttl of sn74260 is
begin

  gate1: entity work.gate_nor5(behavioral) port map (a => g1a, b => g1b, c => g1c, d => g1d, e => g1e, q => g1y_n);
  gate2: entity work.gate_nor5(behavioral) port map (a => g2a, b => g2b, c => g2c, d => g2d, e => g2e, q => g2y_n);

end architecture;
