-- 4-wide 2-input AND-OR-INVERT gates

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm942 is
  port (
    g1a1 : in  std_logic; -- Pin 1
    g1b1 : in  std_logic; -- Pin 2
    g2a1 : in  std_logic; -- Pin 3
    g2b1 : in  std_logic; -- Pin 4
    g2c1 : in  std_logic; -- Pin 5
    g2d1 : in  std_logic; -- Pin 6
    out1 : out std_logic; -- Pin 8
    g1a2 : in  std_logic; -- Pin 13
    g1b2 : in  std_logic; -- Pin 12
    g2a2 : in  std_logic; -- Pin 11
    g2b2 : in  std_logic; -- Pin 10
    g2c2 : in  std_logic; -- Pin 9
    g2d2 : in  std_logic; -- Pin 7
    out2 : out std_logic  -- Pin 14
    );
end dm942;

-- ChatGPT Codex implementation
architecture ttl of dm942 is
begin
  out1 <= (g1a1 and g1b1) or (g2a1 and g2b1 and g2c1 and g2d1);
  out2 <= (g1a2 and g1b2) or (g2a2 and g2b2 and g2c2 and g2d2);
end;
