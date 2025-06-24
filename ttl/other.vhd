-- Other components
-- Dummy Type A
-- Passive Components (res20, sip220_330_8, sip330_470_8)
-- TI TIL309

library ieee;
use ieee.std_logic_1164.all;

package other is

  component dummy_type_A 
    port(
      hi1            : out std_logic;
      hi2            : out std_logic;
      \-boot1\       : out std_logic;
      \-boot2\       : out std_logic;
      \-power reset\ : out std_logic
      ); end component;

  component res20 is
    port (
      r2  : inout std_logic;
      r3  : inout std_logic;
      r4  : inout std_logic;
      r5  : inout std_logic;
      r6  : inout std_logic;
      r7  : inout std_logic;
      r8  : inout std_logic;
      r9  : inout std_logic;
      r10 : inout std_logic;
      r11 : inout std_logic;
      r12 : inout std_logic;
      r13 : inout std_logic;
      r14 : inout std_logic;
      r15 : inout std_logic;
      r16 : inout std_logic;
      r17 : inout std_logic;
      r18 : inout std_logic;
      r19 : inout std_logic
      );
  end component;

  component sip220_330_8 is
    port (
      r2 : inout std_logic;
      r3 : inout std_logic;
      r4 : inout std_logic;
      r5 : inout std_logic;
      r6 : inout std_logic;
      r7 : inout std_logic
      );
  end component;

  component sip330_470_8 is
    port (
      r2 : inout std_logic;
      r3 : inout std_logic;
      r4 : inout std_logic;
      r5 : inout std_logic;
      r6 : inout std_logic;
      r7 : inout std_logic
      );
  end component;

  component til309 is
    port (
      i1, i2, i4, i8 : in  std_logic;
      dp             : in  std_logic;
      latch          : in  std_logic;
      blank_n        : in  std_logic;
      ldp            : in  std_logic;
      test_n         : in  std_logic;
      l1, l2, l4, l8 : out std_logic
      );
  end component;

end;
