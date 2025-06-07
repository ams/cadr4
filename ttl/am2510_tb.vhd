library ieee;
use ieee.std_logic_1164.all;

use work.other.all;

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
    -- Initialize inputs
    ce_n <= '0';
    sel1 <= '0'; sel0 <= '0';
    i3 <= '0'; i2 <= '0'; i1 <= '0'; i0 <= '0';
    i_1 <= '0'; i_2 <= '0'; i_3 <= '0';
    wait for 10 ns;

    -- Test input pattern: i_3='1', i_2='1', i_1='1', i0='1', i1='0', i2='0', i3='0'
    i_3 <= '1'; i_2 <= '1'; i_1 <= '1'; i0 <= '1';
    i1 <= '0'; i2 <= '0'; i3 <= '0';
    wait for 5 ns;

    -- Test 1: sel="00" - no shift
    sel1 <= '0'; sel0 <= '0';
    wait for 10 ns;
    assert o0 = '1' and o1 = '0' and o2 = '0' and o3 = '0'
      report "Test 1 failed: sel=00, expected o3o2o1o0=0001" severity error;

    -- Test 2: sel="01" - shift right by 1 (sel0=0, sel1=1)
    sel1 <= '1'; sel0 <= '0';
    wait for 10 ns;
    assert o0 = '1' and o1 = '1' and o2 = '0' and o3 = '0'
      report "Test 2 failed: sel=01, expected o3o2o1o0=0011" severity error;

    -- Test 3: sel="10" - shift right by 2 (sel0=1, sel1=0)
    sel1 <= '0'; sel0 <= '1';
    wait for 10 ns;
    assert o0 = '1' and o1 = '1' and o2 = '1' and o3 = '0'
      report "Test 3 failed: sel=10, expected o3o2o1o0=0111" severity error;

    -- Test 4: sel="11" - shift right by 3 (sel0=1, sel1=1)
    sel1 <= '1'; sel0 <= '1';
    wait for 10 ns;
    assert o0 = '1' and o1 = '1' and o2 = '1' and o3 = '1'
      report "Test 4 failed: sel=11, expected o3o2o1o0=1111" severity error;

    -- Test 5: ce_n = '1' - outputs should be high-Z
    ce_n <= '1';
    wait for 10 ns;
    assert o0 = 'Z' and o1 = 'Z' and o2 = 'Z' and o3 = 'Z'
      report "Test 5 failed: outputs should be Z when ce_n=1" severity error;

    -- Test 6: Different input pattern with no shift
    ce_n <= '0';
    sel1 <= '0'; sel0 <= '0';
    i3 <= '1'; i2 <= '0'; i1 <= '1'; i0 <= '0';
    i_1 <= '1'; i_2 <= '0'; i_3 <= '1';
    wait for 10 ns;
    assert o0 = '0' and o1 = '1' and o2 = '0' and o3 = '1'
      report "Test 6 failed: sel=00 with pattern 1010" severity error;

    -- Test 7: Same pattern with shift right by 2 (sel0=1, sel1=0)
    sel1 <= '0'; sel0 <= '1';
    wait for 10 ns;
    assert o0 = '0' and o1 = '1' and o2 = '0' and o3 = '1'
      report "Test 7 failed: sel=10 with shift by 2" severity error;

    wait;
  end process;

end;
