library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;


entity dip_74s157_tb is
end entity;

architecture tb of dip_74s157_tb is
  signal p1, p2, p3, p5, p6, p10, p11, p13, p14, p15 : std_logic;
  signal p4, p7, p9, p12 : std_logic;
  signal p4_uut, p7_uut, p9_uut, p12_uut : std_logic;
  signal p4_ref, p7_ref, p9_ref, p12_ref : std_logic;

  signal sel   : std_logic;
  signal a, b  : std_logic_vector(3 downto 0);
  signal y_ref : std_logic_vector(3 downto 0);
  signal enb_n : std_logic;

begin

  uut : dip_74s157
    port map (
      p1  => p1,
      p2  => p2,
      p3  => p3,
      p4  => p4_uut,
      p5  => p5,
      p6  => p6,
      p7  => p7_uut,
      p9  => p9_uut,
      p10 => p10,
      p11 => p11,
      p12 => p12_uut,
      p13 => p13,
      p14 => p14,
      p15 => p15
      );

  ref : entity work.sn74157
    port map (
      sel   => p1,
      enb_n => p15,
      a1    => p14,
      b1    => p13,
      y1    => p12_ref,
      a2    => p11,
      b2    => p10,
      y2    => p9_ref,
      a3    => p6,
      b3    => p5,
      y3    => p7_ref,
      a4    => p3,
      b4    => p2,
      y4    => p4_ref
      );

  -- Connect uut inputs to same signals as ref
  p1  <= sel;
  p15 <= enb_n;
  p14 <= a(0);
  p13 <= b(0);
  p11 <= a(1);
  p10 <= b(1);
  p5  <= a(2);
  p6  <= b(2);
  p2  <= a(3);
  p3  <= b(3);

  -- Check outputs
  process
  begin
    enb_n <= '1';
    sel <= '0';
    a <= (others => '0');
    b <= (others => '0');
    wait for 1 ns;

    for i in 0 to 15 loop
      a <= std_logic_vector(to_unsigned(i, 4));
      for j in 0 to 15 loop
        b <= std_logic_vector(to_unsigned(j, 4));
        sel <= '0';
        wait for 10 ns;
        assert p4_uut = p4_ref report "p4_uut differs from p4_ref with enb_n='1', sel='0'" severity failure;
        assert p7_uut = p7_ref report "p7_uut differs from p7_ref with enb_n='1', sel='0'" severity failure;
        assert p9_uut = p9_ref report "p9_uut differs from p9_ref with enb_n='1', sel='0'" severity failure;
        assert p12_uut = p12_ref report "p12_uut differs from p12_ref with enb_n='1', sel='0'" severity failure;

        sel <= '1';
        wait for 10 ns;
        assert p4_uut = p4_ref report "p4_uut differs from p4_ref with enb_n='1', sel='1'" severity failure;
        assert p7_uut = p7_ref report "p7_uut differs from p7_ref with enb_n='1', sel='1'" severity failure;
        assert p9_uut = p9_ref report "p9_uut differs from p9_ref with enb_n='1', sel='1'" severity failure;
        assert p12_uut = p12_ref report "p12_uut differs from p12_ref with enb_n='1', sel='1'" severity failure;
      end loop;
    end loop;

    enb_n <= '0';
    wait for 1 ns;

    for i in 0 to 15 loop
      a <= std_logic_vector(to_unsigned(i, 4));
      for j in 0 to 15 loop
        b <= std_logic_vector(to_unsigned(j, 4));
        sel <= '0';
        wait for 10 ns;
        assert p4_uut = p4_ref report "p4_uut differs from p4_ref with enb_n='0', sel='0'" severity failure;
        assert p7_uut = p7_ref report "p7_uut differs from p7_ref with enb_n='0', sel='0'" severity failure;
        assert p9_uut = p9_ref report "p9_uut differs from p9_ref with enb_n='0', sel='0'" severity failure;
        assert p12_uut = p12_ref report "p12_uut differs from p12_ref with enb_n='0', sel='0'" severity failure;

        sel <= '1';
        wait for 10 ns;
        assert p4_uut = p4_ref report "p4_uut differs from p4_ref with enb_n='0', sel='1'" severity failure;
        assert p7_uut = p7_ref report "p7_uut differs from p7_ref with enb_n='0', sel='1'" severity failure;
        assert p9_uut = p9_ref report "p9_uut differs from p9_ref with enb_n='0', sel='1'" severity failure;
        assert p12_uut = p12_ref report "p12_uut differs from p12_ref with enb_n='0', sel='1'" severity failure;
      end loop;
    end loop;

    report "Testbench finished";
    wait;
  end process;

end architecture; 