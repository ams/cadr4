library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7428_tb is
end;

architecture testbench of sn7428_tb is

  signal g1a, g1b, g1q_n : std_logic;
  signal g2a, g2b, g2q_n : std_logic;
  signal g3a, g3b, g3q_n : std_logic;
  signal g4a, g4b, g4q_n : std_logic;

begin

  uut : sn7428 port map(
    g1a => g1a, g1b => g1b, g1q_n => g1q_n,
    g2a => g2a, g2b => g2b, g2q_n => g2q_n,
    g3a => g3a, g3b => g3b, g3q_n => g3q_n,
    g4a => g4a, g4b => g4b, g4q_n => g4q_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
