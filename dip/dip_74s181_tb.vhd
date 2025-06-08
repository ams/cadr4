library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s181_tb is
end entity;

architecture test of dip_74s181_tb is

  -- dip_74s181 signals
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
  signal p13_dip : std_logic;
  signal p14_dip : std_logic;
  signal p15_dip : std_logic;
  signal p16_dip : std_logic;
  signal p17_dip : std_logic;
  signal p18_dip : std_logic;
  signal p19_dip : std_logic;
  signal p20_dip : std_logic;
  signal p21_dip : std_logic;
  signal p22_dip : std_logic;
  signal p23_dip : std_logic;

  -- sn74181 signals
  signal cout_n_ttl : std_logic;
  signal y_ttl      : std_logic;
  signal x_ttl      : std_logic;
  signal aeb_ttl    : std_logic;
  signal f0_ttl     : std_logic;
  signal f1_ttl     : std_logic;
  signal f2_ttl     : std_logic;
  signal f3_ttl     : std_logic;
  signal b0_ttl     : std_logic;
  signal b1_ttl     : std_logic;
  signal b2_ttl     : std_logic;
  signal b3_ttl     : std_logic;
  signal a0_ttl     : std_logic;
  signal a1_ttl     : std_logic;
  signal a2_ttl     : std_logic;
  signal a3_ttl     : std_logic;
  signal m_ttl      : std_logic;
  signal s0_ttl     : std_logic;
  signal s1_ttl     : std_logic;
  signal s2_ttl     : std_logic;
  signal s3_ttl     : std_logic;
  signal cin_n_ttl  : std_logic;

  constant DELAY : time := 25 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s181 : dip_74s181
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
      p13 => p13_dip,
      p14 => p14_dip,
      p15 => p15_dip,
      p16 => p16_dip,
      p17 => p17_dip,
      p18 => p18_dip,
      p19 => p19_dip,
      p20 => p20_dip,
      p21 => p21_dip,
      p22 => p22_dip,
      p23 => p23_dip
      );

  -- Instantiate original component
  U_sn74181 : sn74181
    port map (
      cout_n => cout_n_ttl,
      y      => y_ttl,
      x      => x_ttl,
      aeb    => aeb_ttl,
      f0     => f0_ttl,
      f1     => f1_ttl,
      f2     => f2_ttl,
      f3     => f3_ttl,
      b0     => b0_ttl,
      b1     => b1_ttl,
      b2     => b2_ttl,
      b3     => b3_ttl,
      a0     => a0_ttl,
      a1     => a1_ttl,
      a2     => a2_ttl,
      a3     => a3_ttl,
      m      => m_ttl,
      s0     => s0_ttl,
      s1     => s1_ttl,
      s2     => s2_ttl,
      s3     => s3_ttl,
      cin_n  => cin_n_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= b0_ttl;
  p2_dip  <= a0_ttl;
  p3_dip  <= s3_ttl;
  p4_dip  <= s2_ttl;
  p5_dip  <= s1_ttl;
  p6_dip  <= s0_ttl;
  p7_dip  <= cin_n_ttl;
  p8_dip  <= m_ttl;
  p18_dip <= b3_ttl;
  p19_dip <= a3_ttl;
  p20_dip <= b2_ttl;
  p21_dip <= a2_ttl;
  p22_dip <= b1_ttl;
  p23_dip <= a1_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p9_dip  = f0_ttl     report "p9 mismatch"  severity failure;
    assert p10_dip = f1_ttl     report "p10 mismatch" severity failure;
    assert p11_dip = f2_ttl     report "p11 mismatch" severity failure;
    assert p13_dip = f3_ttl     report "p13 mismatch" severity failure;
    assert p14_dip = aeb_ttl    report "p14 mismatch" severity failure;
    assert p15_dip = x_ttl      report "p15 mismatch" severity failure;
    assert p16_dip = cout_n_ttl report "p16 mismatch" severity failure;
    assert p17_dip = y_ttl      report "p17 mismatch" severity failure;
    wait;
  end process;

  -- Stimulus process
  process
    variable a_slv : std_logic_vector(3 downto 0);
    variable b_slv : std_logic_vector(3 downto 0);
    variable s_slv : std_logic_vector(3 downto 0);
    variable m_slv : std_logic_vector(0 downto 0);
    variable cin_slv : std_logic_vector(0 downto 0);
  begin
    for m in 0 to 1 loop
      m_slv := std_logic_vector(to_unsigned(m, 1));
      m_ttl <= m_slv(0);
      for cin in 0 to 1 loop
        cin_slv := std_logic_vector(to_unsigned(cin, 1));
        cin_n_ttl <= not cin_slv(0);
        for s in 0 to 15 loop
          s_slv := std_logic_vector(to_unsigned(s, 4));
          s0_ttl <= s_slv(0);
          s1_ttl <= s_slv(1);
          s2_ttl <= s_slv(2);
          s3_ttl <= s_slv(3);
          for a in 0 to 15 loop
            a_slv := std_logic_vector(to_unsigned(a, 4));
            a0_ttl <= a_slv(0);
            a1_ttl <= a_slv(1);
            a2_ttl <= a_slv(2);
            a3_ttl <= a_slv(3);
            for b in 0 to 15 loop
              b_slv := std_logic_vector(to_unsigned(b, 4));
              b0_ttl <= b_slv(0);
              b1_ttl <= b_slv(1);
              b2_ttl <= b_slv(2);
              b3_ttl <= b_slv(3);
              wait for DELAY;
            end loop;
          end loop;
        end loop;
      end loop;
    end loop;

    -- report "dip_74s181_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 