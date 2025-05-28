-- Dual J-K Positive-Edge-Triggered Flip-Flops With Preset And Clear
-- This component implements two J-K flip-flops with preset and clear.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ttl;
use ttl.misc.all;

entity sn74109 is
  port (
    clr1_n : in  std_logic; -- Pin 1
    j1     : in  std_logic; -- Pin 2
    k1_n   : in  std_logic; -- Pin 3
    clk1   : in  std_logic; -- Pin 4
    pre1_n : in  std_logic; -- Pin 5
    q1     : out std_logic; -- Pin 6
    q1_n   : out std_logic; -- Pin 7

    q2_n   : out std_logic; -- Pin 9
    q2     : out std_logic; -- Pin 10
    pre2_n : in  std_logic; -- Pin 11
    clk2   : in  std_logic; -- Pin 12
    k2_n   : in  std_logic; -- Pin 13
    j2     : in  std_logic; -- Pin 14
    clr2_n : in  std_logic  -- Pin 15
    );
end;

architecture ttl of sn74109 is
begin

  u0 : ff_jkpc port map (clk => clk1, pre => pre1_n, clr => clr1_n, j => j1, k => not k1_n, q => q1, q_n => q1_n);
  u1 : ff_jkpc port map (clk => clk2, pre => pre2_n, clr => clr2_n, j => j2, k => not k2_n, q => q2, q_n => q2_n);

end;
