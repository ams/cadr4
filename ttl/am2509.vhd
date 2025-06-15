-- Datasheet for AM2509 Quad Two-Input High-Speed Register not found. This VHDL model might be based on a non-standard or custom implementation.

-- AM2509 Quad Two-Input High-Speed Register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2509 is
  port (
    clk : in  std_logic := 'H';
    sel : in  std_logic := 'H';
    a0  : in  std_logic := 'H';
    a1  : in  std_logic := 'H';
    aq  : out std_logic;
    b0  : in  std_logic := 'H';
    b1  : in  std_logic := 'H';
    bq  : out std_logic;
    c0  : in  std_logic := 'H';
    c1  : in  std_logic := 'H';
    cq  : out std_logic;
    d0  : in  std_logic := 'H';
    d1  : in  std_logic := 'H';
    dq  : out std_logic
    );
end am2509;

architecture ttl of am2509 is

  signal i0, i1, i2, i3 : std_logic;

begin

  i0 <= a1 when sel = '1' else a0;
  u0 : entity work.ff_d port map (clk => clk, d => i0, q => aq, q_n => open);

  i1 <= b1 when sel = '1' else b0;
  u1 : entity work.ff_d port map (clk => clk, d => i1, q => bq, q_n => open);

  i2 <= c1 when sel = '1' else c0;
  u2 : entity work.ff_d port map (clk => clk, d => i2, q => cq, q_n => open);

  i3 <= d1 when sel = '1' else d0;
  u3 : entity work.ff_d port map (clk => clk, d => i3, q => dq, q_n => open);

end ttl;
