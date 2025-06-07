library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dip.all;


entity dip_7428_tb is
end dip_7428_tb;

architecture behavior of dip_7428_tb is

  -- Signals
  signal g1a, g1b, g2a, g2b, g3a, g3b, g4a, g4b : std_logic;
  signal g1q_n_uut, g2q_n_uut, g3q_n_uut, g4q_n_uut : std_logic;
  signal g1q_n_golden, g2q_n_golden, g3q_n_golden, g4q_n_golden : std_logic;

begin

  uut : entity work.dip_7428
    port map (
      p1  => g1q_n_uut,
      p2  => g1a,
      p3  => g1b,
      p4  => g2q_n_uut,
      p5  => g2a,
      p6  => g2b,
      p8  => g3a,
      p9  => g3b,
      p10 => g3q_n_uut,
      p11 => g4a,
      p12 => g4b,
      p13 => g4q_n_uut
      );

  golden : entity work.sn7428
    port map (
      g1q_n => g1q_n_golden,
      g1a   => g1a,
      g1b   => g1b,
      g2q_n => g2q_n_golden,
      g2a   => g2a,
      g2b   => g2b,
      g3q_n => g3q_n_golden,
      g3a   => g3a,
      g3b   => g3b,
      g4q_n => g4q_n_golden,
      g4a   => g4a,
      g4b   => g4b
      );

  stimulus : process
    variable stim_vec : std_logic_vector(7 downto 0);
  begin
    for i in 0 to 2**8 - 1 loop
      stim_vec := std_logic_vector(to_unsigned(i, 8));
      g1a <= stim_vec(7);
      g1b <= stim_vec(6);
      g2a <= stim_vec(5);
      g2b <= stim_vec(4);
      g3a <= stim_vec(3);
      g3b <= stim_vec(2);
      g4a <= stim_vec(1);
      g4b <= stim_vec(0);
      wait for 10 ns;
    end loop;
    wait;
  end process;

  checker : process(all)
  begin
    assert g1q_n_uut = g1q_n_golden and
           g2q_n_uut = g2q_n_golden and
           g3q_n_uut = g3q_n_golden and
           g4q_n_uut = g4q_n_golden
      report "Mismatch between UUT and golden model"
      severity error;
  end process;

end behavior; 