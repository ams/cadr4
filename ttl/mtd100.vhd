library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity mtd100 is
  port (
    i0 : in std_logic; -- 1
    i1 : in std_logic; -- 3
    i2 : in std_logic; -- 5
    o0 : out std_logic; -- 12
    o1 : out std_logic; -- 10
    o2 : out std_logic  -- 8
  );
end mtd100;

architecture behavioral of mtd100 is
  signal i0_int : std_logic;
  signal i1_int : std_logic;
  signal i2_int : std_logic;
begin
  i0_int <= ttl_input(i0);
  i1_int <= ttl_input(i1);
  i2_int <= ttl_input(i2);
  o0 <= transport i0_int after 100 ns;
  o1 <= transport i1_int after 100 ns;
  o2 <= transport i2_int after 100 ns;
end;