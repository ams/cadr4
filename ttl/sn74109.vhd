-- Dual J-K Positive-Edge-Triggered Flip-Flops With Preset And Clear

library ieee;
use ieee.std_logic_1164.all;

entity sn74109 is
  port (
    clr1_n : in  std_logic;
    j1     : in  std_logic;
    k1_n   : in  std_logic;
    clk1   : in  std_logic;
    pre1_n : in  std_logic;
    q1     : out std_logic;
    q1_n   : out std_logic;

    q2_n   : out std_logic;
    q2     : out std_logic;
    pre2_n : in  std_logic;
    clk2   : in  std_logic;
    k2_n   : in  std_logic;
    j2     : in  std_logic;
    clr2_n : in  std_logic
    );
end;

architecture ttl of sn74109 is
  signal clr1_n_i, j1_i, k1_n_i, clk1_i, pre1_n_i, pre2_n_i, clk2_i, k2_n_i, j2_i, clr2_n_i : std_logic;
begin

  clr1_n_i <= 'H';
  j1_i <= 'H';
  k1_n_i <= 'H';
  clk1_i <= 'H';
  pre1_n_i <= 'H';
  pre2_n_i <= 'H';
  clk2_i <= 'H';
  k2_n_i <= 'H';
  j2_i <= 'H';
  clr2_n_i <= 'H';

  clr1_n_i <= clr1_n;
  j1_i <= j1;
  k1_n_i <= k1_n;
  clk1_i <= clk1;
  pre1_n_i <= pre1_n;
  pre2_n_i <= pre2_n;
  clk2_i <= clk2;
  k2_n_i <= k2_n;
  j2_i <= j2;
  clr2_n_i <= clr2_n;

  u0 : entity work.ff_jkpc port map (clk => clk1_i, pre => pre1_n_i, clr => clr1_n_i, j => j1_i, k => not k1_n_i, q => q1, q_n => q1_n);
  u1 : entity work.ff_jkpc port map (clk => clk2_i, pre => pre2_n_i, clr => clr2_n_i, j => j2_i, k => not k2_n_i, q => q2, q_n => q2_n);

end;
