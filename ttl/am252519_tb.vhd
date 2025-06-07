library ieee;
use ieee.std_logic_1164.all;

use work.other.all;

entity am252519_tb is
end;

architecture testbench of am252519_tb is

  signal q3b        : std_logic;
  signal q2b        : std_logic;
  signal q1b        : std_logic;
  signal q0b        : std_logic;
  signal q3a        : std_logic;
  signal q2a        : std_logic;
  signal q1a        : std_logic;
  signal q0a        : std_logic;
  signal asyn_clr_n : std_logic;
  signal clk_enb_n  : std_logic;
  signal clk        : std_logic;
  signal out_enb_n  : std_logic;
  signal i3         : std_logic;
  signal i2         : std_logic;
  signal i1         : std_logic;
  signal i0         : std_logic;
  signal inv        : std_logic;
  signal o_enb_n    : std_logic;

begin

  uut : am252519 port map(
    o_enb_n    => o_enb_n,
    inv        => inv,
    i0         => i0,
    i1         => i1,
    i2         => i2,
    i3         => i3,
    out_enb_n  => out_enb_n,
    clk        => clk,
    clk_enb_n  => clk_enb_n,
    asyn_clr_n => asyn_clr_n,
    q0a        => q0a,
    q1a        => q1a,
    q2a        => q2a,
    q3a        => q3a,
    q0b        => q0b,
    q1b        => q1b,
    q2b        => q2b,
    q3b        => q3b
    );

  process
  begin
    -- Initialize signals
    clk <= '0';
    asyn_clr_n <= '1';
    clk_enb_n <= '1';
    o_enb_n <= '1';
    out_enb_n <= '1';
    inv <= '0';
    i3 <= '0'; i2 <= '0'; i1 <= '0'; i0 <= '0';
    wait for 10 ns;

    -- Test 1: Asynchronous clear
    asyn_clr_n <= '0';
    wait for 10 ns;
    asyn_clr_n <= '1';
    wait for 10 ns;

    -- Test 2: Load data into register
    clk_enb_n <= '0';
    i3 <= '1'; i2 <= '0'; i1 <= '1'; i0 <= '0';  -- Load 1010
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;

    -- Test 3: Enable output A (non-inverted)
    o_enb_n <= '0';
    wait for 10 ns;
    assert q3a = '1' and q2a = '0' and q1a = '1' and q0a = '0'
      report "Test 3 failed: output A should be 1010" severity error;

    -- Test 4: Enable output B (always non-inverted)
    out_enb_n <= '0';
    wait for 10 ns;
    assert q3b = '1' and q2b = '0' and q1b = '1' and q0b = '0'
      report "Test 4 failed: output B should be 1010" severity error;

    -- Test 5: Test inversion on output A
    inv <= '1';
    wait for 10 ns;
    assert q3a = '0' and q2a = '1' and q1a = '0' and q0a = '1'
      report "Test 5 failed: output A should be inverted to 0101" severity error;
    assert q3b = '1' and q2b = '0' and q1b = '1' and q0b = '0'
      report "Test 5 failed: output B should remain 1010" severity error;

    -- Test 6: Disable outputs (high-Z)
    o_enb_n <= '1';
    out_enb_n <= '1';
    wait for 10 ns;
    assert q3a = 'Z' and q2a = 'Z' and q1a = 'Z' and q0a = 'Z'
      report "Test 6 failed: output A should be high-Z" severity error;
    assert q3b = 'Z' and q2b = 'Z' and q1b = 'Z' and q0b = 'Z'
      report "Test 6 failed: output B should be high-Z" severity error;

    -- Test 7: Clock disabled - data should not change
    clk_enb_n <= '1';
    o_enb_n <= '0';
    out_enb_n <= '0';
    inv <= '0';
    i3 <= '0'; i2 <= '1'; i1 <= '0'; i0 <= '1';  -- Try to load 0101
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    assert q3a = '1' and q2a = '0' and q1a = '1' and q0a = '0'
      report "Test 7 failed: data should not change when clock disabled" severity error;

    -- Test 8: Re-enable clock and load new data
    clk_enb_n <= '0';
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    assert q3a = '0' and q2a = '1' and q1a = '0' and q0a = '1'
      report "Test 8 failed: new data 0101 should be loaded" severity error;

    wait;
  end process;

end;
