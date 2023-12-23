-- Dual J-K Positive-Edge-Triggered Flip-Flops With Preset And Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ttl;
use ttl.misc.all;

entity sn74109 is
  port (
    clk1           : in  std_logic;
    pre1_n, clr1_n : in  std_logic;
    j1, k1_n       : in  std_logic;
    q1, q1_n       : out std_logic;

    clk2           : in  std_logic;
    pre2_n, clr2_n : in  std_logic;
    j2, k2_n       : in  std_logic;
    q2, q2_n       : out std_logic
    );
end;

architecture ttl of sn74109 is
begin

  u0 : ff_jkpc port map (clk => clk1, pre => pre1_n, clr => clr1_n, j => j1, k => k1_n, q => q1, q_n => q1_n);
  u1 : ff_jkpc port map (clk => clk2, pre => pre2_n, clr => clr2_n, j => j2, k => k2_n, q => q2, q_n => q2_n);

end;
