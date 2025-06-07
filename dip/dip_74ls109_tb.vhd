library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library dip;
use dip.dip.all;

library ttl;

entity dip_74ls109_tb is
end dip_74ls109_tb;

architecture behavior of dip_74ls109_tb is

  -- Signals
  signal clr1_n, j1, k1_n, clk1, pre1_n : std_logic;
  signal q1_uut, q1_n_uut               : std_logic;
  signal q1_golden, q1_n_golden         : std_logic;

  signal clr2_n, j2, k2_n, clk2, pre2_n : std_logic;
  signal q2_uut, q2_n_uut               : std_logic;
  signal q2_golden, q2_n_golden         : std_logic;

begin

  uut : entity dip.dip_74ls109
    port map (
      p1  => clr1_n,
      p2  => j1,
      p3  => k1_n,
      p4  => clk1,
      p5  => pre1_n,
      p6  => q1_uut,
      p7  => q1_n_uut,
      p9  => q2_n_uut,
      p10 => q2_uut,
      p11 => pre2_n,
      p12 => clk2,
      p13 => k2_n,
      p14 => j2,
      p15 => clr2_n
      );

  golden : entity ttl.sn74109
    port map (
      clr1_n => clr1_n,
      j1     => j1,
      k1_n   => k1_n,
      clk1   => clk1,
      pre1_n => pre1_n,
      q1     => q1_golden,
      q1_n   => q1_n_golden,
      q2_n   => q2_n_golden,
      q2     => q2_golden,
      pre2_n => pre2_n,
      clk2   => clk2,
      k2_n   => k2_n,
      j2     => j2,
      clr2_n => clr2_n
      );

  stimulus : process
    variable stim_vec : std_logic_vector(9 downto 0);
  begin
    for i in 0 to 2**10 - 1 loop
      stim_vec := std_logic_vector(to_unsigned(i, 10));
      clr1_n <= stim_vec(9);
      j1     <= stim_vec(8);
      k1_n   <= stim_vec(7);
      clk1   <= stim_vec(6);
      pre1_n <= stim_vec(5);
      clr2_n <= stim_vec(4);
      j2     <= stim_vec(3);
      k2_n   <= stim_vec(2);
      clk2   <= stim_vec(1);
      pre2_n <= stim_vec(0);
      wait for 10 ns;
    end loop;
    wait;
  end process;

  checker : process(all)
  begin
    assert q1_uut = q1_golden and
           q1_n_uut = q1_n_golden and
           q2_uut = q2_golden and
           q2_n_uut = q2_n_golden
      report "Mismatch between UUT and golden model"
      severity error;
  end process;

end behavior; 