-- Look-Ahead Carry Generators

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn74182 is
  port (
    xout : out std_logic;
    yout : out std_logic;
    x3   : out std_logic;
    y3   : out std_logic;

    cout2_n : out std_logic;
    x2      : in  std_logic;
    y2      : in  std_logic;

    cout1_n : out std_logic;
    x1      : in  std_logic;
    y1      : in  std_logic;

    cout0_n : out std_logic;
    x0      : in  std_logic;
    y0      : in  std_logic;

    cin_n : in std_logic
    );
end;

architecture ttl of sn74182 is
begin

end;
