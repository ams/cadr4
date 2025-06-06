-- TIL309: Numeric Displays With Logic
-- Datasheet: Texas Instruments TIL308, TIL309 Numeric Displays With Logic, 16-pin package
-- URL: https://pdf.dzsc.com/TIL/TIL308.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity til309 is
  port (
    i1, i2, i4, i8 : in  std_logic; -- i1: Pin 15 (A), i2: Pin 10 (B), i4: Pin 6 (C), i8: Pin 7 (D)
    dp             : in  std_logic; -- Pin 12 (DP)
    latch          : in  std_logic; -- Pin 5 (LS)
    blank_n        : in  std_logic; -- Pin 11 (BI)
    ldp            : in  std_logic; -- Pin 14 (QDP)
    test_n         : in  std_logic; -- Pin 13 (LT)
    l1, l2, l4, l8 : out std_logic  -- l1: Pin 4 (QA), l2: Pin 1 (QB), l4: Pin 2 (QC), l8: Pin 3 (QD)
    );
end;

-- ChatGPT Codex implementation
architecture ttl of til309 is
  signal reg : std_logic_vector(3 downto 0) := (others => '0');
begin
  process(latch)
  begin
    if rising_edge(latch) then
      reg <= i8 & i4 & i2 & i1;
    end if;
  end process;

  process(all)
    variable disp : std_logic_vector(3 downto 0);
  begin
    disp := reg;
    if test_n = '0' then
      disp := (others => '1');
    elsif blank_n = '0' then
      disp := (others => '0');
    end if;
    l8 <= disp(3); l4 <= disp(2); l2 <= disp(1); l1 <= disp(0);
  end process;
end;
