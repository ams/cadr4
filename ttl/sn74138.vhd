-- 3-Line To 8-Line Decoders/Demultiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74138 is
  port (
    a   : in  std_logic;
    b   : in  std_logic;
    c   : in  std_logic;
    g2a : in  std_logic;
    g2b : in  std_logic;
    g1  : in  std_logic;
    y7  : out std_logic;
    y6  : out std_logic;
    y5  : out std_logic;
    y4  : out std_logic;
    y3  : out std_logic;
    y2  : out std_logic;
    y1  : out std_logic;
    y0  : out std_logic
    );
end;

architecture ttl of sn74138 is
begin

end;
