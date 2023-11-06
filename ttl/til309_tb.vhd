library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.other.all;

entity til309_tb is
end;

architecture testbench of til309_tb is

  signal l8      : std_logic;
  signal l4      : std_logic;
  signal l2      : std_logic;
  signal l1      : std_logic;
  signal test_n  : std_logic;
  signal ldp     : std_logic;
  signal blank_n : std_logic;
  signal latch   : std_logic;
  signal dp      : std_logic;
  signal i8      : std_logic;
  signal i4      : std_logic;
  signal i2      : std_logic;
  signal i1      : std_logic;

begin

  uut : til309 port map(
    i1      => i1,
    i2      => i2,
    i4      => i4,
    i8      => i8,
    dp      => dp,
    latch   => latch,
    blank_n => blank_n,
    ldp     => ldp,
    test_n  => test_n,
    l1      => l1,
    l2      => l2,
    l4      => l4,
    l8      => l8
    );

  process
  begin
    wait for 5 ns;

    report "Testbench not implemented!" severity warning;

    wait;
  end process;

end;
