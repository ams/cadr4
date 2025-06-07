library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s373_tb is
end entity;

architecture test of dip_74s373_tb is

  -- dip_74s373 signals
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

  -- sn74373 signals
  signal hold_n_ttl : std_logic;
  signal oenb_n_ttl : std_logic;
  signal i0_ttl     : std_logic;
  signal i1_ttl     : std_logic;
  signal i2_ttl     : std_logic;
  signal i3_ttl     : std_logic;
  signal i4_ttl     : std_logic;
  signal i5_ttl     : std_logic;
  signal i6_ttl     : std_logic;
  signal i7_ttl     : std_logic;
  signal o0_ttl     : std_logic;
  signal o1_ttl     : std_logic;
  signal o2_ttl     : std_logic;
  signal o3_ttl     : std_logic;
  signal o4_ttl     : std_logic;
  signal o5_ttl     : std_logic;
  signal o6_ttl     : std_logic;
  signal o7_ttl     : std_logic;

  constant DELAY : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s373 : dip_74s373
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
  U_sn74373 : sn74373
    port map (
      hold_n => hold_n_ttl,
      oenb_n => oenb_n_ttl,
      i0     => i0_ttl,
      i1     => i1_ttl,
      i2     => i2_ttl,
      i3     => i3_ttl,
      i4     => i4_ttl,
      i5     => i5_ttl,
      i6     => i6_ttl,
      i7     => i7_ttl,
      o0     => o0_ttl,
      o1     => o1_ttl,
      o2     => o2_ttl,
      o3     => o3_ttl,
      o4     => o4_ttl,
      o5     => o5_ttl,
      o6     => o6_ttl,
      o7     => o7_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= oenb_n_ttl;
  p3_dip  <= i0_ttl;
  p4_dip  <= i1_ttl;
  p7_dip  <= i2_ttl;
  p8_dip  <= i3_ttl;
  p11_dip <= not hold_n_ttl;
  p13_dip <= i4_ttl;
  p14_dip <= i5_ttl;
  p17_dip <= i6_ttl;
  p18_dip <= i7_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p2_dip  = o0_ttl report "p2 mismatch"  severity failure;
    assert p5_dip  = o1_ttl report "p5 mismatch"  severity failure;
    assert p6_dip  = o2_ttl report "p6 mismatch"  severity failure;
    assert p9_dip  = o3_ttl report "p9 mismatch"  severity failure;
    assert p12_dip = o4_ttl report "p12 mismatch" severity failure;
    assert p15_dip = o5_ttl report "p15 mismatch" severity failure;
    assert p16_dip = o6_ttl report "p16 mismatch" severity failure;
    assert p19_dip = o7_ttl report "p19 mismatch" severity failure;
    wait;
  end process;

  -- Stimulus process
  process
    variable i_slv : std_logic_vector(7 downto 0);
    variable enb_slv : std_logic_vector(0 downto 0);
  begin
    for oenb in 0 to 1 loop
      for hold in 0 to 1 loop
        enb_slv := std_logic_vector(to_unsigned(oenb, 1));
        oenb_n_ttl <= enb_slv(0);
        enb_slv := std_logic_vector(to_unsigned(hold, 1));
        hold_n_ttl <= enb_slv(0);
        for i in 0 to 255 loop
          i_slv := std_logic_vector(to_unsigned(i, 8));
          i0_ttl <= i_slv(0);
          i1_ttl <= i_slv(1);
          i2_ttl <= i_slv(2);
          i3_ttl <= i_slv(3);
          i4_ttl <= i_slv(4);
          i5_ttl <= i_slv(5);
          i6_ttl <= i_slv(6);
          i7_ttl <= i_slv(7);
          wait for DELAY;
        end loop;
      end loop;
    end loop;

    report "dip_74s373_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 