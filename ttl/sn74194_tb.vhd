library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74194_tb is
end;

architecture testbench of sn74194_tb is

  signal q0    : std_logic;
  signal q1    : std_logic;
  signal q2    : std_logic;
  signal q3    : std_logic;
  signal clk   : std_logic;
  signal s1    : std_logic;
  signal s0    : std_logic;
  signal sil   : std_logic;
  signal i3    : std_logic;
  signal i2    : std_logic;
  signal i1    : std_logic;
  signal i0    : std_logic;
  signal sir   : std_logic;
  signal clr_n : std_logic;

begin

  uut : sn74194 port map(
    clr_n => clr_n,
    sir   => sir,
    i0    => i0,
    i1    => i1,
    i2    => i2,
    i3    => i3,
    sil   => sil,
    s0    => s0,
    s1    => s1,
    clk   => clk,
    q3    => q3,
    q2    => q2,
    q1    => q1,
    q0    => q0
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
