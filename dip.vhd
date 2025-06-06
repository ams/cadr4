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
--      entity < dip-name > is port (                -- <ttl-name>
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

entity dip_16dummy is port (            -- ic_16dummy
  p1 : std_logic;                       -- dummy
  );
end;

entity dip_2147 is port (               -- am2147
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
  p17 : in  std_logic;                  -- a6
  );
end;

entity dip_25ls2519 is port (           -- am252519
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
  p19 : in  std_logic;                  -- asyn_clr_n
  );
end;

entity dip_25s07 is port (              -- am2507
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
  p15 : out std_logic;                  -- d5
  );
end;

entity dip_25s09 is port (              -- am2509
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
  p15 : out std_logic;                  -- dq
  );
end;

entity dip_25s10 is port (              -- am2510
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
  p15 : out std_logic;                  -- o0
  );
end;

entity dip_5600 is port (               -- im5600
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
  p15 : in  std_logic;                  -- ce_n
  );
end;

entity dip_5610 is port (               -- im5600
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
  p15 : in  std_logic;                  -- ce_n
  );
end;

entity dip_7428 is port (               -- sn7428
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
  p13 : out std_logic;                  -- g4q_n
  );
end;

entity dip_74ls109 is port (            -- sn74109
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
  p15 : in  std_logic;                  -- clr2_n
  );
end;

entity dip_74ls14 is port (             -- sn7414
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
  p13 : in  std_logic;                  -- g6a
  );
end;

entity dip_74ls240 is port (            -- sn74240
 );
end;

entity dip_74ls244 is port (            -- sn74244
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
  p19 : in  std_logic;                  -- benb_n
  );
end;

entity dip_74s00 is port (              -- sn7400
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
  p13 : in  std_logic;                  -- g4b
  );
end;

entity dip_74s00o is port (             -- sn7400
 );
end;

entity dip_74s02 is port (              -- sn7402
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
  p13 : out std_logic;                  -- g4q_
  );
end;

entity dip_74s02o is port (             -- sn7402
 );
end;

entity dip_74s04 is port (              -- sn7404
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
  p13 : in  std_logic;                  -- g6a
  );
end;

entity dip_74s04a is port (             -- sn7404
 );
end;

entity dip_74s08 is port (              -- sn7408
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
  p13 : in  std_logic;                  -- g4b
  );
end;

entity dip_74s08o is port (             -- sn7408
 );
end;

entity dip_74s10 is port (              -- sn7410
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
  p13 : in  std_logic;                  -- g1c
  );
end;

entity dip_74s10o is port (             -- sn7410
 );
end;

entity dip_74s11 is port (              -- sn7411
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
  p13 : in  std_logic;                  -- g1c
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
  p15 : in std_logic;                   -- m
  );
end;

entity dip_74s133o is port (            -- sn74133
 );
end;

entity dip_74s138 is port (             -- sn74138
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
  p15 : out std_logic;                  -- y0
  );
end;

entity dip_74s139 is port (             -- sn74139
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
  p15 : in  std_logic;                  -- g2
  );
end;

entity dip_74s151 is port (             -- sn74151
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
  p15 : in  std_logic;                  -- i4
  );
end;

entity dip_74s153 is port (             -- sn74153
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
  p15 : in  std_logic;                  -- enb2_n
  );
end;

entity dip_74s157 is port (             -- sn74157
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
  p15 : in  std_logic;                  -- enb_n
  );
end;

entity dip_74s169 is port (             -- sn74169
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
  p15 : out std_logic;                  -- co_n
  );
end;

entity dip_74s174 is port (             -- sn74174
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
  p15 : in std_logic;                   -- q6
  );
end;

entity dip_74s175 is port (             -- sn74175
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
  p15 : out std_logic;                  -- q3
  );
end;

entity dip_74s181 is port (             -- sn74181
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
  p23 : in  std_logic;                  -- a1
  );
end;

entity dip_74s182 is port (             -- sn74182
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
  p15 : in  std_logic;                  -- x2
  );
end;

entity dip_74s194 is port (             -- sn74194
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
  p15 : out std_logic;                  -- q0
  );
end;

entity dip_74s20 is port (              -- sn7420
  p1  : in  std_logic;                  -- g1a
  p2  : in  std_logic;                  -- g1b
  p4  : in  std_logic;                  -- g1c
  p5  : in  std_logic;                  -- g1d
  p6  : out std_logic;                  -- g1y_n
  p8  : out std_logic;                  -- g2y_n
  p9  : in  std_logic;                  -- g2a
  p10 : in  std_logic;                  -- g2b
  p12 : in  std_logic;                  -- g2c
  p13 : in  std_logic;                  -- g2d
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
  p19 : in  std_logic;                  -- benb_n
  );
end;

entity dip_74s241 is port (             -- sn74241
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
  p19 : in  std_logic;                  -- benb
  );
end;

entity dip_74s258 is port (             -- sn74258
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
  p15 : in  std_logic;                  -- enb_n
  );
end;

entity dip_74s260 is port (             -- sn74260
  p1  : in std_logic;                   -- i1
  p2  : in std_logic;                   -- i2
  p3  : in std_logic;                   -- i3
  p5  : in std_logic;                   -- o1
  p12 : in std_logic;                   -- i4
  p13 : in std_logic;                   -- i5
  );
end;

entity dip_74s280 is port (             -- sn74280
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
  p13 : in  std_logic;                  -- i8
  );
end;

entity dip_74s283 is port (             -- sn74283
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
  p15 : in  std_logic;                  -- b2
  );
end;

entity dip_74s32 is port (              -- sn7432
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
  p13 : in  std_logic;                  -- g4b
  );
end;

entity dip_74s32o is port (             -- sn7432
 );
end;

entity dip_74s32w is port (             -- sn7432
 );
end;

entity dip_74s37 is port (              -- sn7437
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
  p13 : in  std_logic;                  -- g4b
  );
end;

entity dip_74s373 is port (             -- sn74373
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
  p19 : out std_logic;                  -- o7
  );
end;

entity dip_74s374 is port (             -- sn74374
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
  p19 : out std_logic;                  -- o7
  );
end;

entity dip_74s472 is port (             -- dm74472
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
  p19 : in std_logic;                   -- a8
  );
end;

entity dip_74s51 is port (              -- sn7451
  p1  : in  std_logic;                  -- g1a
  p2  : in  std_logic;                  -- g2a
  p3  : in  std_logic;                  -- g2b
  p4  : in  std_logic;                  -- g2c
  p5  : in  std_logic;                  -- g2d
  p6  : out std_logic;                  -- g2y
  p8  : out std_logic;                  -- g1y
  p9  : in  std_logic;                  -- g1c
  p10 : in  std_logic;                  -- g1d
  p13 : in  std_logic;                  -- g1b
  );
end;

entity dip_74s64 is port (              -- sn7464
  p1  : in  std_logic;                  -- d4
  p2  : in  std_logic;                  -- b2
  p3  : in  std_logic;                  -- a2
  p4  : in  std_logic;                  -- c3
  p5  : in  std_logic;                  -- b3
  p6  : in  std_logic;                  -- a3
  p8  : out std_logic;                  -- out
  p9  : in  std_logic;                  -- a1
  p10 : in  std_logic;                  -- b1
  p11 : in  std_logic;                  -- c4
  p12 : in  std_logic;                  -- b4
  p13 : in  std_logic;                  -- a4
  );
end;

entity dip_74s74 is port (              -- sn7474
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
  p13 : in  std_logic;                  -- g2r_n
  );
end;

entity dip_74s86 is port (              -- sn7486
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
  p13 : in  std_logic;                  -- g4b
  );
end;

entity dip_82s21 is port (              -- dm8221
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
  p15 : in  std_logic;                  -- we1_n
  );
end;

entity dip_9328 is port (               -- dm9328
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
  p15 : in std_logic;                   -- bq_n
  );
end;

entity dip_93425a is port (             -- am93425a
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
  p15 : in  std_logic;                  -- di
  );
end;

entity dip_93s46 is port (              -- dm9346
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
  p15 : in  std_logic;                  -- b5
  );
end;

entity dip_93s48 is port (              -- am93s48
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
  p15 : in  std_logic;                  -- i7
  );
end;

entity dip_9s42-1 is port (             -- dm942
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
  p15 : in  std_logic;                  -- g1a2
  );
end;

entity dip_res20 is port (              -- res20
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
  p19 : in std_logic;                   -- r19
  );
end;

entity dip_sip220/330-8 is port (       -- sip220_330_8
  p2 : in std_logic;                    -- r2
  p3 : in std_logic;                    -- r3
  p4 : in std_logic;                    -- r4
  p5 : in std_logic;                    -- r5
  p6 : in std_logic;                    -- r6
  p7 : in std_logic;                    -- r7
  );
end;

entity dip_sip330/470-8 is port (       -- sip330_470_8
  p2 : in std_logic;                    -- r2
  p3 : in std_logic;                    -- r3
  p4 : in std_logic;                    -- r4
  p5 : in std_logic;                    -- r5
  p6 : in std_logic;                    -- r6
  p7 : in std_logic;                    -- r7
  );
end;

entity dip_td100 is port (              -- td100
  p1  : in  std_logic;                  -- input
  p4  : out std_logic;                  -- o_40ns
  p6  : out std_logic;                  -- o_80ns
  p8  : out std_logic;                  -- o_100ns
  p10 : out std_logic;                  -- o_60ns
  p12 : out std_logic;                  -- o_20ns
  );
end;

entity dip_td25 is port (               -- td25
  p1  : in  std_logic;                  -- input
  p4  : out std_logic;                  -- o_10ns
  p6  : out std_logic;                  -- o_20ns
  p8  : out std_logic;                  -- o_25ns
  p10 : out std_logic;                  -- o_15ns
  p12 : out std_logic;                  -- o_5ns
  );
end;

entity dip_td250 is port (              -- td250
  p1  : in  std_logic;                  -- input
  p4  : out std_logic;                  -- o_100ns
  p6  : out std_logic;                  -- o_200ns
  p8  : out std_logic;                  -- o_250ns
  p10 : out std_logic;                  -- o_150ns
  p12 : out std_logic;                  -- o_50ns
  );
end;

entity dip_td50 is port (               -- td50
  p1  : in  std_logic;                  -- input
  p4  : out std_logic;                  -- o_20ns
  p6  : out std_logic;                  -- o_40ns
  p8  : out std_logic;                  -- o_50ns
  p10 : out std_logic;                  -- o_30ns
  p12 : out std_logic;                  -- o_10ns
  );
end;

entity dip_til309 is port (             -- til309
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
  p17 : in std_logic;                   -- i1
  );
end;

--------------------------------------------------------------------------------
