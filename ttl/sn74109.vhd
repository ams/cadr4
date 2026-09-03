-- Dual J-K Positive-Edge-Triggered Flip-Flops With Preset And Clear

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity sn74109 is
  port (
    clr1_n : in  std_logic; -- Pin 1 (1CLR)
    j1     : in  std_logic; -- Pin 2 (1J)
    k1_n   : in  std_logic; -- Pin 3 (1K_n)
    clk1   : in  std_logic; -- Pin 4 (1CLK)
    pre1_n : in  std_logic; -- Pin 5 (1PRE)
    q1     : out std_logic; -- Pin 6 (1Q)
    q1_n   : out std_logic; -- Pin 7 (1Q_n)

    q2_n   : out std_logic; -- Pin 9 (2Q_n)
    q2     : out std_logic; -- Pin 10 (2Q)
    pre2_n : in  std_logic; -- Pin 11 (2PRE)
    clk2   : in  std_logic; -- Pin 12 (2CLK)
    k2_n   : in  std_logic; -- Pin 13 (2K_n)
    j2     : in  std_logic; -- Pin 14 (2J)
    clr2_n : in  std_logic  -- Pin 15 (2CLR)
    );
end entity;

architecture structural of sn74109 is
  signal clr1_n_i, j1_i, k1_n_i, clk1_i, pre1_n_i, pre2_n_i, clk2_i, k2_n_i, j2_i, clr2_n_i : std_logic;
begin

  clr1_n_i <= ttl_input(clr1_n);
  j1_i <= ttl_input(j1);
  k1_n_i <= ttl_input(k1_n);
  clk1_i <= ttl_input(clk1);
  pre1_n_i <= ttl_input(pre1_n);
  pre2_n_i <= ttl_input(pre2_n);
  clk2_i <= ttl_input(clk2);
  k2_n_i <= ttl_input(k2_n);
  j2_i <= ttl_input(j2);
  clr2_n_i <= ttl_input(clr2_n);

  u0 : entity work.ff_jkpc port map (clk => clk1_i, pre => pre1_n_i, clr => clr1_n_i, j => j1_i, k => not k1_n_i, q => q1, q_n => q1_n);
  u1 : entity work.ff_jkpc port map (clk => clk2_i, pre => pre2_n_i, clr => clr2_n_i, j => j2_i, k => not k2_n_i, q => q2, q_n => q2_n);

end architecture;
