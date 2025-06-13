library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sip330_470_8 is
  port (
    r2 : inout std_logic; -- 2
    r3 : inout std_logic; -- 3
    r4 : inout std_logic; -- 4
    r5 : inout std_logic; -- 5
    r6 : inout std_logic; -- 6
    r7 : inout std_logic  -- 7
    );
end;

architecture ttl of sip330_470_8 is
begin
  -- Weak pull-up resistors - can be overridden by strong drivers
  r2 <= 'H'; r3 <= 'H'; r4 <= 'H'; 
  r5 <= 'H'; r6 <= 'H'; r7 <= 'H';
end;
