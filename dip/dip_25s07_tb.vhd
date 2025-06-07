library ieee;
use ieee.std_logic_1164.all;

library dip;
use dip.dip.all;

library ttl;
use ttl.other.all;

entity dip_25s07_tb is
end entity;

architecture test of dip_25s07_tb is
  -- dip_25s07 signals
  signal p1_dip  : std_logic;
  signal p2_dip  : std_logic;
  signal p3_dip  : std_logic;
  signal p4_dip  : std_logic;
  signal p5_dip  : std_logic;
  signal p6_dip  : std_logic;
  signal p7_dip  : std_logic;
  signal p9_dip  : std_logic;
  signal p10_dip : std_logic;
  signal p11_dip : std_logic;
  signal p12_dip : std_logic;
  signal p13_dip : std_logic;
  signal p14_dip : std_logic;
  signal p15_dip : std_logic;

  -- am2507 signals
  signal enb_n_ttl : std_logic;
  signal d0_ttl    : std_logic;
  signal i0_ttl    : std_logic;
  signal i1_ttl    : std_logic;
  signal d1_ttl    : std_logic;
  signal i2_ttl    : std_logic;
  signal d2_ttl    : std_logic;
  signal clk_ttl   : std_logic;
  signal d3_ttl    : std_logic;
  signal i3_ttl    : std_logic;
  signal d4_ttl    : std_logic;
  signal i4_ttl    : std_logic;
  signal i5_ttl    : std_logic;
  signal d5_ttl    : std_logic;

begin

  -- Instantiate wrapper
  U_dip_25s07 : dip_25s07
    port map (
      p1  => p1_dip,
      p2  => p2_dip,
      p3  => p3_dip,
      p4  => p4_dip,
      p5  => p5_dip,
      p6  => p6_dip,
      p7  => p7_dip,
      p9  => p9_dip,
      p10 => p10_dip,
      p11 => p11_dip,
      p12 => p12_dip,
      p13 => p13_dip,
      p14 => p14_dip,
      p15 => p15_dip
    );

  -- Instantiate original component
  U_am2507 : am2507
    port map (
      enb_n => enb_n_ttl,
      d0    => d0_ttl,
      i0    => i0_ttl,
      i1    => i1_ttl,
      d1    => d1_ttl,
      i2    => i2_ttl,
      d2    => d2_ttl,
      clk   => clk_ttl,
      d3    => d3_ttl,
      i3    => i3_ttl,
      d4    => d4_ttl,
      i4    => i4_ttl,
      i5    => i5_ttl,
      d5    => d5_ttl
    );

  -- Connect inputs
  p1_dip <= enb_n_ttl;
  p3_dip <= i0_ttl;
  p4_dip <= i1_ttl;
  p6_dip <= i2_ttl;
  p9_dip <= clk_ttl;
  p11_dip <= i3_ttl;
  p13_dip <= i4_ttl;
  p14_dip <= i5_ttl;

  -- Verification process
  process
  begin
    -- Initialize
    clk_ttl <= '0'; enb_n_ttl <= '1';
    i0_ttl <= '0'; i1_ttl <= '0'; i2_ttl <= '0'; i3_ttl <= '0'; i4_ttl <= '0'; i5_ttl <= '0';
    wait for 1 ns;

    -- Test 1: Load data with enable disabled (should not change outputs)
    i0_ttl <= '1'; i1_ttl <= '1'; i2_ttl <= '1'; i3_ttl <= '1'; i4_ttl <= '1'; i5_ttl <= '1';
    clk_ttl <= '1'; wait for 1 ns; clk_ttl <= '0'; wait for 1 ns;
    assert p2_dip = d0_ttl and p5_dip = d1_ttl and p7_dip = d2_ttl and p10_dip = d3_ttl and p12_dip = d4_ttl and p15_dip = d5_ttl report "Outputs changed while disabled" severity failure;

    -- Test 2: Load data with enable active
    enb_n_ttl <= '0';
    clk_ttl <= '1'; wait for 1 ns; clk_ttl <= '0'; wait for 1 ns;
    assert p2_dip = d0_ttl and p5_dip = d1_ttl and p7_dip = d2_ttl and p10_dip = d3_ttl and p12_dip = d4_ttl and p15_dip = d5_ttl report "Load failed" severity failure;

    report "dip_25s07 test passed.";
    wait;
  end process;

end architecture; 