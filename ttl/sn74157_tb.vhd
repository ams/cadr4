library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74157_tb is
end;

architecture testbench of sn74157_tb is

  signal enb_n : std_logic;
  signal a1    : std_logic;
  signal b1    : std_logic;
  signal y1    : std_logic;
  signal a2    : std_logic;
  signal b2    : std_logic;
  signal y2    : std_logic;
  signal y3    : std_logic;
  signal b3    : std_logic;
  signal a3    : std_logic;
  signal y4    : std_logic;
  signal b4    : std_logic;
  signal a4    : std_logic;
  signal sel   : std_logic;

begin

  uut : sn74157 port map(
    sel   => sel,
    a4    => a4,
    b4    => b4,
    y4    => y4,
    a3    => a3,
    b3    => b3,
    y3    => y3,
    y2    => y2,
    b2    => b2,
    a2    => a2,
    y1    => y1,
    b1    => b1,
    a1    => a1,
    enb_n => enb_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
