library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s194_tb is
end entity;

architecture test of dip_74s194_tb is

  -- dip_74s194 signals
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

  -- sn74194 signals
  signal clk_ttl   : std_logic;
  signal sil_ttl   : std_logic;
  signal sir_ttl   : std_logic;
  signal clr_n_ttl : std_logic;
  signal i0_ttl    : std_logic;
  signal i1_ttl    : std_logic;
  signal i2_ttl    : std_logic;
  signal i3_ttl    : std_logic;
  signal s0_ttl    : std_logic;
  signal s1_ttl    : std_logic;
  signal q0_ttl    : std_logic;
  signal q1_ttl    : std_logic;
  signal q2_ttl    : std_logic;
  signal q3_ttl    : std_logic;

  constant CLK_PERIOD : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s194 : dip_74s194
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
  U_sn74194 : sn74194
    port map (
      clk   => clk_ttl,
      sil   => sil_ttl,
      sir   => sir_ttl,
      clr_n => clr_n_ttl,
      i0    => i0_ttl,
      i1    => i1_ttl,
      i2    => i2_ttl,
      i3    => i3_ttl,
      s0    => s0_ttl,
      s1    => s1_ttl,
      q0    => q0_ttl,
      q1    => q1_ttl,
      q2    => q2_ttl,
      q3    => q3_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= clr_n_ttl;
  p2_dip  <= sir_ttl;
  p3_dip  <= i0_ttl;
  p4_dip  <= i1_ttl;
  p5_dip  <= i2_ttl;
  p6_dip  <= i3_ttl;
  p7_dip  <= sil_ttl;
  p9_dip  <= s0_ttl;
  p10_dip <= s1_ttl;
  p11_dip <= clk_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p12_dip = q3_ttl report "p12 mismatch" severity failure;
    assert p13_dip = q2_ttl report "p13 mismatch" severity failure;
    assert p14_dip = q1_ttl report "p14 mismatch" severity failure;
    assert p15_dip = q0_ttl report "p15 mismatch" severity failure;
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
    variable s_slv : std_logic_vector(1 downto 0);
  begin
    -- Test clear
    clr_n_ttl <= '0';
    wait for CLK_PERIOD;
    clr_n_ttl <= '1';
    wait for CLK_PERIOD;

    -- Test all modes
    for s in 0 to 3 loop
      s_slv := std_logic_vector(to_unsigned(s, 2));
      s0_ttl <= s_slv(0);
      s1_ttl <= s_slv(1);
      for i in 0 to 15 loop
        i_slv := std_logic_vector(to_unsigned(i, 4));
        i0_ttl <= i_slv(0);
        i1_ttl <= i_slv(1);
        i2_ttl <= i_slv(2);
        i3_ttl <= i_slv(3);
        sil_ttl <= i_slv(0);
        sir_ttl <= i_slv(3);
        wait for CLK_PERIOD;
      end loop;
    end loop;

    report "dip_74s194_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 