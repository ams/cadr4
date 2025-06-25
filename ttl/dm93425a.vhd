-- 1024x1 Bit TTL Bipolar RAM
-- Fairchild 93425A
-- doc/ttl/dm93425a.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dm93425a is
  port (
    a0   : in  std_logic;
    a1   : in  std_logic;
    a2   : in  std_logic;
    a3   : in  std_logic;
    a4   : in  std_logic;
    a5   : in  std_logic;
    a6   : in  std_logic;
    a7   : in  std_logic;
    a8   : in  std_logic;
    a9   : in  std_logic;
    ce_n : in  std_logic;
    we_n : in  std_logic;
    di   : in  std_logic;
    do   : out std_logic
    );
end entity;

architecture ttl of dm93425a is
  signal a0_i, a1_i, a2_i, a3_i, a4_i, a5_i, a6_i, a7_i, a8_i, a9_i, ce_n_i, we_n_i, di_i : std_logic;
  type ram_t is array (0 to 1023) of std_logic;
  signal ram : ram_t  := (others => '0');
begin

  a0_i <= 'H';
  a1_i <= 'H';
  a2_i <= 'H';
  a3_i <= 'H';
  a4_i <= 'H';
  a5_i <= 'H';
  a6_i <= 'H';
  a7_i <= 'H';
  a8_i <= 'H';
  a9_i <= 'H';
  ce_n_i <= 'H';
  we_n_i <= 'H';
  di_i <= 'H';

  a0_i <= a0;
  a1_i <= a1;
  a2_i <= a2;
  a3_i <= a3;
  a4_i <= a4;
  a5_i <= a5;
  a6_i <= a6;
  a7_i <= a7;
  a8_i <= a8;
  a9_i <= a9;
  ce_n_i <= ce_n;
  we_n_i <= we_n;
  di_i <= di;

  process(all)
    variable addr : unsigned(9 downto 0);
  begin
    if to_x01(ce_n_i) = '0' then
      addr := (a9_i, a8_i, a7_i, a6_i, a5_i, a4_i, a3_i, a2_i, a1_i, a0_i);
      if is_x(addr) then
        if to_x01(we_n_i) = '1' then
          do <= 'X';
        end if;
      else
        if to_x01(we_n_i) = '0' then
          -- Write
          ram(to_integer(addr)) <= di_i;
        elsif to_x01(we_n_i) = '1' then
          -- Read (always happens when enabled)
          do <= ram(to_integer(addr));
        else
          -- do nothing
        end if;
      end if;
    elsif to_x01(ce_n_i) = '1' then
      do <= 'Z';
    else
      do <= 'X';
    end if;
  end process;
end architecture;
