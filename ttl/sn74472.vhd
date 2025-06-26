-- (512x8) 4096-Bit TTL PROM
-- Texas Instruments SN74S472
-- doc/ttl/sn74s472.pdf

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.misc.load_rom_file;
use work.misc.ttl_input;

entity sn74472 is
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
    d0   : out std_logic;
    d1   : out std_logic;
    d2   : out std_logic;
    d3   : out std_logic;
    d4   : out std_logic;
    d5   : out std_logic;
    d6   : out std_logic;
    d7   : out std_logic;
    ce_n : in  std_logic
    );
end;

architecture ttl of sn74472 is
  signal a0_i, a1_i, a2_i, a3_i, a4_i, a5_i, a6_i, a7_i, a8_i, ce_n_i : std_logic;
  constant rom  : std_logic_vector := load_rom_file(fn);  
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
  ce_n_i <= ttl_input(ce_n);

    process(all)
    variable data : std_logic_vector(7 downto 0);
    variable addr : unsigned(8 downto 0);
  begin
    if to_x01(ce_n_i) = '0' then
      addr := (a8_i, a7_i, a6_i, a5_i, a4_i, a3_i, a2_i, a1_i, a0_i);
      if is_x(addr) then
        d7 <= 'X'; d6 <= 'X'; d5 <= 'X'; d4 <= 'X';
        d3 <= 'X'; d2 <= 'X'; d1 <= 'X'; d0 <= 'X';
      else
        data := rom(to_integer(addr) * 8 + 7 downto to_integer(addr) * 8);
        d7 <= data(7); d6 <= data(6); d5 <= data(5); d4 <= data(4);
        d3 <= data(3); d2 <= data(2); d1 <= data(1); d0 <= data(0);
      end if;
    elsif to_x01(ce_n_i) = '1' then
      d7 <= 'Z'; d6 <= 'Z'; d5 <= 'Z'; d4 <= 'Z';
      d3 <= 'Z'; d2 <= 'Z'; d1 <= 'Z'; d0 <= 'Z';
    else
      d7 <= 'X'; d6 <= 'X'; d5 <= 'X'; d4 <= 'X';
      d3 <= 'X'; d2 <= 'X'; d1 <= 'X'; d0 <= 'X';
    end if;
  end process;
end;
