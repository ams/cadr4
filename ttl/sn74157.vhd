library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74157 is
  port (
    sel   : in  std_logic;
    a4    : in  std_logic;
    b4    : in  std_logic;
    y4    : out std_logic;
    a3    : in  std_logic;
    b3    : in  std_logic;
    y3    : out std_logic;
    y2    : out std_logic;
    b2    : in  std_logic;
    a2    : in  std_logic;
    y1    : out std_logic;
    b1    : in  std_logic;
    a1    : in  std_logic;
    enb_n : in  std_logic
    );
end;

architecture ttl of sn74157 is
begin

end;
