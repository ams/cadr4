library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7408_tb is
end sn7408_tb;

architecture testbench of sn7408_tb is

  signal g1a, g1b, g1q : std_logic;
  signal g2a, g2b, g2q : std_logic;
  signal g3a, g3b, g3q : std_logic;
  signal g4a, g4b, g4q : std_logic;

begin

  uut : sn7408 port map(
    g1a => g1a, g1b => g1b, g1q => g1q,
    g2a => g2a, g2b => g2b, g2q => g2q,
    g3a => g3a, g3b => g3b, g3q => g3q,
    g4a => g4a, g4b => g4b, g4q => g4q
    );

  process
  begin
    wait for 5 ns;

    wait;
  end process;

end testbench;
