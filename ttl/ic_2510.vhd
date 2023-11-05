library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_2510 is
  port (
    i3   : in  std_logic;
    i2   : in  std_logic;
    i1   : in  std_logic;
    i0   : in  std_logic;
    i_1  : in  std_logic;
    i_2  : in  std_logic;
    i_3  : in  std_logic;
    sel1 : in  std_logic;
    sel0 : in  std_logic;
    ce_n : in  std_logic;
    o3   : out std_logic;
    o2   : out std_logic;
    o1   : out std_logic;
    o0   : out std_logic
    );
end ic_2510;

architecture ttl of ic_2510 is
begin

end ttl;
