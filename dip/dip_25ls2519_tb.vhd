library ieee;
use ieee.std_logic_1164.all;

use work.dip.all;

use work.other.all;

entity dip_25ls2519_tb is
end entity;

architecture tb of dip_25ls2519_tb is
  -- Inputs
  signal p1, p4, p7, p8, p9, p13, p16, p17, p18, p19 : std_logic := '0';
  -- Outputs
  signal p2, p3, p5, p6, p11, p12, p14, p15 : std_logic;

  -- TTL signals
  signal clk, o_enb_n, inv, i0, i1, i2, i3, out_enb_n, clk_enb_n, asyn_clr_n : std_logic := '0';
  signal q0a, q1a, q2a, q3a, q0b, q1b, q2b, q3b : std_logic;

begin

  UUT_DIP : component dip_25ls2519
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

  UUT_TTL : entity work.am252519
    port map (
      clk        => clk,
      o_enb_n    => o_enb_n,
      inv        => inv,
      i0         => i0,
      i1         => i1,
      i2         => i2,
      i3         => i3,
      out_enb_n  => out_enb_n,
      clk_enb_n  => clk_enb_n,
      asyn_clr_n => asyn_clr_n,
      q0a        => q0a,
      q1a        => q1a,
      q2a        => q2a,
      q3a        => q3a,
      q0b        => q0b,
      q1b        => q1b,
      q2b        => q2b,
      q3b        => q3b
    );

  stimulus : process
    variable error_cnt : integer := 0;
    procedure check
      is
    begin
      wait for 0 ns;
      assert p2 = q0a and p3 = q0b and p5 = q1a and p6 = q1b and p11 = q2b and p12 = q2a and p14 = q3b and p15 = q3a
        report "Mismatch between DIP and TTL" severity warning;
      if p2 /= q0a or p3 /= q0b or p5 /= q1a or p6 /= q1b or p11 /= q2b or p12 /= q2a or p14 /= q3b or p15 /= q3a then
        error_cnt := error_cnt + 1;
      end if;
    end procedure;
  begin
    i0 <= p1;
    i1 <= p4;
    o_enb_n <= p7;
    out_enb_n <= p8;
    clk <= p9;
    i2 <= p13;
    i3 <= p16;
    clk_enb_n <= p17;
    inv <= p18;
    asyn_clr_n <= p19;

    -- Reset
    p19 <= '0';
    wait for 10 ns;
    p19 <= '1';
    check;

    -- Load data
    p17 <= '0';
    p1 <= '1'; p4 <= '0'; p13 <= '1'; p16 <= '0';
    wait for 10 ns;
    p9 <= '1';
    wait for 10 ns;
    p9 <= '0';
    wait for 10 ns;
    p17 <= '1';
    check;

    -- Check outputs
    p7 <= '0';
    p8 <= '0';
    wait for 10 ns;
    check;

    -- Invert outputs
    p18 <= '1';
    check;

    assert error_cnt = 0 report "Test failed with " & integer'image(error_cnt) & " errors." severity failure;
    wait;
  end process;

end architecture;