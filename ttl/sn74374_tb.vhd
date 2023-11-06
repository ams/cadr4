library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74374_tb is
end;

architecture testbench of sn74374_tb is

  signal oenb_n : std_logic;
  signal clk    : std_logic;
  signal o7     : std_logic;
  signal o6     : std_logic;
  signal o5     : std_logic;
  signal o4     : std_logic;
  signal o3     : std_logic;
  signal o2     : std_logic;
  signal o1     : std_logic;
  signal o0     : std_logic;
  signal i7     : std_logic;
  signal i6     : std_logic;
  signal i5     : std_logic;
  signal i4     : std_logic;
  signal i3     : std_logic;
  signal i2     : std_logic;
  signal i1     : std_logic;
  signal i0     : std_logic;

begin

  uut : sn74374 port map(
    i0     => i0,
    i1     => i1,
    i2     => i2,
    i3     => i3,
    i4     => i4,
    i5     => i5,
    i6     => i6,
    i7     => i7,
    o0     => o0,
    o1     => o1,
    o2     => o2,
    o3     => o3,
    o4     => o4,
    o5     => o5,
    o6     => o6,
    o7     => o7,
    clk    => clk,
    oenb_n => oenb_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
