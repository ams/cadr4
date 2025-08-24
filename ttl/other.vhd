library ieee;
use ieee.std_logic_1164.all;

package other is

  component dummy_type_a is
  port (
      hi1            : inout std_logic; -- 16
      hi2            : inout std_logic; -- 15
      \-boot1\       : inout std_logic; -- 14
      \-boot2\       : inout std_logic; -- 13
      \-power reset\ : out std_logic  -- 12
      );
  end component;

  component res20 is
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
  end component;

  component sip180_390_8 is
  port (
      r2 : inout std_logic; -- 2
      r3 : inout std_logic; -- 3
      r4 : inout std_logic; -- 4
      r5 : inout std_logic; -- 5
      r6 : inout std_logic; -- 6
      r7 : inout std_logic  -- 7
      );
  end component;

  component sip220_330_8 is
  port (
      r2 : inout std_logic; -- 2
      r3 : inout std_logic; -- 3
      r4 : inout std_logic; -- 4
      r5 : inout std_logic; -- 5
      r6 : inout std_logic; -- 6
      r7 : inout std_logic  -- 7
      );
  end component;

  component sip330_470_8 is
  port (
      r2 : inout std_logic; -- 2
      r3 : inout std_logic; -- 3
      r4 : inout std_logic; -- 4
      r5 : inout std_logic; -- 5
      r6 : inout std_logic; -- 6
      r7 : inout std_logic  -- 7
      );
  end component;

  component til309 is
  port (
      i1, i2, i4, i8 : in  std_logic; -- i1: Pin 17 (A), i2: Pin 12 (B), i4: Pin 6 (C), i8: Pin 7 (D)
      dp             : in  std_logic; -- Pin 14
      latch          : in  std_logic; -- Pin 5 
      blank_n        : in  std_logic; -- Pin 13
      ldp            : in  std_logic; -- Pin 16
      test_n         : in  std_logic; -- Pin 15 (LT)
      l1, l2, l4, l8 : out std_logic  -- l1: Pin 4 (QA), l2: Pin 1 (QB), l4: Pin 2 (QC), l8: Pin 3 (QD)
      );
  end component;

end package;
