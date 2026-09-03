-- Dual D-Type Positive Edge Triggered Flip-Flops With Preset And Clear

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn7474 is
  port (
    g1r_n : in  std_logic;  -- Pin 1 (1CLR)
    g1d   : in  std_logic;  -- Pin 2 (1D)
    g1clk : in  std_logic;  -- Pin 3 (1CLK)
    g1s_n : in  std_logic;  -- Pin 4 (1PRE)
    g1q   : out std_logic;  -- Pin 5 (1Q)
    g1q_n : out std_logic;  -- Pin 6 (1Q_n)
    g2q_n : out std_logic;  -- Pin 8 (2Q_n)
    g2q   : out std_logic;  -- Pin 9 (2Q)
    g2s_n : in  std_logic;  -- Pin 10 (2PRE)
    g2clk : in  std_logic;  -- Pin 11 (2CLK)
    g2d   : in  std_logic;  -- Pin 12 (2D)
    g2r_n : in  std_logic   -- Pin 13 (2CLR)
    );
end entity;

architecture functional of sn7474 is
  signal g1r_n_i, g1d_i, g1clk_i, g1s_n_i, g2s_n_i, g2clk_i, g2d_i, g2r_n_i : std_logic;
begin

  g1r_n_i <= ttl_input(g1r_n);
  g1d_i <= ttl_input(g1d);
  g1clk_i <= ttl_input(g1clk);
  g1s_n_i <= ttl_input(g1s_n);
  g2s_n_i <= ttl_input(g2s_n);
  g2clk_i <= ttl_input(g2clk);
  g2d_i <= ttl_input(g2d);
  g2r_n_i <= ttl_input(g2r_n);

  -- first flip-flop
  u1 : entity work.ff_dpc port map (clk => g1clk_i, pre => g1s_n_i, clr => g1r_n_i, d => g1d_i, q => g1q, q_n => g1q_n, enb_n => '0');

  -- second flip-flop
  u2 : entity work.ff_dpc port map (clk => g2clk_i, pre => g2s_n_i, clr => g2r_n_i, d => g2d_i, q => g2q, q_n => g2q_n, enb_n => '0');

end architecture;
