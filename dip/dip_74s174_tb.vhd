library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s174_tb is
end entity;

architecture test of dip_74s174_tb is

  -- dip_74s174 signals
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

  -- sn74174 signals
  signal clr_n_ttl : std_logic;
  signal clk_ttl   : std_logic;
  signal d1_ttl    : std_logic;
  signal d2_ttl    : std_logic;
  signal d3_ttl    : std_logic;
  signal d4_ttl    : std_logic;
  signal d5_ttl    : std_logic;
  signal d6_ttl    : std_logic;
  signal q1_ttl    : std_logic;
  signal q2_ttl    : std_logic;
  signal q3_ttl    : std_logic;
  signal q4_ttl    : std_logic;
  signal q5_ttl    : std_logic;
  signal q6_ttl    : std_logic;

  constant CLK_PERIOD : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s174 : entity work.dip_74s174
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
  U_sn74174 : sn74174
    port map (
      clr_n => clr_n_ttl,
      clk   => clk_ttl,
      d1    => d1_ttl,
      d2    => d2_ttl,
      d3    => d3_ttl,
      d4    => d4_ttl,
      d5    => d5_ttl,
      d6    => d6_ttl,
      q1    => q1_ttl,
      q2    => q2_ttl,
      q3    => q3_ttl,
      q4    => q4_ttl,
      q5    => q5_ttl,
      q6    => q6_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= clr_n_ttl;
  p3_dip  <= d1_ttl;
  p4_dip  <= d2_ttl;
  p6_dip  <= d3_ttl;
  p9_dip  <= clk_ttl;
  p11_dip <= d4_ttl;
  p13_dip <= d5_ttl;
  p14_dip <= d6_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p2_dip  = q1_ttl report "p2 mismatch"  severity failure;
    assert p5_dip  = q2_ttl report "p5 mismatch"  severity failure;
    assert p7_dip  = q3_ttl report "p7 mismatch"  severity failure;
    assert p10_dip = q4_ttl report "p10 mismatch" severity failure;
    assert p12_dip = q5_ttl report "p12 mismatch" severity failure;
    assert p15_dip = q6_ttl report "p15 mismatch" severity failure;
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
    variable i_slv : std_logic_vector(5 downto 0);
  begin
    -- Test clear
    clr_n_ttl <= '0';
    d1_ttl <= 'X';
    d2_ttl <= 'X';
    d3_ttl <= 'X';
    d4_ttl <= 'X';
    d5_ttl <= 'X';
    d6_ttl <= 'X';
    wait for CLK_PERIOD;
    clr_n_ttl <= '1';
    wait for CLK_PERIOD;

    -- Test data
    for i in 0 to 63 loop
      i_slv := std_logic_vector(to_unsigned(i, 6));
      d1_ttl <= i_slv(0);
      d2_ttl <= i_slv(1);
      d3_ttl <= i_slv(2);
      d4_ttl <= i_slv(3);
      d5_ttl <= i_slv(4);
      d6_ttl <= i_slv(5);
      wait for CLK_PERIOD;
    end loop;

    -- report "dip_74s174_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 