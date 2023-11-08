-- Data Selectors / Multiplexers

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74151 is
  port (
    i0   : in  std_logic;
    i1   : in  std_logic;
    i2   : in  std_logic;
    i3   : in  std_logic;
    i4   : in  std_logic;
    i5   : in  std_logic;
    i6   : in  std_logic;
    i7   : in  std_logic;
    q    : out std_logic;
    q_n  : out std_logic;
    sel2 : in  std_logic;
    sel1 : in  std_logic;
    sel0 : in  std_logic;
    ce_n : in  std_logic
    );
end;

architecture ttl of sn74151 is
begin

end;
