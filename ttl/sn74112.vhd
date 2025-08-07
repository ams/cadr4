-- Dual J-K Negative-Edge-Triggered Flip-Flops With Preset And Clear

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity sn74112 is
  port (
    clr1_n : in  std_logic;
    j1     : in  std_logic;
    k1     : in  std_logic;
    clk1   : in  std_logic;
    pre1_n : in  std_logic;
    q1     : out std_logic;
    q1_n   : out std_logic;

    q2_n   : out std_logic;
    q2     : out std_logic;
    pre2_n : in  std_logic;
    clk2   : in  std_logic;
    k2     : in  std_logic;
    j2     : in  std_logic;
    clr2_n : in  std_logic
    );
end;

architecture structural of sn74112 is
  signal clr1_n_i, j1_i, k1_i, clk1_i, pre1_n_i, pre2_n_i, clk2_i, k2_i, j2_i, clr2_n_i : std_logic;
begin

  clr1_n_i <= ttl_input(clr1_n);
  j1_i <= ttl_input(j1);
  k1_i <= ttl_input(k1);
  clk1_i <= ttl_input(clk1);
  pre1_n_i <= ttl_input(pre1_n);
  pre2_n_i <= ttl_input(pre2_n);
  clk2_i <= ttl_input(clk2);
  k2_i <= ttl_input(k2);
  j2_i <= ttl_input(j2);
  clr2_n_i <= ttl_input(clr2_n);

  u0 : entity work.ff_jkpc port map (clk => not clk1_i, pre => pre1_n_i, clr => clr1_n_i, j => j1_i, k => k1_i, q => q1, q_n => q1_n);
  u1 : entity work.ff_jkpc port map (clk => not clk2_i, pre => pre2_n_i, clr => clr2_n_i, j => j2_i, k => k2_i, q => q2, q_n => q2_n);

end;