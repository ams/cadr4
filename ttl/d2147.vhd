-- 4096 X 1 Bt Static RAM
-- Intel 2147H
-- doc/ttl/d2147.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.misc.all;

entity d2147 is
  generic (
    fn : string := ""
  );
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
    a10  : in  std_logic;
    a11  : in  std_logic;
    ce_n : in  std_logic;
    di   : in  std_logic;
    we_n : in  std_logic;
    do   : out std_logic
    );
end entity;

architecture behavioral of d2147 is
  signal a0_int   : std_logic;
  signal a1_int   : std_logic;
  signal a2_int   : std_logic;
  signal a3_int   : std_logic;
  signal a4_int   : std_logic;
  signal a5_int   : std_logic;
  signal a6_int   : std_logic;
  signal a7_int   : std_logic;
  signal a8_int   : std_logic;
  signal a9_int   : std_logic;
  signal a10_int  : std_logic;
  signal a11_int  : std_logic;
  signal ce_n_int : std_logic;
  signal di_int   : std_logic;
  signal we_n_int : std_logic;
  
  signal ram : work.misc.word_array_t(0 to 4095)(0 downto 0) := load_hex_file(fn, 4096, 1);
  
begin
  a0_int <= ttl_input(a0);
  a1_int <= ttl_input(a1);
  a2_int <= ttl_input(a2);
  a3_int <= ttl_input(a3);
  a4_int <= ttl_input(a4);
  a5_int <= ttl_input(a5);
  a6_int <= ttl_input(a6);
  a7_int <= ttl_input(a7);
  a8_int <= ttl_input(a8);
  a9_int <= ttl_input(a9);
  a10_int <= ttl_input(a10);
  a11_int <= ttl_input(a11);
  ce_n_int <= ttl_input(ce_n);
  di_int <= ttl_input(di);
  we_n_int <= ttl_input(we_n);
  
  process (all)
    variable addr : unsigned(11 downto 0);
  begin
    if ce_n_int = '0' then
      addr := (a11_int, a10_int, a9_int, a8_int, a7_int, a6_int, a5_int, a4_int, a3_int, a2_int, a1_int, a0_int);
      if is_x(addr) then
        if we_n_int = '1' then
          do <= 'X';
        end if;
      else
        if we_n_int = '0' then
          ram(to_integer(addr))(0) <= di_int;
        elsif we_n_int = '1' then
          do <= ram(to_integer(addr))(0);
        else
          -- do nothing
        end if;
      end if;
    elsif ce_n_int = '1' then
      do <= 'Z';
    else
      do <= 'X';
    end if;
  end process;
end architecture;
