library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

package dip is

  -- Generate when done.

end package;

--------------------------------------------------------------------------------
--
-- Format of the following entities:
--
-- entity <dip-name> is port ( -- <ttl-name>
-- <dip-pin-name> : <direction> std_logic; -- <ttl-pin-name>
-- ...
-- );
-- end;
--

entity dip_16dummy is port (            -- ic_16dummy
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  );
end;

entity dip_2147 is port (               -- am2147
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  );
end;

entity dip_25ls2519 is port (           -- am252519
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  );
end;

entity dip_25s07 is port (              -- am2507
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_25s09 is port (              -- am2509
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_25s10 is port (              -- am2510
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_5600 is port (               -- im5600
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_5610 is port (               -- im5600
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_7428 is port (               -- sn7428
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74ls109 is port (            -- sn74109
  p1 : inout std_logic;
  p2 : inout std_logic;
  p3 : inout std_logic;
  p4 : inout std_logic;
  p5 : inout std_logic;
  p6 : inout std_logic;
  p7 : inout std_logic;
  );
end;

entity dip_74ls14 is port (             -- sn7414
  p2 : inout std_logic;
  p3 : inout std_logic;
  p4 : inout std_logic;
  p5 : inout std_logic;
  p6 : inout std_logic;
  p8 : inout std_logic;
  p9 : inout std_logic;
  );
end;

entity dip_74ls240 is port (            -- sn74240
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  );
end;

entity dip_74ls244 is port (            -- sn74244
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  );
end;

entity dip_74s00 is port (              -- sn7400
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s00o is port (             -- sn7400
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s02 is port (              -- sn7402
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s02o is port (             -- sn7402
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s04 is port (              -- sn7404
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s04a is port (             -- sn7404
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s08 is port (              -- sn7408
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s08o is port (             -- sn7408
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s10 is port (              -- sn7410
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s10o is port (             -- sn7410
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s11 is port (              -- sn7411
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s11o is port (             -- sn7411
  p3 : inout std_logic;
  p4 : inout std_logic;
  p5 : inout std_logic;
  p6 : inout std_logic;
  );
end;

entity dip_74s133 is port (             -- sn74133
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s133o is port (            -- sn74133
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s138 is port (             -- sn74138
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s139 is port (             -- sn74139
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s151 is port (             -- sn74151
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s153 is port (             -- sn74153
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s157 is port (             -- sn74157
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s169 is port (             -- sn74169
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s174 is port (             -- sn74174
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s175 is port (             -- sn74175
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s181 is port (             -- sn74181
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  p20 : inout std_logic;
  p21 : inout std_logic;
  p22 : inout std_logic;
  p23 : inout std_logic;
  );
end;

entity dip_74s182 is port (             -- sn74182
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s194 is port (             -- sn74194
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s20 is port (              -- sn7420
  p1  : inout std_logic;
  p2  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s20o is port (             -- sn7420
  p1  : inout std_logic;
  p2  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s240 is port (             -- sn74240
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  );
end;

entity dip_74s241 is port (             -- sn74241
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  );
end;

entity dip_74s258 is port (             -- sn74258
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s260 is port (             -- sn74260
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p5  : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s280 is port (             -- sn74280
  p1  : inout std_logic;
  p2  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s283 is port (             -- sn74283
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_74s32 is port (              -- sn7432
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s32o is port (             -- sn7432
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  );
end;

entity dip_74s32w is port (             -- sn7432
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s37 is port (              -- sn7437
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  );
end;

entity dip_74s373 is port (             -- sn74373
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  );
end;

entity dip_74s374 is port (             -- sn74374
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  );
end;

entity dip_74s472 is port (             -- dm74472
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  );
end;

entity dip_74s51 is port (              -- sn7451
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s64 is port (              -- sn7464
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s74 is port (              -- sn7474
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_74s86 is port (              -- sn7486
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  );
end;

entity dip_82s21 is port (              -- dm8221
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_9328 is port (               -- dm9328
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_93425a is port (             -- am93425a
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_93s46 is port (              -- dm9346
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_93s48 is port (              -- am93s48
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_9s42-1 is port (             -- dm942
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p9  : inout std_logic;
  p10 : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  );
end;

entity dip_res20 is port (              -- res20
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p8  : inout std_logic;
  p9  : inout std_logic;
  p11 : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  p18 : inout std_logic;
  p19 : inout std_logic;
  );
end;

entity dip_sip220/330-8 is port (       -- sip220_330_8
  p2 : inout std_logic;
  p3 : inout std_logic;
  p4 : inout std_logic;
  p5 : inout std_logic;
  p6 : inout std_logic;
  p7 : inout std_logic;
  );
end;

entity dip_sip330/470-8 is port (       -- sip330_470_8
  p2 : inout std_logic;
  p3 : inout std_logic;
  p4 : inout std_logic;
  p5 : inout std_logic;
  p6 : inout std_logic;
  p7 : inout std_logic;
  );
end;

entity dip_td100 is port (              -- td100
  p1  : inout std_logic;
  p4  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p10 : inout std_logic;
  p12 : inout std_logic;
  );
end;

entity dip_td25 is port (               -- td25
  p1  : inout std_logic;
  p4  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p10 : inout std_logic;
  p12 : inout std_logic;
  );
end;

entity dip_td250 is port (              -- td250
  p1  : inout std_logic;
  p4  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p10 : inout std_logic;
  p12 : inout std_logic;
  );
end;

entity dip_td50 is port (               -- td50
  p1  : inout std_logic;
  p4  : inout std_logic;
  p6  : inout std_logic;
  p8  : inout std_logic;
  p10 : inout std_logic;
  p12 : inout std_logic;
  );
end;

entity dip_til309 is port (             -- til309
  p1  : inout std_logic;
  p2  : inout std_logic;
  p3  : inout std_logic;
  p4  : inout std_logic;
  p5  : inout std_logic;
  p6  : inout std_logic;
  p7  : inout std_logic;
  p12 : inout std_logic;
  p13 : inout std_logic;
  p14 : inout std_logic;
  p15 : inout std_logic;
  p16 : inout std_logic;
  p17 : inout std_logic;
  );
end;

--------------------------------------------------------------------------------
