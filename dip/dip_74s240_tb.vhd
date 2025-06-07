library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s240_tb is
end entity;

architecture test of dip_74s240_tb is

  -- dip_74s240 signals
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

  -- sn74240 signals
  signal aenb_n_ttl : std_logic;
  signal ain0_ttl   : std_logic;
  signal ain1_ttl   : std_logic;
  signal ain2_ttl   : std_logic;
  signal ain3_ttl   : std_logic;
  signal aout0_ttl  : std_logic;
  signal aout1_ttl  : std_logic;
  signal aout2_ttl  : std_logic;
  signal aout3_ttl  : std_logic;
  signal benb_n_ttl : std_logic;
  signal bin0_ttl   : std_logic;
  signal bin1_ttl   : std_logic;
  signal bin2_ttl   : std_logic;
  signal bin3_ttl   : std_logic;
  signal bout0_ttl  : std_logic;
  signal bout1_ttl  : std_logic;
  signal bout2_ttl  : std_logic;
  signal bout3_ttl  : std_logic;

  constant DELAY : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s240 : dip_74s240
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
  U_sn74240 : sn74240
    port map (
      aenb_n => aenb_n_ttl,
      ain0   => ain0_ttl,
      ain1   => ain1_ttl,
      ain2   => ain2_ttl,
      ain3   => ain3_ttl,
      aout0  => aout0_ttl,
      aout1  => aout1_ttl,
      aout2  => aout2_ttl,
      aout3  => aout3_ttl,
      benb_n => benb_n_ttl,
      bin0   => bin0_ttl,
      bin1   => bin1_ttl,
      bin2   => bin2_ttl,
      bin3   => bin3_ttl,
      bout0  => bout0_ttl,
      bout1  => bout1_ttl,
      bout2  => bout2_ttl,
      bout3  => bout3_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= aenb_n_ttl;
  p2_dip  <= ain0_ttl;
  p4_dip  <= ain1_ttl;
  p6_dip  <= ain2_ttl;
  p8_dip  <= ain3_ttl;
  p11_dip <= bin0_ttl;
  p13_dip <= bin1_ttl;
  p15_dip <= bin2_ttl;
  p17_dip <= bin3_ttl;
  p19_dip <= benb_n_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p3_dip  = bout3_ttl report "p3 mismatch"  severity failure;
    assert p5_dip  = bout2_ttl report "p5 mismatch"  severity failure;
    assert p7_dip  = bout1_ttl report "p7 mismatch"  severity failure;
    assert p9_dip  = bout0_ttl report "p9 mismatch"  severity failure;
    assert p12_dip = aout3_ttl report "p12 mismatch" severity failure;
    assert p14_dip = aout2_ttl report "p14 mismatch" severity failure;
    assert p16_dip = aout1_ttl report "p16 mismatch" severity failure;
    assert p18_dip = aout0_ttl report "p18 mismatch" severity failure;
    wait;
  end process;

  -- Stimulus process
  process
    variable i_slv : std_logic_vector(7 downto 0);
    variable enb_slv : std_logic_vector(0 downto 0);
  begin
    for aenb in 0 to 1 loop
      for benb in 0 to 1 loop
        enb_slv := std_logic_vector(to_unsigned(aenb, 1));
        aenb_n_ttl <= enb_slv(0);
        enb_slv := std_logic_vector(to_unsigned(benb, 1));
        benb_n_ttl <= enb_slv(0);
        for i in 0 to 255 loop
          i_slv := std_logic_vector(to_unsigned(i, 8));
          ain0_ttl <= i_slv(0);
          ain1_ttl <= i_slv(1);
          ain2_ttl <= i_slv(2);
          ain3_ttl <= i_slv(3);
          bin0_ttl <= i_slv(4);
          bin1_ttl <= i_slv(5);
          bin2_ttl <= i_slv(6);
          bin3_ttl <= i_slv(7);
          wait for DELAY;
        end loop;
      end loop;
    end loop;

    report "dip_74s240_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 