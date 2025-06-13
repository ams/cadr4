-- SN7486: Quadruple 2-input Exclusive-OR Gates
-- Datasheet: Texas Instruments SN74LS86A, SN74S86 (N Package / PDIP) - https://www.ti.com/lit/gpn/SN54S86

library ieee;
use ieee.std_logic_1164.all;

entity sn7486 is
  port (
    g1a : in  std_logic; -- Pin 1
    g1b : in  std_logic; -- Pin 2
    g1y : out std_logic; -- Pin 3

    g2a : in  std_logic; -- Pin 4
    g2b : in  std_logic; -- Pin 5
    g2y : out std_logic; -- Pin 6

    g3a : in  std_logic; -- Pin 9
    g3b : in  std_logic; -- Pin 10
    g3y : out std_logic; -- Pin 8

    g4a : in  std_logic; -- Pin 12
    g4b : in  std_logic; -- Pin 13
    g4y : out std_logic  -- Pin 11
    );
end;

architecture ttl of sn7486 is
begin

  g1y <= g1a xor g1b;
  g2y <= g2a xor g2b;
  g3y <= g3a xor g3b;
  g4y <= g4a xor g4b;

end;
