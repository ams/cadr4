-- Quad Register with Two Independantly Controlled Three-State Outputs
-- AMD Am25LS2519
-- ttl/doc/am25ls2519.pdf

library ieee;
use ieee.std_logic_1164.all;

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
    d0         : in  std_logic := 'H'; -- 1
    d1         : in  std_logic := 'H'; -- 4
    d2         : in  std_logic := 'H'; -- 13
    d3         : in  std_logic := 'H'; -- 16
    e_n        : in  std_logic := 'H'; -- 17
    cp         : in  std_logic := 'H'; -- 9
    oe_y_n     : in  std_logic := 'H'; -- 8
    oe_w_n     : in  std_logic := 'H'; -- 7
    y0         : out std_logic; -- 3
    y1         : out std_logic; -- 6
    y2         : out std_logic; -- 11
    y3         : out std_logic; -- 14
    w0         : out std_logic; -- 2
    w1         : out std_logic; -- 5
    w2         : out std_logic; -- 12
    w3         : out std_logic; -- 15
    pol        : in  std_logic := 'H'; -- 18
    clr_n      : in  std_logic := 'H' -- 19
    );
end entity;

architecture ttl of am25ls2519 is
  signal q0, q1, q2, q3 : std_logic;
begin

  u1 : entity work.ff_d port map (clk => cp, d => d0, q => q0, q_n => open, enb_n => e_n);
  u2 : entity work.ff_d port map (clk => cp, d => d1, q => q1, q_n => open, enb_n => e_n);
  u3 : entity work.ff_d port map (clk => cp, d => d2, q => q2, q_n => open, enb_n => e_n);
  u4 : entity work.ff_d port map (clk => cp, d => d3, q => q3, q_n => open, enb_n => e_n);

  process (all)
  begin
    if to_x01(oe_y_n) = '0' then
      y3 <= q3;
      y2 <= q2;
      y1 <= q1;
      y0 <= q0;
    elsif to_x01(oe_y_n) = '1' then
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

    if to_x01(oe_w_n) = '0' then
      if to_x01(pol) = '1' then
        w3 <= not q3;
        w2 <= not q2;
        w1 <= not q1;
        w0 <= not q0;
      elsif to_x01(pol) = '0' then
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
    elsif to_x01(oe_w_n) = '1' then
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
