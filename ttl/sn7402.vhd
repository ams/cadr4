-- Datasheet: https://www.ti.com/lit/gpn/sn7402 (PDIP (N) Package)

-- Quadruple 2-Input Positive-NOR Gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Simple 2-input NOR gate
entity nor_gate is
  port (
    a : in  std_logic;
    b : in  std_logic;
    q : out std_logic
  );
end;

architecture behavioral of nor_gate is
begin
  q <= '0' when (a = '1' or b = '1') else '1';
end;

entity sn7402 is
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

architecture ttl of sn7402 is
begin

  gate1: entity work.nor_gate(behavioral) port map (a => g1a, b => g1b, q => g1q_n);
  gate2: entity work.nor_gate(behavioral) port map (a => g2a, b => g2b, q => g2q_n);
  gate3: entity work.nor_gate(behavioral) port map (a => g3a, b => g3b, q => g3q_n);
  gate4: entity work.nor_gate(behavioral) port map (a => g4a, b => g4b, q => g4q_n);

end;
