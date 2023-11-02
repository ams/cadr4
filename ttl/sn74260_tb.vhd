library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74260_tb is
end sn74260_tb;

architecture testbench of sn74260_tb is

  signal i1, i2, i3, i4, i5 : std_logic;
  signal o1                 : std_logic;

begin

  uut : sn74260 port map(
    i1 => i1, i2 => i2, i3 => i3, i4 => i4, i5 => i5,
    o1 => o1
    );

  process
  begin
    wait for 5 ns;

    wait;
  end process;

end testbench;
