-- Dual D Type Positive Edge Triggered Flip Flops With Preset And Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn7474 is
  port (
    g1r_n : in  std_logic;
    g1d   : in  std_logic;
    g1clk : in  std_logic;
    g1s_n : in  std_logic;
    g1q   : out std_logic;
    g1q_n : out std_logic;
    g2q_n : out std_logic;
    g2q   : out std_logic;
    g2s_n : in  std_logic;
    g2clk : in  std_logic;
    g2d   : in  std_logic;
    g2r_n : in  std_logic
    );
end;

architecture ttl of sn7474 is
begin

end;
