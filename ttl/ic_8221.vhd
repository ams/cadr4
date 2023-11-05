library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_8221 is
  port (
    d1     : out std_logic;
    i1     : in  std_logic;
    we1_n  : in  std_logic;
    i0     : in  std_logic;
    d0     : out std_logic;
    we0_n  : in  std_logic;
    a0     : in  std_logic;
    a1     : in  std_logic;
    a2     : in  std_logic;
    a3     : in  std_logic;
    a4     : in  std_logic;
    strobe : in  std_logic;
    wclk_n : in  std_logic;
    ce     : in  std_logic
    );
end ic_8221;

architecture ttl of ic_8221 is
begin

end ttl;
