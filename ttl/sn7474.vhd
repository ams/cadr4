-- Dual D-Type Positive Edge Triggered Flip-Flops With Preset And Clear

library ieee;
use ieee.std_logic_1164.all;

entity sn7474 is
  port (
    g1r_n : in  std_logic := 'H'; -- pin 1
    g1d   : in  std_logic := 'H'; -- pin 2
    g1clk : in  std_logic := 'H'; -- pin 3
    g1s_n : in  std_logic := 'H'; -- pin 4
    g1q   : out std_logic; -- pin 5
    g1q_n : out std_logic; -- pin 6
    g2q_n : out std_logic; -- pin 9
    g2q   : out std_logic; -- pin 8
    g2s_n : in  std_logic := 'H'; -- pin 10
    g2clk : in  std_logic := 'H'; -- pin 11
    g2d   : in  std_logic := 'H'; -- pin 12
    g2r_n : in  std_logic := 'H'  -- pin 13
    );
end;

architecture ttl of sn7474 is
begin
  -- first flip-flop
  u1 : entity work.ff_dpc port map (clk => g1clk, pre => g1s_n, clr => g1r_n, d => g1d, q => g1q, q_n => g1q_n, enb_n => '0');

  -- second flip-flop
  u2 : entity work.ff_dpc port map (clk => g2clk, pre => g2s_n, clr => g2r_n, d => g2d, q => g2q, q_n => g2q_n, enb_n => '0');

end;
