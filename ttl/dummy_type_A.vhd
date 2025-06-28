-- Dummy Type A
-- doc/ai/cadrpt/parts.64

library ieee;
use ieee.std_logic_1164.all;

--           ________    
-- vcc --- 1:|1K ohm|16: -- hi1
--      |- 2:|1K ohm|15: -- hi2
--      |- 3:|1K ohm|14: -- \-boot1\
--      |- 4:|1K ohm|13: -- \-boot2\
--      -- 5:|5K ohm|12: -- \-power reset\ (inverters are removed from olord2)
--         6:|      |11:
-- gnd -|- 7:|10Kohm|10: -|
--      -- 8:| 82 uF|9:  --
--           -------- 
--            type A  

entity dummy_type_A is
  port (
    hi1            : out std_logic; -- 16
    hi2            : out std_logic; -- 15
    \-boot1\       : out std_logic; -- 14
    \-boot2\       : out std_logic; -- 13
    \-power reset\ : out std_logic  -- 12
    );
end;

architecture functional of dummy_type_A is
begin
  hi1 <= 'H';
  hi2 <= 'H';
  \-boot1\ <= 'H';
  \-boot2\ <= 'H';
  \-power reset\ <= '0', '1' after 20 ns; -- short delay then go high
end;
