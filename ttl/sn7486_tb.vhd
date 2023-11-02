library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7486_tb is
end;

architecture testbench of sn7486_tb is

  signal g1a, g1b, g1y : std_logic;
  signal g2a, g2b, g2y : std_logic;
  signal g3a, g3b, g3y : std_logic;
  signal g4a, g4b, g4y : std_logic;

begin

  uut : sn7486 port map(
    g1a => g1a, g1b => g1b, g1y => g1y,
    g2a => g2a, g2b => g2b, g2y => g2y,
    g3a => g3a, g3b => g3b, g3y => g3y,
    g4a => g4a, g4b => g4b, g4y => g4y
    );

  process
  begin
    wait for 5 ns;

    g1a <= '0'; g1b <= '0'; wait for 5 ns; assert g1y = '0';
    g1a <= '0'; g1b <= '1'; wait for 5 ns; assert g1y = '1';
    g1a <= '1'; g1b <= '0'; wait for 5 ns; assert g1y = '1';
    g1a <= '1'; g1b <= '1'; wait for 5 ns; assert g1y = '0';

    g2a <= '0'; g2b <= '0'; wait for 5 ns; assert g2y = '0';
    g2a <= '0'; g2b <= '1'; wait for 5 ns; assert g2y = '1';
    g2a <= '1'; g2b <= '0'; wait for 5 ns; assert g2y = '1';
    g2a <= '1'; g2b <= '1'; wait for 5 ns; assert g2y = '0';

    g3a <= '0'; g3b <= '0'; wait for 5 ns; assert g3y = '0';
    g3a <= '0'; g3b <= '1'; wait for 5 ns; assert g3y = '1';
    g3a <= '1'; g3b <= '0'; wait for 5 ns; assert g3y = '1';
    g3a <= '1'; g3b <= '1'; wait for 5 ns; assert g3y = '0';

    g4a <= '0'; g4b <= '0'; wait for 5 ns; assert g4y = '0';
    g4a <= '0'; g4b <= '1'; wait for 5 ns; assert g4y = '1';
    g4a <= '1'; g4b <= '0'; wait for 5 ns; assert g4y = '1';
    g4a <= '1'; g4b <= '1'; wait for 5 ns; assert g4y = '0';

    wait;
  end process;

end;
