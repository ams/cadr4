library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7410_tb is
end;

architecture testbench of sn7410_tb is

  signal g1a, g1b, g1c, g1y_n : std_logic;
  signal g2a, g2b, g2c, g2y_n : std_logic;
  signal g3a, g3b, g3c, g3y_n : std_logic;

begin

  uut : sn7410 port map(
    g1a => g1a, g1b => g1b, g1c => g1c, g1y_n => g1y_n,
    g2a => g2a, g2b => g2b, g2c => g2c, g2y_n => g2y_n,
    g3a => g3a, g3b => g3b, g3c => g3c, g3y_n => g3y_n
    );

  process
  begin
    wait for 5 ns;

--    g1a <= 'X'; g1b <= 'X'; g1c <= '0'; wait for 5 ns; assert g1y_n = '1';
--    g1a <= 'X'; g1b <= '0'; g1c <= 'X'; wait for 5 ns; assert g1y_n = '1';
--    g1a <= '0'; g1b <= 'X'; g1c <= 'X'; wait for 5 ns; assert g1y_n = '1';
--    g1a <= '1'; g1b <= '1'; g1c <= '1'; wait for 5 ns; assert g1y_n = '0';

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
