library ieee;
use ieee.std_logic_1164.all;

library dip;
use dip.dip.all;

library ttl;
use ttl.other.all;

entity dip_25ls2519_tb is
end entity;

architecture test of dip_25ls2519_tb is
  -- dip_25ls2519 signals
  signal p1_dip  : std_logic;
  signal p2_dip  : std_logic;
  signal p3_dip  : std_logic;
  signal p4_dip  : std_logic;
  signal p5_dip  : std_logic;
  signal p6_dip  : std_logic;
  signal p7_dip  : std_logic;
  signal p8_dip  : std_logic;
  signal p9_dip  : std_logic;
  signal p11_dip : std_logic;
  signal p12_dip : std_logic;
  signal p13_dip : std_logic;
  signal p14_dip : std_logic;
  signal p15_dip : std_logic;
  signal p16_dip : std_logic;
  signal p17_dip : std_logic;
  signal p18_dip : std_logic;
  signal p19_dip : std_logic;

  -- am252519 signals
  signal i0_ttl         : std_logic;
  signal q0a_ttl        : std_logic;
  signal q0b_ttl        : std_logic;
  signal i1_ttl         : std_logic;
  signal q1a_ttl        : std_logic;
  signal q1b_ttl        : std_logic;
  signal o_enb_n_ttl    : std_logic;
  signal out_enb_n_ttl  : std_logic;
  signal clk_ttl        : std_logic;
  signal q2b_ttl        : std_logic;
  signal q2a_ttl        : std_logic;
  signal i2_ttl         : std_logic;
  signal q3b_ttl        : std_logic;
  signal q3a_ttl        : std_logic;
  signal i3_ttl         : std_logic;
  signal clk_enb_n_ttl  : std_logic;
  signal inv_ttl        : std_logic;
  signal asyn_clr_n_ttl : std_logic;

begin

  -- Instantiate wrapper
  U_dip_25ls2519 : dip_25ls2519
    port map (
      p1  => p1_dip,
      p2  => p2_dip,
      p3  => p3_dip,
      p4  => p4_dip,
      p5  => p5_dip,
      p6  => p6_dip,
      p7  => p7_dip,
      p8  => p8_dip,
      p9  => p9_dip,
      p11 => p11_dip,
      p12 => p12_dip,
      p13 => p13_dip,
      p14 => p14_dip,
      p15 => p15_dip,
      p16 => p16_dip,
      p17 => p17_dip,
      p18 => p18_dip,
      p19 => p19_dip
    );

  -- Instantiate original component
  U_am252519 : am252519
    port map (
      i0         => i0_ttl,
      q0a        => q0a_ttl,
      q0b        => q0b_ttl,
      i1         => i1_ttl,
      q1a        => q1a_ttl,
      q1b        => q1b_ttl,
      o_enb_n    => o_enb_n_ttl,
      out_enb_n  => out_enb_n_ttl,
      clk        => clk_ttl,
      q2b        => q2b_ttl,
      q2a        => q2a_ttl,
      i2         => i2_ttl,
      q3b        => q3b_ttl,
      q3a        => q3a_ttl,
      i3         => i3_ttl,
      clk_enb_n  => clk_enb_n_ttl,
      inv        => inv_ttl,
      asyn_clr_n => asyn_clr_n_ttl
    );

  -- Connect inputs
  p1_dip <= i0_ttl;
  p4_dip <= i1_ttl;
  p7_dip <= o_enb_n_ttl;
  p8_dip <= out_enb_n_ttl;
  p9_dip <= clk_ttl;
  p13_dip <= i2_ttl;
  p16_dip <= i3_ttl;
  p17_dip <= clk_enb_n_ttl;
  p18_dip <= inv_ttl;
  p19_dip <= asyn_clr_n_ttl;

  -- Verification process
  process
  begin
    -- Initialize signals
    clk_ttl <= '0';
    asyn_clr_n_ttl <= '1';
    clk_enb_n_ttl <= '1';
    o_enb_n_ttl <= '1';
    out_enb_n_ttl <= '1';
    inv_ttl <= '0';
    i3_ttl <= '0'; i2_ttl <= '0'; i1_ttl <= '0'; i0_ttl <= '0';
    wait for 10 ns;

    -- Test 1: Asynchronous clear
    asyn_clr_n_ttl <= '0';
    wait for 10 ns;
    asyn_clr_n_ttl <= '1';
    wait for 10 ns;
    assert p2_dip = q0a_ttl and p3_dip = q0b_ttl and p5_dip = q1a_ttl and p6_dip = q1b_ttl and p11_dip = q2b_ttl and p12_dip = q2a_ttl and p14_dip = q3b_ttl and p15_dip = q3a_ttl report "Clear failed" severity failure;

    -- Test 2: Load data into register
    clk_enb_n_ttl <= '0';
    i3_ttl <= '1'; i2_ttl <= '0'; i1_ttl <= '1'; i0_ttl <= '0';  -- Load 1010
    clk_ttl <= '1';
    wait for 10 ns;
    clk_ttl <= '0';
    wait for 10 ns;
    assert p2_dip = q0a_ttl and p3_dip = q0b_ttl and p5_dip = q1a_ttl and p6_dip = q1b_ttl and p11_dip = q2b_ttl and p12_dip = q2a_ttl and p14_dip = q3b_ttl and p15_dip = q3a_ttl report "Load failed" severity failure;
    
    report "dip_25ls2519 test passed.";
    wait;
  end process;

end architecture; 