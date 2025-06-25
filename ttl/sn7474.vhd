-- Dual D-Type Positive Edge Triggered Flip-Flops With Preset And Clear

library ieee;
use ieee.std_logic_1164.all;

entity sn7474 is
  port (
    g1r_n : in  std_logic; -- pin 1
    g1d   : in  std_logic; -- pin 2
    g1clk : in  std_logic; -- pin 3
    g1s_n : in  std_logic; -- pin 4
    g1q   : out std_logic; -- pin 5
    g1q_n : out std_logic; -- pin 6
    g2q_n : out std_logic; -- pin 9
    g2q   : out std_logic; -- pin 8
    g2s_n : in  std_logic; -- pin 10
    g2clk : in  std_logic; -- pin 11
    g2d   : in  std_logic; -- pin 12
    g2r_n : in  std_logic  -- pin 13
    );
end;

architecture ttl of sn7474 is
  signal g1r_n_i, g1d_i, g1clk_i, g1s_n_i, g2s_n_i, g2clk_i, g2d_i, g2r_n_i : std_logic;
begin

  g1r_n_i <= 'H';
  g1d_i <= 'H';
  g1clk_i <= 'H';
  g1s_n_i <= 'H';
  g2s_n_i <= 'H';
  g2clk_i <= 'H';
  g2d_i <= 'H';
  g2r_n_i <= 'H';

  g1r_n_i <= g1r_n;
  g1d_i <= g1d;
  g1clk_i <= g1clk;
  g1s_n_i <= g1s_n;
  g2s_n_i <= g2s_n;
  g2clk_i <= g2clk;
  g2d_i <= g2d;
  g2r_n_i <= g2r_n;

  -- first flip-flop
  u1 : entity work.ff_dpc port map (clk => g1clk_i, pre => g1s_n_i, clr => g1r_n_i, d => g1d_i, q => g1q, q_n => g1q_n, enb_n => '0');

  -- second flip-flop
  u2 : entity work.ff_dpc port map (clk => g2clk_i, pre => g2s_n_i, clr => g2r_n_i, d => g2d_i, q => g2q, q_n => g2q_n, enb_n => '0');

end;
