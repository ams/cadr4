-- Numeric Displays With Logic

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity til309 is
  port (
    i1, i2, i4, i8 : in  std_logic;
    dp             : in  std_logic;
    latch          : in  std_logic;
    blank_n        : in  std_logic;
    ldp            : in  std_logic;
    test_n         : in  std_logic;
    l1, l2, l4, l8 : out std_logic
    );
end;

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
