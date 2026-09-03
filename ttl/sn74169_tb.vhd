library ieee;
use ieee.std_logic_1164.all;

use std.env.all;

use work.sn74.all;

entity sn74169_tb is
end entity;

architecture testbench of sn74169_tb is

  signal clk     : std_logic;
  signal up_dn   : std_logic;
  signal load_n  : std_logic;
  signal enb_p_n : std_logic;
  signal enb_t_n : std_logic;
  signal o0      : std_logic;
  signal o1      : std_logic;
  signal o2      : std_logic;
  signal o3      : std_logic;
  signal i0      : std_logic;
  signal i1      : std_logic;
  signal i2      : std_logic;
  signal i3      : std_logic;
  signal co_n    : std_logic;

begin

  uut : sn74169 port map(
    co_n => co_n,
    i3   => i3,
    i2   => i2,
    i1   => i1,
    i0   => i0,

    o3 => o3,
    o2 => o2,
    o1 => o1,
    o0 => o0,

    enb_t_n => enb_t_n,
    enb_p_n => enb_p_n,
    load_n  => load_n,
    up_dn   => up_dn,
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
    up_dn <= '0';
    load_n <= '1';
    enb_p_n <= '1';
    enb_t_n <= '1';
    i3 <= '0';
    i2 <= '0';
    i1 <= '0';
    i0 <= '0';
    
    wait for 20 ns;
    
    -- Initialize counter to known state (load 0) since hardware starts undefined
    load_n <= '0';
    wait for 10 ns;
    load_n <= '1';
    wait for 10 ns;
    
    -- Test 1: Parallel load with value 5 (0101)
    i3 <= '0';
    i2 <= '1';
    i1 <= '0';
    i0 <= '1';
    load_n <= '0';
    wait for 10 ns;
    load_n <= '1';
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "0101" report "Load test failed" severity error;
    
    -- Test 2: Count up from 5
    up_dn <= '1';  -- up count
    enb_p_n <= '0';
    enb_t_n <= '0';
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "0110" report "Up count from 5 failed" severity error;
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "0111" report "Up count to 7 failed" severity error;
    
    -- Test 3: Load value 14 (1110) and test overflow
    enb_p_n <= '1';
    enb_t_n <= '1';
    i3 <= '1';
    i2 <= '1';
    i1 <= '1';
    i0 <= '0';
    load_n <= '0';
    wait for 10 ns;
    load_n <= '1';
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "1110" report "Load 14 failed" severity error;
    
    -- Enable counting and count to 15, then overflow to 0
    enb_p_n <= '0';
    enb_t_n <= '0';
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "1111" report "Count to 15 failed" severity error;
    assert co_n = '0' report "Carry out not active at 15" severity error;
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "0000" report "Overflow to 0 failed" severity error;
    assert co_n = '1' report "Carry out still active after overflow" severity error;
    
    -- Test 4: Count down from 2
    enb_p_n <= '1';
    enb_t_n <= '1';
    i3 <= '0';
    i2 <= '0';
    i1 <= '1';
    i0 <= '0';
    load_n <= '0';
    wait for 10 ns;
    load_n <= '1';
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "0010" report "Load 2 failed" severity error;
    
    up_dn <= '0';  -- down count
    enb_p_n <= '0';
    enb_t_n <= '0';
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "0001" report "Down count to 1 failed" severity error;
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "0000" report "Down count to 0 failed" severity error;
    assert co_n = '0' report "Carry out not active at 0 during down count" severity error;
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "1111" report "Underflow to 15 failed" severity error;
    assert co_n = '1' report "Carry out still active after underflow" severity error;
    
    -- Test 5: Disable with enb_p_n = '1'
    enb_p_n <= '1';
    enb_t_n <= '0';
    wait for 20 ns;
    assert (o3 & o2 & o1 & o0) = "1111" report "Count should be disabled with enb_p_n=1" severity error;
    
    -- Test 6: Disable with enb_t_n = '1'
    enb_p_n <= '0';
    enb_t_n <= '1';
    wait for 20 ns;
    assert (o3 & o2 & o1 & o0) = "1111" report "Count should be disabled with enb_t_n=1" severity error;
    
    -- Test 7: Load has priority over counting
    enb_p_n <= '0';
    enb_t_n <= '0';
    up_dn <= '1';
    i3 <= '1';
    i2 <= '0';
    i1 <= '1';
    i0 <= '0';
    load_n <= '0';
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "1010" report "Load priority test failed" severity error;
    load_n <= '1';
    
    -- Test 8: ripple carry output
    -- RCO_n = NOT(ENT_n = '0' AND ((U/D = '1' AND Q = 15) OR (U/D = '0' AND Q = 0)))
    -- ENP_n, LOAD_n and the data inputs must not take part.
    -- Load 15 (up mode, both enables low from test 7); clock edges are at 5 ns mod 10 ns
    i3 <= '1';
    i2 <= '1';
    i1 <= '1';
    i0 <= '1';
    load_n <= '0';
    wait for 10 ns;
    load_n <= '1';
    wait for 1 ns;
    assert (o3 & o2 & o1 & o0) = "1111" report "Load 15 failed" severity error;
    assert co_n = '0' report "RCO should be active at 15 in up mode with ENT_n low" severity error;

    -- ENP_n must not gate RCO (it stays high for the rest of the test, so the counter holds)
    enb_p_n <= '1';
    wait for 1 ns;
    assert co_n = '0' report "RCO must be independent of ENP_n" severity error;

    -- ENT_n does gate RCO
    enb_t_n <= '1';
    wait for 1 ns;
    assert co_n = '1' report "RCO should be inactive with ENT_n high" severity error;
    enb_t_n <= '0';
    wait for 1 ns;
    assert co_n = '0' report "RCO should be active again with ENT_n low" severity error;

    -- LOAD_n and the data inputs must not affect RCO before the clock edge:
    -- present 0000 with LOAD_n low in down mode while Q is still 1111
    wait for 6 ns;          -- past the clock edge (counter holds, ENP_n high)
    up_dn <= '0';
    i3 <= '0';
    i2 <= '0';
    i1 <= '0';
    i0 <= '0';
    load_n <= '0';
    wait for 1 ns;
    assert (o3 & o2 & o1 & o0) = "1111" report "Counter should still be 15 before the load edge" severity error;
    assert co_n = '1' report "RCO must not depend on LOAD_n or the data inputs: Q is 15 in down mode" severity error;
    load_n <= '1';          -- withdraw the load before the next clock edge
    wait for 10 ns;
    assert (o3 & o2 & o1 & o0) = "1111" report "Counter should hold with ENP_n high" severity error;

    -- Load 0 and check RCO in down mode, with the data inputs at 1111 and LOAD_n low again
    load_n <= '0';
    wait for 10 ns;
    load_n <= '1';
    i3 <= '1';
    i2 <= '1';
    i1 <= '1';
    i0 <= '1';
    wait for 1 ns;
    assert (o3 & o2 & o1 & o0) = "0000" report "Load 0 failed" severity error;
    assert co_n = '0' report "RCO should be active at 0 in down mode with ENT_n low" severity error;
    load_n <= '0';
    wait for 1 ns;
    assert co_n = '0' report "RCO must not depend on LOAD_n or the data inputs: Q is 0 in down mode" severity error;
    load_n <= '1';
    up_dn <= '1';
    wait for 1 ns;
    assert co_n = '1' report "RCO should be inactive at 0 in up mode" severity error;
    std.env.stop;
    
    wait;
  end process;

end;
