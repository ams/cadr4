library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_alu1 is
  port (
    a31a     : in  std_logic;
    m31b     : out std_logic;
    aluf3a   : in  std_logic;
    aluf2a   : in  std_logic;
    aluf1a   : in  std_logic;
    aluf0a   : in  std_logic;
    \-cin32\ : in  std_logic;
    alumode  : in  std_logic;
    alu32    : out std_logic;
    m31      : in  std_logic;
    hi12     : in  std_logic;
    a28      : in  std_logic;
    m28      : in  std_logic;
    \-cin28\ : in  std_logic;
    alu28    : out std_logic;
    alu29    : out std_logic;
    alu30    : out std_logic;
    alu31    : out std_logic;
    aeqm     : out std_logic;
    xout31   : out std_logic;
    yout31   : out std_logic;
    a31b     : in  std_logic;
    a30      : in  std_logic;
    m30      : in  std_logic;
    a29      : in  std_logic;
    m29      : in  std_logic;
    a20      : in  std_logic;
    m20      : in  std_logic;
    \-cin20\ : in  std_logic;
    alu20    : out std_logic;
    alu21    : out std_logic;
    alu22    : out std_logic;
    alu23    : out std_logic;
    xout23   : out std_logic;
    yout23   : out std_logic;
    a23      : in  std_logic;
    m23      : in  std_logic;
    a22      : in  std_logic;
    m22      : in  std_logic;
    a21      : in  std_logic;
    m21      : in  std_logic;
    a24      : in  std_logic;
    m24      : in  std_logic;
    \-cin24\ : in  std_logic;
    alu24    : out std_logic;
    alu25    : out std_logic;
    alu26    : out std_logic;
    alu27    : out std_logic;
    xout27   : out std_logic;
    yout27   : out std_logic;
    a27      : in  std_logic;
    m27      : in  std_logic;
    a26      : in  std_logic;
    m26      : in  std_logic;
    a25      : in  std_logic;
    m25      : in  std_logic;
    a16      : in  std_logic;
    m16      : in  std_logic;
    \-cin16\ : in  std_logic;
    alu16    : out std_logic;
    alu17    : out std_logic;
    alu18    : out std_logic;
    alu19    : out std_logic;
    xout19   : out std_logic;
    yout19   : out std_logic;
    a19      : in  std_logic;
    m19      : in  std_logic;
    a18      : in  std_logic;
    m18      : in  std_logic;
    a17      : in  std_logic;
    m17      : in  std_logic);
end;

architecture ttl of cadr4_alu1 is
  signal nc444 : std_logic;
  signal nc445 : std_logic;
  signal nc446 : std_logic;
  signal nc447 : std_logic;
  signal nc448 : std_logic;
  signal nc449 : std_logic;
  signal nc450 : std_logic;
  signal nc451 : std_logic;
  signal nc452 : std_logic;
  signal nc453 : std_logic;
  signal nc454 : std_logic;
  signal nc455 : std_logic;
  signal nc456 : std_logic;
  signal nc457 : std_logic;
  signal nc458 : std_logic;
  signal nc459 : std_logic;
  signal nc460 : std_logic;
  signal nc461 : std_logic;
  signal nc462 : std_logic;
  signal nc463 : std_logic;
  signal nc464 : std_logic;
  signal nc465 : std_logic;
  signal nc466 : std_logic;
  signal nc467 : std_logic;
  signal nc468 : std_logic;
  signal nc469 : std_logic;
begin
  alu1_2b13 : sn74s181 port map(
    b0     => a16,      -- p1 (A16)
    a0     => m16,      -- p2 (M16)
    s3     => aluf3a,   -- p3 (ALUF3A)
    s2     => aluf2a,   -- p4 (ALUF2A)
    s1     => aluf1a,   -- p5 (ALUF1A)
    s0     => aluf0a,   -- p6 (ALUF0A)
    cin_n  => \-cin16\, -- p7 (-CIN16)
    m      => alumode,  -- p8 (ALUMODE)
    f0     => alu16,    -- p9 (ALU16)
    f1     => alu17,    -- p10 (ALU17)
    f2     => alu18,    -- p11 (ALU18)
    f3     => alu19,    -- p13 (ALU19)
    aeb    => aeqm,     -- p14 (AEQM)
    x      => xout19,   -- p15 (XOUT19)
    cout_n => nc460,    -- p16 (NC)
    y      => yout19,   -- p17 (YOUT19)
    b3     => a19,      -- p18 (A19)
    a3     => m19,      -- p19 (M19)
    b2     => a18,      -- p20 (A18)
    a2     => m18,      -- p21 (M18)
    b1     => a17,      -- p22 (A17)
    a1     => m17       -- p23 (M17)
  );
  alu1_2a13 : sn74s181 port map(
    b0     => a20,      -- p1 (A20)
    a0     => m20,      -- p2 (M20)
    s3     => aluf3a,   -- p3 (ALUF3A)
    s2     => aluf2a,   -- p4 (ALUF2A)
    s1     => aluf1a,   -- p5 (ALUF1A)
    s0     => aluf0a,   -- p6 (ALUF0A)
    cin_n  => \-cin20\, -- p7 (-CIN20)
    m      => alumode,  -- p8 (ALUMODE)
    f0     => alu20,    -- p9 (ALU20)
    f1     => alu21,    -- p10 (ALU21)
    f2     => alu22,    -- p11 (ALU22)
    f3     => alu23,    -- p13 (ALU23)
    aeb    => aeqm,     -- p14 (AEQM)
    x      => xout23,   -- p15 (XOUT23)
    cout_n => nc459,    -- p16 (NC)
    y      => yout23,   -- p17 (YOUT23)
    b3     => a23,      -- p18 (A23)
    a3     => m23,      -- p19 (M23)
    b2     => a22,      -- p20 (A22)
    a2     => m22,      -- p21 (M22)
    b1     => a21,      -- p22 (A21)
    a1     => m21       -- p23 (M21)
  );
  alu1_2b08 : sn74s181 port map(
    b0     => a24,      -- p1 (A24)
    a0     => m24,      -- p2 (M24)
    s3     => aluf3a,   -- p3 (ALUF3A)
    s2     => aluf2a,   -- p4 (ALUF2A)
    s1     => aluf1a,   -- p5 (ALUF1A)
    s0     => aluf0a,   -- p6 (ALUF0A)
    cin_n  => \-cin24\, -- p7 (-CIN24)
    m      => alumode,  -- p8 (ALUMODE)
    f0     => alu24,    -- p9 (ALU24)
    f1     => alu25,    -- p10 (ALU25)
    f2     => alu26,    -- p11 (ALU26)
    f3     => alu27,    -- p13 (ALU27)
    aeb    => aeqm,     -- p14 (AEQM)
    x      => xout27,   -- p15 (XOUT27)
    cout_n => nc458,    -- p16 (NC)
    y      => yout27,   -- p17 (YOUT27)
    b3     => a27,      -- p18 (A27)
    a3     => m27,      -- p19 (M27)
    b2     => a26,      -- p20 (A26)
    a2     => m26,      -- p21 (M26)
    b1     => a25,      -- p22 (A25)
    a1     => m25       -- p23 (M25)
  );
  alu1_2a08 : sn74s181 port map(
    b0     => a28,      -- p1 (A28)
    a0     => m28,      -- p2 (M28)
    s3     => aluf3a,   -- p3 (ALUF3A)
    s2     => aluf2a,   -- p4 (ALUF2A)
    s1     => aluf1a,   -- p5 (ALUF1A)
    s0     => aluf0a,   -- p6 (ALUF0A)
    cin_n  => \-cin28\, -- p7 (-CIN28)
    m      => alumode,  -- p8 (ALUMODE)
    f0     => alu28,    -- p9 (ALU28)
    f1     => alu29,    -- p10 (ALU29)
    f2     => alu30,    -- p11 (ALU30)
    f3     => alu31,    -- p13 (ALU31)
    aeb    => aeqm,     -- p14 (AEQM)
    x      => xout31,   -- p15 (XOUT31)
    cout_n => nc457,    -- p16 (NC)
    y      => yout31,   -- p17 (YOUT31)
    b3     => a31b,     -- p18 (A31B)
    a3     => m31b,     -- p19 (M31B)
    b2     => a30,      -- p20 (A30)
    a2     => m30,      -- p21 (M30)
    b1     => a29,      -- p22 (A29)
    a1     => m29       -- p23 (M29)
  );
  alu1_2a03 : sn74s181 port map(
    b0     => a31a,     -- p1 (A31A)
    a0     => m31b,     -- p2 (M31B)
    s3     => aluf3a,   -- p3 (ALUF3A)
    s2     => aluf2a,   -- p4 (ALUF2A)
    s1     => aluf1a,   -- p5 (ALUF1A)
    s0     => aluf0a,   -- p6 (ALUF0A)
    cin_n  => \-cin32\, -- p7 (-CIN32)
    m      => alumode,  -- p8 (ALUMODE)
    f0     => alu32,    -- p9 (ALU32)
    f1     => nc444,    -- p10 (NC)
    f2     => nc445,    -- p11 (NC)
    f3     => nc446,    -- p13 (NC)
    aeb    => nc447,    -- p14 (NC)
    x      => nc448,    -- p15 (NC)
    cout_n => nc449,    -- p16 (NC)
    y      => nc450,    -- p17 (NC)
    b3     => nc451,    -- p18 (NC)
    a3     => nc452,    -- p19 (NC)
    b2     => nc453,    -- p20 (NC)
    a2     => nc454,    -- p21 (NC)
    b1     => nc455,    -- p22 (NC)
    a1     => nc456     -- p23 (NC)
  );
  alu1_2a04 : sn74s08 port map(
    g1a => m31,  -- p1 (M31)
    g1b => hi12, -- p2 (HI12)
    g1q => m31b, -- p3 (M31B)
    g2a => nc461, -- p4 (NC)
    g2b => nc462, -- p5 (NC)
    g2q => nc463, -- p6 (NC)
    g3a => nc464, -- p8 (NC)
    g3b => nc465, -- p9 (NC)
    g3q => nc466, -- p10 (NC)
    g4a => nc467, -- p11 (NC)
    g4b => nc468, -- p12 (NC)
    g4q => nc469  -- p13 (NC)
  );
end architecture;
