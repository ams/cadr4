library ieee;
use ieee.std_logic_1164.all;

use std.env.all;

use work.sn74.all;

entity sn74163_tb is
end entity;

architecture testbench of sn74163_tb is

  signal clk     : std_logic;
  signal clr_n   : std_logic;
  signal pe_n    : std_logic;
  signal enb_p   : std_logic;
  signal enb_t   : std_logic;
  signal d0      : std_logic;
  signal d1      : std_logic;
  signal d2      : std_logic;
  signal d3      : std_logic;
  signal i0      : std_logic;
  signal i1      : std_logic;
  signal i2      : std_logic;
  signal i3      : std_logic;
  signal tc      : std_logic;

begin

  uut : sn74163 port map(
    tc   => tc,
    i3   => i3,
    i2   => i2,
    i1   => i1,
    i0   => i0,

    d3 => d3,
    d2 => d2,
    d1 => d1,
    d0 => d0,

    enb_t   => enb_t,
    enb_p   => enb_p,
    pe_n    => pe_n,
    clr_n   => clr_n,
    clk     => clk
    );

  -- Clock generation
  process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  -- Test sequence
  process
  begin
    -- Initialize signals
    clr_n <= '1';
    pe_n <= '1';
    enb_p <= '0';
    enb_t <= '0';
    i3 <= '0';
    i2 <= '0';
    i1 <= '0';
    i0 <= '0';
    
    wait for 20 ns;
    
    -- Test 1: Synchronous clear
    clr_n <= '0';
    wait for 10 ns;
    clr_n <= '1';
    wait for 10 ns;
    assert (d3 & d2 & d1 & d0) = "0000" report "Clear test failed" severity error;
    
    -- Test 2: Parallel load with value 5 (0101)
    i3 <= '0';
    i2 <= '1';
    i1 <= '0';
    i0 <= '1';
    pe_n <= '0';
    wait for 10 ns;
    pe_n <= '1';
    wait for 10 ns;
    assert (d3 & d2 & d1 & d0) = "0101" report "Load test failed" severity error;
    
    -- Test 3: Count up from 5
    enb_p <= '1';
    enb_t <= '1';
    wait for 10 ns;
    assert (d3 & d2 & d1 & d0) = "0110" report "Up count from 5 failed" severity error;
    wait for 10 ns;
    assert (d3 & d2 & d1 & d0) = "0111" report "Up count to 7 failed" severity error;
    
    -- Test 4: Load value 14 (1110) and test terminal count
    enb_p <= '0';
    enb_t <= '0';
    i3 <= '1';
    i2 <= '1';
    i1 <= '1';
    i0 <= '0';
    pe_n <= '0';
    wait for 10 ns;
    pe_n <= '1';
    wait for 10 ns;
    assert (d3 & d2 & d1 & d0) = "1110" report "Load 14 failed" severity error;
    
    -- Enable counting and count to 15, then overflow to 0
    enb_p <= '1';
    enb_t <= '1';
    wait for 10 ns;
    assert (d3 & d2 & d1 & d0) = "1111" report "Count to 15 failed" severity error;
    assert tc = '1' report "TC not active at 15" severity error;
    wait for 10 ns;
    assert (d3 & d2 & d1 & d0) = "0000" report "Overflow to 0 failed" severity error;
    assert tc = '0' report "TC still active after overflow" severity error;
    
    -- Test 5: Count from 0 to 15 continuously (15 clock edges: counter reaches 1111)
    wait for 150 ns;
    assert (d3 & d2 & d1 & d0) = "1111" report "Count to 15 after 15 clocks failed" severity error;
    
    -- Test 6: Disable with enb_p = '0' (two clock edges): counter holds, TC stays active (ENT high, Q = 15)
    enb_p <= '0';
    enb_t <= '1';
    wait for 20 ns;
    assert (d3 & d2 & d1 & d0) = "1111" report "Counter should hold with enb_p low" severity error;
    assert tc = '1' report "TC should be active at 15 with enb_t high even though enb_p is low" severity error;
    
    -- Test 7: Disable with enb_t = '0' (two clock edges): counter holds, TC inactive
    enb_p <= '1';
    enb_t <= '0';
    wait for 20 ns;
    assert (d3 & d2 & d1 & d0) = "1111" report "Counter should hold with enb_t low" severity error;
    assert tc = '0' report "TC should be inactive with enb_t low" severity error;
    
    -- Test 8: Load has priority over counting
    enb_p <= '1';
    enb_t <= '1';
    i3 <= '1';
    i2 <= '0';
    i1 <= '1';
    i0 <= '0';
    pe_n <= '0';
    wait for 10 ns;
    assert (d3 & d2 & d1 & d0) = "1010" report "Load priority test failed" severity error;
    pe_n <= '1';
    
    -- Test 9: Clear has priority over load
    i3 <= '0';
    i2 <= '0';
    i1 <= '0';
    i0 <= '1';
    pe_n <= '0';
    clr_n <= '0';
    wait for 10 ns;
    assert (d3 & d2 & d1 & d0) = "0000" report "Clear priority over load test failed" severity error;
    clr_n <= '1';
    pe_n <= '1';
    
    -- Test 10: TC = ENT AND (Q = 15); ENP does not take part
    -- Load 15, then examine TC between clock edges (edges are at 5 ns mod 10 ns)
    i3 <= '1';
    i2 <= '1';
    i1 <= '1';
    i0 <= '1';
    pe_n <= '0';
    wait for 10 ns;
    pe_n <= '1';
    enb_p <= '1';
    enb_t <= '1';
    wait for 1 ns;
    assert (d3 & d2 & d1 & d0) = "1111" report "Load 15 failed" severity error;
    assert tc = '1' report "TC should be active at 15 with both enables high" severity error;
    
    -- ENP must not gate TC
    enb_p <= '0';
    wait for 1 ns;
    assert tc = '1' report "TC must be independent of enb_p" severity error;
    
    -- ENT does gate TC
    enb_t <= '0';
    wait for 1 ns;
    assert tc = '0' report "TC should be inactive with enb_t low" severity error;
    enb_t <= '1';
    wait for 10 ns;   -- one clock edge with enb_p low: counter holds at 15
    assert (d3 & d2 & d1 & d0) = "1111" report "Counter should hold at 15 with enb_p low" severity error;
    assert tc = '1' report "TC should be active at 15 with enb_t high and enb_p low" severity error;
    std.env.stop;
    
    wait;
  end process;

end;
