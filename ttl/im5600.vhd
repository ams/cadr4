-- 256 Bit Bipolar Read Only Memory
   
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity im5600 is
  port (
    o7   : out std_logic;
    o6   : out std_logic;
    o5   : out std_logic;
    o4   : out std_logic;
    o3   : out std_logic;
    o2   : out std_logic;
    o1   : out std_logic;
    o0   : out std_logic;
    a4   : in  std_logic;
    a3   : in  std_logic;
    a2   : in  std_logic;
    a1   : in  std_logic;
    a0   : in  std_logic;
    ce_n : in  std_logic
    );
end im5600;

architecture ttl of im5600 is
begin

end ttl;
