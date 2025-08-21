library ieee;
use ieee.std_logic_1164.all;

use work.other.til309;

entity til309_tb is
end entity;

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
    -- Initialize
    i1 <= '0'; i2 <= '0'; i4 <= '0'; i8 <= '0';
    dp <= '0';
    latch <= '0';
    blank_n <= '1';
    ldp <= '0';
    test_n <= '1';
    wait for 10 ns;

    -- Test 1: Display digit 5 (0101)
    i1 <= '1'; i2 <= '0'; i4 <= '1'; i8 <= '0';
    latch <= '1';
    wait for 10 ns;
    latch <= '0';
    wait for 10 ns;
    assert l1 = '1' and l2 = '0' and l4 = '1' and l8 = '0'
      report "Failed to display digit 5";

    -- Test 2: Display digit 9 (1001)
    i1 <= '1'; i2 <= '0'; i4 <= '0'; i8 <= '1';
    latch <= '1';
    wait for 10 ns;
    latch <= '0';
    wait for 10 ns;
    assert l1 = '1' and l2 = '0' and l4 = '0' and l8 = '1'
      report "Failed to display digit 9";

    -- Test 3: Blank display
    blank_n <= '0';
    wait for 10 ns;
    assert l1 = '0' and l2 = '0' and l4 = '0' and l8 = '0'
      report "Failed to blank display";
    blank_n <= '1';

    -- Test 4: Test mode
    test_n <= '0';
    wait for 10 ns;
    assert l1 = '1' and l2 = '1' and l4 = '1' and l8 = '1'
      report "Failed to enter test mode";
    test_n <= '1';

    -- Test 5: Decimal point
    dp <= '1';
    ldp <= '1';
    wait for 10 ns;
    assert l1 = '1' and l2 = '0' and l4 = '0' and l8 = '1'
      report "Failed to display decimal point";

    wait;
  end process;

end architecture;
