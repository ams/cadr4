-- SN7437: Quadruple 2-Input Positive-NAND Buffers
-- Datasheet: Texas Instruments SN74LS37 Quadruple 2-Input Positive-NAND Buffers, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74LS37

library ieee;
use ieee.std_logic_1164.all;

entity sn7437 is
  port (
    g1a   : in  std_logic := 'H'; -- Pin 1
    g1b   : in  std_logic := 'H'; -- Pin 2
    g1y   : out std_logic; -- Pin 3

    g2a   : in  std_logic := 'H'; -- Pin 4
    g2b   : in  std_logic := 'H'; -- Pin 5
    g2y   : out std_logic; -- Pin 6

    g3a   : in  std_logic := 'H'; -- Pin 9
    g3b   : in  std_logic := 'H'; -- Pin 10
    g3y   : out std_logic; -- Pin 8

    g4a   : in  std_logic := 'H'; -- Pin 12
    g4b   : in  std_logic := 'H'; -- Pin 13
    g4y   : out std_logic  -- Pin 11
    );
end;

architecture ttl of sn7437 is
begin

  g1y <= g1a nand g1b;
  g2y <= g2a nand g2b;
  g3y <= g3a nand g3b;
  g4y <= g4a nand g4b;

end;
