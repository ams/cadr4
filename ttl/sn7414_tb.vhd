library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7414_tb is
end;

architecture testbench of sn7414_tb is

  signal g1a   : std_logic;
  signal g1q_n : std_logic;
  signal g2a   : std_logic;
  signal g2q_n : std_logic;
  signal g3a   : std_logic;
  signal g3q_n : std_logic;
  signal g4a   : std_logic;
  signal g4q_n : std_logic;
  signal g5a   : std_logic;
  signal g5q_n : std_logic;
  signal g6a   : std_logic;
  signal g6q_n : std_logic;

begin

  uut : sn7414 port map(
    g1a   => g1a,
    g1q_n => g1q_n,
    g2a   => g2a,
    g2q_n => g2q_n,
    g3a   => g3a,
    g3q_n => g3q_n,
    g4a   => g4a,
    g4q_n => g4q_n,
    g5a   => g5a,
    g5q_n => g5q_n,
    g6a   => g6a,
    g6q_n => g6q_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
