library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity dm942_tb is
end;

architecture testbench of dm942_tb is

  signal g1a1 : std_logic;
  signal g1b1 : std_logic;
  signal g2a1 : std_logic;
  signal g2b1 : std_logic;
  signal g2c1 : std_logic;
  signal g2d1 : std_logic;
  signal out1 : std_logic;
  signal g1a2 : std_logic;
  signal g1b2 : std_logic;
  signal g2a2 : std_logic;
  signal g2b2 : std_logic;
  signal g2c2 : std_logic;
  signal g2d2 : std_logic;
  signal out2 : std_logic;

begin

  uut : dm942 port map(
    g1a1 => g1a1,
    g1b1 => g1b1,
    g2a1 => g2a1,
    g2b1 => g2b1,
    g2c1 => g2c1,
    g2d1 => g2d1,
    out1 => out1,
    g1a2 => g1a2,
    g1b2 => g1b2,
    g2a2 => g2a2,
    g2b2 => g2b2,
    g2c2 => g2c2,
    g2d2 => g2d2,
    out2 => out2
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
