library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.signetics.n82s21;

entity n82s21_tb is
end entity;

architecture testbench of n82s21_tb is

  signal d1        : std_logic;
  signal i1        : std_logic;
  signal we1_n     : std_logic;
  signal i0        : std_logic;
  signal d0        : std_logic;
  signal we0_n     : std_logic;
  signal a0        : std_logic;
  signal a1        : std_logic;
  signal a2        : std_logic;
  signal a3        : std_logic;
  signal a4        : std_logic;
  signal latch_n   : std_logic;
  signal wclk_n    : std_logic;
  signal ce        : std_logic;

begin

  uut : n82s21 port map(
    d1      => d1,
    i1      => i1,
    we1_n   => we1_n,
    i0      => i0,
    d0      => d0,
    we0_n   => we0_n,
    a0      => a0,
    a1      => a1,
    a2      => a2,
    a3      => a3,
    a4      => a4,
    latch_n => latch_n,
    wclk_n  => wclk_n,
    ce      => ce
    );

  process
  begin
    -- Initialize signals
    ce <= '0';
    latch_n <= '1';  -- Start with latch transparent (live data)
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

    -- Test 2: Write both bits at address 0 first (to initialize it)
    ce <= '1';
    latch_n <= '1';  -- Keep latch transparent
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0'; -- address 0
    i0 <= '1';
    i1 <= '0';
    we0_n <= '0';  -- enable write to bit 0
    we1_n <= '0';  -- enable write to bit 1
    wait for 5 ns;
    wclk_n <= '0';  -- falling edge
    wait for 5 ns;
    wclk_n <= '1';
    we0_n <= '1';
    we1_n <= '1';
    wait for 5 ns;
    assert d0 = 'Z' and d1 = '0' report "Test 2 failed" severity error;

    -- Test 3: Write both bits at address 1 
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '1'; -- address 1
    i0 <= '0';
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
    assert d0 = '0' and d1 = 'Z' report "Test 3 failed" severity error;

    -- Test 4: Write both bits at address 2
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
    assert d0 = 'Z' and d1 = 'Z' report "Test 4 failed" severity error;

    -- Test 5: Write zeros to test driving low
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '1'; a0 <= '1'; -- address 3
    i0 <= '0';
    i1 <= '0';
    we0_n <= '0';  -- enable write to bit 0
    we1_n <= '0';  -- enable write to bit 1
    wait for 5 ns;
    wclk_n <= '0';  -- falling edge
    wait for 5 ns;
    wclk_n <= '1';
    we0_n <= '1';
    we1_n <= '1';
    wait for 5 ns;
    assert d0 = '0' and d1 = '0' report "Test 5 failed" severity error;

    -- Test 6: Address isolation - check previous addresses still hold their values
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '0'; -- address 0
    wait for 5 ns;
    assert d0 = 'Z' and d1 = '0' report "Test 6a failed" severity error;
    
    a4 <= '0'; a3 <= '0'; a2 <= '0'; a1 <= '0'; a0 <= '1'; -- address 1
    wait for 5 ns;
    assert d0 = '0' and d1 = 'Z' report "Test 6b failed" severity error;

    -- Test 7: Test latch behavior - first write known data to address 4
    a4 <= '0'; a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '0'; -- address 4
    latch_n <= '1';  -- transparent mode
    i0 <= '0';  -- write known values first
    i1 <= '0';
    we0_n <= '0';
    we1_n <= '0';
    wait for 5 ns;
    wclk_n <= '0';  -- write the initial data
    wait for 5 ns;
    wclk_n <= '1';
    we0_n <= '1';
    we1_n <= '1';
    wait for 5 ns;
    -- Now we know memory at address 4 contains '0','0', so outputs should be '0'
    assert d0 = '0' and d1 = '0' report "Test 7a failed" severity error;
    
    -- Now latch this data
    latch_n <= '0';  -- latch the current '0' values
    wait for 5 ns;
    -- Should still see '0' (now latched)
    assert d0 = '0' and d1 = '0' report "Test 7b failed" severity error;
    
    -- Write new data while in latch mode
    i0 <= '1';  -- write '1' to bit 0
    i1 <= '1';  -- write '1' to bit 1
    we0_n <= '0';
    we1_n <= '0';
    wait for 5 ns;
    wclk_n <= '0';  -- falling edge - write should work
    wait for 5 ns;
    wclk_n <= '1';
    we0_n <= '1';
    we1_n <= '1';
    wait for 5 ns;
    -- Should still see latched '0' values, not the new written '1' values
    assert d0 = '0' and d1 = '0' report "Test 7c failed" severity error;
    
    -- Now switch to transparent mode to see the written data
    latch_n <= '1';
    wait for 5 ns;
    -- Should see the newly written data: '1' -> 'Z' for open-collector
    assert d0 = 'Z' and d1 = 'Z' report "Test 7d failed" severity error;

    -- Test 8: Test CE requirement for write
    latch_n <= '1';  -- re-enable latch
    ce <= '0';      -- disable chip enable
    i0 <= '0';      -- try to write '0' to both bits
    i1 <= '0';
    we0_n <= '0';
    we1_n <= '0';
    wait for 5 ns;
    wclk_n <= '0';  -- falling edge - should not write due to ce=0
    wait for 5 ns;
    wclk_n <= '1';
    we0_n <= '1';
    we1_n <= '1';
    ce <= '1';      -- re-enable for read
    wait for 5 ns;
    -- Should still see the values from Test 7 (not written due to ce=0 during write)
    assert d0 = 'Z' and d1 = 'Z' report "Test 8 failed" severity error;

    -- Test 9: Test different addresses with mixed values
    for addr in 5 to 7 loop
      a4 <= std_logic(to_unsigned(addr, 5)(4));
      a3 <= std_logic(to_unsigned(addr, 5)(3));
      a2 <= std_logic(to_unsigned(addr, 5)(2));
      a1 <= std_logic(to_unsigned(addr, 5)(1));
      a0 <= std_logic(to_unsigned(addr, 5)(0));
      i0 <= std_logic(to_unsigned(addr mod 4, 2)(0));
      i1 <= std_logic(to_unsigned(addr mod 4, 2)(1));
      ce <= '1';
      latch_n <= '1';
      we0_n <= '0';
      we1_n <= '0';
      wait for 5 ns;
      wclk_n <= '0';
      wait for 5 ns;
      wclk_n <= '1';
      we0_n <= '1';
      we1_n <= '1';
      wait for 5 ns;
      -- Check expected values based on open-collector behavior
      if std_logic(to_unsigned(addr mod 4, 2)(0)) = '0' then
        assert d0 = '0' report "Test 9a failed" severity error;
      else
        assert d0 = 'Z' report "Test 9b failed" severity error;
      end if;
      if std_logic(to_unsigned(addr mod 4, 2)(1)) = '0' then
        assert d1 = '0' report "Test 9c failed" severity error;
      else
        assert d1 = 'Z' report "Test 9d failed" severity error;
      end if;
    end loop;

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
    assert d0 = '0' and d1 = 'Z' report "Test 10 failed" severity error;

    -- Test 11: Test latch functionality - write data and then latch it
    a4 <= '0'; a3 <= '0'; a2 <= '1'; a1 <= '0'; a0 <= '1'; -- address 5 (already written in Test 9)
    latch_n <= '1';  -- transparent mode
    wait for 5 ns;
    -- Address 5: addr mod 4 = 1, so i0='1', i1='0' was written
    assert d0 = 'Z' and d1 = '0' report "Test 11a failed" severity error;
    
    -- Now latch the data
    latch_n <= '0';  -- latch the current data
    wait for 5 ns;
    -- Should still see the same data (now latched)
    assert d0 = 'Z' and d1 = '0' report "Test 11b failed" severity error;
    
    -- Change memory content while latch is active
    i0 <= '0';
    i1 <= '1';
    latch_n <= '1';  -- temporarily go transparent to write new data
    we0_n <= '0';
    we1_n <= '0';
    wait for 5 ns;
    wclk_n <= '0';  -- write new data
    wait for 5 ns;
    wclk_n <= '1';
    we0_n <= '1';
    we1_n <= '1';
    latch_n <= '0';  -- go back to latched mode - this latches the NEW memory content
    wait for 5 ns;
    -- Should see the newly latched data: d0='0' (from '0'), d1='Z' (from '1')
    assert d0 = '0' and d1 = 'Z' report "Test 11c failed" severity error;
    
    -- Test 12: Test transition from latched to transparent
    latch_n <= '1';  -- go transparent
    wait for 5 ns;
    -- Now should see the new memory content: d0='0' (from '0'), d1='Z' (from '1')
    assert d0 = '0' and d1 = 'Z' report "Test 12 failed" severity error;

    -- Test 13: Test timing sequence - data input changes, address changes, then wclk
    -- Setup: we's=0, latch=1 throughout, ce=1
    ce <= '1';
    latch_n <= '1';  -- transparent mode throughout
    we0_n <= '0';    -- enable writes throughout
    we1_n <= '0';
    wclk_n <= '1';   -- start with wclk high
    
    -- Step 1: Change data inputs first
    i0 <= '1';  -- set data to write
    i1 <= '0';
    wait for 5 ns;
    
    -- Step 2: Change address (to a fresh address we haven't used)
    a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '0'; -- address 8
    wait for 5 ns;
    -- At this point, we should see whatever was previously stored at address 8 (likely 'Z','Z' if uninitialized)
    
    -- Step 3: Now bring wclk down to perform the write
    wclk_n <= '0';  -- falling edge - this should write i0='1', i1='0' to address 8
    wait for 5 ns;
    -- The write is level sensitive and the latch is transparent (L=1):
    -- the data being written is visible at the outputs right away
    -- (truth table: CE=1, C=0, W=0, L=1 -> "Data being written into memory").
    -- d0 shows 'Z' (from i0='1'), d1 shows '0' (from i1='0')
    assert d0 = 'Z' and d1 = '0' report "Test 13a: Write not immediately reflected" severity error;
    
    -- Step 4: Complete the write cycle
    wclk_n <= '1';
    wait for 5 ns;
    -- Should definitely see the written data now
    assert d0 = 'Z' and d1 = '0' report "Test 13b: Write not visible after wclk cycle" severity error;
    
    -- Step 5: Change address to see if outputs change to something else
    a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '1'; -- address 9 (uninitialized)
    wait for 5 ns;
    -- Address 9 was never written: uninitialised memory reads 'U' in this
    -- project (load_hex_file with an empty file name)
    assert d0 = 'U' and d1 = 'U' report "Test 13c: Address change not reflected in outputs" severity error;
    
    -- Step 6: Go back to address 8 to confirm our write is still there
    a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '0'; -- address 8
    wait for 5 ns;
    -- Should see our written data again
    assert d0 = 'Z' and d1 = '0' report "Test 13d: Written data lost" severity error;
    
    -- Step 7: Write different data to address 9 using the same sequence
    -- Change data first
    i0 <= '0';  -- different data
    i1 <= '1';
    wait for 5 ns;
    
    -- Change address
    a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '1'; -- address 9
    wait for 5 ns;
    
    -- Write with wclk
    wclk_n <= '0';  -- write i0='0', i1='1' to address 9
    wait for 5 ns;
    -- Check immediate reflection
    assert d0 = '0' and d1 = 'Z' report "Test 13e: Second write not immediately reflected" severity error;
    
    wclk_n <= '1';
    wait for 5 ns;
    assert d0 = '0' and d1 = 'Z' report "Test 13f: Second write not visible after wclk cycle" severity error;
    
    -- Final verification: toggle between addresses to see both values
    a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '0'; -- address 8
    wait for 5 ns;
    assert d0 = 'Z' and d1 = '0' report "Test 13g: First address data corrupted" severity error;
    
    a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '0'; a0 <= '1'; -- address 9
    wait for 5 ns;
    assert d0 = '0' and d1 = 'Z' report "Test 13h: Second address data corrupted" severity error;
    
    -- Test 14: the write is level sensitive. While C and W are low the
    -- addressed word follows the data inputs; the data present when the write
    -- window closes is what stays stored. Changing the address while the
    -- window is open writes the new address as well.
    ce <= '1';
    latch_n <= '1';
    we0_n <= '0';
    we1_n <= '0';
    wclk_n <= '1';
    i0 <= '0'; i1 <= '0';
    a4 <= '0'; a3 <= '1'; a2 <= '0'; a1 <= '1'; a0 <= '0'; -- address 10
    wait for 5 ns;
    wclk_n <= '0';  -- open the write window
    wait for 5 ns;
    assert d0 = '0' and d1 = '0' report "Test 14a: address 10 not written with 00" severity error;
    -- change the data while the window is open: the stored word follows
    i0 <= '1'; i1 <= '0';
    wait for 5 ns;
    assert d0 = 'Z' and d1 = '0' report "Test 14b: data change during write not stored" severity error;
    -- change the address while the window is open: address 11 is written too
    a0 <= '1'; -- address 11
    wait for 5 ns;
    assert d0 = 'Z' and d1 = '0' report "Test 14c: address 11 not written during write" severity error;
    i0 <= '0'; i1 <= '1';
    wait for 5 ns;
    assert d0 = '0' and d1 = 'Z' report "Test 14d: data change during write not stored" severity error;
    wclk_n <= '1';  -- close the write window
    wait for 5 ns;
    assert d0 = '0' and d1 = 'Z' report "Test 14e: address 11 after write" severity error;
    a0 <= '0'; -- address 10
    wait for 5 ns;
    assert d0 = 'Z' and d1 = '0' report "Test 14f: address 10 must hold the last data written before the address change" severity error;
    -- data changes with the window closed do not write
    i0 <= '1'; i1 <= '1';
    wait for 5 ns;
    assert d0 = 'Z' and d1 = '0' report "Test 14g: write with C high" severity error;

    -- Test 15: address changed in the same simulation step as the write
    -- strobe falls: the new address (12) is written, address 11 is untouched
    a2 <= '1'; a1 <= '0'; a0 <= '0'; -- address 12
    wclk_n <= '0';
    wait for 5 ns;
    wclk_n <= '1';
    wait for 5 ns;
    assert d0 = 'Z' and d1 = 'Z' report "Test 15a: address 12 not written" severity error;
    a2 <= '0'; a1 <= '1'; a0 <= '1'; -- address 11
    wait for 5 ns;
    assert d0 = '0' and d1 = 'Z' report "Test 15b: address 11 corrupted by write to address 12" severity error;
    we0_n <= '1';
    we1_n <= '1';

    -- Test 16: output hold. With L=0 the outputs keep the latched word
    -- regardless of CE and of the address (truth table: CE=X, L=0).
    a2 <= '0'; a1 <= '1'; a0 <= '0'; -- address 10: 1,0
    latch_n <= '1';
    wait for 5 ns;
    assert d0 = 'Z' and d1 = '0' report "Test 16a: read address 10" severity error;
    latch_n <= '0';  -- latch
    wait for 5 ns;
    ce <= '0';       -- disable the chip: outputs still hold
    wait for 5 ns;
    assert d0 = 'Z' and d1 = '0' report "Test 16b: latched outputs must hold with CE=0" severity error;
    a0 <= '1';       -- address 11: 0,1 - not visible while latched
    wait for 5 ns;
    assert d0 = 'Z' and d1 = '0' report "Test 16c: latched outputs must hold on address change" severity error;
    latch_n <= '1';  -- unlatch with CE=0: outputs disabled
    wait for 5 ns;
    assert d0 = 'Z' and d1 = 'Z' report "Test 16d: CE=0, L=1 must disable the outputs" severity error;
    ce <= '1';       -- live data of address 11
    wait for 5 ns;
    assert d0 = '0' and d1 = 'Z' report "Test 16e: read address 11" severity error;

    wait;
  end process;

end;
