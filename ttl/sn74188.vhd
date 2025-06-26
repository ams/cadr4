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

architecture ttl of sn74188 is
  signal ce_n_i, a0_i, a1_i, a2_i, a3_i, a4_i : std_logic;
  constant rom  : std_logic_vector := load_rom_file(fn);  
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
    if to_x01(ce_n_i) = '0' then
      addr := (a4_i, a3_i, a2_i, a1_i, a0_i);
      if is_x(addr) then
        o7 <= 'X'; o6 <= 'X'; o5 <= 'X'; o4 <= 'X';
        o3 <= 'X'; o2 <= 'X'; o1 <= 'X'; o0 <= 'X';        
      else
        data := rom(to_integer(addr) * 8 + 7 downto to_integer(addr) * 8);
        -- this is an open-collector output component
        -- it can only drive low or high-z
        -- an external pull-up resistor is required to drive high
        o7 <= '0' when data(7) = '0' else 'Z';
        o6 <= '0' when data(6) = '0' else 'Z';
        o5 <= '0' when data(5) = '0' else 'Z';
        o4 <= '0' when data(4) = '0' else 'Z';
        o3 <= '0' when data(3) = '0' else 'Z';
        o2 <= '0' when data(2) = '0' else 'Z';
        o1 <= '0' when data(1) = '0' else 'Z';
        o0 <= '0' when data(0) = '0' else 'Z';
      end if;
    elsif to_x01(ce_n_i) = '1' then
      o7 <= 'Z'; o6 <= 'Z'; o5 <= 'Z'; o4 <= 'Z';
      o3 <= 'Z'; o2 <= 'Z'; o1 <= 'Z'; o0 <= 'Z';
    else
      o7 <= 'X'; o6 <= 'X'; o5 <= 'X'; o4 <= 'X';
      o3 <= 'X'; o2 <= 'X'; o1 <= 'X'; o0 <= 'X';
    end if;
  end process;
end architecture;
