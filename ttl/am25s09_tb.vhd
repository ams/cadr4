library ieee;
use ieee.std_logic_1164.all;

use work.amd.am25s09

entity am25s09_tb is
end;

architecture testbench of am25s09_tb is

  signal clk : std_logic;
  signal sel : std_logic;
  signal dq  : std_logic;
  signal d1  : std_logic;
  signal d0  : std_logic;
  signal cq  : std_logic;
  signal c1  : std_logic;
  signal c0  : std_logic;
  signal bq  : std_logic;
  signal b1  : std_logic;
  signal b0  : std_logic;
  signal aq  : std_logic;
  signal a1  : std_logic;
  signal a0  : std_logic;

begin

  uut : am25s09 port map(
    a0  => a0,
    a1  => a1,
    aq  => aq,
    b0  => b0,
    b1  => b1,
    bq  => bq,
    c0  => c0,
    c1  => c1,
    cq  => cq,
    d0  => d0,
    d1  => d1,
    dq  => dq,
    sel => sel,
    clk => clk
    );

  process
  begin
    -- Initialize signals
    clk <= '0';
    sel <= '0';
    a0 <= '0'; a1 <= '0';
    b0 <= '0'; b1 <= '0';
    c0 <= '0'; c1 <= '0';
    d0 <= '0'; d1 <= '0';
    wait for 10 ns;

    -- Test 1: sel = '0', should latch a0, b0, c0, d0 inputs
    sel <= '0';
    a0 <= '1'; a1 <= '0';  -- Should latch a0 = '1'
    b0 <= '0'; b1 <= '1';  -- Should latch b0 = '0'
    c0 <= '1'; c1 <= '0';  -- Should latch c0 = '1'
    d0 <= '0'; d1 <= '1';  -- Should latch d0 = '0'
    wait for 5 ns;  -- Let inputs settle
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    assert aq = '1' and bq = '0' and cq = '1' and dq = '0'
      report "Test 1 failed: should latch a0,b0,c0,d0 when sel=0" severity error;

    -- Test 2: sel = '1', should latch a1, b1, c1, d1 inputs
    sel <= '1';
    a0 <= '0'; a1 <= '1';  -- Should latch a1 = '1'
    b0 <= '1'; b1 <= '0';  -- Should latch b1 = '0'
    c0 <= '0'; c1 <= '1';  -- Should latch c1 = '1'
    d0 <= '1'; d1 <= '0';  -- Should latch d1 = '0'
    wait for 5 ns;  -- Let inputs settle
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    assert aq = '1' and bq = '0' and cq = '1' and dq = '0'
      report "Test 2 failed: should latch a1,b1,c1,d1 when sel=1" severity error;

    -- Test 3: Change inputs, outputs should remain stable until next clock
    a0 <= '1'; a1 <= '0';
    b0 <= '0'; b1 <= '1';
    c0 <= '1'; c1 <= '0';
    d0 <= '0'; d1 <= '1';
    wait for 10 ns;
    assert aq = '1' and bq = '0' and cq = '1' and dq = '0'
      report "Test 3 failed: outputs changed without clock edge" severity error;

    -- Test 4: Clock edge with new data (sel still = '1')
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    assert aq = '0' and bq = '1' and cq = '0' and dq = '1'
      report "Test 4 failed: new data not latched correctly with sel=1" severity error;

    -- Test 5: Switch back to sel = '0' and test different pattern
    sel <= '0';
    a0 <= '0'; a1 <= '1';  -- Should latch a0 = '0'
    b0 <= '1'; b1 <= '0';  -- Should latch b0 = '1'
    c0 <= '0'; c1 <= '1';  -- Should latch c0 = '0'
    d0 <= '1'; d1 <= '0';  -- Should latch d0 = '1'
    wait for 5 ns;  -- Let inputs settle
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    assert aq = '0' and bq = '1' and cq = '0' and dq = '1'
      report "Test 5 failed: should latch a0,b0,c0,d0 when sel=0" severity error;

    wait;
  end process;

end;
