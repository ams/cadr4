-- 1024x1 Bit TTL Bipolar RAM
-- Fairchild 93425A

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.misc.all;

entity dm93425a is
  generic (fn : string := "");
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

architecture behavioral of dm93425a is
  signal a0_i, a1_i, a2_i, a3_i, a4_i, a5_i, a6_i, a7_i, a8_i, a9_i, ce_n_i, we_n_i, di_i : std_logic;
  signal ram : work.misc.word_array_t(0 to 1023)(0 downto 0) := load_hex_file(fn, 1024, 1);
begin

  a0_i <= ttl_input(a0);
  a1_i <= ttl_input(a1);
  a2_i <= ttl_input(a2);
  a3_i <= ttl_input(a3);
  a4_i <= ttl_input(a4);
  a5_i <= ttl_input(a5);
  a6_i <= ttl_input(a6);
  a7_i <= ttl_input(a7);
  a8_i <= ttl_input(a8);
  a9_i <= ttl_input(a9);
  ce_n_i <= ttl_input(ce_n);
  we_n_i <= ttl_input(we_n);
  di_i <= ttl_input(di);

  process(all)
    variable addr : unsigned(9 downto 0);
  begin
    if ce_n_i = '0' then
      addr := (a9_i, a8_i, a7_i, a6_i, a5_i, a4_i, a3_i, a2_i, a1_i, a0_i);
      if is_x(addr) then
        if we_n_i = '1' then
          do <= 'X';
        end if;
      else
        if we_n_i = '0' then
          -- Write
          ram(to_integer(addr))(0) <= di_i;
        elsif we_n_i = '1' then
          -- Read (always happens when enabled)
          do <= ram(to_integer(addr))(0);
        else
          -- do nothing
        end if;
      end if;
    elsif ce_n_i = '1' then
      do <= 'Z';
    else
      do <= 'X';
    end if;
  end process;
end architecture;
