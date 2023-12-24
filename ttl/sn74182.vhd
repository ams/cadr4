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
  cout0_n <= not (y0 and (x0 or not cin_n));
  cout1_n <= not (y1 and (x1 or (y0 and (x0 or not cin_n))));
  cout2_n <= not (y2 and (x2 or (y1 and (x1 or (y0 and (x0 or not cin_n))))));
  yout <= y3 and (x3 or y2) and (x3 or x2 or y1) and (x3 or x2 or x1 or y0);
  xout <= x3 or x2 or x1 or x0;
end;
