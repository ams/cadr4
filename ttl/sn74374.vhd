-- SN74374: Octal D-Type Flip-Flops
-- Datasheet: Texas Instruments SN74LS374A Octal D-Type Edge-Triggered Flip-Flops With 3-State Outputs, PDIP (N) Package
-- URL: https://www.ti.com/lit/ds/symlink/sn74ls374a.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

entity sn74374 is
  port (
    clk   : in  std_logic := 'H'; -- pin 10
    oenb_n : in  std_logic := 'H'; -- pin 1
    i0 : in  std_logic := 'H'; -- pin 3
    i1 : in  std_logic := 'H'; -- pin 4
    i2 : in  std_logic := 'H'; -- pin 9
    i3 : in  std_logic := 'H'; -- pin 11
    i4 : in  std_logic := 'H'; -- pin 13
    i5 : in  std_logic := 'H'; -- pin 14
    i6 : in  std_logic := 'H'; -- pin 17
    i7 : in  std_logic := 'H'; -- pin 18
    o0 : out std_logic; -- pin 2
    o1 : out std_logic; -- pin 5
    o2 : out std_logic; -- pin 6
    o3 : out std_logic; -- pin 7
    o4 : out std_logic; -- pin 12
    o5 : out std_logic; -- pin 15
    o6 : out std_logic; -- pin 16
    o7 : out std_logic  -- pin 19
    );
end;

architecture ttl of sn74374 is
  signal q_int : std_logic_vector(7 downto 0);
begin

  -- 8 D flip-flops
  u0 : entity work.ff_d port map (clk => clk, d => i0, q => q_int(0), q_n => open);
  u1 : entity work.ff_d port map (clk => clk, d => i1, q => q_int(1), q_n => open);
  u2 : entity work.ff_d port map (clk => clk, d => i2, q => q_int(2), q_n => open);
  u3 : entity work.ff_d port map (clk => clk, d => i3, q => q_int(3), q_n => open);
  u4 : entity work.ff_d port map (clk => clk, d => i4, q => q_int(4), q_n => open);
  u5 : entity work.ff_d port map (clk => clk, d => i5, q => q_int(5), q_n => open);
  u6 : entity work.ff_d port map (clk => clk, d => i6, q => q_int(6), q_n => open);
  u7 : entity work.ff_d port map (clk => clk, d => i7, q => q_int(7), q_n => open);

  -- Output enable process: controls 3-state outputs
  process(oenb_n, q_int)
  begin
    if oenb_n = '0' then
      -- Output enable active (low), drive stored data to outputs
      o0 <= q_int(0);
      o1 <= q_int(1);
      o2 <= q_int(2);
      o3 <= q_int(3);
      o4 <= q_int(4);
      o5 <= q_int(5);
      o6 <= q_int(6);
      o7 <= q_int(7);
    elsif oenb_n = '1' then
      -- Output enable inactive (high), outputs in high-impedance
      o0 <= 'Z';
      o1 <= 'Z';
      o2 <= 'Z';
      o3 <= 'Z';
      o4 <= 'Z';
      o5 <= 'Z';
      o6 <= 'Z';
      o7 <= 'Z';
    else
      o0 <= 'X';
      o1 <= 'X';
      o2 <= 'X';
      o3 <= 'X';
      o4 <= 'X';
      o5 <= 'X';
      o6 <= 'X';
      o7 <= 'X';
    end if;
  end process;

end;
