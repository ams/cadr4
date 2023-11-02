-- Quadruple 2-Input Positive-NAND Buffers

library ieee;
use ieee.std_logic_1164.all;

entity sn7437 is
  port (
    g1a, g1b : in  std_logic;
    g1y      : out std_logic;

    g2a, g2b : in  std_logic;
    g2y      : out std_logic;

    g3a, g3b : in  std_logic;
    g3y      : out std_logic;

    g4a, g4b : in  std_logic;
    g4y      : out std_logic
    );
end;

architecture ttl of sn7437 is
begin

  g1y <= not (g1a and g1b);
  g2y <= not (g2a and g2b);
  g3y <= not (g3a and g3b);
  g4y <= not (g4a and g4b);

end;
