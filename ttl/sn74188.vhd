-- (32x8) 256-Bit TTL PROM
-- National Semiconductor 74S188
-- doc/ttl/sn74s188.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.misc.all;

entity sn74188 is
  generic (fn : string := "");
  port (
    ce_n : in  std_logic;
    a0   : in  std_logic;
    a1   : in  std_logic;
    a2   : in  std_logic;
    a3   : in  std_logic;
    a4   : in  std_logic;
    o0   : out std_logic;
    o1   : out std_logic;
    o2   : out std_logic;
    o3   : out std_logic;
    o4   : out std_logic;
    o5   : out std_logic;
    o6   : out std_logic;
    o7   : out std_logic
    );
end entity;

architecture behavioral of sn74188 is
  signal ce_n_i, a0_i, a1_i, a2_i, a3_i, a4_i : std_logic;  
  constant rom : work.misc.word_array_t(0 to 31)(7 downto 0) := load_hex_file(fn, 32, 8);  
begin

  ce_n_i <= ttl_input(ce_n);
  a0_i <= ttl_input(a0);
  a1_i <= ttl_input(a1);
  a2_i <= ttl_input(a2);
  a3_i <= ttl_input(a3);
  a4_i <= ttl_input(a4);

  process(all)
    variable data : std_logic_vector(7 downto 0);
    variable addr : unsigned(4 downto 0);
  begin
    if ce_n_i = '0' then
      addr := (a4_i, a3_i, a2_i, a1_i, a0_i);
      if is_x(addr) then
        o7 <= 'X'; o6 <= 'X'; o5 <= 'X'; o4 <= 'X';
        o3 <= 'X'; o2 <= 'X'; o1 <= 'X'; o0 <= 'X';        
      else
        data := rom(to_integer(addr));
        -- this is an open-collector output component
        -- it can only drive low or high-z
        -- an external pull-up resistor is required to drive high
        o7 <= '0' when data(7) = '0' else 'Z' when data(7) = '1' else data(7);
        o6 <= '0' when data(6) = '0' else 'Z' when data(6) = '1' else data(6);
        o5 <= '0' when data(5) = '0' else 'Z' when data(5) = '1' else data(5);
        o4 <= '0' when data(4) = '0' else 'Z' when data(4) = '1' else data(4);
        o3 <= '0' when data(3) = '0' else 'Z' when data(3) = '1' else data(3);
        o2 <= '0' when data(2) = '0' else 'Z' when data(2) = '1' else data(2);
        o1 <= '0' when data(1) = '0' else 'Z' when data(1) = '1' else data(1);
        o0 <= '0' when data(0) = '0' else 'Z' when data(0) = '1' else data(0);
      end if;
    elsif ce_n_i = '1' then
      o7 <= 'Z'; o6 <= 'Z'; o5 <= 'Z'; o4 <= 'Z';
      o3 <= 'Z'; o2 <= 'Z'; o1 <= 'Z'; o0 <= 'Z';
    else
      o7 <= 'X'; o6 <= 'X'; o5 <= 'X'; o4 <= 'X';
      o3 <= 'X'; o2 <= 'X'; o1 <= 'X'; o0 <= 'X';
    end if;
  end process;
end architecture;
