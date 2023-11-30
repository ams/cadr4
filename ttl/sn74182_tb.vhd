library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74182_tb is
end;

architecture testbench of sn74182_tb is

  signal cin_n   : std_logic;
  signal y0      : std_logic;
  signal x0      : std_logic;
  signal cout0_n : std_logic;
  signal y1      : std_logic;
  signal x1      : std_logic;
  signal cout1_n : std_logic;
  signal y2      : std_logic;
  signal x2      : std_logic;
  signal cout2_n : std_logic;
  signal y3      : std_logic;
  signal x3      : std_logic;
  signal yout    : std_logic;
  signal xout    : std_logic;

begin

  uut : sn74182 port map(
    xout => xout,
    yout => yout,
    x3   => x3,
    y3   => y3,

    cout2_n => cout2_n,
    x2      => x2,
    y2      => y2,

    cout1_n => cout1_n,
    x1      => x1,
    y1      => y1,

    cout0_n => cout0_n,
    x0      => x0,
    y0      => y0,

    cin_n => cin_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
