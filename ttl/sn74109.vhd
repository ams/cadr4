-- Dual J-K Positive-Edge-Triggered Flip-Flops With Preset And Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74109 is
  port (
    clr1_n : in  std_logic;
    j1     : in  std_logic;
    k1_n   : in  std_logic;
    clk1   : in  std_logic;
    pre1_n : in  std_logic;
    q1     : out std_logic;
    q1_n   : out std_logic;

    clr2_n : in  std_logic;
    j2     : in  std_logic;
    k2_n   : in  std_logic;
    clk2   : in  std_logic;
    pre2_n : in  std_logic;
    q2     : out std_logic;
    q2_n   : out std_logic
    );
end;

architecture ttl of sn74109 is
begin

end;
