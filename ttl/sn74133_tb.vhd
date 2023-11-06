library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74133_tb is
end;

architecture testbench of sn74133_tb is

  signal m   : std_logic;
  signal l   : std_logic;
  signal k   : std_logic;
  signal j   : std_logic;
  signal i   : std_logic;
  signal h   : std_logic;
  signal q_n : std_logic;
  signal a   : std_logic;
  signal b   : std_logic;
  signal c   : std_logic;
  signal d   : std_logic;
  signal e   : std_logic;
  signal f   : std_logic;
  signal g   : std_logic;

begin

  uut : sn74133 port map(
    g   => g,
    f   => f,
    e   => e,
    d   => d,
    c   => c,
    b   => b,
    a   => a,
    q_n => q_n,
    h   => h,
    i   => i,
    j   => j,
    k   => k,
    l   => l,
    m   => m
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
