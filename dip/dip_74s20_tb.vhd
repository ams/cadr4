library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s20_tb is
end entity;

architecture test of dip_74s20_tb is

  -- dip_74s20 signals
  signal p1_dip  : std_logic;
  signal p2_dip  : std_logic;
  signal p4_dip  : std_logic;
  signal p5_dip  : std_logic;
  signal p6_dip  : std_logic;
  signal p8_dip  : std_logic;
  signal p9_dip  : std_logic;
  signal p10_dip : std_logic;
  signal p12_dip : std_logic;
  signal p13_dip : std_logic;

  -- sn7420 signals
  signal g1a_ttl   : std_logic;
  signal g1b_ttl   : std_logic;
  signal g1c_ttl   : std_logic;
  signal g1d_ttl   : std_logic;
  signal g1y_n_ttl : std_logic;
  signal g2a_ttl   : std_logic;
  signal g2b_ttl   : std_logic;
  signal g2c_ttl   : std_logic;
  signal g2d_ttl   : std_logic;
  signal g2y_n_ttl : std_logic;

  constant DELAY : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s20 : dip_74s20
    port map (
      p1  => p1_dip,
      p2  => p2_dip,
      p4  => p4_dip,
      p5  => p5_dip,
      p6  => p6_dip,
      p8  => p8_dip,
      p9  => p9_dip,
      p10 => p10_dip,
      p12 => p12_dip,
      p13 => p13_dip
      );

  -- Instantiate original component
  U_sn7420 : sn7420
    port map (
      g1a   => g1a_ttl,
      g1b   => g1b_ttl,
      g1c   => g1c_ttl,
      g1d   => g1d_ttl,
      g1y_n => g1y_n_ttl,
      g2a   => g2a_ttl,
      g2b   => g2b_ttl,
      g2c   => g2c_ttl,
      g2d   => g2d_ttl,
      g2y_n => g2y_n_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= g1a_ttl;
  p2_dip  <= g1b_ttl;
  p4_dip  <= g1c_ttl;
  p5_dip  <= g1d_ttl;
  p9_dip  <= g2a_ttl;
  p10_dip <= g2b_ttl;
  p12_dip <= g2c_ttl;
  p13_dip <= g2d_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p6_dip = g1y_n_ttl report "p6 mismatch" severity failure;
    assert p8_dip = g2y_n_ttl report "p8 mismatch" severity failure;
    wait;
  end process;

  -- Stimulus process
  process
    variable i_slv : std_logic_vector(7 downto 0);
  begin
    for i in 0 to 255 loop
      i_slv := std_logic_vector(to_unsigned(i, 8));
      g1a_ttl <= i_slv(0);
      g1b_ttl <= i_slv(1);
      g1c_ttl <= i_slv(2);
      g1d_ttl <= i_slv(3);
      g2a_ttl <= i_slv(4);
      g2b_ttl <= i_slv(5);
      g2c_ttl <= i_slv(6);
      g2d_ttl <= i_slv(7);
      wait for DELAY;
    end loop;

    report "dip_74s20_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 