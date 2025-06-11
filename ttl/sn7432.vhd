-- SN7432: Quadruple 2-Input Positive-OR Gates
-- Datasheet: Texas Instruments SN7432 Quadruple 2-Input Positive-OR Gates, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/sn7432

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7432 is
  port (
    g1a : in  std_logic;
    g1b : in  std_logic;
    g1y : out std_logic;

    g2a : in  std_logic;
    g2b : in  std_logic;
    g2y : out std_logic;

    g3a : in  std_logic;
    g3b : in  std_logic;
    g3y : out std_logic;

    g4a : in  std_logic;
    g4b : in  std_logic;
    g4y : out std_logic
    );
end;

architecture ttl of sn7432 is
begin

  g1y <= g1a or g1b;
  g2y <= g2a or g2b;
  g3y <= g3a or g3b;
  g4y <= g4a or g4b;

end;
