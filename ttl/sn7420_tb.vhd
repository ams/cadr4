library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7420_tb is
end;

architecture testbench of sn7420_tb is

  signal g1a, g1b, g1c, g1d, g1y_n : std_logic;
  signal g2a, g2b, g2c, g2d, g2y_n : std_logic;

begin

  uut : sn7420 port map(
    g1a => g1a, g1b => g1b, g1c => g1c, g1d => g1d, g1y_n => g1y_n,
    g2a => g2a, g2b => g2b, g2c => g2c, g2d => g2d, g2y_n => g2y_n
    );

  process
  begin
    wait for 5 ns;

---!!!

    wait;
  end process;

end;
