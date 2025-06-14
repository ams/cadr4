-- AM252519 Quad Register with Two Independantly Controlled Three-State Outputs
-- Mete: port names and implementation matches to datasheet (ttl/doc/am25ls2519.pdf)
-- Mete: pin numbers are for CERDIP package

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- di inputs
-- e_n clock enable
-- cp clock pulse (clk)
-- oe_y_n and oe_w_n outout enable y and w, when H, output is high-Z
-- yi non-inverting three-state outputs
-- wi three-state outputs with polarity control
-- pol polarity control, when H, Wi is inverted
-- clr_n asynch clear, when L, internal flip-flips are reset to L

entity am252519 is
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
end am252519;

architecture ttl of am252519 is
  signal reg4 : std_logic_vector(3 downto 0);
begin
  ------------------------------------------------------------------
  -- register operation
  ------------------------------------------------------------------
  process(cp, clr_n)
  begin
    if clr_n = '0' then
      reg4 <= "0000";
    elsif rising_edge(cp) then
      if e_n = '0' then
        reg4 <= d3 & d2 & d1 & d0;
      end if;
    end if;
  end process;

  ------------------------------------------------------------------
  -- output section
  ------------------------------------------------------------------
  process(reg4, oe_y_n, oe_w_n, pol)
  begin
    if oe_y_n = '0' then
      y3 <= reg4(3);
      y2 <= reg4(2);
      y1 <= reg4(1);
      y0 <= reg4(0);
    else
      y3 <= 'Z';
      y2 <= 'Z';
      y1 <= 'Z';
      y0 <= 'Z';
    end if;

    if oe_w_n = '0' then
      if pol = '1' then
        w3 <= not reg4(3);
        w2 <= not reg4(2);
        w1 <= not reg4(1);
        w0 <= not reg4(0);
      else
        w3 <= reg4(3);
        w2 <= reg4(2);
        w1 <= reg4(1);
        w0 <= reg4(0);
      end if;
    else
      w3 <= 'Z';
      w2 <= 'Z';
      w1 <= 'Z';
      w0 <= 'Z';
    end if;
  end process;
end;
