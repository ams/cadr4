library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s283_tb is
end entity;

architecture test of dip_74s283_tb is

  -- dip_74s283 signals
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

  -- sn74283 signals
  signal c0_ttl : std_logic;
  signal a0_ttl : std_logic;
  signal a1_ttl : std_logic;
  signal a2_ttl : std_logic;
  signal a3_ttl : std_logic;
  signal b0_ttl : std_logic;
  signal b1_ttl : std_logic;
  signal b2_ttl : std_logic;
  signal b3_ttl : std_logic;
  signal s0_ttl : std_logic;
  signal s1_ttl : std_logic;
  signal s2_ttl : std_logic;
  signal s3_ttl : std_logic;
  signal c4_ttl : std_logic;

  constant DELAY : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s283 : dip_74s283
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
  U_sn74283 : sn74283
    port map (
      c0 => c0_ttl,
      a0 => a0_ttl,
      a1 => a1_ttl,
      a2 => a2_ttl,
      a3 => a3_ttl,
      b0 => b0_ttl,
      b1 => b1_ttl,
      b2 => b2_ttl,
      b3 => b3_ttl,
      s0 => s0_ttl,
      s1 => s1_ttl,
      s2 => s2_ttl,
      s3 => s3_ttl,
      c4 => c4_ttl
      );

  -- Connect dip and ttl component inputs
  -- p1 is s1
  p2_dip  <= b1_ttl;
  p3_dip  <= a1_ttl;
  -- p4 is s0
  p5_dip  <= a0_ttl;
  p6_dip  <= b0_ttl;
  p7_dip  <= c0_ttl;
  -- p9 is c4
  -- p10 is s3
  p11_dip <= b3_ttl;
  p12_dip <= a3_ttl;
  -- p13 is s2
  p14_dip <= a2_ttl;
  p15_dip <= b2_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p1_dip = s1_ttl   report "p1 mismatch" severity failure;
    assert p4_dip = s0_ttl   report "p4 mismatch" severity failure;
    assert p9_dip = c4_ttl   report "p9 mismatch" severity failure;
    assert p10_dip = s3_ttl  report "p10 mismatch" severity failure;
    assert p13_dip = s2_ttl  report "p13 mismatch" severity failure;
    wait;
  end process;

  -- Stimulus process
  process
    variable i_slv : std_logic_vector(8 downto 0);
  begin
    for i in 0 to 511 loop
      i_slv := std_logic_vector(to_unsigned(i, 9));
      a0_ttl <= i_slv(0);
      a1_ttl <= i_slv(1);
      a2_ttl <= i_slv(2);
      a3_ttl <= i_slv(3);
      b0_ttl <= i_slv(4);
      b1_ttl <= i_slv(5);
      b2_ttl <= i_slv(6);
      b3_ttl <= i_slv(7);
      c0_ttl <= i_slv(8);
      wait for DELAY;
    end loop;

    report "dip_74s283_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 