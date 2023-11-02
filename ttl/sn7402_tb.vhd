library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn7402_tb is
end;

architecture testbench of sn7402_tb is

  signal g1a, g1b, g1q_n : std_logic;
  signal g2a, g2b, g2q_n : std_logic;
  signal g3a, g3b, g3q_n : std_logic;
  signal g4a, g4b, g4q_n : std_logic;

begin

  uut : sn7402 port map(
    g1a => g1a, g1b => g1b, g1q_n => g1q_n,
    g2a => g2a, g2b => g2b, g2q_n => g2q_n,
    g3a => g3a, g3b => g3b, g3q_n => g3q_n,
    g4a => g4a, g4b => g4b, g4q_n => g4q_n
    );

  process
  begin
    wait for 5 ns;

    g1a <= '0'; g1b <= '0'; wait for 5 ns; assert g1q_n = '1';
    g1a <= '0'; g1b <= '1'; wait for 5 ns; assert g1q_n = '1';
    g1a <= '1'; g1b <= '0'; wait for 5 ns; assert g1q_n = '1';
    g1a <= '1'; g1b <= '1'; wait for 5 ns; assert g1q_n = '0';

    g2a <= '0'; g2b <= '0'; wait for 5 ns; assert g2q_n = '1';
    g2a <= '0'; g2b <= '1'; wait for 5 ns; assert g2q_n = '1';
    g2a <= '1'; g2b <= '0'; wait for 5 ns; assert g2q_n = '1';
    g2a <= '1'; g2b <= '1'; wait for 5 ns; assert g2q_n = '0';

    g3a <= '0'; g3b <= '0'; wait for 5 ns; assert g3q_n = '1';
    g3a <= '0'; g3b <= '1'; wait for 5 ns; assert g3q_n = '1';
    g3a <= '1'; g3b <= '0'; wait for 5 ns; assert g3q_n = '1';
    g3a <= '1'; g3b <= '1'; wait for 5 ns; assert g3q_n = '0';

    g4a <= '0'; g4b <= '0'; wait for 5 ns; assert g4q_n = '1';
    g4a <= '0'; g4b <= '1'; wait for 5 ns; assert g4q_n = '1';
    g4a <= '1'; g4b <= '0'; wait for 5 ns; assert g4q_n = '1';
    g4a <= '1'; g4b <= '1'; wait for 5 ns; assert g4q_n = '0';

    wait;
  end process;

end;
