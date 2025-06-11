-- Datasheet for AM2509 Quad Two-Input High-Speed Register not found. This VHDL model might be based on a non-standard or custom implementation.

-- AM2509 Quad Two-Input High-Speed Register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.misc.all;

entity am2509 is
  port (
    clk : in  std_logic;
    sel : in  std_logic;
    a0  : in  std_logic;
    a1  : in  std_logic;
    aq  : out std_logic;
    b0  : in  std_logic;
    b1  : in  std_logic;
    bq  : out std_logic;
    c0  : in  std_logic;
    c1  : in  std_logic;
    cq  : out std_logic;
    d0  : in  std_logic;
    d1  : in  std_logic;
    dq  : out std_logic
    );
end am2509;

architecture ttl of am2509 is

  signal i0, i1, i2, i3 : std_logic;

begin

  i0 <= sel and (a0 or a1);
  u0 : ff_d port map (clk => clk, d => i0, q => aq);

  i1 <= sel and (b0 or b1);
  u1 : ff_d port map (clk => clk, d => i1, q => bq);

  i2 <= sel and (c0 or c1);
  u2 : ff_d port map (clk => clk, d => i2, q => cq);

  i3 <= sel and (d0 or d1);
  u3 : ff_d port map (clk => clk, d => i3, q => dq);

end ttl;
