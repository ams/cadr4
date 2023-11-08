-- Octal D-Type Transparent Latches And Edge-Triggered Flip-Flops

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74373 is
  port (
    i0     : in  std_logic;
    i1     : in  std_logic;
    i2     : in  std_logic;
    i3     : in  std_logic;
    i4     : in  std_logic;
    i5     : in  std_logic;
    i6     : in  std_logic;
    i7     : in  std_logic;
    o0     : out std_logic;
    o1     : out std_logic;
    o2     : out std_logic;
    o3     : out std_logic;
    o4     : out std_logic;
    o5     : out std_logic;
    o6     : out std_logic;
    o7     : out std_logic;
    hold_n : in  std_logic;
    oenb_n : in  std_logic
    );
end;

architecture ttl of sn74373 is
begin

end;
