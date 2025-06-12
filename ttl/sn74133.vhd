-- 13-Input Positive-NAND Gate
-- Datasheet: https://www.ti.com/lit/ds/symlink/sn74s133.pdf (PDIP (N) Package)
-- This component implements a 13-input NAND gate.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74133 is
  port (
    a : in std_logic; -- Pin 1
    b : in std_logic; -- Pin 2
    c : in std_logic; -- Pin 3
    d : in std_logic; -- Pin 4
    e : in std_logic; -- Pin 5
    f : in std_logic; -- Pin 6
    g : in std_logic; -- Pin 9
    h : in std_logic; -- Pin 10
    i : in std_logic; -- Pin 11
    j : in std_logic; -- Pin 12
    k : in std_logic; -- Pin 13
    l : in std_logic; -- Pin 14
    m : in std_logic; -- Pin 15

    q_n : out std_logic -- Pin 8
    );
end;

architecture ttl of sn74133 is
begin

  gate1: entity work.gate_nand13(behavioral) port map (
    a => a, b => b, c => c, d => d, e => e, f => f, g => g, h => h, 
    i => i, j => j, k => k, l => l, m => m, q => q_n
  );

end;
