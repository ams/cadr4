library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity am2507_tb is
end;

architecture testbench of am2507_tb is

  signal enb_n : std_logic;
  signal clk   : std_logic;
  signal d5    : std_logic;
  signal d4    : std_logic;
  signal d3    : std_logic;
  signal d2    : std_logic;
  signal d1    : std_logic;
  signal d0    : std_logic;
  signal i5    : std_logic;
  signal i4    : std_logic;
  signal i3    : std_logic;
  signal i2    : std_logic;
  signal i1    : std_logic;
  signal i0    : std_logic;

begin

  uut : am2507 port map(
    i0    => i0,
    i1    => i1,
    i2    => i2,
    i3    => i3,
    i4    => i4,
    i5    => i5,
    d0    => d0,
    d1    => d1,
    d2    => d2,
    d3    => d3,
    d4    => d4,
    d5    => d5,
    clk   => clk,
    enb_n => enb_n
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
