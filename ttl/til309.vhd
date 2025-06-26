-- Numeric Displays With Logic
-- Texas Instruments TIL309
-- doc/ttl/til309.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.misc.all;

entity til309 is
  port (
    i1, i2, i4, i8 : in  std_logic; -- i1: Pin 17 (A), i2: Pin 12 (B), i4: Pin 6 (C), i8: Pin 7 (D)
    dp             : in  std_logic; -- Pin 14
    latch          : in  std_logic; -- Pin 5 
    blank_n        : in  std_logic; -- Pin 13
    ldp            : in  std_logic; -- Pin 16
    test_n         : in  std_logic; -- Pin 15 (LT)
    l1, l2, l4, l8 : out std_logic  -- l1: Pin 4 (QA), l2: Pin 1 (QB), l4: Pin 2 (QC), l8: Pin 3 (QD)
    );
end;

architecture ttl of til309 is
  signal i1_int     : std_logic;
  signal i2_int     : std_logic;
  signal i4_int     : std_logic;
  signal i8_int     : std_logic;
  signal dp_int     : std_logic;
  signal latch_int  : std_logic;
  signal blank_n_int: std_logic;
  signal ldp_int    : std_logic;
  signal test_n_int : std_logic;
  
  signal reg : std_logic_vector(3 downto 0);
begin
  i1_int <= ttl_input(i1);
  i2_int <= ttl_input(i2);
  i4_int <= ttl_input(i4);
  i8_int <= ttl_input(i8);
  dp_int <= ttl_input(dp);
  latch_int <= ttl_input(latch);
  blank_n_int <= ttl_input(blank_n);
  ldp_int <= ttl_input(ldp);
  test_n_int <= ttl_input(test_n);
  
  process (all)
  begin
    if rising_edge(latch_int) then
      reg <= i8_int & i4_int & i2_int & i1_int;
    end if;
  end process;

  process (all)
    variable disp : std_logic_vector(3 downto 0);
  begin
    if test_n_int = '0' then
      disp := (others => '1');
    elsif blank_n_int = '0' then
      disp := (others => '0');
    else
      disp := reg;
    end if;
    l8 <= disp(3); l4 <= disp(2); l2 <= disp(1); l1 <= disp(0);
  end process;
end;
