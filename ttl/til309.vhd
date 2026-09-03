-- Numeric Displays With Logic
-- Texas Instruments TIL309
-- doc/ttl/til309.pdf
--
-- Only the 4-bit BCD latch with its outputs QA..QD is modelled; the LED
-- display, the decimal point latch (no QDP output on the CADR symbol) and
-- the display-only controls have no observable effect in the simulation.
--
-- Latch strobe (LS): when low, the data in the latch follows the latch
-- inputs (transparent); when high, the data is held. Lamp test (LT) and
-- blanking (BI) override only the display, the latch outputs are unaffected.
--
-- Pin numbers in the port comments follow the CADR drawing symbol (which
-- puts the inputs on pins 12..17), not the TI 16-pin package pinout.

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity til309 is
  port (
    i1, i2, i4, i8 : in  std_logic; -- i1: Pin 17 (A), i2: Pin 12 (B), i4: Pin 6 (C), i8: Pin 7 (D)
    dp             : in  std_logic; -- Pin 14 (DP, decimal point data, display only)
    latch          : in  std_logic; -- Pin 5 (LS, latch strobe, transparent when low)
    blank_n        : in  std_logic; -- Pin 13 (BI, display only)
    ldp            : in  std_logic; -- Pin 16 (display only)
    test_n         : in  std_logic; -- Pin 15 (LT, display only)
    l1, l2, l4, l8 : out std_logic  -- l1: Pin 4 (QA), l2: Pin 1 (QB), l4: Pin 2 (QC), l8: Pin 3 (QD)
    );
end entity;

architecture behavioral of til309 is
  signal i1_int     : std_logic;
  signal i2_int     : std_logic;
  signal i4_int     : std_logic;
  signal i8_int     : std_logic;
  signal latch_int  : std_logic;

  signal reg : std_logic_vector(3 downto 0) := (others => '0');
begin
  i1_int <= ttl_input(i1);
  i2_int <= ttl_input(i2);
  i4_int <= ttl_input(i4);
  i8_int <= ttl_input(i8);
  latch_int <= ttl_input(latch);

  -- BCD latch: transparent while the strobe is low, holds while it is high
  process (all)
  begin
    if latch_int = '0' then
      reg <= i8_int & i4_int & i2_int & i1_int;
    end if;
  end process;

  l8 <= reg(3);
  l4 <= reg(2);
  l2 <= reg(1);
  l1 <= reg(0);
end architecture;
