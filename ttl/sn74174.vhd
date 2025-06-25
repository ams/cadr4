-- Hex D-Type Flip-Flops with Clear

library ieee;
use ieee.std_logic_1164.all;

entity sn74174 is
  port (
    clk   : in std_logic := 'H';
    clr_n : in std_logic := 'H';

    d1 : in  std_logic := 'H';
    d2 : in  std_logic := 'H';
    d3 : in  std_logic := 'H';
    d4 : in  std_logic := 'H';
    d5 : in  std_logic := 'H';
    d6 : in  std_logic := 'H';
    q1 : out std_logic;
    q2 : out std_logic;
    q3 : out std_logic;
    q4 : out std_logic;
    q5 : out std_logic;
    q6 : out std_logic
    );
end;

architecture ttl of sn74174 is
begin

  u1 : entity work.ff_dpc port map (clk => clk, clr => clr_n, d => d1, q => q1, q_n => open, enb_n => '0', pre => '1');
  u2 : entity work.ff_dpc port map (clk => clk, clr => clr_n, d => d2, q => q2, q_n => open, enb_n => '0', pre => '1');
  u3 : entity work.ff_dpc port map (clk => clk, clr => clr_n, d => d3, q => q3, q_n => open, enb_n => '0', pre => '1');
  u4 : entity work.ff_dpc port map (clk => clk, clr => clr_n, d => d4, q => q4, q_n => open, enb_n => '0', pre => '1');
  u5 : entity work.ff_dpc port map (clk => clk, clr => clr_n, d => d5, q => q5, q_n => open, enb_n => '0', pre => '1');
  u6 : entity work.ff_dpc port map (clk => clk, clr => clr_n, d => d6, q => q6, q_n => open, enb_n => '0', pre => '1');

end;