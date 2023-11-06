library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74280_tb is
end;

architecture testbench of sn74280_tb is

  signal i8   : std_logic;
  signal i7   : std_logic;
  signal i6   : std_logic;
  signal i5   : std_logic;
  signal i4   : std_logic;
  signal i3   : std_logic;
  signal odd  : std_logic;
  signal even : std_logic;
  signal i2   : std_logic;
  signal i1   : std_logic;
  signal i0   : std_logic;

begin

  uut : sn74280 port map(
    i0   => i0,
    i1   => i1,
    i2   => i2,
    even => even,
    odd  => odd,
    i3   => i3,
    i4   => i4,
    i5   => i5,
    i6   => i6,
    i7   => i7,
    i8   => i8
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
