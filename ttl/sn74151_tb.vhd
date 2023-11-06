library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74151_tb is
end;

architecture testbench of sn74151_tb is

  signal ce_n : std_logic;
  signal sel0 : std_logic;
  signal sel1 : std_logic;
  signal sel2 : std_logic;
  signal q_n  : std_logic;
  signal q    : std_logic;
  signal i7   : std_logic;
  signal i6   : std_logic;
  signal i5   : std_logic;
  signal i4   : std_logic;
  signal i3   : std_logic;
  signal i2   : std_logic;
  signal i1   : std_logic;
  signal i0   : std_logic;

begin

  uut : sn74151 port map(
    i0   => i0,
    i1   => i1,
    i2   => i2,
    i3   => i3,
    i4   => i4,
    i5   => i5,
    i6   => i6,
    i7   => i7,
    q    => q,
    q_n  => q_n,
    sel2 => sel2,
    sel1 => sel1,
    sel0 => sel0,
    ce_n => ce_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
