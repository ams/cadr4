-- SN7474: Dual D-Type Positive Edge Triggered Flip-Flops With Preset And Clear
-- Datasheet: Texas Instruments SN74S74 Dual D-Type Positive-Edge-Triggered Flip-Flops With Preset And Clear, PDIP (N) Package
-- URL: https://www.ti.com/lit/gpn/SN74S74

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
  constant SETUP_TIME       : time := 20 ns;
  constant HOLD_TIME        : time := 5 ns;
  signal g1q_int, g1q_n_int : std_logic;
  signal g2q_int, g2q_n_int : std_logic;
begin
  -- first flip-flop
  process(g1clk, g1r_n, g1s_n)
  begin
    if g1r_n = '0' then
      g1q_int   <= '0';
      g1q_n_int <= '1';
    elsif g1s_n = '0' then
      g1q_int   <= '1';
      g1q_n_int <= '0';
    elsif rising_edge(g1clk) then
      g1q_int   <= g1d;
      g1q_n_int <= not g1d;
    end if;
  end process;

  -- second flip-flop
  process(g2clk, g2r_n, g2s_n)
  begin
    if g2r_n = '0' then
      g2q_int   <= '0';
      g2q_n_int <= '1';
    elsif g2s_n = '0' then
      g2q_int   <= '1';
      g2q_n_int <= '0';
    elsif rising_edge(g2clk) then
      g2q_int   <= g2d;
      g2q_n_int <= not g2d;
    end if;
  end process;

  -- Output assignments
  g1q   <= g1q_int;
  g1q_n <= g1q_n_int;
  g2q   <= g2q_int;
  g2q_n <= g2q_n_int;
end;
