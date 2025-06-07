library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

use work.dip.all;

entity dip_74ls244_tb is
end entity;

architecture behavior of dip_74ls244_tb is
  signal p1, p19 : std_logic;
  signal p2, p4, p6, p8   : std_logic;
  signal p11, p13, p15, p17 : std_logic;
  signal p3, p5, p7, p9   : std_logic;
  signal p12, p14, p16, p18 : std_logic;

  alias ain0 is p2;
  alias ain1 is p4;
  alias ain2 is p6;
  alias ain3 is p8;

  alias bin0 is p11;
  alias bin1 is p13;
  alias bin2 is p15;
  alias bin3 is p17;

  alias aout0 is p18;
  alias aout1 is p16;
  alias aout2 is p14;
  alias aout3 is p12;

  alias bout0 is p9;
  alias bout1 is p7;
  alias bout2 is p5;
  alias bout3 is p3;

  alias aenb_n is p1;
  alias benb_n is p19;

begin
  uut : entity work.dip_74ls244
    port map (
      p1  => p1,
      p2  => p2,
      p3  => p3,
      p4  => p4,
      p5  => p5,
      p6  => p6,
      p7  => p7,
      p8  => p8,
      p9  => p9,
      p11 => p11,
      p12 => p12,
      p13 => p13,
      p14 => p14,
      p15 => p15,
      p16 => p16,
      p17 => p17,
      p18 => p18,
      p19 => p19
      );

  stim_proc : process
  begin
    report "Starting test";

    -- Test case 1: both enables low (active)
    aenb_n <= '0';
    benb_n <= '0';
    ain0 <= '0'; ain1 <= '1'; ain2 <= '0'; ain3 <= '1';
    bin0 <= '1'; bin1 <= '0'; bin2 <= '1'; bin3 <= '0';
    wait for 10 ns;
    assert aout0 = '0' and aout1 = '1' and aout2 = '0' and aout3 = '1' report "TC1.A failed" severity error;
    assert bout0 = '1' and bout1 = '0' and bout2 = '1' and bout3 = '0' report "TC1.B failed" severity error;

    -- Test case 2: a_enb high (inactive), b_enb low (active)
    aenb_n <= '1';
    benb_n <= '0';
    wait for 10 ns;
    assert aout0 = 'Z' and aout1 = 'Z' and aout2 = 'Z' and aout3 = 'Z' report "TC2.A failed" severity error;
    assert bout0 = '1' and bout1 = '0' and bout2 = '1' and bout3 = '0' report "TC2.B failed" severity error;

    -- Test case 3: a_enb low (active), b_enb high (inactive)
    aenb_n <= '0';
    benb_n <= '1';
    wait for 10 ns;
    assert aout0 = '0' and aout1 = '1' and aout2 = '0' and aout3 = '1' report "TC3.A failed" severity error;
    assert bout0 = 'Z' and bout1 = 'Z' and bout2 = 'Z' and bout3 = 'Z' report "TC3.B failed" severity error;

    -- Test case 4: both enables high (inactive)
    aenb_n <= '1';
    benb_n <= '1';
    wait for 10 ns;
    assert aout0 = 'Z' and aout1 = 'Z' and aout2 = 'Z' and aout3 = 'Z' report "TC4.A failed" severity error;
    assert bout0 = 'Z' and bout1 = 'Z' and bout2 = 'Z' and bout3 = 'Z' report "TC4.B failed" severity error;

    report "Test finished";
    wait;
  end process;

end architecture; 