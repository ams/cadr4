-- Six-Bit Register with Common Clock Enable

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2507 is
  port (
    i0, i1, i2, i3, i4, i5 : in  std_logic;
    d0, d1, d2, d3, d4, d5 : out std_logic;
    clk                    : in  std_logic;
    enb_n                  : in  std_logic
    );
end am2507;

-- ChatGPT Codex implementation
architecture ttl of am2507 is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if enb_n = '0' then
        d0 <= i0; d1 <= i1; d2 <= i2;
        d3 <= i3; d4 <= i4; d5 <= i5;
      end if;
    end if;
  end process;
end;
