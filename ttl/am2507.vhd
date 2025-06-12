-- Datasheet for 6-bit AM2507 not found. This VHDL model might be based on a non-standard or custom implementation.

-- AM2507 Six-Bit Register with Common Clock Enable

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2507 is
  port (
    i0    : in  std_logic;
    i1    : in  std_logic;
    i2    : in  std_logic;
    i3    : in  std_logic;
    i4    : in  std_logic;
    i5    : in  std_logic;
    d0    : out std_logic;
    d1    : out std_logic;
    d2    : out std_logic;
    d3    : out std_logic;
    d4    : out std_logic;
    d5    : out std_logic;
    clk   : in  std_logic;
    enb_n : in  std_logic
    );
end am2507;

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
