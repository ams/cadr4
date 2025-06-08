library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s175_tb is
end entity;

architecture test of dip_74s175_tb is

  -- dip_74s175 signals
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

  -- sn74175 signals
  signal clr_n_ttl : std_logic;
  signal clk_ttl   : std_logic;
  signal d0_ttl    : std_logic;
  signal d1_ttl    : std_logic;
  signal d2_ttl    : std_logic;
  signal d3_ttl    : std_logic;
  signal q0_ttl    : std_logic;
  signal q0_n_ttl  : std_logic;
  signal q1_ttl    : std_logic;
  signal q1_n_ttl  : std_logic;
  signal q2_ttl    : std_logic;
  signal q2_n_ttl  : std_logic;
  signal q3_ttl    : std_logic;
  signal q3_n_ttl  : std_logic;

  constant CLK_PERIOD : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s175 : dip_74s175
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
  U_sn74175 : sn74175
    port map (
      clr_n => clr_n_ttl,
      clk   => clk_ttl,
      d0    => d0_ttl,
      d1    => d1_ttl,
      d2    => d2_ttl,
      d3    => d3_ttl,
      q0    => q0_ttl,
      q0_n  => q0_n_ttl,
      q1    => q1_ttl,
      q1_n  => q1_n_ttl,
      q2    => q2_ttl,
      q2_n  => q2_n_ttl,
      q3    => q3_ttl,
      q3_n  => q3_n_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= clr_n_ttl;
  p4_dip  <= d0_ttl;
  p5_dip  <= d1_ttl;
  p9_dip  <= clk_ttl;
  p12_dip <= d2_ttl;
  p13_dip <= d3_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p2_dip  = q0_ttl   report "p2 mismatch"  severity failure;
    assert p3_dip  = q0_n_ttl report "p3 mismatch"  severity failure;
    assert p6_dip  = q1_n_ttl report "p6 mismatch"  severity failure;
    assert p7_dip  = q1_ttl   report "p7 mismatch"  severity failure;
    assert p10_dip = q2_ttl   report "p10 mismatch" severity failure;
    assert p11_dip = q2_n_ttl report "p11 mismatch" severity failure;
    assert p14_dip = q3_n_ttl report "p14 mismatch" severity failure;
    assert p15_dip = q3_ttl   report "p15 mismatch" severity failure;
    wait;
  end process;

  -- Clock generation
  process
  begin
    while not test_finished loop
      clk_ttl <= '0';
      wait for CLK_PERIOD / 2;
      clk_ttl <= '1';
      wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- Stimulus process
  process
    variable i_slv : std_logic_vector(3 downto 0);
  begin
    -- Test clear
    clr_n_ttl <= '0';
    d0_ttl <= 'X';
    d1_ttl <= 'X';
    d2_ttl <= 'X';
    d3_ttl <= 'X';
    wait for CLK_PERIOD;
    clr_n_ttl <= '1';
    wait for CLK_PERIOD;

    -- Test data
    for i in 0 to 15 loop
      i_slv := std_logic_vector(to_unsigned(i, 4));
      d0_ttl <= i_slv(0);
      d1_ttl <= i_slv(1);
      d2_ttl <= i_slv(2);
      d3_ttl <= i_slv(3);
      wait for CLK_PERIOD;
    end loop;

    -- report "dip_74s175_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 