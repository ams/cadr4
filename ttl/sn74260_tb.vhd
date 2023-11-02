library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74260_tb is
end sn74260_tb;

architecture testbench of sn74260_tb is

  signal g1a, g2a, g3a, g4a, g5a : std_logic;
  signal g1y_n                   : std_logic;

begin

  uut : sn74260 port map(
    g1a   => g1a,
    g2a   => g2a,
    g3a   => g3a,
    g4a   => g4a,
    g5a   => g5a,
    g1y_n => g1y_n
    );

  process
  begin
    wait for 5 ns;

---!!!

    wait;
  end process;

end testbench;
