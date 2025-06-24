-- Dual J-K Positive-Edge-Triggered Flip-Flops With Preset And Clear

library ieee;
use ieee.std_logic_1164.all;

entity sn74109 is
  port (
    clr1_n : in  std_logic := 'H';
    j1     : in  std_logic := 'H';
    k1_n   : in  std_logic := 'H';
    clk1   : in  std_logic := 'H';
    pre1_n : in  std_logic := 'H';
    q1     : out std_logic;
    q1_n   : out std_logic;

    q2_n   : out std_logic;
    q2     : out std_logic;
    pre2_n : in  std_logic := 'H';
    clk2   : in  std_logic := 'H';
    k2_n   : in  std_logic := 'H';
    j2     : in  std_logic := 'H';
    clr2_n : in  std_logic := 'H'
    );
end;

architecture ttl of sn74109 is
begin

  u0 : entity work.ff_jkpc port map (clk => clk1, pre => pre1_n, clr => clr1_n, j => j1, k => not k1_n, q => q1, q_n => q1_n);
  u1 : entity work.ff_jkpc port map (clk => clk2, pre => pre2_n, clr => clr2_n, j => j2, k => not k2_n, q => q2, q_n => q2_n);

end;
