library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74138_tb is
end;

architecture testbench of sn74138_tb is

  signal y0  : std_logic;
  signal y1  : std_logic;
  signal y2  : std_logic;
  signal y3  : std_logic;
  signal y4  : std_logic;
  signal y5  : std_logic;
  signal y6  : std_logic;
  signal y7  : std_logic;
  signal g1  : std_logic;
  signal g2b : std_logic;
  signal g2a : std_logic;
  signal c   : std_logic;
  signal b   : std_logic;
  signal a   : std_logic;

begin

  uut : sn74138 port map(
    a   => a,
    b   => b,
    c   => c,
    g2a => g2a,
    g2b => g2b,
    g1  => g1,
    y7  => y7,
    y6  => y6,
    y5  => y5,
    y4  => y4,
    y3  => y3,
    y2  => y2,
    y1  => y1,
    y0  => y0
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
