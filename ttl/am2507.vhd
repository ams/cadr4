-- Datasheet for 6-bit AM2507 not found. This VHDL model might be based on a non-standard or custom implementation.

-- AM2507 Six-Bit Register with Common Clock Enable

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2507 is
  port (
    i0    : in  std_logic := 'H';
    i1    : in  std_logic := 'H';
    i2    : in  std_logic := 'H';
    i3    : in  std_logic := 'H';
    i4    : in  std_logic := 'H';
    i5    : in  std_logic := 'H';
    d0    : out std_logic := '0';
    d1    : out std_logic := '0';
    d2    : out std_logic := '0';
    d3    : out std_logic := '0';
    d4    : out std_logic := '0';
    d5    : out std_logic := '0';
    clk   : in  std_logic := 'H';
    enb_n : in  std_logic := 'H'
    );
end am2507;

architecture ttl of am2507 is
begin
  process(all)
  begin
    if enb_n = '0' then
      if rising_edge(clk) then
        d0 <= i0; d1 <= i1; d2 <= i2;
        d3 <= i3; d4 <= i4; d5 <= i5;
      end if;
    end if;
  end process;
end;
