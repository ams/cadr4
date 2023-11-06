library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7451_tb is
end;

architecture testbench of sn7451_tb is

  signal g1a, g1b, g1c, g1d, g1y : std_logic;
  signal g2a, g2b, g2c, g2d, g2y : std_logic;

begin

  uut : sn7451 port map(
    g1a => g1a, g1b => g1b, g1c => g1c, g1d => g1d, g1y => g1y,
    g2a => g2a, g2b => g2b, g2c => g2c, g2d => g2d, g2y => g2y
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
