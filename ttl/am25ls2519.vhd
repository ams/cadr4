-- Quad Register with Two Independantly Controlled Three-State Outputs
-- AMD Am25LS2519
-- ttl/doc/am25ls2519.pdf

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

-- di inputs
-- e_n clock enable
-- cp clock pulse (clk)
-- oe_y_n and oe_w_n outout enable y and w, when H, output is high-Z
-- yi non-inverting three-state outputs
-- wi three-state outputs with polarity control
-- pol polarity control, when H, Wi is inverted
-- clr_n asynch clear, when L, internal flip-flips are reset to L

-- pin numbers are for CERDIP package
entity am25ls2519 is
  port (    
    d0         : in  std_logic; -- 1
    d1         : in  std_logic; -- 4
    d2         : in  std_logic; -- 13
    d3         : in  std_logic; -- 16
    e_n        : in  std_logic; -- 17
    cp         : in  std_logic; -- 9
    oe_y_n     : in  std_logic; -- 8
    oe_w_n     : in  std_logic; -- 7
    y0         : out std_logic; -- 3
    y1         : out std_logic; -- 6
    y2         : out std_logic; -- 11
    y3         : out std_logic; -- 14
    w0         : out std_logic; -- 2
    w1         : out std_logic; -- 5
    w2         : out std_logic; -- 12
    w3         : out std_logic; -- 15
    pol        : in  std_logic; -- 18
    clr_n      : in  std_logic -- 19
    );
end entity;

architecture ttl of am25ls2519 is
  signal d0_i, d1_i, d2_i, d3_i, e_n_i, cp_i, oe_y_n_i, oe_w_n_i, pol_i, clr_n_i : std_logic;
  signal q0, q1, q2, q3 : std_logic;
begin

  d0_i <= ttl_input(d0);
  d1_i <= ttl_input(d1);
  d2_i <= ttl_input(d2);
  d3_i <= ttl_input(d3);
  e_n_i <= ttl_input(e_n);
  cp_i <= ttl_input(cp);
  oe_y_n_i <= ttl_input(oe_y_n);
  oe_w_n_i <= ttl_input(oe_w_n);
  pol_i <= ttl_input(pol);
  clr_n_i <= ttl_input(clr_n);

  u1 : entity work.ff_dpc port map (clk => cp_i, d => d0_i, q => q0, q_n => open, enb_n => e_n_i, pre => '1', clr => clr_n_i);
  u2 : entity work.ff_dpc port map (clk => cp_i, d => d1_i, q => q1, q_n => open, enb_n => e_n_i, pre => '1', clr => clr_n_i);
  u3 : entity work.ff_dpc port map (clk => cp_i, d => d2_i, q => q2, q_n => open, enb_n => e_n_i, pre => '1', clr => clr_n_i);
  u4 : entity work.ff_dpc port map (clk => cp_i, d => d3_i, q => q3, q_n => open, enb_n => e_n_i, pre => '1', clr => clr_n_i);

  process (all)
  begin
    if oe_y_n_i = '0' then
      y3 <= q3;
      y2 <= q2;
      y1 <= q1;
      y0 <= q0;
    elsif oe_y_n_i = '1' then
      y3 <= 'Z';
      y2 <= 'Z';
      y1 <= 'Z';
      y0 <= 'Z';
    else
      y3 <= 'X';
      y2 <= 'X';
      y1 <= 'X';
      y0 <= 'X';
    end if;

    if oe_w_n_i = '0' then
      if pol_i = '1' then
        w3 <= not q3;
        w2 <= not q2;
        w1 <= not q1;
        w0 <= not q0;
      elsif pol_i = '0' then
        w3 <= q3;
        w2 <= q2;
        w1 <= q1;
        w0 <= q0;
      else
        w3 <= 'X';
        w2 <= 'X';
        w1 <= 'X';
        w0 <= 'X';
      end if;
    elsif oe_w_n_i = '1' then
      w3 <= 'Z';
      w2 <= 'Z';
      w1 <= 'Z';
      w0 <= 'Z';
    else
      w3 <= 'X';
      w2 <= 'X';
      w1 <= 'X';
      w0 <= 'X';
    end if;
  end process;
  
end architecture;
