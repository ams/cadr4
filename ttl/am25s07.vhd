-- Hex Parallel D Registers with Register Enable
-- AMD Am25S07
-- doc/ttl/am25s07.pdf

library ieee;
use ieee.std_logic_1164.all;

entity am25s07 is
  port (
    i0    : in  std_logic := 'H';
    i1    : in  std_logic := 'H';
    i2    : in  std_logic := 'H';
    i3    : in  std_logic := 'H';
    i4    : in  std_logic := 'H';
    i5    : in  std_logic := 'H';
    d0    : out std_logic;
    d1    : out std_logic;
    d2    : out std_logic;
    d3    : out std_logic;
    d4    : out std_logic;
    d5    : out std_logic;
    clk   : in  std_logic := 'H';
    enb_n : in  std_logic := 'H'
    );
end entity;

architecture ttl of am25s07 is
begin
  u1 : entity work.ff_dpc port map (clk => clk, d => i0, q => d0, q_n => open, enb_n => enb_n, pre => '1', clr => '1');
  u2 : entity work.ff_dpc port map (clk => clk, d => i1, q => d1, q_n => open, enb_n => enb_n, pre => '1', clr => '1');
  u3 : entity work.ff_dpc port map (clk => clk, d => i2, q => d2, q_n => open, enb_n => enb_n, pre => '1', clr => '1');
  u4 : entity work.ff_dpc port map (clk => clk, d => i3, q => d3, q_n => open, enb_n => enb_n, pre => '1', clr => '1');
  u5 : entity work.ff_dpc port map (clk => clk, d => i4, q => d4, q_n => open, enb_n => enb_n, pre => '1', clr => '1');
  u6 : entity work.ff_dpc port map (clk => clk, d => i5, q => d5, q_n => open, enb_n => enb_n, pre => '1', clr => '1');
end architecture;
