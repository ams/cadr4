-- SN7404: Hex Inverters

library ieee;
use ieee.std_logic_1164.all;

entity sn7404 is
  port (
    g1a : in  std_logic; -- pin 1
    g1q_n : out std_logic; -- pin 2

    g2a : in  std_logic; -- pin 3
    g2q_n : out std_logic; -- pin 4

    g3a : in  std_logic; -- pin 5
    g3q_n : out std_logic; -- pin 6

    g4a : in  std_logic; -- pin 9
    g4q_n : out std_logic; -- pin 8

    g5a : in  std_logic; -- pin 11
    g5q_n : out std_logic; -- pin 10

    g6a : in  std_logic; -- pin 13
    g6q_n : out std_logic  -- pin 12
    );
end;

architecture ttl of sn7404 is
begin

  g1q_n <= not g1a;
  g2q_n <= not g2a;
  g3q_n <= not g3a;
  g4q_n <= not g4a;
  g5q_n <= not g5a;
  g6q_n <= not g6a;

end;
