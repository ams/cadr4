library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm942 is
  port (
    g1a1, g1a2 : in  std_logic;
    g1b1, g1b2 : in  std_logic;
    g2a1, g2a2 : in  std_logic;
    g2b1, g2b2 : in  std_logic;
    g2c1, g2c2 : in  std_logic;
    g2d1, g2d2 : in  std_logic;
    out1, out2 : out std_logic
    );
end dm942;

-- ChatGPT Codex implementation
architecture ttl of dm942 is
begin
  out1 <= (g1a1 and g1b1) or (g2a1 and g2b1 and g2c1 and g2d1);
  out2 <= (g1a2 and g1b2) or (g2a2 and g2b2 and g2c2 and g2d2);
end;
