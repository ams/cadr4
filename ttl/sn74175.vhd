-- SN74175: Quad D-Type Flip-Flops with Clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Datasheet: Texas Instruments SN74LV175A Quadruple D-Type Flip-Flops With Clear, PDIP (N) Package
-- URL: https://www.ti.com/lit/ds/symlink/sn74lv175a.pdf

entity sn74175 is
  port (
    clk   : in std_logic := 'H';
    clr_n : in std_logic := 'H';

    d0 : in std_logic := 'H';
    d1 : in std_logic := 'H';
    d2 : in std_logic := 'H';
    d3 : in std_logic := 'H';

    q0   : out std_logic;
    q0_n : out std_logic;
    q1   : out std_logic;
    q1_n : out std_logic;
    q2   : out std_logic;
    q2_n : out std_logic;
    q3   : out std_logic;
    q3_n : out std_logic
    );
end;

architecture ttl of sn74175 is
begin

  u0 : entity work.ff_dc port map (clk => clk, clr => clr_n, d => d0, q => q0, q_n => q0_n);
  u1 : entity work.ff_dc port map (clk => clk, clr => clr_n, d => d1, q => q1, q_n => q1_n);
  u2 : entity work.ff_dc port map (clk => clk, clr => clr_n, d => d2, q => q2, q_n => q2_n);
  u3 : entity work.ff_dc port map (clk => clk, clr => clr_n, d => d3, q => q3, q_n => q3_n);

end;