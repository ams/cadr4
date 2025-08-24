library ieee;
use ieee.std_logic_1164.all;

entity res20 is
  port (
    r2  : inout std_logic; -- 2
    r3  : inout std_logic; -- 3
    r4  : inout std_logic; -- 4
    r5  : inout std_logic; -- 5
    r6  : inout std_logic; -- 6
    r7  : inout std_logic; -- 7
    r8  : inout std_logic; -- 8
    r9  : inout std_logic; -- 9
    r10 : inout std_logic; -- 10
    r11 : inout std_logic; -- 11
    r12 : inout std_logic; -- 12
    r13 : inout std_logic; -- 13
    r14 : inout std_logic; -- 14
    r15 : inout std_logic; -- 15
    r16 : inout std_logic; -- 16
    r17 : inout std_logic; -- 17
    r18 : inout std_logic; -- 18
    r19 : inout std_logic -- 19
    );
end entity;

architecture functional of res20 is
begin
  -- Weak pull-up resistors - can be overridden by strong drivers
  r2  <= 'H'; r3  <= 'H'; r4  <= 'H'; r5  <= 'H';
  r6  <= 'H'; r7  <= 'H'; r8  <= 'H'; r9  <= 'H';
  r10 <= 'H'; r11 <= 'H'; r12 <= 'H'; r13 <= 'H';
  r14 <= 'H'; r15 <= 'H'; r16 <= 'H'; r17 <= 'H';
  r18 <= 'H'; r19 <= 'H';
end architecture;
