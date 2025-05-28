-- Hex Schmitt-Trigger Inverters

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7414 is
  port (
    g1a   : in  std_logic; -- Pin 1
    g1q_n : out std_logic; -- Pin 2
    g2a   : in  std_logic; -- Pin 3
    g2q_n : out std_logic; -- Pin 4
    g3a   : in  std_logic; -- Pin 5
    g3q_n : out std_logic; -- Pin 6
    g4a   : in  std_logic; -- Pin 9
    g4q_n : out std_logic; -- Pin 8
    g5a   : in  std_logic; -- Pin 11
    g5q_n : out std_logic; -- Pin 10
    g6a   : in  std_logic; -- Pin 13
    g6q_n : out std_logic  -- Pin 12
    );
end;

architecture ttl of sn7414 is
begin

  g1q_n <= not g1a;
  g2q_n <= not g2a;
  g3q_n <= not g3a;
  g4q_n <= not g4a;
  g5q_n <= not g5a;
  g6q_n <= not g6a;

end;
