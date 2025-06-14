-- Datasheet: https://www.ti.com/lit/gpn/sn7404 (PDIP (N) Package)
-- SN7404: Hex Inverters

library ieee;
use ieee.std_logic_1164.all;

entity sn7404 is
  port (
    g1a   : in  std_logic := 'H';
    g1q_n : out std_logic;

    g2a   : in  std_logic := 'H';
    g2q_n : out std_logic;

    g3a   : in  std_logic := 'H';
    g3q_n : out std_logic;

    g4a   : in  std_logic := 'H';
    g4q_n : out std_logic;

    g5a   : in  std_logic := 'H';
    g5q_n : out std_logic;

    g6a   : in  std_logic := 'H';
    g6q_n : out std_logic
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
