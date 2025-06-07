library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;

use work.sn74.all;

entity dip_74s280_tb is
end entity;

architecture test of dip_74s280_tb is

  -- dip_74s280 signals
  signal p1_dip  : std_logic;
  signal p2_dip  : std_logic;
  signal p4_dip  : std_logic;
  signal p5_dip  : std_logic;
  signal p6_dip  : std_logic;
  signal p8_dip  : std_logic;
  signal p9_dip  : std_logic;
  signal p10_dip : std_logic;
  signal p11_dip : std_logic;
  signal p12_dip : std_logic;
  signal p13_dip : std_logic;

  -- sn74280 signals
  signal i0_ttl   : std_logic;
  signal i1_ttl   : std_logic;
  signal i2_ttl   : std_logic;
  signal i3_ttl   : std_logic;
  signal i4_ttl   : std_logic;
  signal i5_ttl   : std_logic;
  signal i6_ttl   : std_logic;
  signal i7_ttl   : std_logic;
  signal i8_ttl   : std_logic;
  signal even_ttl : std_logic;
  signal odd_ttl  : std_logic;

  constant DELAY : time := 10 ns;
  signal test_finished : boolean := false;

begin

  -- Instantiate wrapper
  U_dip_74s280 : dip_74s280
    port map (
      p1  => p1_dip,
      p2  => p2_dip,
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
  U_sn74280 : sn74280
    port map (
      i0   => i0_ttl,
      i1   => i1_ttl,
      i2   => i2_ttl,
      i3   => i3_ttl,
      i4   => i4_ttl,
      i5   => i5_ttl,
      i6   => i6_ttl,
      i7   => i7_ttl,
      i8   => i8_ttl,
      even => even_ttl,
      odd  => odd_ttl
      );

  -- Connect dip and ttl component inputs
  p1_dip  <= i0_ttl;
  p2_dip  <= i1_ttl;
  p4_dip  <= i2_ttl;
  p8_dip  <= i3_ttl;
  p9_dip  <= i4_ttl;
  p10_dip <= i5_ttl;
  p11_dip <= i6_ttl;
  p12_dip <= i7_ttl;
  p13_dip <= i8_ttl;

  -- Verification process
  process
  begin
    wait for 1 ns;
    assert p5_dip = even_ttl report "p5 mismatch" severity failure;
    assert p6_dip = odd_ttl  report "p6 mismatch" severity failure;
    wait;
  end process;

  -- Stimulus process
  process
    variable i_slv : std_logic_vector(8 downto 0);
  begin
    for i in 0 to 511 loop
      i_slv := std_logic_vector(to_unsigned(i, 9));
      i0_ttl <= i_slv(0);
      i1_ttl <= i_slv(1);
      i2_ttl <= i_slv(2);
      i3_ttl <= i_slv(3);
      i4_ttl <= i_slv(4);
      i5_ttl <= i_slv(5);
      i6_ttl <= i_slv(6);
      i7_ttl <= i_slv(7);
      i8_ttl <= i_slv(8);
      wait for DELAY;
    end loop;

    report "dip_74s280_tb finished.";
    test_finished <= true;
    wait;
  end process;

end architecture; 