library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ttl;
use ttl.other.all;

entity dm8221_tb is
end;

architecture testbench of dm8221_tb is

  signal d1     : std_logic;
  signal i1     : std_logic;
  signal we1_n  : std_logic;
  signal i0     : std_logic;
  signal d0     : std_logic;
  signal we0_n  : std_logic;
  signal a0     : std_logic;
  signal a1     : std_logic;
  signal a2     : std_logic;
  signal a3     : std_logic;
  signal a4     : std_logic;
  signal strobe : std_logic;
  signal wclk_n : std_logic;
  signal ce     : std_logic;

begin

  uut : dm8221 port map(
    d1     => d1,
    i1     => i1,
    we1_n  => we1_n,
    i0     => i0,
    d0     => d0,
    we0_n  => we0_n,
    a0     => a0,
    a1     => a1,
    a2     => a2,
    a3     => a3,
    a4     => a4,
    strobe => strobe,
    wclk_n => wclk_n,
    ce     => ce
    );

  process
  begin
    -- Initialize signals
    ce <= '0';
    strobe <= '0';
    wclk_n <= '1';
    we0_n <= '1';
    we1_n <= '1';
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0';
    i0 <= '0';
    i1 <= '0';
    wait for 10 ns;

    -- Test 1: Read with ce='0' should give high-Z
    ce <= '0';
    wait for 5 ns;
    assert d0 = 'Z' and d1 = 'Z' report "Test 1 failed" severity error;

    -- Test 2: Enable chip and test initial read (should be '00' from reset)
    ce <= '1';
    wait for 5 ns;
    assert d0 = '0' and d1 = '0' report "Test 2 failed" severity error;

    -- Test 3: Write bit 0 only at address 0
    ce <= '1';
    strobe <= '1';
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0'; -- address 0
    i0 <= '1';
    i1 <= '0';
    we0_n <= '0';  -- enable write to bit 0
    we1_n <= '1';  -- disable write to bit 1
    wait for 5 ns;
    wclk_n <= '0';  -- falling edge
    wait for 5 ns;
    wclk_n <= '1';
    we0_n <= '1';
    wait for 5 ns;
    assert d0 = '1' and d1 = '0' report "Test 3 failed" severity error;

    -- Test 4: Write bit 1 only at address 1 
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '1'; -- address 1
    i0 <= '0';
    i1 <= '1';
    we0_n <= '1';  -- disable write to bit 0
    we1_n <= '0';  -- enable write to bit 1
    wait for 5 ns;
    wclk_n <= '0';  -- falling edge
    wait for 5 ns;
    wclk_n <= '1';
    we1_n <= '1';
    wait for 5 ns;
    assert d0 = '0' and d1 = '1' report "Test 4 failed" severity error;

    -- Test 5: Write both bits at address 2
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '0'; -- address 2
    i0 <= '1';
    i1 <= '1';
    we0_n <= '0';  -- enable write to bit 0
    we1_n <= '0';  -- enable write to bit 1
    wait for 5 ns;
    wclk_n <= '0';  -- falling edge
    wait for 5 ns;
    wclk_n <= '1';
    we0_n <= '1';
    we1_n <= '1';
    wait for 5 ns;
    assert d0 = '1' and d1 = '1' report "Test 5 failed" severity error;

    -- Test 6: Address isolation - check previous addresses still hold their values
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0'; -- address 0
    wait for 5 ns;
    assert d0 = '1' and d1 = '0' report "Test 6a failed" severity error;
    
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '1'; -- address 1
    wait for 5 ns;
    assert d0 = '0' and d1 = '1' report "Test 6b failed" severity error;

    -- Test 7: Test strobe requirement
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '1'; -- address 3
    i0 <= '1';
    i1 <= '1';
    strobe <= '0';  -- disable strobe
    we0_n <= '0';
    we1_n <= '0';
    wait for 5 ns;
    wclk_n <= '0';  -- falling edge
    wait for 5 ns;
    wclk_n <= '1';
    wait for 5 ns;
    -- Should still be '00' (not written due to strobe=0)
    assert d0 = '0' and d1 = '0' report "Test 7 failed" severity error;

    -- Test 8: Test CE requirement for write
    strobe <= '1';  -- re-enable strobe
    ce <= '0';      -- disable chip enable
    wait for 5 ns;
    wclk_n <= '0';  -- falling edge
    wait for 5 ns;
    wclk_n <= '1';
    ce <= '1';      -- re-enable for read
    wait for 5 ns;
    -- Should still be '00' (not written due to ce=0 during write)
    assert d0 = '0' and d1 = '0' report "Test 8 failed" severity error;

    -- Test 9: Test different addresses
    for addr in 4 to 7 loop
      a4 <= std_logic(to_unsigned(addr, 5)(4));
      a3 <= std_logic(to_unsigned(addr, 5)(3));
      a2 <= std_logic(to_unsigned(addr, 5)(2));
      a1 <= std_logic(to_unsigned(addr, 5)(1));
      a0 <= std_logic(to_unsigned(addr, 5)(0));
      i0 <= std_logic(to_unsigned(addr mod 4, 2)(0));
      i1 <= std_logic(to_unsigned(addr mod 4, 2)(1));
      ce <= '1';
      strobe <= '1';
      we0_n <= '0';
      we1_n <= '0';
      wait for 5 ns;
      wclk_n <= '0';
      wait for 5 ns;
      wclk_n <= '1';
      wait for 5 ns;
      assert d0 = std_logic(to_unsigned(addr mod 4, 2)(0)) and 
             d1 = std_logic(to_unsigned(addr mod 4, 2)(1)) 
             report "Test 9 failed" severity error;
    end loop;
    
    we0_n <= '1';
    we1_n <= '1';

    -- Test 10: High address bits
    a4 <= '1'; a3 <= '1'; a2 <= '1'; a1 <= '1'; a0 <= '1'; -- address 31
    i0 <= '0';
    i1 <= '1';
    we0_n <= '0';
    we1_n <= '0';
    wait for 5 ns;
    wclk_n <= '0';
    wait for 5 ns;
    wclk_n <= '1';
    we0_n <= '1';
    we1_n <= '1';
    wait for 5 ns;
    assert d0 = '0' and d1 = '1' report "Test 10 failed" severity error;

    wait;
  end process;

end;
