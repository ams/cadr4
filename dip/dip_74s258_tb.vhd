library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s258_tb is
end entity;

architecture test of dip_74s258_tb is

  -- dip_74s258 signals
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

  -- sn74258 signals
  signal enb_n_ttl : std_logic;
  signal sel_ttl   : std_logic;
  signal a0_ttl    : std_logic;
  signal a1_ttl    : std_logic;
  signal ay_ttl    : std_logic;
  signal b0_ttl    : std_logic;
  signal b1_ttl    : std_logic;
  signal by_ttl    : std_logic;
  signal c0_ttl    : std_logic;
  signal c1_ttl    : std_logic;
  signal cy_ttl    : std_logic;
  signal d0_ttl    : std_logic;
  signal d1_ttl    : std_logic;
  signal dy_ttl    : std_logic;

  constant DELAY : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s258 : dip_74s258
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
  U_sn74258 : sn74258
    port map (
      enb_n => enb_n_ttl,
      sel   => sel_ttl,
      a0    => a0_ttl,
      a1    => a1_ttl,
      ay    => ay_ttl,
      b0    => b0_ttl,
      b1    => b1_ttl,
      by    => by_ttl,
      c0    => c0_ttl,
      c1    => c1_ttl,
      cy    => cy_ttl,
      d0    => d0_ttl,
      d1    => d1_ttl,
      dy    => dy_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= sel_ttl;
  p2_dip  <= d0_ttl;
  p3_dip  <= d1_ttl;
  p5_dip  <= c0_ttl;
  p6_dip  <= c1_ttl;
  p10_dip <= b1_ttl;
  p11_dip <= b0_ttl;
  p13_dip <= a1_ttl;
  p14_dip <= a0_ttl;
  p15_dip <= enb_n_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p4_dip  = dy_ttl report "p4 mismatch"  severity failure;
    assert p7_dip  = cy_ttl report "p7 mismatch"  severity failure;
    assert p9_dip  = by_ttl report "p9 mismatch"  severity failure;
    assert p12_dip = ay_ttl report "p12 mismatch" severity failure;
    wait;
  end process;

  -- Stimulus process
  process
    variable i_slv : std_logic_vector(9 downto 0);
  begin
    for i in 0 to 1023 loop
      i_slv := std_logic_vector(to_unsigned(i, 10));
      enb_n_ttl <= i_slv(0);
      sel_ttl   <= i_slv(1);
      a0_ttl    <= i_slv(2);
      a1_ttl    <= i_slv(3);
      b0_ttl    <= i_slv(4);
      b1_ttl    <= i_slv(5);
      c0_ttl    <= i_slv(6);
      c1_ttl    <= i_slv(7);
      d0_ttl    <= i_slv(8);
      d1_ttl    <= i_slv(9);
      wait for DELAY;
    end loop;

    report "dip_74s258_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 