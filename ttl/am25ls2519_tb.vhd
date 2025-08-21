library ieee;
use ieee.std_logic_1164.all;

use work.amd.am25ls2519;

entity am25ls2519_tb is
end entity;

architecture testbench of am25ls2519_tb is

  signal w3         : std_logic;
  signal w2         : std_logic;
  signal w1         : std_logic;
  signal w0         : std_logic;
  signal y3         : std_logic;
  signal y2         : std_logic;
  signal y1         : std_logic;
  signal y0         : std_logic;
  signal clr_n      : std_logic;
  signal e_n        : std_logic;
  signal cp         : std_logic;
  signal oe_w_n     : std_logic;
  signal d3         : std_logic;
  signal d2         : std_logic;
  signal d1         : std_logic;
  signal d0         : std_logic;
  signal pol        : std_logic;
  signal oe_y_n     : std_logic;

begin

  uut : am25ls2519 port map(
    oe_y_n     => oe_y_n,
    pol        => pol,
    d0         => d0,
    d1         => d1,
    d2         => d2,
    d3         => d3,
    oe_w_n     => oe_w_n,
    cp         => cp,
    e_n        => e_n,
    clr_n      => clr_n,
    y0         => y0,
    y1         => y1,
    y2         => y2,
    y3         => y3,
    w0         => w0,
    w1         => w1,
    w2         => w2,
    w3         => w3
    );

  process
  begin
    -- Initialize signals
    cp <= '0';
    clr_n <= '1';
    e_n <= '1';
    oe_y_n <= '1';
    oe_w_n <= '1';
    pol <= '0';
    d3 <= '0'; d2 <= '0'; d1 <= '0'; d0 <= '0';
    wait for 10 ns;

    -- Test 1: Asynchronous clear
    clr_n <= '0';
    wait for 10 ns;
    clr_n <= '1';
    wait for 10 ns;

    -- Test 2: Load data into register
    e_n <= '0';
    d3 <= '1'; d2 <= '0'; d1 <= '1'; d0 <= '0';  -- Load 1010
    cp <= '1';
    wait for 10 ns;
    cp <= '0';
    wait for 10 ns;

    -- Test 3: Enable output A (non-inverted)
    oe_y_n <= '0';
    wait for 10 ns;
    assert y3 = '1' and y2 = '0' and y1 = '1' and y0 = '0'
      report "Test 3 failed: output A should be 1010" severity error;

    -- Test 4: Enable output B (always non-inverted)
    oe_w_n <= '0';
    wait for 10 ns;
    assert w3 = '1' and w2 = '0' and w1 = '1' and w0 = '0'
      report "Test 4 failed: output B should be 1010" severity error;

    -- Test 5: Test inversion on output B
    pol <= '1';
    wait for 10 ns;
    assert y3 = '1' and y2 = '0' and y1 = '1' and y0 = '0'
      report "Test 5 failed: output A should be non-inverted 1010" severity error;
    assert w3 = '0' and w2 = '1' and w1 = '0' and w0 = '1'
      report "Test 5 failed: output B should be inverted to 0101" severity error;

    -- Test 6: Disable outputs (high-Z)
    oe_y_n <= '1';
    oe_w_n <= '1';
    wait for 10 ns;
    assert y3 = 'Z' and y2 = 'Z' and y1 = 'Z' and y0 = 'Z'
      report "Test 6 failed: output A should be high-Z" severity error;
    assert w3 = 'Z' and w2 = 'Z' and w1 = 'Z' and w0 = 'Z'
      report "Test 6 failed: output B should be high-Z" severity error;

    -- Test 7: Clock disabled - data should not change
    e_n <= '1';
    oe_y_n <= '0';
    oe_w_n <= '0';
    pol <= '0';
    d3 <= '0'; d2 <= '1'; d1 <= '0'; d0 <= '1';  -- Try to load 0101
    cp <= '1';
    wait for 10 ns;
    cp <= '0';
    wait for 10 ns;
    assert y3 = '1' and y2 = '0' and y1 = '1' and y0 = '0'
      report "Test 7 failed: data should not change when clock disabled" severity error;

    -- Test 8: Re-enable clock and load new data
    e_n <= '0';
    cp <= '1';
    wait for 10 ns;
    cp <= '0';
    wait for 10 ns;
    assert y3 = '0' and y2 = '1' and y1 = '0' and y0 = '1'
      report "Test 8 failed: new data 0101 should be loaded" severity error;

    wait;
  end process;

end;
