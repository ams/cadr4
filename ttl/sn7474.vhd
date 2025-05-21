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

-- ChatGPT Codex implementation
architecture ttl of sn7474 is
begin
  -- first flip-flop
  process(g1clk, g1r_n, g1s_n)
  begin
    if g1r_n = '0' then
      g1q <= '0'; g1q_n <= '1';
    elsif g1s_n = '0' then
      g1q <= '1'; g1q_n <= '0';
    elsif rising_edge(g1clk) then
      g1q <= g1d; g1q_n <= not g1d;
    end if;
  end process;

  -- second flip-flop
  process(g2clk, g2r_n, g2s_n)
  begin
    if g2r_n = '0' then
      g2q <= '0'; g2q_n <= '1';
    elsif g2s_n = '0' then
      g2q <= '1'; g2q_n <= '0';
    elsif rising_edge(g2clk) then
      g2q <= g2d; g2q_n <= not g2d;
    end if;
  end process;
end;
