library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity am2510_tb is
end;

architecture testbench of am2510_tb is

  signal o0   : std_logic;
  signal o1   : std_logic;
  signal o2   : std_logic;
  signal o3   : std_logic;
  signal ce_n : std_logic;
  signal sel0 : std_logic;
  signal sel1 : std_logic;
  signal i_3  : std_logic;
  signal i_2  : std_logic;
  signal i_1  : std_logic;
  signal i0   : std_logic;
  signal i1   : std_logic;
  signal i2   : std_logic;
  signal i3   : std_logic;

begin

  uut : am2510 port map(
    i3   => i3,
    i2   => i2,
    i1   => i1,
    i0   => i0,
    i_1  => i_1,
    i_2  => i_2,
    i_3  => i_3,
    sel1 => sel1,
    sel0 => sel0,
    ce_n => ce_n,
    o3   => o3,
    o2   => o2,
    o1   => o1,
    o0   => o0
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
