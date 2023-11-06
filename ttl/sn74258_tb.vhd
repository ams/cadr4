library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74258_tb is
end;

architecture testbench of sn74258_tb is

  signal enb_n : std_logic;
  signal sel   : std_logic;
  signal dy    : std_logic;
  signal d1    : std_logic;
  signal d0    : std_logic;
  signal cy    : std_logic;
  signal c1    : std_logic;
  signal c0    : std_logic;
  signal by    : std_logic;
  signal b1    : std_logic;
  signal b0    : std_logic;
  signal ay    : std_logic;
  signal a1    : std_logic;
  signal a0    : std_logic;

begin

  uut : sn74258 port map(
    a0    => a0,
    a1    => a1,
    ay    => ay,
    b0    => b0,
    b1    => b1,
    by    => by,
    c0    => c0,
    c1    => c1,
    cy    => cy,
    d0    => d0,
    d1    => d1,
    dy    => dy,
    sel   => sel,
    enb_n => enb_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
