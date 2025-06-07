library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s472_tb is
end entity;

architecture test of dip_74s472_tb is

  -- dip_74s472 signals
  signal p1_dip  : std_logic;
  signal p2_dip  : std_logic;
  signal p3_dip  : std_logic;
  signal p4_dip  : std_logic;
  signal p5_dip  : std_logic;
  signal p6_dip  : std_logic;
  signal p7_dip  : std_logic;
  signal p8_dip  : std_logic;
  signal p9_dip  : std_logic;
  signal p10_dip : std_logic;
  signal p11_dip : std_logic;
  signal p12_dip : std_logic;
  signal p13_dip : std_logic;
  signal p14_dip : std_logic;
  signal p15_dip : std_logic;
  signal p16_dip : std_logic;
  signal p17_dip : std_logic;
  signal p18_dip : std_logic;
  signal p19_dip : std_logic;
  signal p20_dip : std_logic;

  -- dm74s472 signals
  signal a0_ttl   : std_logic;
  signal a1_ttl   : std_logic;
  signal a2_ttl   : std_logic;
  signal a3_ttl   : std_logic;
  signal a4_ttl   : std_logic;
  signal a5_ttl   : std_logic;
  signal a6_ttl   : std_logic;
  signal a7_ttl   : std_logic;
  signal a8_ttl   : std_logic;
  signal d0_ttl   : std_logic;
  signal d1_ttl   : std_logic;
  signal d2_ttl   : std_logic;
  signal d3_ttl   : std_logic;
  signal d4_ttl   : std_logic;
  signal d5_ttl   : std_logic;
  signal d6_ttl   : std_logic;
  signal d7_ttl   : std_logic;
  signal ce_n_ttl : std_logic;

  constant DELAY : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s472 : entity work.dip_74s472
    generic map (
      fn => ""
      )
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
      p10 => p10_dip,
      p11 => p11_dip,
      p12 => p12_dip,
      p13 => p13_dip,
      p14 => p14_dip,
      p15 => p15_dip,
      p16 => p16_dip,
      p17 => p17_dip,
      p18 => p18_dip,
      p19 => p19_dip,
      p20 => p20_dip
      );

  -- Instantiate original component
  U_dm74s472 : entity work.dm74s472
    generic map (
      fn => "proms/74s472.rom"
      )
    port map (
      a0   => a0_ttl,
      a1   => a1_ttl,
      a2   => a2_ttl,
      a3   => a3_ttl,
      a4   => a4_ttl,
      a5   => a5_ttl,
      a6   => a6_ttl,
      a7   => a7_ttl,
      a8   => a8_ttl,
      d0   => d0_ttl,
      d1   => d1_ttl,
      d2   => d2_ttl,
      d3   => d3_ttl,
      d4   => d4_ttl,
      d5   => d5_ttl,
      d6   => d6_ttl,
      d7   => d7_ttl,
      ce_n => ce_n_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= a8_ttl;
  p2_dip  <= a7_ttl;
  p3_dip  <= a6_ttl;
  p4_dip  <= a5_ttl;
  p5_dip  <= a4_ttl;
  p6_dip  <= a3_ttl;
  p7_dip  <= a2_ttl;
  p8_dip  <= a1_ttl;
  p9_dip  <= a0_ttl;
  p10_dip <= '0';
  p19_dip <= ce_n_ttl;
  p20_dip <= '1';


  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p11_dip = d0_ttl   report "p11 mismatch" severity failure;
    assert p12_dip = d1_ttl   report "p12 mismatch" severity failure;
    assert p13_dip = d2_ttl   report "p13 mismatch" severity failure;
    assert p14_dip = d3_ttl   report "p14 mismatch" severity failure;
    assert p15_dip = d4_ttl  report "p15 mismatch" severity failure;
    assert p16_dip = d5_ttl  report "p16 mismatch" severity failure;
    assert p17_dip = d6_ttl  report "p17 mismatch" severity failure;
    assert p18_dip = d7_ttl  report "p18 mismatch" severity failure;
    wait;
  end process;

  -- Stimulus process
  process
    variable i_slv : std_logic_vector(8 downto 0);
  begin
    ce_n_ttl <= '0';
    for i in 0 to 511 loop
      i_slv := std_logic_vector(to_unsigned(i, 9));
      a0_ttl <= i_slv(0);
      a1_ttl <= i_slv(1);
      a2_ttl <= i_slv(2);
      a3_ttl <= i_slv(3);
      a4_ttl <= i_slv(4);
      a5_ttl <= i_slv(5);
      a6_ttl <= i_slv(6);
      a7_ttl <= i_slv(7);
      a8_ttl <= i_slv(8);
      wait for DELAY;
    end loop;
    ce_n_ttl <= '1';
    wait for DELAY;

    report "dip_74s472_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 