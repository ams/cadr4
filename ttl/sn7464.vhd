-- 4-2-3-2 Input AND-OR-INVERT Gate

library ieee;
use ieee.std_logic_1164.all;

entity sn7464 is
  port (
    d4    : in  std_logic; -- Pin 1
    b2    : in  std_logic; -- Pin 2
    a2    : in  std_logic; -- Pin 3
    c3    : in  std_logic; -- Pin 4
    b3    : in  std_logic; -- Pin 5
    a3    : in  std_logic; -- Pin 9
    \out\ : out std_logic; -- Pin 8
    a1    : in  std_logic; -- Pin 10
    b1    : in  std_logic; -- Pin 11
    c4    : in  std_logic; -- Pin 12
    b4    : in  std_logic; -- Pin 13
    a4    : in  std_logic  -- Pin 14
    );
end;

architecture ttl of sn7464 is
  signal d4_i, b2_i, a2_i, c3_i, b3_i, a3_i, a1_i, b1_i, c4_i, b4_i, a4_i : std_logic;
begin

  d4_i <= 'H';
  b2_i <= 'H';
  a2_i <= 'H';
  c3_i <= 'H';
  b3_i <= 'H';
  a3_i <= 'H';
  a1_i <= 'H';
  b1_i <= 'H';
  c4_i <= 'H';
  b4_i <= 'H';
  a4_i <= 'H';

  d4_i <= d4;
  b2_i <= b2;
  a2_i <= a2;
  c3_i <= c3;
  b3_i <= b3;
  a3_i <= a3;
  a1_i <= a1;
  b1_i <= b1;
  c4_i <= c4;
  b4_i <= b4;
  a4_i <= a4;

  -- 4-2-3-2 Input AND-OR-INVERT: ((a1 AND b1) OR (a2 AND b2) OR (a3 AND b3 AND c3) OR (a4 AND b4 AND c4 AND d4)) then invert
  \out\ <= not ((a1_i and b1_i) or (a2_i and b2_i) or (a3_i and b3_i and c3_i) or (a4_i and b4_i and c4_i and d4_i));

end;
