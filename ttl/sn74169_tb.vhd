library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;

entity sn74169_tb is
end;

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
    
    -- Test 8: Carry output conditions
    -- Load 15 and check carry during up count
    i3 <= '1';
    i2 <= '1';
    i1 <= '1';
    i0 <= '1';
    load_n <= '0';
    wait for 10 ns;
    load_n <= '1';
    wait for 5 ns;
    assert co_n = '0' report "Carry should be active at 15 with up count enabled" severity error;
    
    -- Load 0 and check carry during down count
    up_dn <= '0';
    i3 <= '0';
    i2 <= '0';
    i1 <= '0';
    i0 <= '0';
    load_n <= '0';
    wait for 10 ns;
    load_n <= '1';
    wait for 5 ns;
    assert co_n = '0' report "Carry should be active at 0 with down count enabled" severity error;
    
    wait;
  end process;

end;
