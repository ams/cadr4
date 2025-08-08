library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity mttldl is
  generic (delay : time := 100 ns);
  port (
    i0 : in std_logic; -- 1
    i1 : in std_logic; -- 3
    i2 : in std_logic; -- 5
    o0 : out std_logic; -- 12
    o1 : out std_logic; -- 10
    o2 : out std_logic  -- 8
  );
end mttldl;

architecture behavioral of mttldl is
  signal i0_int : std_logic;
  signal i1_int : std_logic;
  signal i2_int : std_logic;
begin
  i0_int <= ttl_input(i0);
  i1_int <= ttl_input(i1);
  i2_int <= ttl_input(i2);
  o0 <= transport i0_int after delay;
  o1 <= transport i1_int after delay;
  o2 <= transport i2_int after delay;
end;