-- Hex Inverters

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn7404 is
  port (
    g1a   : in  std_logic;
    g1q_n : out std_logic;

    g2a   : in  std_logic;
    g2q_n : out std_logic;

    g3a   : in  std_logic;
    g3q_n : out std_logic;

    g4a   : in  std_logic;
    g4q_n : out std_logic;

    g5a   : in  std_logic;
    g5q_n : out std_logic;

    g6a   : in  std_logic;
    g6q_n : out std_logic
    );
end;

architecture ttl of sn7404 is
  signal g1a_i, g2a_i, g3a_i, g4a_i, g5a_i, g6a_i : std_logic;
begin

  g1a_i <= ttl_input(g1a);
  g2a_i <= ttl_input(g2a);
  g3a_i <= ttl_input(g3a);
  g4a_i <= ttl_input(g4a);
  g5a_i <= ttl_input(g5a);
  g6a_i <= ttl_input(g6a);

  g1q_n <= not g1a_i;
  g2q_n <= not g2a_i;
  g3q_n <= not g3a_i;
  g4q_n <= not g4a_i;
  g5q_n <= not g5a_i;
  g6q_n <= not g6a_i;

end;
