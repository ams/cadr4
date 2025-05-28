-- AM2507 Six-Bit Register with Common Clock Enable

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2507 is
  port (
    i0    : in  std_logic; -- pin 3
    i1    : in  std_logic; -- pin 4
    i2    : in  std_logic; -- pin 6
    i3    : in  std_logic; -- pin 11
    i4    : in  std_logic; -- pin 13
    i5    : in  std_logic; -- pin 14
    d0    : out std_logic; -- pin 2
    d1    : out std_logic; -- pin 5
    d2    : out std_logic; -- pin 7
    d3    : out std_logic; -- pin 10
    d4    : out std_logic; -- pin 12
    d5    : out std_logic; -- pin 15
    clk   : in  std_logic; -- pin 9
    enb_n : in  std_logic -- pin 1
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
