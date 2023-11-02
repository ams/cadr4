library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7404_tb is
end;

architecture testbench of sn7404_tb is

  signal g1a, g1q_n : std_logic;
  signal g2a, g2q_n : std_logic;
  signal g3a, g3q_n : std_logic;
  signal g4a, g4q_n : std_logic;
  signal g5a, g5q_n : std_logic;
  signal g6a, g6q_n : std_logic;

begin

  uut : sn7404 port map(
    g1a => g1a, g1q_n => g1q_n,
    g2a => g2a, g2q_n => g2q_n,
    g3a => g3a, g3q_n => g3q_n,
    g4a => g4a, g4q_n => g4q_n,
    g5a => g5a, g5q_n => g5q_n,
    g6a => g6a, g6q_n => g6q_n
    );

  process
  begin
    wait for 5 ns;

    g1a <= '0'; wait for 5 ns; assert g1q_n = '1';
    g1a <= '1'; wait for 5 ns; assert g1q_n = '0';

    g2a <= '0'; wait for 5 ns; assert g2q_n = '1';
    g2a <= '1'; wait for 5 ns; assert g2q_n = '0';

    g3a <= '0'; wait for 5 ns; assert g3q_n = '1';
    g3a <= '1'; wait for 5 ns; assert g3q_n = '0';

    g4a <= '0'; wait for 5 ns; assert g4q_n = '1';
    g4a <= '1'; wait for 5 ns; assert g4q_n = '0';

    wait;
  end process;

end;
