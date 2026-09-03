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
    -- Initialize with the latch strobe high (hold)
    i1 <= '0'; i2 <= '0'; i4 <= '0'; i8 <= '0';
    dp <= '0';
    latch <= '1';
    blank_n <= '1';
    ldp <= '0';
    test_n <= '1';
    wait for 10 ns;
    -- Test 0: the latch powers up cleared
    assert l1 = '0' and l2 = '0' and l4 = '0' and l8 = '0'
      report "Test 0 failed: latch outputs should power up as 0000" severity error;

    -- Test 1: transparent mode. With the latch strobe low the latch outputs
    -- follow the inputs, no strobe edge is needed.
    latch <= '0';
    i1 <= '1'; i2 <= '0'; i4 <= '1'; i8 <= '0';  -- 5
    wait for 10 ns;
    assert l1 = '1' and l2 = '0' and l4 = '1' and l8 = '0'
      report "Test 1a failed: latch outputs should follow the inputs (5)" severity error;
    i1 <= '1'; i2 <= '0'; i4 <= '0'; i8 <= '1';  -- 9
    wait for 10 ns;
    assert l1 = '1' and l2 = '0' and l4 = '0' and l8 = '1'
      report "Test 1b failed: latch outputs should follow the inputs (9)" severity error;

    -- Test 2: hold mode. With the latch strobe high the latch keeps the
    -- last data and ignores the inputs.
    latch <= '1';
    wait for 10 ns;
    i1 <= '0'; i2 <= '1'; i4 <= '1'; i8 <= '0';  -- 6
    wait for 10 ns;
    assert l1 = '1' and l2 = '0' and l4 = '0' and l8 = '1'
      report "Test 2 failed: latch outputs should hold 9 while the strobe is high" severity error;

    -- Test 3: blanking affects only the display, not the latch outputs
    blank_n <= '0';
    wait for 10 ns;
    assert l1 = '1' and l2 = '0' and l4 = '0' and l8 = '1'
      report "Test 3 failed: blanking must not change the latch outputs" severity error;
    blank_n <= '1';

    -- Test 4: lamp test affects only the display, not the latch outputs
    test_n <= '0';
    wait for 10 ns;
    assert l1 = '1' and l2 = '0' and l4 = '0' and l8 = '1'
      report "Test 4 failed: lamp test must not change the latch outputs" severity error;
    test_n <= '1';

    -- Test 5: decimal point inputs do not affect the BCD latch outputs
    dp <= '1';
    ldp <= '1';
    wait for 10 ns;
    assert l1 = '1' and l2 = '0' and l4 = '0' and l8 = '1'
      report "Test 5 failed: decimal point must not change the latch outputs" severity error;

    -- Test 6: back to transparent mode, the pending input data (6) appears
    latch <= '0';
    wait for 10 ns;
    assert l1 = '0' and l2 = '1' and l4 = '1' and l8 = '0'
      report "Test 6 failed: latch outputs should follow the inputs (6)" severity error;

    -- Test 7: 'Z' on the latch strobe reads as high (hold)
    latch <= 'Z';
    wait for 10 ns;
    i1 <= '1'; i2 <= '1'; i4 <= '1'; i8 <= '1';
    wait for 10 ns;
    assert l1 = '0' and l2 = '1' and l4 = '1' and l8 = '0'
      report "Test 7 failed: 'Z' on the latch strobe must hold the data" severity error;
    latch <= '0';
    wait for 10 ns;
    assert l1 = '1' and l2 = '1' and l4 = '1' and l8 = '1'
      report "Test 8 failed: latch outputs should follow the inputs (F)" severity error;

    wait;
  end process;

end architecture;
