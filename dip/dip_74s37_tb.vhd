library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s37_tb is
end entity;

architecture test of dip_74s37_tb is

  -- dip_74s37 signals
  signal p1_dip  : std_logic;
  signal p2_dip  : std_logic;
  signal p3_dip  : std_logic;
  signal p4_dip  : std_logic;
  signal p5_dip  : std_logic;
  signal p6_dip  : std_logic;
  signal p8_dip  : std_logic;
  signal p9_dip  : std_logic;
  signal p10_dip : std_logic;
  signal p11_dip : std_logic;
  signal p12_dip : std_logic;
  signal p13_dip : std_logic;

  -- sn7437 signals
  signal g1a_ttl : std_logic;
  signal g1b_ttl : std_logic;
  signal g1y_ttl : std_logic;
  signal g2a_ttl : std_logic;
  signal g2b_ttl : std_logic;
  signal g2y_ttl : std_logic;
  signal g3a_ttl : std_logic;
  signal g3b_ttl : std_logic;
  signal g3y_ttl : std_logic;
  signal g4a_ttl : std_logic;
  signal g4b_ttl : std_logic;
  signal g4y_ttl : std_logic;

  constant DELAY : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s37 : dip_74s37
    port map (
      p1  => p1_dip,
      p2  => p2_dip,
      p3  => p3_dip,
      p4  => p4_dip,
      p5  => p5_dip,
      p6  => p6_dip,
      p8  => p8_dip,
      p9  => p9_dip,
      p10 => p10_dip,
      p11 => p11_dip,
      p12 => p12_dip,
      p13 => p13_dip
      );

  -- Instantiate original component
  U_sn7437 : sn7437
    port map (
      g1a => g1a_ttl,
      g1b => g1b_ttl,
      g1y => g1y_ttl,
      g2a => g2a_ttl,
      g2b => g2b_ttl,
      g2y => g2y_ttl,
      g3a => g3a_ttl,
      g3b => g3b_ttl,
      g3y => g3y_ttl,
      g4a => g4a_ttl,
      g4b => g4b_ttl,
      g4y => g4y_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= g1a_ttl;
  p2_dip  <= g1b_ttl;
  p4_dip  <= g2a_ttl;
  p5_dip  <= g2b_ttl;
  p9_dip  <= g3a_ttl;
  p10_dip <= g3b_ttl;
  p12_dip <= g4a_ttl;
  p13_dip <= g4b_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p3_dip = g1y_ttl  report "p3 mismatch" severity failure;
    assert p6_dip = g2y_ttl  report "p6 mismatch" severity failure;
    assert p8_dip = g3y_ttl  report "p8 mismatch" severity failure;
    assert p11_dip = g4y_ttl report "p11 mismatch" severity failure;
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
      g2a_ttl <= i_slv(2);
      g2b_ttl <= i_slv(3);
      g3a_ttl <= i_slv(4);
      g3b_ttl <= i_slv(5);
      g4a_ttl <= i_slv(6);
      g4b_ttl <= i_slv(7);
      wait for DELAY;
    end loop;

    -- report "dip_74s37_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 