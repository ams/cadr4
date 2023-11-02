library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7432_tb is
end sn7432_tb;

architecture testbench of sn7432_tb is

  signal g1a, g1b, g1y : std_logic;
  signal g2a, g2b, g2y : std_logic;
  signal g3a, g3b, g3y : std_logic;
  signal g4a, g4b, g4y : std_logic;

begin

  uut : sn7432 port map(
    g1a => g1a, g1b => g1b, g1y => g1y,
    g2a => g2a, g2b => g2b, g2y => g2y,
    g3a => g3a, g3b => g3b, g3y => g3y,
    g4a => g4a, g4b => g4b, g4y => g4y
    );

  process
  begin
    wait for 5 ns;

---!!!

    wait;
  end process;

end testbench;
