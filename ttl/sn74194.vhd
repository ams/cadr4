library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74194 is
  port (
    clr_n : in  std_logic;
    sir   : in  std_logic;
    i0    : in  std_logic;
    i1    : in  std_logic;
    i2    : in  std_logic;
    i3    : in  std_logic;
    sil   : in  std_logic;
    s0    : in  std_logic;
    s1    : in  std_logic;
    clk   : in  std_logic;
    q3    : out std_logic;
    q2    : out std_logic;
    q1    : out std_logic;
    q0    : out std_logic
    );
end;

architecture ttl of sn74194 is
begin

end;
