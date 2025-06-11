library ieee;
use ieee.std_logic_1164.all;

use work.sn74.all;

entity sn74373_tb is
end;

architecture sim of sn74373_tb is
  signal hold_n, oenb_n : std_logic;
  signal i : std_logic_vector(7 downto 0);
  signal o : std_logic_vector(7 downto 0);
begin
  dut : sn74373
    port map (
      hold_n => hold_n,
      oenb_n => oenb_n,
      i7 => i(7), i6 => i(6), i5 => i(5), i4 => i(4),
      i3 => i(3), i2 => i(2), i1 => i(1), i0 => i(0),
      o7 => o(7), o6 => o(6), o5 => o(5), o4 => o(4),
      o3 => o(3), o2 => o(2), o1 => o(1), o0 => o(0)
    );

  process
  begin
    -- Test 1: Transparent latch behavior
    hold_n <= '1';
    oenb_n <= '0';
    i <= "10101010";
    wait for 10 ns;
    assert o = "10101010" report "Test 1 failed: Latch not transparent" severity error;

    -- Test 2: Latch hold behavior
    hold_n <= '0';
    i <= "01010101";
    wait for 10 ns;
    assert o = "10101010" report "Test 2 failed: Latch not holding" severity error;

    -- Test 3: Tri-state output when disabled
    oenb_n <= '1';
    wait for 10 ns;
    assert o = "ZZZZZZZZ" report "Test 3 failed: Output not tri-stated" severity error;

    -- Test 4: Output enabled after tri-state
    oenb_n <= '0';
    wait for 10 ns;
    assert o = "10101010" report "Test 4 failed: Output not restored" severity error;

    -- Test 5: New data latched when enabled
    hold_n <= '1';
    i <= "11110000";
    wait for 10 ns;
    assert o = "11110000" report "Test 5 failed: New data not latched" severity error;

    -- Test 6: Data held after disable
    hold_n <= '0';
    i <= "00001111";
    wait for 10 ns;
    assert o = "11110000" report "Test 6 failed: Data not held" severity error;

    wait;
  end process;
end;
