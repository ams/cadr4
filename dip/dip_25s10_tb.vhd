library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library dip;
use dip.dip.all;

library ttl;

entity dip_25s10_tb is
end dip_25s10_tb;

architecture behavior of dip_25s10_tb is

  -- Signals
  signal i_3, i_2, i_1, i0, i1, i2, i3, sel1, sel0, ce_n : std_logic;
  signal o0_uut, o1_uut, o2_uut, o3_uut                 : std_logic;
  signal o0_golden, o1_golden, o2_golden, o3_golden     : std_logic;

begin

  uut : entity dip.dip_25s10
    port map (
      p1  => i_3,
      p2  => i_2,
      p3  => i_1,
      p4  => i0,
      p5  => i1,
      p6  => i2,
      p7  => i3,
      p9  => sel1,
      p10 => sel0,
      p11 => o3_uut,
      p12 => o2_uut,
      p13 => ce_n,
      p14 => o1_uut,
      p15 => o0_uut
      );

  golden : entity ttl.am2510
    port map (
      i_3     => i_3,
      i_2     => i_2,
      i_1     => i_1,
      i0      => i0,
      i1      => i1,
      i2      => i2,
      i3      => i3,
      sel1    => sel1,
      sel0    => sel0,
      ce_n    => ce_n,
      o3      => o3_golden,
      o2      => o2_golden,
      o1      => o1_golden,
      o0      => o0_golden
      );

  stimulus : process
    variable stim_vec : std_logic_vector(9 downto 0);
  begin
    for i in 0 to 2**10 - 1 loop
      stim_vec := std_logic_vector(to_unsigned(i, 10));
      ce_n  <= stim_vec(0);
      sel0  <= stim_vec(1);
      sel1  <= stim_vec(2);
      i3    <= stim_vec(3);
      i2    <= stim_vec(4);
      i1    <= stim_vec(5);
      i0    <= stim_vec(6);
      i_1   <= stim_vec(7);
      i_2   <= stim_vec(8);
      i_3   <= stim_vec(9);
      wait for 10 ns;
    end loop;
    wait;
  end process;

  checker : process(o0_uut, o1_uut, o2_uut, o3_uut, o0_golden, o1_golden, o2_golden, o3_golden)
  begin
    assert o0_uut = o0_golden and o1_uut = o1_golden and o2_uut = o2_golden and o3_uut = o3_golden
      report "Mismatch between UUT and golden model"
      severity error;
  end process;

end behavior; 