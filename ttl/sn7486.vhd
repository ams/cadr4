-- SN7486: Quadruple 2-input Exclusive-OR Gates

library ieee;
use ieee.std_logic_1164.all;

entity sn7486 is
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

architecture ttl of sn7486 is
begin

  g1y <= g1a xor g1b;
  g2y <= g2a xor g2b;
  g3y <= g3a xor g3b;
  g4y <= g4a xor g4b;

end;
