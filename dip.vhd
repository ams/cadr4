library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

package dip is

  component dip_16dummy is port (
    p1 : std_logic
    );
  end component;

  component dip_2147 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p8  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic;
    p16 : in  std_logic;
    p17 : in  std_logic
    );
  end component;

  component dip_25ls2519 is port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : in  std_logic;
    p8  : in  std_logic;
    p9  : in  std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : out std_logic;
    p16 : in  std_logic;
    p17 : in  std_logic;
    p18 : in  std_logic;
    p19 : in  std_logic
    );
  end component;

  component dip_25s07 is port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : out std_logic
    );
  end component;

  component dip_25s09 is port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : out std_logic
    );
  end component;

  component dip_25s10 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
  end component;

  component dip_5600 is port (
    p1  : out std_logic;
    p2  : out std_logic;
    p3  : out std_logic;
    p4  : out std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_5610 is port (
    p1  : out std_logic;
    p2  : out std_logic;
    p3  : out std_logic;
    p4  : out std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_7428 is port (
    p1  : out std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p8  : in  std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : out std_logic
    );
  end component;

  component dip_74ls109 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_74ls14 is port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74ls244 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p8  : in  std_logic;
    p9  : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : in  std_logic;
    p16 : out std_logic;
    p17 : in  std_logic;
    p18 : out std_logic;
    p19 : in  std_logic
    );
  end component;

  component dip_74s00 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : out std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s02 is port (
    p1  : out std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p8  : in  std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : out std_logic
    );
  end component;

  component dip_74s04 is port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s08 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : out std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s10 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s11 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s11o is port (
    p3 : inout std_logic;
    p4 : inout std_logic;
    p5 : inout std_logic;
    p6 : inout std_logic
    );
  end component;

  component dip_74s133 is port (
    p1  : in std_logic;
    p2  : in std_logic;
    p3  : in std_logic;
    p4  : in std_logic;
    p5  : in std_logic;
    p6  : in std_logic;
    p7  : in std_logic;
    p9  : in std_logic;
    p10 : in std_logic;
    p11 : in std_logic;
    p12 : in std_logic;
    p13 : in std_logic;
    p14 : in std_logic;
    p15 : in std_logic
    );
  end component;

  component dip_74s138 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
  end component;

  component dip_74s139 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_74s151 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : in  std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_74s153 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_74s157 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_74s169 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
  end component;

  component dip_74s174 is port (
    p1  : in std_logic;
    p2  : in std_logic;
    p3  : in std_logic;
    p4  : in std_logic;
    p5  : in std_logic;
    p6  : in std_logic;
    p7  : in std_logic;
    p9  : in std_logic;
    p10 : in std_logic;
    p11 : in std_logic;
    p12 : in std_logic;
    p13 : in std_logic;
    p14 : in std_logic;
    p15 : in std_logic
    );
  end component;

  component dip_74s175 is port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p9  : in  std_logic;
    p10 : out std_logic;
    p11 : out std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
  end component;

  component dip_74s181 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p8  : in  std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic;
    p16 : out std_logic;
    p17 : out std_logic;
    p18 : in  std_logic;
    p19 : in  std_logic;
    p20 : in  std_logic;
    p21 : in  std_logic;
    p22 : in  std_logic;
    p23 : in  std_logic
    );
  end component;

  component dip_74s182 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : out std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_74s194 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : out std_logic;
    p14 : out std_logic;
    p15 : out std_logic
    );
  end component;

  component dip_74s20 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s20o is port (
    p1  : inout std_logic;
    p2  : inout std_logic;
    p4  : inout std_logic;
    p5  : inout std_logic;
    p6  : inout std_logic;
    p8  : inout std_logic;
    p9  : inout std_logic;
    p10 : inout std_logic;
    p12 : inout std_logic;
    p13 : inout std_logic
    );
  end component;

  component dip_74s240 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p8  : in  std_logic;
    p9  : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : in  std_logic;
    p16 : out std_logic;
    p17 : in  std_logic;
    p18 : out std_logic;
    p19 : in  std_logic
    );
  end component;

  component dip_74s241 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p8  : in  std_logic;
    p9  : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : out std_logic;
    p15 : in  std_logic;
    p16 : out std_logic;
    p17 : in  std_logic;
    p18 : out std_logic;
    p19 : in  std_logic
    );
  end component;

  component dip_74s258 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_74s260 is port (
    p1  : in std_logic;
    p2  : in std_logic;
    p3  : in std_logic;
    p5  : in std_logic;
    p12 : in std_logic;
    p13 : in std_logic
    );
  end component;

  component dip_74s280 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p8  : in  std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s283 is port (
    p1  : out std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : out std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : out std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_74s32 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : out std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s37 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : out std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s373 is port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : in  std_logic;
    p8  : in  std_logic;
    p9  : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : out std_logic;
    p16 : out std_logic;
    p17 : in  std_logic;
    p18 : in  std_logic;
    p19 : out std_logic
    );
  end component;

  component dip_74s374 is port (
    p1  : in  std_logic;
    p2  : out std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p7  : in  std_logic;
    p8  : in  std_logic;
    p9  : out std_logic;
    p11 : in  std_logic;
    p12 : out std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : out std_logic;
    p16 : out std_logic;
    p17 : in  std_logic;
    p18 : in  std_logic;
    p19 : out std_logic
    );
  end component;

  component dip_74s472 is port (
    p1  : in std_logic;
    p2  : in std_logic;
    p3  : in std_logic;
    p4  : in std_logic;
    p5  : in std_logic;
    p6  : in std_logic;
    p7  : in std_logic;
    p8  : in std_logic;
    p9  : in std_logic;
    p11 : in std_logic;
    p12 : in std_logic;
    p13 : in std_logic;
    p14 : in std_logic;
    p15 : in std_logic;
    p16 : in std_logic;
    p17 : in std_logic;
    p18 : in std_logic;
    p19 : in std_logic
    );
  end component;

  component dip_74s51 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s64 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s74 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : out std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_74s86 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : out std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : out std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic
    );
  end component;

  component dip_82s21 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_9328 is port (
    p1  : in std_logic;
    p2  : in std_logic;
    p3  : in std_logic;
    p4  : in std_logic;
    p5  : in std_logic;
    p6  : in std_logic;
    p7  : in std_logic;
    p9  : in std_logic;
    p10 : in std_logic;
    p11 : in std_logic;
    p12 : in std_logic;
    p13 : in std_logic;
    p14 : in std_logic;
    p15 : in std_logic
    );
  end component;

  component dip_93425a is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : in  std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_93s46 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_93s48 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : in  std_logic;
    p9  : out std_logic;
    p10 : out std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_9s42_1 is port (
    p1  : in  std_logic;
    p2  : in  std_logic;
    p3  : in  std_logic;
    p4  : in  std_logic;
    p5  : in  std_logic;
    p6  : in  std_logic;
    p7  : out std_logic;
    p9  : out std_logic;
    p10 : in  std_logic;
    p11 : in  std_logic;
    p12 : in  std_logic;
    p13 : in  std_logic;
    p14 : in  std_logic;
    p15 : in  std_logic
    );
  end component;

  component dip_res20 is port (
    p2  : in std_logic;
    p3  : in std_logic;
    p4  : in std_logic;
    p5  : in std_logic;
    p6  : in std_logic;
    p7  : in std_logic;
    p8  : in std_logic;
    p9  : in std_logic;
    p10 : in std_logic;
    p11 : in std_logic;
    p12 : in std_logic;
    p13 : in std_logic;
    p14 : in std_logic;
    p15 : in std_logic;
    p16 : in std_logic;
    p17 : in std_logic;
    p18 : in std_logic;
    p19 : in std_logic
    );
  end component;

  component dip_sip220_330_8 is port (
    p2 : in std_logic;
    p3 : in std_logic;
    p4 : in std_logic;
    p5 : in std_logic;
    p6 : in std_logic;
    p7 : in std_logic
    );
  end component;

  component dip_sip330_470_8 is port (
    p2 : in std_logic;
    p3 : in std_logic;
    p4 : in std_logic;
    p5 : in std_logic;
    p6 : in std_logic;
    p7 : in std_logic
    );
  end component;

  component dip_td100 is port (
    p1  : in  std_logic;
    p4  : out std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p10 : out std_logic;
    p12 : out std_logic
    );
  end component;

  component dip_td25 is port (
    p1  : in  std_logic;
    p4  : out std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p10 : out std_logic;
    p12 : out std_logic
    );
  end component;

  component dip_td250 is port (
    p1  : in  std_logic;
    p4  : out std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p10 : out std_logic;
    p12 : out std_logic
    );
  end component;

  component dip_td50 is port (
    p1  : in  std_logic;
    p4  : out std_logic;
    p6  : out std_logic;
    p8  : out std_logic;
    p10 : out std_logic;
    p12 : out std_logic
    );
  end component;

  component dip_til309 is port (
    p1  : in std_logic;
    p2  : in std_logic;
    p3  : in std_logic;
    p4  : in std_logic;
    p5  : in std_logic;
    p6  : in std_logic;
    p7  : in std_logic;
    p12 : in std_logic;
    p13 : in std_logic;
    p14 : in std_logic;
    p15 : in std_logic;
    p16 : in std_logic;
    p17 : in std_logic
    );
  end component;

end package;

--------------------------------------------------------------------------------
--
-- Format of the following entities:
--
--      entity < dip-name > is port (                -- <ttl-name> <original-suds-name>
--        <dip-pin-name > : < direction > std_logic; -- <ttl-pin-name>
--        ...
--        );
--      end;
--
-- This is then used to generate the architectures; that look as
-- follows:
--
--      architecture dip of <dip-name> is
--      begin
--        ttl : <ttl-name> port map (<dip-pin-name> => <ttl-pin-name>, ...);
--      end;
--------------------------------------------------------------------------------

entity dip_16dummy is port (            -- ic_16dummy [16dummy]
  p1 : std_logic                        -- dummy
  );
end;

architecture dip of dip_16dummy is
begin
  ttl : ic_16dummy port map (p1 => dummy);
end;

entity dip_2147 is port (               -- am2147 [2147]
  p1  : in  std_logic;                  -- a0
  p2  : in  std_logic;                  -- a1
  p3  : in  std_logic;                  -- a2
  p4  : in  std_logic;                  -- a3
  p5  : in  std_logic;                  -- a4
  p6  : in  std_logic;                  -- a5
  p7  : out std_logic;                  -- do
  p8  : in  std_logic;                  -- we_n
  p10 : in  std_logic;                  -- ce_n
  p11 : in  std_logic;                  -- di
  p12 : in  std_logic;                  -- a11
  p13 : in  std_logic;                  -- a10
  p14 : in  std_logic;                  -- a9
  p15 : in  std_logic;                  -- a8
  p16 : in  std_logic;                  -- a7
  p17 : in  std_logic                   -- a6
  );
end;

architecture dip of dip_2147 is
begin
  ttl : am2147 port map (p1 => a0, p2 => a1, p3 => a2, p4 => a3, p5 => a4, p6 => a5, p7 => do, p8 => we_n, p10 => ce_n, p11 => di, p12 => a11, p13 => a10, p14 => a9, p15 => a8, p16 => a7, p17 => a6);
end;

entity dip_25ls2519 is port (           -- am252519 [25ls2519]
  p1  : in  std_logic;                  -- i0
  p2  : out std_logic;                  -- q0a
  p3  : out std_logic;                  -- q0b
  p4  : in  std_logic;                  -- i1
  p5  : out std_logic;                  -- q1a
  p6  : out std_logic;                  -- q1b
  p7  : in  std_logic;                  -- o_enb_n
  p8  : in  std_logic;                  -- out_enb_n
  p9  : in  std_logic;                  -- clk
  p11 : out std_logic;                  -- q2b
  p12 : out std_logic;                  -- q2a
  p13 : in  std_logic;                  -- i2
  p14 : out std_logic;                  -- q3b
  p15 : out std_logic;                  -- q3a
  p16 : in  std_logic;                  -- i3
  p17 : in  std_logic;                  -- clk_enb_n
  p18 : in  std_logic;                  -- inv
  p19 : in  std_logic                   -- asyn_clr_n
  );
end;

architecture dip of dip_25ls2519 is
begin
  ttl : am252519 port map (p1 => i0, p2 => q0a, p3 => q0b, p4 => i1, p5 => q1a, p6 => q1b, p7 => o_enb_n, p8 => out_enb_n, p9 => clk, p11 => q2b, p12 => q2a, p13 => i2, p14 => q3b, p15 => q3a, p16 => i3, p17 => clk_enb_n, p18 => inv, p19 => asyn_clr_n);
end;

entity dip_25s07 is port (              -- am2507 [25s07]
  p1  : in  std_logic;                  -- enb_n
  p2  : out std_logic;                  -- d0
  p3  : in  std_logic;                  -- i0
  p4  : in  std_logic;                  -- i1
  p5  : out std_logic;                  -- d1
  p6  : in  std_logic;                  -- i2
  p7  : out std_logic;                  -- d2
  p9  : in  std_logic;                  -- clk
  p10 : out std_logic;                  -- d3
  p11 : in  std_logic;                  -- i3
  p12 : out std_logic;                  -- d4
  p13 : in  std_logic;                  -- i4
  p14 : in  std_logic;                  -- i5
  p15 : out std_logic                   -- d5
  );
end;

architecture dip of dip_25s07 is
begin
  ttl : am2507 port map (p1 => enb_n, p2 => d0, p3 => i0, p4 => i1, p5 => d1, p6 => i2, p7 => d2, p9 => clk, p10 => d3, p11 => i3, p12 => d4, p13 => i4, p14 => i5, p15 => d5);
end;

entity dip_25s09 is port (              -- am2509 [25s09]
  p1  : in  std_logic;                  -- sel
  p2  : out std_logic;                  -- aq
  p3  : in  std_logic;                  -- a0
  p4  : in  std_logic;                  -- a1
  p5  : in  std_logic;                  -- b1
  p6  : in  std_logic;                  -- b0
  p7  : out std_logic;                  -- bq
  p9  : in  std_logic;                  -- clk
  p10 : out std_logic;                  -- cq
  p11 : in  std_logic;                  -- c0
  p12 : in  std_logic;                  -- c1
  p13 : in  std_logic;                  -- d1
  p14 : in  std_logic;                  -- d0
  p15 : out std_logic                   -- dq
  );
end;

architecture dip of dip_25s09 is
begin
  ttl : am2509 port map (p1 => sel, p2 => aq, p3 => a0, p4 => a1, p5 => b1, p6 => b0, p7 => bq, p9 => clk, p10 => cq, p11 => c0, p12 => c1, p13 => d1, p14 => d0, p15 => dq);
end;

entity dip_25s10 is port (              -- am2510 [25s10]
  p1  : in  std_logic;                  -- i_3
  p2  : in  std_logic;                  -- i_2
  p3  : in  std_logic;                  -- i_1
  p4  : in  std_logic;                  -- i0
  p5  : in  std_logic;                  -- i1
  p6  : in  std_logic;                  -- i2
  p7  : in  std_logic;                  -- i3
  p9  : in  std_logic;                  -- sel1
  p10 : in  std_logic;                  -- sel0
  p11 : out std_logic;                  -- o3
  p12 : out std_logic;                  -- o2
  p13 : in  std_logic;                  -- ce_n
  p14 : out std_logic;                  -- o1
  p15 : out std_logic                   -- o0
  );
end;

architecture dip of dip_25s10 is
begin
  ttl : am2510 port map (p1 => i_3, p2 => i_2, p3 => i_1, p4 => i0, p5 => i1, p6 => i2, p7 => i3, p9 => sel1, p10 => sel0, p11 => o3, p12 => o2, p13 => ce_n, p14 => o1, p15 => o0);
end;

entity dip_5600 is port (               -- im5600 [5600]
  p1  : out std_logic;                  -- o0
  p2  : out std_logic;                  -- o1
  p3  : out std_logic;                  -- o2
  p4  : out std_logic;                  -- o3
  p5  : out std_logic;                  -- o4
  p6  : out std_logic;                  -- o5
  p7  : out std_logic;                  -- o6
  p9  : out std_logic;                  -- o7
  p10 : in  std_logic;                  -- a0
  p11 : in  std_logic;                  -- a1
  p12 : in  std_logic;                  -- a2
  p13 : in  std_logic;                  -- a3
  p14 : in  std_logic;                  -- a4
  p15 : in  std_logic                   -- ce_n
  );
end;

architecture dip of dip_5600 is
begin
  ttl : im5600 port map (p1 => o0, p2 => o1, p3 => o2, p4 => o3, p5 => o4, p6 => o5, p7 => o6, p9 => o7, p10 => a0, p11 => a1, p12 => a2, p13 => a3, p14 => a4, p15 => ce_n);
end;

entity dip_5610 is port (               -- im5600 [5610]
  p1  : out std_logic;                  -- o0
  p2  : out std_logic;                  -- o1
  p3  : out std_logic;                  -- o2
  p4  : out std_logic;                  -- o3
  p5  : out std_logic;                  -- o4
  p6  : out std_logic;                  -- o5
  p7  : out std_logic;                  -- o6
  p9  : out std_logic;                  -- o7
  p10 : in  std_logic;                  -- a0
  p11 : in  std_logic;                  -- a1
  p12 : in  std_logic;                  -- a2
  p13 : in  std_logic;                  -- a3
  p14 : in  std_logic;                  -- a4
  p15 : in  std_logic                   -- ce_n
  );
end;

architecture dip of dip_5610 is
begin
  ttl : im5600 port map (p1 => o0, p2 => o1, p3 => o2, p4 => o3, p5 => o4, p6 => o5, p7 => o6, p9 => o7, p10 => a0, p11 => a1, p12 => a2, p13 => a3, p14 => a4, p15 => ce_n);
end;

entity dip_7428 is port (               -- sn7428 [7428]
  p1  : out std_logic;                  -- g1q_n
  p2  : in  std_logic;                  -- g1a
  p3  : in  std_logic;                  -- g1b
  p4  : out std_logic;                  -- g2q_n
  p5  : in  std_logic;                  -- g2a
  p6  : in  std_logic;                  -- g3b
  p8  : in  std_logic;                  -- g3a
  p9  : in  std_logic;                  -- g3b
  p10 : out std_logic;                  -- g3q_n
  p11 : in  std_logic;                  -- g4a
  p12 : in  std_logic;                  -- g4b
  p13 : out std_logic                   -- g4q_n
  );
end;

architecture dip of dip_7428 is
begin
  ttl : sn7428 port map (p1 => g1q_n, p2 => g1a, p3 => g1b, p4 => g2q_n, p5 => g2a, p6 => g3b, p8 => g3a, p9 => g3b, p10 => g3q_n, p11 => g4a, p12 => g4b, p13 => g4q_n);
end;

entity dip_74ls109 is port (            -- sn74109 [74ls109]
  p1  : in  std_logic;                  -- clr1_n
  p2  : in  std_logic;                  -- j1
  p3  : in  std_logic;                  -- k1_n
  p4  : in  std_logic;                  -- clk1
  p5  : in  std_logic;                  -- pre1_n
  p6  : out std_logic;                  -- q1
  p7  : out std_logic;                  -- q1_n
  p9  : out std_logic;                  -- q2_n
  p10 : out std_logic;                  -- q2
  p11 : in  std_logic;                  -- pre2_n
  p12 : in  std_logic;                  -- clk2
  p13 : in  std_logic;                  -- k2_n
  p14 : in  std_logic;                  -- j2
  p15 : in  std_logic                   -- clr2_n
  );
end;

architecture dip of dip_74ls109 is
begin
  ttl : sn74109 port map (p1 => clr1_n, p2 => j1, p3 => k1_n, p4 => clk1, p5 => pre1_n, p6 => q1, p7 => q1_n, p9 => q2_n, p10 => q2, p11 => pre2_n, p12 => clk2, p13 => k2_n, p14 => j2, p15 => clr2_n);
end;

entity dip_74ls14 is port (             -- sn7414 [74ls14]
  p1  : in  std_logic;                  -- g1a
  p2  : out std_logic;                  -- g1q_n
  p3  : in  std_logic;                  -- g2a
  p4  : out std_logic;                  -- g2q_n
  p5  : in  std_logic;                  -- g3a
  p6  : out std_logic;                  -- g3q_n
  p8  : out std_logic;                  -- g4q
  p9  : in  std_logic;                  -- g4a
  p10 : out std_logic;                  -- g5q_n
  p11 : in  std_logic;                  -- g5a
  p12 : out std_logic;                  -- g6q_n
  p13 : in  std_logic                   -- g6a
  );
end;

architecture dip of dip_74ls14 is
begin
  ttl : sn7414 port map (p1 => g1a, p2 => g1q_n, p3 => g2a, p4 => g2q_n, p5 => g3a, p6 => g3q_n, p8 => g4q, p9 => g4a, p10 => g5q_n, p11 => g5a, p12 => g6q_n, p13 => g6a);
end;

-- entity dip_74ls240 is port ( -- sn74240 [74ls240]
-- );
-- end;

entity dip_74ls244 is port (            -- sn74244 [74ls244]
  p1  : in  std_logic;                  -- aenb_n
  p2  : in  std_logic;                  -- ain0
  p3  : out std_logic;                  -- bout3
  p4  : in  std_logic;                  -- ain1
  p5  : out std_logic;                  -- bout2
  p6  : in  std_logic;                  -- ain2
  p7  : out std_logic;                  -- bout1
  p8  : in  std_logic;                  -- ain3
  p9  : out std_logic;                  -- bout0
  p11 : in  std_logic;                  -- bin0
  p12 : out std_logic;                  -- aout3
  p13 : in  std_logic;                  -- bin1
  p14 : out std_logic;                  -- aout2
  p15 : in  std_logic;                  -- bin2
  p16 : out std_logic;                  -- aout1
  p17 : in  std_logic;                  -- bin3
  p18 : out std_logic;                  -- aout0
  p19 : in  std_logic                   -- benb_n
  );
end;

architecture dip of dip_74ls244 is
begin
  ttl : sn74244 port map (p1 => aenb_n, p2 => ain0, p3 => bout3, p4 => ain1, p5 => bout2, p6 => ain2, p7 => bout1, p8 => ain3, p9 => bout0, p11 => bin0, p12 => aout3, p13 => bin1, p14 => aout2, p15 => bin2, p16 => aout1, p17 => bin3, p18 => aout0, p19 => benb_n);
end;

entity dip_74s00 is port (              -- sn7400 [74s00]
  p1  : in  std_logic;                  -- g1b
  p2  : in  std_logic;                  -- g1a
  p3  : out std_logic;                  -- g1q_n
  p4  : in  std_logic;                  -- g2b
  p5  : in  std_logic;                  -- g2a
  p6  : out std_logic;                  -- g2q_n
  p8  : out std_logic;                  -- g3q_n
  p9  : in  std_logic;                  -- g3b
  p10 : in  std_logic;                  -- g3a
  p11 : out std_logic;                  -- g4q_n
  p12 : in  std_logic;                  -- g4a
  p13 : in  std_logic                   -- g4b
  );
end;

architecture dip of dip_74s00 is
begin
  ttl : sn7400 port map (p1 => g1b, p2 => g1a, p3 => g1q_n, p4 => g2b, p5 => g2a, p6 => g2q_n, p8 => g3q_n, p9 => g3b, p10 => g3a, p11 => g4q_n, p12 => g4a, p13 => g4b);
end;

-- entity dip_74s00o is port ( -- sn7400 [74s00o]
-- );
-- end;

entity dip_74s02 is port (              -- sn7402 [74s02]
  p1  : out std_logic;                  -- g1q_n
  p2  : in  std_logic;                  -- g1a
  p3  : in  std_logic;                  -- g1b
  p4  : out std_logic;                  -- g2q_n
  p5  : in  std_logic;                  -- g2a
  p6  : in  std_logic;                  -- g2b
  p8  : in  std_logic;                  -- g3b
  p9  : in  std_logic;                  -- g3a
  p10 : out std_logic;                  -- g3q_n
  p11 : in  std_logic;                  -- g4b
  p12 : in  std_logic;                  -- g4a
  p13 : out std_logic                   -- g4q_n
  );
end;

architecture dip of dip_74s02 is
begin
  ttl : sn7402 port map (p1 => g1q_n, p2 => g1a, p3 => g1b, p4 => g2q_n, p5 => g2a, p6 => g2b, p8 => g3b, p9 => g3a, p10 => g3q_n, p11 => g4b, p12 => g4a, p13 => g4q_n);
end;

-- entity dip_74s02o is port ( -- sn7402 [74s02o]
-- );
-- end;

entity dip_74s04 is port (              -- sn7404 [74s04]
  p1  : in  std_logic;                  -- g1a
  p2  : out std_logic;                  -- g1q_n
  p3  : in  std_logic;                  -- g2a
  p4  : out std_logic;                  -- g2q_n
  p5  : in  std_logic;                  -- g3a
  p6  : out std_logic;                  -- g3q_n
  p8  : out std_logic;                  -- g4q
  p9  : in  std_logic;                  -- g4a
  p10 : out std_logic;                  -- g5q_n
  p11 : in  std_logic;                  -- g5a
  p12 : out std_logic;                  -- g6q_n
  p13 : in  std_logic                   -- g6a
  );
end;

architecture dip of dip_74s04 is
begin
  ttl : sn7404 port map (p1 => g1a, p2 => g1q_n, p3 => g2a, p4 => g2q_n, p5 => g3a, p6 => g3q_n, p8 => g4q, p9 => g4a, p10 => g5q_n, p11 => g5a, p12 => g6q_n, p13 => g6a);
end;

-- entity dip_74s04a is port ( -- sn7404 [74s04a]
-- );
-- end;

entity dip_74s08 is port (              -- sn7408 [74s08]
  p1  : in  std_logic;                  -- g1b
  p2  : in  std_logic;                  -- g1a
  p3  : out std_logic;                  -- g1q
  p4  : in  std_logic;                  -- g2b
  p5  : in  std_logic;                  -- g2a
  p6  : out std_logic;                  -- g2q
  p8  : out std_logic;                  -- g3q
  p9  : in  std_logic;                  -- g3a
  p10 : in  std_logic;                  -- g3b
  p11 : out std_logic;                  -- g4q
  p12 : in  std_logic;                  -- g4a
  p13 : in  std_logic                   -- g4b
  );
end;

architecture dip of dip_74s08 is
begin
  ttl : sn7408 port map (p1 => g1b, p2 => g1a, p3 => g1q, p4 => g2b, p5 => g2a, p6 => g2q, p8 => g3q, p9 => g3a, p10 => g3b, p11 => g4q, p12 => g4a, p13 => g4b);
end;

-- entity dip_74s08o is port ( -- sn7408 [74s08o]
-- );
-- end;

entity dip_74s10 is port (              -- sn7410 [74s10]
  p1  : in  std_logic;                  -- g1a
  p2  : in  std_logic;                  -- g1b
  p3  : in  std_logic;                  -- g2a
  p4  : in  std_logic;                  -- g2b
  p5  : in  std_logic;                  -- g2c
  p6  : out std_logic;                  -- g2y_n
  p8  : out std_logic;                  -- g3y_n
  p9  : in  std_logic;                  -- g3a
  p10 : in  std_logic;                  -- g3b
  p11 : in  std_logic;                  -- g3c
  p12 : out std_logic;                  -- g1y_n
  p13 : in  std_logic                   -- g1c
  );
end;

architecture dip of dip_74s10 is
begin
  ttl : sn7410 port map (p1 => g1a, p2 => g1b, p3 => g2a, p4 => g2b, p5 => g2c, p6 => g2y_n, p8 => g3y_n, p9 => g3a, p10 => g3b, p11 => g3c, p12 => g1y_n, p13 => g1c);
end;

-- entity dip_74s10o is port ( -- sn7410 [74s10o]
-- );
-- end;

entity dip_74s11 is port (              -- sn7411 [74s11]
  p1  : in  std_logic;                  -- g1a
  p2  : in  std_logic;                  -- g1b
  p3  : in  std_logic;                  -- g2a
  p4  : in  std_logic;                  -- g2b
  p5  : in  std_logic;                  -- g2c
  p6  : out std_logic;                  -- g2y_n
  p8  : out std_logic;                  -- g3y_n
  p9  : in  std_logic;                  -- g3a
  p10 : in  std_logic;                  -- g3b
  p11 : in  std_logic;                  -- g3c
  p12 : out std_logic;                  -- g1y_n
  p13 : in  std_logic                   -- g1c
  );
end;

architecture dip of dip_74s11 is
begin
  ttl : sn7411 port map (p1 => g1a, p2 => g1b, p3 => g2a, p4 => g2b, p5 => g2c, p6 => g2y_n, p8 => g3y_n, p9 => g3a, p10 => g3b, p11 => g3c, p12 => g1y_n, p13 => g1c);
end;

entity dip_74s11o is port (             -- sn7411 [74s11o]
  p3 : inout std_logic;
  p4 : inout std_logic;
  p5 : inout std_logic;
  p6 : inout std_logic
  );
end;

entity dip_74s133 is port (             -- sn74133 [74s133]
  p1  : in std_logic;                   -- g
  p2  : in std_logic;                   -- f
  p3  : in std_logic;                   -- e
  p4  : in std_logic;                   -- d
  p5  : in std_logic;                   -- c
  p6  : in std_logic;                   -- b
  p7  : in std_logic;                   -- a
  p9  : in std_logic;                   -- q_n
  p10 : in std_logic;                   -- h
  p11 : in std_logic;                   -- i
  p12 : in std_logic;                   -- j
  p13 : in std_logic;                   -- k
  p14 : in std_logic;                   -- l
  p15 : in std_logic                    -- m
  );
end;

architecture dip of dip_74s133 is
begin
  ttl : sn74133 port map (p1 => g, p2 => f, p3 => e, p4 => d, p5 => c, p6 => b, p7 => a, p9 => q_n, p10 => h, p11 => i, p12 => j, p13 => k, p14 => l, p15 => m);
end;

-- entity dip_74s133o is port ( -- sn74133 [74s133o]
-- );
-- end;

entity dip_74s138 is port (             -- sn74138 [74s138]
  p1  : in  std_logic;                  -- a
  p2  : in  std_logic;                  -- b
  p3  : in  std_logic;                  -- c
  p4  : in  std_logic;                  -- g2a
  p5  : in  std_logic;                  -- g2b
  p6  : in  std_logic;                  -- g1
  p7  : out std_logic;                  -- y7
  p9  : out std_logic;                  -- y6
  p10 : out std_logic;                  -- y5
  p11 : out std_logic;                  -- y4
  p12 : out std_logic;                  -- y3
  p13 : out std_logic;                  -- y2
  p14 : out std_logic;                  -- y1
  p15 : out std_logic                   -- y0
  );
end;

architecture dip of dip_74s138 is
begin
  ttl : sn74138 port map (p1 => a, p2 => b, p3 => c, p4 => g2a, p5 => g2b, p6 => g1, p7 => y7, p9 => y6, p10 => y5, p11 => y4, p12 => y3, p13 => y2, p14 => y1, p15 => y0);
end;

entity dip_74s139 is port (             -- sn74139 [74s139]
  p1  : in  std_logic;                  -- g1
  p2  : in  std_logic;                  -- a1
  p3  : in  std_logic;                  -- b1
  p4  : out std_logic;                  -- g1y0
  p5  : out std_logic;                  -- g1y1
  p6  : out std_logic;                  -- g1y2
  p7  : out std_logic;                  -- g1y3
  p9  : out std_logic;                  -- g2y3
  p10 : out std_logic;                  -- g2y2
  p11 : out std_logic;                  -- g2y1
  p12 : out std_logic;                  -- g2y0
  p13 : in  std_logic;                  -- b2
  p14 : in  std_logic;                  -- a2
  p15 : in  std_logic                   -- g2
  );
end;

architecture dip of dip_74s139 is
begin
  ttl : sn74139 port map (p1 => g1, p2 => a1, p3 => b1, p4 => g1y0, p5 => g1y1, p6 => g1y2, p7 => g1y3, p9 => g2y3, p10 => g2y2, p11 => g2y1, p12 => g2y0, p13 => b2, p14 => a2, p15 => g2);
end;

entity dip_74s151 is port (             -- sn74151 [74s151]
  p1  : in  std_logic;                  -- i3
  p2  : in  std_logic;                  -- i2
  p3  : in  std_logic;                  -- i1
  p4  : in  std_logic;                  -- i0
  p5  : out std_logic;                  -- q
  p6  : out std_logic;                  -- q_n
  p7  : in  std_logic;                  -- ce_n
  p9  : in  std_logic;                  -- sel2
  p10 : in  std_logic;                  -- sel1
  p11 : in  std_logic;                  -- sel0
  p12 : in  std_logic;                  -- i7
  p13 : in  std_logic;                  -- i6
  p14 : in  std_logic;                  -- i5
  p15 : in  std_logic                   -- i4
  );
end;

architecture dip of dip_74s151 is
begin
  ttl : sn74151 port map (p1 => i3, p2 => i2, p3 => i1, p4 => i0, p5 => q, p6 => q_n, p7 => ce_n, p9 => sel2, p10 => sel1, p11 => sel0, p12 => i7, p13 => i6, p14 => i5, p15 => i4);
end;

entity dip_74s153 is port (             -- sn74153 [74s153]
  p1  : in  std_logic;                  -- enb1_n
  p2  : in  std_logic;                  -- sel1
  p3  : in  std_logic;                  -- g1c3
  p4  : in  std_logic;                  -- g1c2
  p5  : in  std_logic;                  -- g1c1
  p6  : in  std_logic;                  -- g1c0
  p7  : out std_logic;                  -- g1q
  p9  : out std_logic;                  -- g2q
  p10 : in  std_logic;                  -- g2c0
  p11 : in  std_logic;                  -- g2c1
  p12 : in  std_logic;                  -- g2c2
  p13 : in  std_logic;                  -- g2c3
  p14 : in  std_logic;                  -- sel0
  p15 : in  std_logic                   -- enb2_n
  );
end;

architecture dip of dip_74s153 is
begin
  ttl : sn74153 port map (p1 => enb1_n, p2 => sel1, p3 => g1c3, p4 => g1c2, p5 => g1c1, p6 => g1c0, p7 => g1q, p9 => g2q, p10 => g2c0, p11 => g2c1, p12 => g2c2, p13 => g2c3, p14 => sel0, p15 => enb2_n);
end;

entity dip_74s157 is port (             -- sn74157 [74s157]
  p1  : in  std_logic;                  -- sel
  p2  : in  std_logic;                  -- a4
  p3  : in  std_logic;                  -- b4
  p4  : out std_logic;                  -- y4
  p5  : in  std_logic;                  -- a3
  p6  : in  std_logic;                  -- b3
  p7  : out std_logic;                  -- y3
  p9  : out std_logic;                  -- y2
  p10 : in  std_logic;                  -- b2
  p11 : in  std_logic;                  -- a2
  p12 : out std_logic;                  -- y1
  p13 : in  std_logic;                  -- b1
  p14 : in  std_logic;                  -- a1
  p15 : in  std_logic                   -- enb_n
  );
end;

architecture dip of dip_74s157 is
begin
  ttl : sn74157 port map (p1 => sel, p2 => a4, p3 => b4, p4 => y4, p5 => a3, p6 => b3, p7 => y3, p9 => y2, p10 => b2, p11 => a2, p12 => y1, p13 => b1, p14 => a1, p15 => enb_n);
end;

entity dip_74s169 is port (             -- sn74169 [74s169]
  p1  : in  std_logic;                  -- up_dn
  p2  : in  std_logic;                  -- clk
  p3  : in  std_logic;                  -- i0
  p4  : in  std_logic;                  -- i1
  p5  : in  std_logic;                  -- i2
  p6  : in  std_logic;                  -- i3
  p7  : in  std_logic;                  -- enb_p_n
  p9  : in  std_logic;                  -- load_n
  p10 : in  std_logic;                  -- enb_t_n
  p11 : out std_logic;                  -- o3
  p12 : out std_logic;                  -- o2
  p13 : out std_logic;                  -- o1
  p14 : out std_logic;                  -- o0
  p15 : out std_logic                   -- co_n
  );
end;

architecture dip of dip_74s169 is
begin
  ttl : sn74169 port map (p1 => up_dn, p2 => clk, p3 => i0, p4 => i1, p5 => i2, p6 => i3, p7 => enb_p_n, p9 => load_n, p10 => enb_t_n, p11 => o3, p12 => o2, p13 => o1, p14 => o0, p15 => co_n);
end;

entity dip_74s174 is port (             -- sn74174 [74s174]
  p1  : in std_logic;                   -- clr_n
  p2  : in std_logic;                   -- q1
  p3  : in std_logic;                   -- d1
  p4  : in std_logic;                   -- d2
  p5  : in std_logic;                   -- q2
  p6  : in std_logic;                   -- d3
  p7  : in std_logic;                   -- q3
  p9  : in std_logic;                   -- clk
  p10 : in std_logic;                   -- q4
  p11 : in std_logic;                   -- d4
  p12 : in std_logic;                   -- q5
  p13 : in std_logic;                   -- d5
  p14 : in std_logic;                   -- d6
  p15 : in std_logic                    -- q6
  );
end;

architecture dip of dip_74s174 is
begin
  ttl : sn74174 port map (p1 => clr_n, p2 => q1, p3 => d1, p4 => d2, p5 => q2, p6 => d3, p7 => q3, p9 => clk, p10 => q4, p11 => d4, p12 => q5, p13 => d5, p14 => d6, p15 => q6);
end;

entity dip_74s175 is port (             -- sn74175 [74s175]
  p1  : in  std_logic;                  -- clr_n
  p2  : out std_logic;                  -- q0
  p3  : out std_logic;                  -- q0_n
  p4  : in  std_logic;                  -- d0
  p5  : in  std_logic;                  -- d1
  p6  : out std_logic;                  -- q1_n
  p7  : out std_logic;                  -- q1
  p9  : in  std_logic;                  -- clk
  p10 : out std_logic;                  -- q2
  p11 : out std_logic;                  -- q2_n
  p12 : in  std_logic;                  -- d2
  p13 : in  std_logic;                  -- d3
  p14 : out std_logic;                  -- q3_n
  p15 : out std_logic                   -- q3
  );
end;

architecture dip of dip_74s175 is
begin
  ttl : sn74175 port map (p1 => clr_n, p2 => q0, p3 => q0_n, p4 => d0, p5 => d1, p6 => q1_n, p7 => q1, p9 => clk, p10 => q2, p11 => q2_n, p12 => d2, p13 => d3, p14 => q3_n, p15 => q3);
end;

entity dip_74s181 is port (             -- sn74181 [74s181]
  p1  : in  std_logic;                  -- b0
  p2  : in  std_logic;                  -- a0
  p3  : in  std_logic;                  -- s3
  p4  : in  std_logic;                  -- s2
  p5  : in  std_logic;                  -- s1
  p6  : in  std_logic;                  -- s0
  p7  : in  std_logic;                  -- cin_n
  p8  : in  std_logic;                  -- m
  p9  : out std_logic;                  -- f0
  p10 : out std_logic;                  -- f1
  p11 : out std_logic;                  -- f2
  p13 : out std_logic;                  -- f3
  p14 : out std_logic;                  -- aeb
  p15 : out std_logic;                  -- x
  p16 : out std_logic;                  -- cout_n
  p17 : out std_logic;                  -- y
  p18 : in  std_logic;                  -- b3
  p19 : in  std_logic;                  -- a3
  p20 : in  std_logic;                  -- b2
  p21 : in  std_logic;                  -- a2
  p22 : in  std_logic;                  -- b1
  p23 : in  std_logic                   -- a1
  );
end;

architecture dip of dip_74s181 is
begin
  ttl : sn74181 port map (p1 => b0, p2 => a0, p3 => s3, p4 => s2, p5 => s1, p6 => s0, p7 => cin_n, p8 => m, p9 => f0, p10 => f1, p11 => f2, p13 => f3, p14 => aeb, p15 => x, p16 => cout_n, p17 => y, p18 => b3, p19 => a3, p20 => b2, p21 => a2, p22 => b1, p23 => a1);
end;

entity dip_74s182 is port (             -- sn74182 [74s182]
  p1  : in  std_logic;                  -- y1
  p2  : in  std_logic;                  -- x1
  p3  : in  std_logic;                  -- y0
  p4  : in  std_logic;                  -- x0
  p5  : out std_logic;                  -- y3
  p6  : out std_logic;                  -- x3
  p7  : out std_logic;                  -- xout
  p9  : out std_logic;                  -- cout2_n
  p10 : out std_logic;                  -- yout
  p11 : out std_logic;                  -- cout1_n
  p12 : out std_logic;                  -- cout0_n
  p13 : in  std_logic;                  -- cin_n
  p14 : in  std_logic;                  -- y2
  p15 : in  std_logic                   -- x2
  );
end;

architecture dip of dip_74s182 is
begin
  ttl : sn74182 port map (p1 => y1, p2 => x1, p3 => y0, p4 => x0, p5 => y3, p6 => x3, p7 => xout, p9 => cout2_n, p10 => yout, p11 => cout1_n, p12 => cout0_n, p13 => cin_n, p14 => y2, p15 => x2);
end;

entity dip_74s194 is port (             -- sn74194 [74s194]
  p1  : in  std_logic;                  -- clr_n
  p2  : in  std_logic;                  -- sir
  p3  : in  std_logic;                  -- i0
  p4  : in  std_logic;                  -- i1
  p5  : in  std_logic;                  -- i2
  p6  : in  std_logic;                  -- i3
  p7  : in  std_logic;                  -- sil
  p9  : in  std_logic;                  -- s0
  p10 : in  std_logic;                  -- s1
  p11 : in  std_logic;                  -- clk
  p12 : out std_logic;                  -- q3
  p13 : out std_logic;                  -- q2
  p14 : out std_logic;                  -- q1
  p15 : out std_logic                   -- q0
  );
end;

architecture dip of dip_74s194 is
begin
  ttl : sn74194 port map (p1 => clr_n, p2 => sir, p3 => i0, p4 => i1, p5 => i2, p6 => i3, p7 => sil, p9 => s0, p10 => s1, p11 => clk, p12 => q3, p13 => q2, p14 => q1, p15 => q0);
end;

entity dip_74s20 is port (              -- sn7420 [74s20]
  p1  : in  std_logic;                  -- g1a
  p2  : in  std_logic;                  -- g1b
  p4  : in  std_logic;                  -- g1c
  p5  : in  std_logic;                  -- g1d
  p6  : out std_logic;                  -- g1y_n
  p8  : out std_logic;                  -- g2y_n
  p9  : in  std_logic;                  -- g2a
  p10 : in  std_logic;                  -- g2b
  p12 : in  std_logic;                  -- g2c
  p13 : in  std_logic                   -- g2d
  );
end;

architecture dip of dip_74s20 is
begin
  ttl : sn7420 port map (p1 => g1a, p2 => g1b, p4 => g1c, p5 => g1d, p6 => g1y_n, p8 => g2y_n, p9 => g2a, p10 => g2b, p12 => g2c, p13 => g2d);
end;

entity dip_74s20o is port (             -- sn7420 [74s20o]
  p1  : inout std_logic;
  p2  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic
  );
end;

entity dip_74s240 is port (             -- sn74240 [74s240]
  p1  : in  std_logic;                  -- aenb_n
  p2  : in  std_logic;                  -- ain0
  p3  : out std_logic;                  -- bout3
  p4  : in  std_logic;                  -- ain1
  p5  : out std_logic;                  -- bout2
  p6  : in  std_logic;                  -- ain2
  p7  : out std_logic;                  -- bout1
  p8  : in  std_logic;                  -- ain3
  p9  : out std_logic;                  -- bout0
  p11 : in  std_logic;                  -- bin0
  p12 : out std_logic;                  -- aout3
  p13 : in  std_logic;                  -- bin1
  p14 : out std_logic;                  -- aout2
  p15 : in  std_logic;                  -- bin2
  p16 : out std_logic;                  -- aout1
  p17 : in  std_logic;                  -- bin3
  p18 : out std_logic;                  -- aout0
  p19 : in  std_logic                   -- benb_n
  );
end;

architecture dip of dip_74s240 is
begin
  ttl : sn74240 port map (p1 => aenb_n, p2 => ain0, p3 => bout3, p4 => ain1, p5 => bout2, p6 => ain2, p7 => bout1, p8 => ain3, p9 => bout0, p11 => bin0, p12 => aout3, p13 => bin1, p14 => aout2, p15 => bin2, p16 => aout1, p17 => bin3, p18 => aout0, p19 => benb_n);
end;

entity dip_74s241 is port (             -- sn74241 [74s241]
  p1  : in  std_logic;                  -- aenb_n
  p2  : in  std_logic;                  -- ain0
  p3  : out std_logic;                  -- bout3
  p4  : in  std_logic;                  -- ain1
  p5  : out std_logic;                  -- bout2
  p6  : in  std_logic;                  -- ain2
  p7  : out std_logic;                  -- bout1
  p8  : in  std_logic;                  -- ain3
  p9  : out std_logic;                  -- bout0
  p11 : in  std_logic;                  -- bin0
  p12 : out std_logic;                  -- aout3
  p13 : in  std_logic;                  -- bin1
  p14 : out std_logic;                  -- aout2
  p15 : in  std_logic;                  -- bin2
  p16 : out std_logic;                  -- aout1
  p17 : in  std_logic;                  -- bin3
  p18 : out std_logic;                  -- aout0
  p19 : in  std_logic                   -- benb
  );
end;

architecture dip of dip_74s241 is
begin
  ttl : sn74241 port map (p1 => aenb_n, p2 => ain0, p3 => bout3, p4 => ain1, p5 => bout2, p6 => ain2, p7 => bout1, p8 => ain3, p9 => bout0, p11 => bin0, p12 => aout3, p13 => bin1, p14 => aout2, p15 => bin2, p16 => aout1, p17 => bin3, p18 => aout0, p19 => benb);
end;

entity dip_74s258 is port (             -- sn74258 [74s258]
  p1  : in  std_logic;                  -- sel
  p2  : in  std_logic;                  -- d0
  p3  : in  std_logic;                  -- d1
  p4  : out std_logic;                  -- dy
  p5  : in  std_logic;                  -- c0
  p6  : in  std_logic;                  -- c1
  p7  : out std_logic;                  -- cy
  p9  : out std_logic;                  -- by
  p10 : in  std_logic;                  -- b1
  p11 : in  std_logic;                  -- b0
  p12 : out std_logic;                  -- ay
  p13 : in  std_logic;                  -- a1
  p14 : in  std_logic;                  -- a0
  p15 : in  std_logic                   -- enb_n
  );
end;

architecture dip of dip_74s258 is
begin
  ttl : sn74258 port map (p1 => sel, p2 => d0, p3 => d1, p4 => dy, p5 => c0, p6 => c1, p7 => cy, p9 => by, p10 => b1, p11 => b0, p12 => ay, p13 => a1, p14 => a0, p15 => enb_n);
end;

entity dip_74s260 is port (             -- sn74260 [74s260]
  p1  : in std_logic;                   -- i1
  p2  : in std_logic;                   -- i2
  p3  : in std_logic;                   -- i3
  p5  : in std_logic;                   -- o1
  p12 : in std_logic;                   -- i4
  p13 : in std_logic                    -- i5
  );
end;

architecture dip of dip_74s260 is
begin
  ttl : sn74260 port map (p1 => i1, p2 => i2, p3 => i3, p5 => o1, p12 => i4, p13 => i5);
end;

entity dip_74s280 is port (             -- sn74280 [74s280]
  p1  : in  std_logic;                  -- i0
  p2  : in  std_logic;                  -- i1
  p4  : in  std_logic;                  -- i2
  p5  : out std_logic;                  -- even
  p6  : out std_logic;                  -- odd
  p8  : in  std_logic;                  -- i3
  p9  : in  std_logic;                  -- i4
  p10 : in  std_logic;                  -- i5
  p11 : in  std_logic;                  -- i6
  p12 : in  std_logic;                  -- i7
  p13 : in  std_logic                   -- i8
  );
end;

architecture dip of dip_74s280 is
begin
  ttl : sn74280 port map (p1 => i0, p2 => i1, p4 => i2, p5 => even, p6 => odd, p8 => i3, p9 => i4, p10 => i5, p11 => i6, p12 => i7, p13 => i8);
end;

entity dip_74s283 is port (             -- sn74283 [74s283]
  p1  : out std_logic;                  -- s1
  p2  : in  std_logic;                  -- b1
  p3  : in  std_logic;                  -- a1
  p4  : out std_logic;                  -- s0
  p5  : in  std_logic;                  -- a0
  p6  : in  std_logic;                  -- b0
  p7  : in  std_logic;                  -- c0
  p9  : out std_logic;                  -- c4
  p10 : out std_logic;                  -- s3
  p11 : in  std_logic;                  -- b3
  p12 : in  std_logic;                  -- a3
  p13 : out std_logic;                  -- s2
  p14 : in  std_logic;                  -- a2
  p15 : in  std_logic                   -- b2
  );
end;

architecture dip of dip_74s283 is
begin
  ttl : sn74283 port map (p1 => s1, p2 => b1, p3 => a1, p4 => s0, p5 => a0, p6 => b0, p7 => c0, p9 => c4, p10 => s3, p11 => b3, p12 => a3, p13 => s2, p14 => a2, p15 => b2);
end;

entity dip_74s32 is port (              -- sn7432 [74s32]
  p1  : in  std_logic;                  -- g1a
  p2  : in  std_logic;                  -- g1b
  p3  : out std_logic;                  -- g1y
  p4  : in  std_logic;                  -- g2a
  p5  : in  std_logic;                  -- g2b
  p6  : out std_logic;                  -- g2y
  p8  : out std_logic;                  -- g3y
  p9  : in  std_logic;                  -- g3a
  p10 : in  std_logic;                  -- g3b
  p11 : out std_logic;                  -- g4y
  p12 : in  std_logic;                  -- g4a
  p13 : in  std_logic                   -- g4b
  );
end;

architecture dip of dip_74s32 is
begin
  ttl : sn7432 port map (p1 => g1a, p2 => g1b, p3 => g1y, p4 => g2a, p5 => g2b, p6 => g2y, p8 => g3y, p9 => g3a, p10 => g3b, p11 => g4y, p12 => g4a, p13 => g4b);
end;

-- entity dip_74s32o is port ( -- sn7432 [74s32o]
-- );
-- end;

-- entity dip_74s32w is port ( -- sn7432 [74s32w]
-- );
-- end;

entity dip_74s37 is port (              -- sn7437 [74s37]
  p1  : in  std_logic;                  -- g1a
  p2  : in  std_logic;                  -- g1b
  p3  : out std_logic;                  -- g1y
  p4  : in  std_logic;                  -- g2a
  p5  : in  std_logic;                  -- g2b
  p6  : out std_logic;                  -- g2y
  p8  : out std_logic;                  -- g3y
  p9  : in  std_logic;                  -- g3a
  p10 : in  std_logic;                  -- g3b
  p11 : out std_logic;                  -- g4y
  p12 : in  std_logic;                  -- g4a
  p13 : in  std_logic                   -- g4b
  );
end;

architecture dip of dip_74s37 is
begin
  ttl : sn7437 port map (p1 => g1a, p2 => g1b, p3 => g1y, p4 => g2a, p5 => g2b, p6 => g2y, p8 => g3y, p9 => g3a, p10 => g3b, p11 => g4y, p12 => g4a, p13 => g4b);
end;

entity dip_74s373 is port (             -- sn74373 [74s373]
  p1  : in  std_logic;                  -- oenb_n
  p2  : out std_logic;                  -- o0
  p3  : in  std_logic;                  -- i0
  p4  : in  std_logic;                  -- i1
  p5  : out std_logic;                  -- o1
  p6  : out std_logic;                  -- o2
  p7  : in  std_logic;                  -- i2
  p8  : in  std_logic;                  -- i3
  p9  : out std_logic;                  -- o3
  p11 : in  std_logic;                  -- hold_n
  p12 : out std_logic;                  -- o4
  p13 : in  std_logic;                  -- i4
  p14 : in  std_logic;                  -- i5
  p15 : out std_logic;                  -- o5
  p16 : out std_logic;                  -- o6
  p17 : in  std_logic;                  -- i6
  p18 : in  std_logic;                  -- i7
  p19 : out std_logic                   -- o7
  );
end;

architecture dip of dip_74s373 is
begin
  ttl : sn74373 port map (p1 => oenb_n, p2 => o0, p3 => i0, p4 => i1, p5 => o1, p6 => o2, p7 => i2, p8 => i3, p9 => o3, p11 => hold_n, p12 => o4, p13 => i4, p14 => i5, p15 => o5, p16 => o6, p17 => i6, p18 => i7, p19 => o7);
end;

entity dip_74s374 is port (             -- sn74374 [74s374]
  p1  : in  std_logic;                  -- oenb_n
  p2  : out std_logic;                  -- o0
  p3  : in  std_logic;                  -- i0
  p4  : in  std_logic;                  -- i1
  p5  : out std_logic;                  -- o1
  p6  : out std_logic;                  -- o2
  p7  : in  std_logic;                  -- i2
  p8  : in  std_logic;                  -- i3
  p9  : out std_logic;                  -- o3
  p11 : in  std_logic;                  -- clk
  p12 : out std_logic;                  -- o4
  p13 : in  std_logic;                  -- i4
  p14 : in  std_logic;                  -- i5
  p15 : out std_logic;                  -- o5
  p16 : out std_logic;                  -- o6
  p17 : in  std_logic;                  -- i6
  p18 : in  std_logic;                  -- i7
  p19 : out std_logic                   -- o7
  );
end;

architecture dip of dip_74s374 is
begin
  ttl : sn74374 port map (p1 => oenb_n, p2 => o0, p3 => i0, p4 => i1, p5 => o1, p6 => o2, p7 => i2, p8 => i3, p9 => o3, p11 => clk, p12 => o4, p13 => i4, p14 => i5, p15 => o5, p16 => o6, p17 => i6, p18 => i7, p19 => o7);
end;

entity dip_74s472 is port (             -- dm74472 [74s472]
  p1  : in std_logic;                   -- a0
  p2  : in std_logic;                   -- a1
  p3  : in std_logic;                   -- a2
  p4  : in std_logic;                   -- a3
  p5  : in std_logic;                   -- a4
  p6  : in std_logic;                   -- d0
  p7  : in std_logic;                   -- d1
  p8  : in std_logic;                   -- d2
  p9  : in std_logic;                   -- d3
  p11 : in std_logic;                   -- d4
  p12 : in std_logic;                   -- d5
  p13 : in std_logic;                   -- d6
  p14 : in std_logic;                   -- d7
  p15 : in std_logic;                   -- ce_n
  p16 : in std_logic;                   -- a5
  p17 : in std_logic;                   -- a6
  p18 : in std_logic;                   -- a7
  p19 : in std_logic                    -- a8
  );
end;

architecture dip of dip_74s472 is
begin
  ttl : dm74472 port map (p1 => a0, p2 => a1, p3 => a2, p4 => a3, p5 => a4, p6 => d0, p7 => d1, p8 => d2, p9 => d3, p11 => d4, p12 => d5, p13 => d6, p14 => d7, p15 => ce_n, p16 => a5, p17 => a6, p18 => a7, p19 => a8);
end;

entity dip_74s51 is port (              -- sn7451 [74s51]
  p1  : in  std_logic;                  -- g1a
  p2  : in  std_logic;                  -- g2a
  p3  : in  std_logic;                  -- g2b
  p4  : in  std_logic;                  -- g2c
  p5  : in  std_logic;                  -- g2d
  p6  : out std_logic;                  -- g2y
  p8  : out std_logic;                  -- g1y
  p9  : in  std_logic;                  -- g1c
  p10 : in  std_logic;                  -- g1d
  p13 : in  std_logic                   -- g1b
  );
end;

architecture dip of dip_74s51 is
begin
  ttl : sn7451 port map (p1 => g1a, p2 => g2a, p3 => g2b, p4 => g2c, p5 => g2d, p6 => g2y, p8 => g1y, p9 => g1c, p10 => g1d, p13 => g1b);
end;

entity dip_74s64 is port (              -- sn7464 [74s64]
  p1  : in  std_logic;                  -- d4
  p2  : in  std_logic;                  -- b2
  p3  : in  std_logic;                  -- a2
  p4  : in  std_logic;                  -- c3
  p5  : in  std_logic;                  -- b3
  p6  : in  std_logic;                  -- a3
  p8  : out std_logic;                  -- \out\
  p9  : in  std_logic;                  -- a1
  p10 : in  std_logic;                  -- b1
  p11 : in  std_logic;                  -- c4
  p12 : in  std_logic;                  -- b4
  p13 : in  std_logic                   -- a4
  );
end;

architecture dip of dip_74s64 is
begin
  ttl : sn7464 port map (p1 => d4, p2 => b2, p3 => a2, p4 => c3, p5 => b3, p6 => a3, p8 => \out\, p9 => a1, p10 => b1, p11 => c4, p12 => b4, p13 => a4);
end;

entity dip_74s74 is port (              -- sn7474 [74s74]
  p1  : in  std_logic;                  -- g1r_n
  p2  : in  std_logic;                  -- g1d
  p3  : in  std_logic;                  -- g1clk
  p4  : in  std_logic;                  -- g1s_n
  p5  : out std_logic;                  -- g1q
  p6  : out std_logic;                  -- g1q_n
  p8  : out std_logic;                  -- g2q_n
  p9  : out std_logic;                  -- g2q
  p10 : in  std_logic;                  -- g2s_n
  p11 : in  std_logic;                  -- g2clk
  p12 : in  std_logic;                  -- g2d
  p13 : in  std_logic                   -- g2r_n
  );
end;

architecture dip of dip_74s74 is
begin
  ttl : sn7474 port map (p1 => g1r_n, p2 => g1d, p3 => g1clk, p4 => g1s_n, p5 => g1q, p6 => g1q_n, p8 => g2q_n, p9 => g2q, p10 => g2s_n, p11 => g2clk, p12 => g2d, p13 => g2r_n);
end;

entity dip_74s86 is port (              -- sn7486 [74s86]
  p1  : in  std_logic;                  -- g1a
  p2  : in  std_logic;                  -- g1b
  p3  : out std_logic;                  -- g1y
  p4  : in  std_logic;                  -- g2a
  p5  : in  std_logic;                  -- g2b
  p6  : out std_logic;                  -- g2y
  p8  : out std_logic;                  -- g3y
  p9  : in  std_logic;                  -- g3a
  p10 : in  std_logic;                  -- g3b
  p11 : out std_logic;                  -- g4y
  p12 : in  std_logic;                  -- g4a
  p13 : in  std_logic                   -- g4b
  );
end;

architecture dip of dip_74s86 is
begin
  ttl : sn7486 port map (p1 => g1a, p2 => g1b, p3 => g1y, p4 => g2a, p5 => g2b, p6 => g2y, p8 => g3y, p9 => g3a, p10 => g3b, p11 => g4y, p12 => g4a, p13 => g4b);
end;

entity dip_82s21 is port (              -- dm8221 [82s21]
  p1  : in  std_logic;                  -- wclk_n
  p2  : in  std_logic;                  -- we0_n
  p3  : in  std_logic;                  -- i0
  p4  : in  std_logic;                  -- a4
  p5  : in  std_logic;                  -- ce
  p6  : in  std_logic;                  -- strobe
  p7  : out std_logic;                  -- d0
  p9  : out std_logic;                  -- d1
  p10 : in  std_logic;                  -- a3
  p11 : in  std_logic;                  -- a2
  p12 : in  std_logic;                  -- a1
  p13 : in  std_logic;                  -- a0
  p14 : in  std_logic;                  -- i1
  p15 : in  std_logic                   -- we1_n
  );
end;

architecture dip of dip_82s21 is
begin
  ttl : dm8221 port map (p1 => wclk_n, p2 => we0_n, p3 => i0, p4 => a4, p5 => ce, p6 => strobe, p7 => d0, p9 => d1, p10 => a3, p11 => a2, p12 => a1, p13 => a0, p14 => i1, p15 => we1_n);
end;

entity dip_9328 is port (               -- dm9328 [9328]
  p1  : in std_logic;                   -- clr_n
  p2  : in std_logic;                   -- aq_n
  p3  : in std_logic;                   -- aq
  p4  : in std_logic;                   -- asel
  p5  : in std_logic;                   -- ai1
  p6  : in std_logic;                   -- ai0
  p7  : in std_logic;                   -- aclk
  p9  : in std_logic;                   -- comclk
  p10 : in std_logic;                   -- bclk
  p11 : in std_logic;                   -- bi0
  p12 : in std_logic;                   -- bi1
  p13 : in std_logic;                   -- bsel
  p14 : in std_logic;                   -- bq
  p15 : in std_logic                    -- bq_n
  );
end;

architecture dip of dip_9328 is
begin
  ttl : dm9328 port map (p1 => clr_n, p2 => aq_n, p3 => aq, p4 => asel, p5 => ai1, p6 => ai0, p7 => aclk, p9 => comclk, p10 => bclk, p11 => bi0, p12 => bi1, p13 => bsel, p14 => bq, p15 => bq_n);
end;

entity dip_93425a is port (             -- am93425a [93425a]
  p1  : in  std_logic;                  -- ce_n
  p2  : in  std_logic;                  -- a0
  p3  : in  std_logic;                  -- a1
  p4  : in  std_logic;                  -- a2
  p5  : in  std_logic;                  -- a3
  p6  : in  std_logic;                  -- a4
  p7  : out std_logic;                  -- do
  p9  : in  std_logic;                  -- a5
  p10 : in  std_logic;                  -- a6
  p11 : in  std_logic;                  -- a7
  p12 : in  std_logic;                  -- a8
  p13 : in  std_logic;                  -- a9
  p14 : in  std_logic;                  -- we_n
  p15 : in  std_logic                   -- di
  );
end;

architecture dip of dip_93425a is
begin
  ttl : am93425a port map (p1 => ce_n, p2 => a0, p3 => a1, p4 => a2, p5 => a3, p6 => a4, p7 => do, p9 => a5, p10 => a6, p11 => a7, p12 => a8, p13 => a9, p14 => we_n, p15 => di);
end;

entity dip_93s46 is port (              -- dm9346 [93s46]
  p1  : in  std_logic;                  -- a0
  p2  : in  std_logic;                  -- b0
  p3  : in  std_logic;                  -- a1
  p4  : in  std_logic;                  -- b1
  p5  : in  std_logic;                  -- a2
  p6  : in  std_logic;                  -- b2
  p7  : in  std_logic;                  -- enb
  p9  : out std_logic;                  -- eq
  p10 : in  std_logic;                  -- a3
  p11 : in  std_logic;                  -- b3
  p12 : in  std_logic;                  -- a4
  p13 : in  std_logic;                  -- b4
  p14 : in  std_logic;                  -- a5
  p15 : in  std_logic                   -- b5
  );
end;

architecture dip of dip_93s46 is
begin
  ttl : dm9346 port map (p1 => a0, p2 => b0, p3 => a1, p4 => b1, p5 => a2, p6 => b2, p7 => enb, p9 => eq, p10 => a3, p11 => b3, p12 => a4, p13 => b4, p14 => a5, p15 => b5);
end;

entity dip_93s48 is port (              -- am93s48 [93s48]
  p1  : in  std_logic;                  -- i6
  p2  : in  std_logic;                  -- i5
  p3  : in  std_logic;                  -- i4
  p4  : in  std_logic;                  -- i3
  p5  : in  std_logic;                  -- i2
  p6  : in  std_logic;                  -- i1
  p7  : in  std_logic;                  -- i0
  p9  : out std_logic;                  -- po
  p10 : out std_logic;                  -- pe
  p11 : in  std_logic;                  -- i11
  p12 : in  std_logic;                  -- i10
  p13 : in  std_logic;                  -- i9
  p14 : in  std_logic;                  -- i8
  p15 : in  std_logic                   -- i7
  );
end;

architecture dip of dip_93s48 is
begin
  ttl : am93s48 port map (p1 => i6, p2 => i5, p3 => i4, p4 => i3, p5 => i2, p6 => i1, p7 => i0, p9 => po, p10 => pe, p11 => i11, p12 => i10, p13 => i9, p14 => i8, p15 => i7);
end;

entity dip_9s42_1 is port (             -- dm942 [9s42-1]
  p1  : in  std_logic;                  -- g1a1
  p2  : in  std_logic;                  -- g1b1
  p3  : in  std_logic;                  -- g2a1
  p4  : in  std_logic;                  -- g2b1
  p5  : in  std_logic;                  -- g2c1
  p6  : in  std_logic;                  -- g2d1
  p7  : out std_logic;                  -- out1
  p9  : out std_logic;                  -- out2
  p10 : in  std_logic;                  -- g2d2
  p11 : in  std_logic;                  -- g2c2
  p12 : in  std_logic;                  -- g2b2
  p13 : in  std_logic;                  -- g2a2
  p14 : in  std_logic;                  -- g1b2
  p15 : in  std_logic                   -- g1a2
  );
end;

architecture dip of dip_9s42_1 is
begin
  ttl : dm942 port map (p1 => g1a1, p2 => g1b1, p3 => g2a1, p4 => g2b1, p5 => g2c1, p6 => g2d1, p7 => out1, p9 => out2, p10 => g2d2, p11 => g2c2, p12 => g2b2, p13 => g2a2, p14 => g1b2, p15 => g1a2);
end;

entity dip_res20 is port (              -- res20 [res20]
  p2  : in std_logic;                   -- r2
  p3  : in std_logic;                   -- r3
  p4  : in std_logic;                   -- r4
  p5  : in std_logic;                   -- r5
  p6  : in std_logic;                   -- r6
  p7  : in std_logic;                   -- r7
  p8  : in std_logic;                   -- r8
  p9  : in std_logic;                   -- r9
  p10 : in std_logic;                   -- r10
  p11 : in std_logic;                   -- r11
  p12 : in std_logic;                   -- r12
  p13 : in std_logic;                   -- r13
  p14 : in std_logic;                   -- r14
  p15 : in std_logic;                   -- r15
  p16 : in std_logic;                   -- r16
  p17 : in std_logic;                   -- r17
  p18 : in std_logic;                   -- r18
  p19 : in std_logic                    -- r19
  );
end;

architecture dip of dip_res20 is
begin
  ttl : res20 port map (p2 => r2, p3 => r3, p4 => r4, p5 => r5, p6 => r6, p7 => r7, p8 => r8, p9 => r9, p10 => r10, p11 => r11, p12 => r12, p13 => r13, p14 => r14, p15 => r15, p16 => r16, p17 => r17, p18 => r18, p19 => r19);
end;

entity dip_sip220_330_8 is port (       -- sip220_330_8 [sip220/330-8]
  p2 : in std_logic;                    -- r2
  p3 : in std_logic;                    -- r3
  p4 : in std_logic;                    -- r4
  p5 : in std_logic;                    -- r5
  p6 : in std_logic;                    -- r6
  p7 : in std_logic                     -- r7
  );
end;

architecture dip of dip_sip220_330_8 is
begin
  ttl : sip220_330_8 port map (p2 => r2, p3 => r3, p4 => r4, p5 => r5, p6 => r6, p7 => r7);
end;

entity dip_sip330_470_8 is port (       -- sip330_470_8 [sip330/470-8]
  p2 : in std_logic;                    -- r2
  p3 : in std_logic;                    -- r3
  p4 : in std_logic;                    -- r4
  p5 : in std_logic;                    -- r5
  p6 : in std_logic;                    -- r6
  p7 : in std_logic                     -- r7
  );
end;

architecture dip of dip_sip330_470_8 is
begin
  ttl : sip330_470_8 port map (p2 => r2, p3 => r3, p4 => r4, p5 => r5, p6 => r6, p7 => r7);
end;

entity dip_td100 is port (              -- td100 [td100]
  p1  : in  std_logic;                  -- input
  p4  : out std_logic;                  -- o_40ns
  p6  : out std_logic;                  -- o_80ns
  p8  : out std_logic;                  -- o_100ns
  p10 : out std_logic;                  -- o_60ns
  p12 : out std_logic                   -- o_20ns
  );
end;

architecture dip of dip_td100 is
begin
  ttl : td100 port map (p1 => input, p4 => o_40ns, p6 => o_80ns, p8 => o_100ns, p10 => o_60ns, p12 => o_20ns);
end;

entity dip_td25 is port (               -- td25 [td25]
  p1  : in  std_logic;                  -- input
  p4  : out std_logic;                  -- o_10ns
  p6  : out std_logic;                  -- o_20ns
  p8  : out std_logic;                  -- o_25ns
  p10 : out std_logic;                  -- o_15ns
  p12 : out std_logic                   -- o_5ns
  );
end;

architecture dip of dip_td25 is
begin
  ttl : td25 port map (p1 => input, p4 => o_10ns, p6 => o_20ns, p8 => o_25ns, p10 => o_15ns, p12 => o_5ns);
end;

entity dip_td250 is port (              -- td250 [td250]
  p1  : in  std_logic;                  -- input
  p4  : out std_logic;                  -- o_100ns
  p6  : out std_logic;                  -- o_200ns
  p8  : out std_logic;                  -- o_250ns
  p10 : out std_logic;                  -- o_150ns
  p12 : out std_logic                   -- o_50ns
  );
end;

architecture dip of dip_td250 is
begin
  ttl : td250 port map (p1 => input, p4 => o_100ns, p6 => o_200ns, p8 => o_250ns, p10 => o_150ns, p12 => o_50ns);
end;

entity dip_td50 is port (               -- td50 [td50]
  p1  : in  std_logic;                  -- input
  p4  : out std_logic;                  -- o_20ns
  p6  : out std_logic;                  -- o_40ns
  p8  : out std_logic;                  -- o_50ns
  p10 : out std_logic;                  -- o_30ns
  p12 : out std_logic                   -- o_10ns
  );
end;

architecture dip of dip_td50 is
begin
  ttl : td50 port map (p1 => input, p4 => o_20ns, p6 => o_40ns, p8 => o_50ns, p10 => o_30ns, p12 => o_10ns);
end;

entity dip_til309 is port (             -- til309 [til309]
  p1  : in std_logic;                   -- l2
  p2  : in std_logic;                   -- l4
  p3  : in std_logic;                   -- l8
  p4  : in std_logic;                   -- l1
  p5  : in std_logic;                   -- latch
  p6  : in std_logic;                   -- i4
  p7  : in std_logic;                   -- i8
  p12 : in std_logic;                   -- i2
  p13 : in std_logic;                   -- blank_n
  p14 : in std_logic;                   -- dp
  p15 : in std_logic;                   -- test_n
  p16 : in std_logic;                   -- ldp
  p17 : in std_logic                    -- i1
  );
end;

architecture dip of dip_til309 is
begin
  ttl : til309 port map (p1 => l2, p2 => l4, p3 => l8, p4 => l1, p5 => latch, p6 => i4, p7 => i8, p12 => i2, p13 => blank_n, p14 => dp, p15 => test_n, p16 => ldp, p17 => i1);
end;

--------------------------------------------------------------------------------
