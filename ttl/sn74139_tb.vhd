library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74139_tb is
end;

architecture testbench of sn74139_tb is

  signal g2   : std_logic;
  signal a2   : std_logic;
  signal b2   : std_logic;
  signal g2y0 : std_logic;
  signal g2y1 : std_logic;
  signal g2y2 : std_logic;
  signal g2y3 : std_logic;
  signal g1y3 : std_logic;
  signal g1y2 : std_logic;
  signal g1y1 : std_logic;
  signal g1y0 : std_logic;
  signal b1   : std_logic;
  signal a1   : std_logic;
  signal g1   : std_logic;

begin

  uut : sn74139 port map(
    g1   => g1,
    a1   => a1,
    b1   => b1,
    g1y0 => g1y0,
    g1y1 => g1y1,
    g1y2 => g1y2,
    g1y3 => g1y3,
    g2y3 => g2y3,
    g2y2 => g2y2,
    g2y1 => g2y1,
    g2y0 => g2y0,
    b2   => b2,
    a2   => a2,
    g2   => g2
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
