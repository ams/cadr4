library ieee;
use ieee.std_logic_1164.all;

library dip;
use dip.dip.all;

library ttl;
use ttl.other.all;

entity dip_2147_tb is
end entity;

architecture test of dip_2147_tb is
  -- dip_2147 signals
  signal p1_dip  : std_logic;
  signal p2_dip  : std_logic;
  signal p3_dip  : std_logic;
  signal p4_dip  : std_logic;
  signal p5_dip  : std_logic;
  signal p6_dip  : std_logic;
  signal p7_dip  : std_logic;
  signal p8_dip  : std_logic;
  signal p10_dip : std_logic;
  signal p11_dip : std_logic;
  signal p12_dip : std_logic;
  signal p13_dip : std_logic;
  signal p14_dip : std_logic;
  signal p15_dip : std_logic;
  signal p16_dip : std_logic;
  signal p17_dip : std_logic;

  -- am2147 signals
  signal a0_ttl   : std_logic;
  signal a1_ttl   : std_logic;
  signal a2_ttl   : std_logic;
  signal a3_ttl   : std_logic;
  signal a4_ttl   : std_logic;
  signal a5_ttl   : std_logic;
  signal do_ttl   : std_logic;
  signal we_n_ttl : std_logic;
  signal ce_n_ttl : std_logic;
  signal di_ttl   : std_logic;
  signal a11_ttl  : std_logic;
  signal a10_ttl  : std_logic;
  signal a9_ttl   : std_logic;
  signal a8_ttl   : std_logic;
  signal a7_ttl   : std_logic;
  signal a6_ttl   : std_logic;

begin

  -- Instantiate wrapper
  U_dip_2147 : dip_2147
    port map (
      p1  => p1_dip,
      p2  => p2_dip,
      p3  => p3_dip,
      p4  => p4_dip,
      p5  => p5_dip,
      p6  => p6_dip,
      p7  => p7_dip,
      p8  => p8_dip,
      p10 => p10_dip,
      p11 => p11_dip,
      p12 => p12_dip,
      p13 => p13_dip,
      p14 => p14_dip,
      p15 => p15_dip,
      p16 => p16_dip,
      p17 => p17_dip
    );

  -- Instantiate original component
  U_am2147 : am2147
    port map (
      a0   => a0_ttl,
      a1   => a1_ttl,
      a2   => a2_ttl,
      a3   => a3_ttl,
      a4   => a4_ttl,
      a5   => a5_ttl,
      do   => do_ttl,
      we_n => we_n_ttl,
      ce_n => ce_n_ttl,
      di   => di_ttl,
      a11  => a11_ttl,
      a10  => a10_ttl,
      a9   => a9_ttl,
      a8   => a8_ttl,
      a7   => a7_ttl,
      a6   => a6_ttl
    );

  -- connect inputs
  p1_dip <= a0_ttl;
  p2_dip <= a1_ttl;
  p3_dip <= a2_ttl;
  p4_dip <= a3_ttl;
  p5_dip <= a4_ttl;
  p6_dip <= a5_ttl;
  p8_dip <= we_n_ttl;
  p10_dip <= ce_n_ttl;
  p11_dip <= di_ttl;
  p12_dip <= a11_ttl;
  p13_dip <= a10_ttl;
  p14_dip <= a9_ttl;
  p15_dip <= a8_ttl;
  p16_dip <= a7_ttl;
  p17_dip <= a6_ttl;

  -- Verification process
  process
  begin
    -- Test 1: Initialize with chip disabled
    ce_n_ttl <= '1'; we_n_ttl <= '1'; di_ttl <= '0';
    a11_ttl <= '0'; a10_ttl <= '0'; a9_ttl <= '0'; a8_ttl <= '0';
    a7_ttl <= '0'; a6_ttl <= '0'; a5_ttl <= '0'; a4_ttl <= '0';
    a3_ttl <= '0'; a2_ttl <= '0'; a1_ttl <= '0'; a0_ttl <= '0';
    wait for 1 ns;
    assert p7_dip = do_ttl report "Output should be high-Z when chip disabled";

    -- Test 2: Write '1' to address 0
    ce_n_ttl <= '0'; we_n_ttl <= '0'; di_ttl <= '1';
    wait for 1 ns;
    assert p7_dip = do_ttl report "Data out mismatch during write";
    
    -- Test 3: Read from address 0
    we_n_ttl <= '1';
    wait for 1 ns;
    assert p7_dip = do_ttl report "Failed to read '1' from address 0";

    -- Test 4: Write '0' to address 1
    we_n_ttl <= '1'; -- Disable write first
    a0_ttl <= '1';   -- Change address
    wait for 1 ns;
    we_n_ttl <= '0'; di_ttl <= '0'; -- Enable write
    wait for 1 ns;
    assert p7_dip = do_ttl report "Data out mismatch during write";
    
    -- Test 5: Read from address 1
    we_n_ttl <= '1';
    wait for 1 ns;
    assert p7_dip = do_ttl report "Failed to read '0' from address 1";

    -- Test 6: Verify address 0 still contains '1'
    a0_ttl <= '0';
    wait for 1 ns;
    assert p7_dip = do_ttl report "Address 0 lost its data";

    -- Test 7: Test higher address (address 4095)
    we_n_ttl <= '1'; -- Disable write first
    a11_ttl <= '1'; a10_ttl <= '1'; a9_ttl <= '1'; a8_ttl <= '1';
    a7_ttl <= '1'; a6_ttl <= '1'; a5_ttl <= '1'; a4_ttl <= '1';
    a3_ttl <= '1'; a2_ttl <= '1'; a1_ttl <= '1'; a0_ttl <= '1';
    wait for 1 ns;
    we_n_ttl <= '0'; di_ttl <= '1'; -- Enable write
    wait for 1 ns;
    assert p7_dip = do_ttl report "Data out mismatch during write";
    
    we_n_ttl <= '1';
    wait for 1 ns;
    assert p7_dip = do_ttl report "Failed to write/read from max address";

    report "dip_2147 test passed.";
    wait;
  end process;

end architecture; 