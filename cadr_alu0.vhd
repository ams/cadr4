library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_alu0 is
  port (
    a12      : out std_logic;
    m12      : in  std_logic;
    aluf3b   : in  std_logic;
    aluf2b   : in  std_logic;
    aluf1b   : in  std_logic;
    aluf0b   : in  std_logic;
    \-cin12\ : in  std_logic;
    alumode  : in  std_logic;
    alu12    : out std_logic;
    alu13    : out std_logic;
    alu14    : out std_logic;
    alu15    : out std_logic;
    aeqm     : out std_logic;
    xout15   : out std_logic;
    yout15   : out std_logic;
    a15      : in  std_logic;
    m15      : in  std_logic;
    a14      : in  std_logic;
    m14      : in  std_logic;
    a13      : in  std_logic;
    m13      : in  std_logic;
    a4       : in  std_logic;
    m4       : in  std_logic;
    \-cin4\  : in  std_logic;
    alu4     : out std_logic;
    alu5     : out std_logic;
    alu6     : out std_logic;
    alu7     : out std_logic;
    xout7    : out std_logic;
    yout7    : out std_logic;
    a7       : in  std_logic;
    m7       : in  std_logic;
    a6       : in  std_logic;
    m6       : in  std_logic;
    a5       : in  std_logic;
    m5       : in  std_logic;
    a8       : in  std_logic;
    m8       : in  std_logic;
    \-cin8\  : in  std_logic;
    alu8     : out std_logic;
    alu9     : out std_logic;
    alu10    : out std_logic;
    alu11    : out std_logic;
    xout11   : out std_logic;
    yout11   : out std_logic;
    a11      : in  std_logic;
    m11      : in  std_logic;
    a10      : in  std_logic;
    m10      : in  std_logic;
    a9       : in  std_logic;
    m9       : in  std_logic;
    a0       : in  std_logic;
    m0       : in  std_logic;
    \-cin0\  : in  std_logic;
    alu0     : out std_logic;
    alu1     : out std_logic;
    alu2     : out std_logic;
    alu3     : out std_logic;
    xout3    : out std_logic;
    yout3    : out std_logic;
    a3       : in  std_logic;
    m3       : in  std_logic;
    a2       : in  std_logic;
    m2       : in  std_logic;
    a1       : in  std_logic;
    m1       : in  std_logic);
end;

architecture ttl of cadr_alu0 is
begin
  alu0_2a23 : sn74s181 port map(
    b0     => a12,      -- p1 (A12)
    a0     => m12,      -- p2 (M12)
    s3     => aluf3b,   -- p3 (ALUF3B)
    s2     => aluf2b,   -- p4 (ALUF2B)
    s1     => aluf1b,   -- p5 (ALUF1B)
    s0     => aluf0b,   -- p6 (ALUF0B)
    cin_n  => \-cin12\, -- p7 (-CIN12)
    m      => alumode,  -- p8 (ALUMODE)
    f0     => alu12,    -- p9 (ALU12)
    f1     => alu13,    -- p10 (ALU13)
    f2     => alu14,    -- p11 (ALU14)
    f3     => alu15,    -- p13 (ALU15)
    aeb    => aeqm,     -- p14 (AEQM)
    x      => xout15,   -- p15 (XOUT15)
    cout_n => open,   -- p16 (NC)
    y      => yout15,   -- p17 (YOUT15)
    b3     => a15,      -- p18 (A15)
    a3     => m15,      -- p19 (M15)
    b2     => a14,      -- p20 (A14)
    a2     => m14,      -- p21 (M14)
    b1     => a13,      -- p22 (A13)
    a1     => m13       -- p23 (M13)
  );
  alu0_2a28 : sn74s181 port map(
    b0     => a4,       -- p1 (A4)
    a0     => m4,       -- p2 (M4)
    s3     => aluf3b,   -- p3 (ALUF3B)
    s2     => aluf2b,   -- p4 (ALUF2B)
    s1     => aluf1b,   -- p5 (ALUF1B)
    s0     => aluf0b,   -- p6 (ALUF0B)
    cin_n  => \-cin4\,  -- p7 (-CIN4)
    m      => alumode,  -- p8 (ALUMODE)
    f0     => alu4,     -- p9 (ALU4)
    f1     => alu5,     -- p10 (ALU5)
    f2     => alu6,     -- p11 (ALU6)
    f3     => alu7,     -- p13 (ALU7)
    aeb    => aeqm,     -- p14 (AEQM)
    x      => xout7,    -- p15 (XOUT7)
    cout_n => open,    -- p16 (NC)
    y      => yout7,    -- p17 (YOUT7)
    b3     => a7,       -- p18 (A7)
    a3     => m7,       -- p19 (M7)
    b2     => a6,       -- p20 (A6)
    a2     => m6,       -- p21 (M6)
    b1     => a5,       -- p22 (A5)
    a1     => m5       -- p23 (M5)
  );
  alu0_2b23 : sn74s181 port map(
    b0     => a8,       -- p1 (A8)
    a0     => m8,       -- p2 (M8)
    s3     => aluf3b,   -- p3 (ALUF3B)
    s2     => aluf2b,   -- p4 (ALUF2B)
    s1     => aluf1b,   -- p5 (ALUF1B)
    s0     => aluf0b,   -- p6 (ALUF0B)
    cin_n  => \-cin8\,  -- p7 (-CIN8)
    m      => alumode,  -- p8 (ALUMODE)
    f0     => alu8,     -- p9 (ALU8)
    f1     => alu9,     -- p10 (ALU9)
    f2     => alu10,    -- p11 (ALU10)
    f3     => alu11,    -- p13 (ALU11)
    aeb    => aeqm,     -- p14 (AEQM)
    x      => xout11,   -- p15 (XOUT11)
    cout_n => open,    -- p16 (NC)
    y      => yout11,   -- p17 (YOUT11)
    b3     => a11,      -- p18 (A11)
    a3     => m11,      -- p19 (M11)
    b2     => a10,      -- p20 (A10)
    a2     => m10,      -- p21 (M10)
    b1     => a9,       -- p22 (A9)
    a1     => m9       -- p23 (M9)
  );
  alu0_2b28 : sn74s181 port map(
    b0     => a0,       -- p1 (A0)
    a0     => m0,       -- p2 (M0)
    s3     => aluf3b,   -- p3 (ALUF3B)
    s2     => aluf2b,   -- p4 (ALUF2B)
    s1     => aluf1b,   -- p5 (ALUF1B)
    s0     => aluf0b,   -- p6 (ALUF0B)
    cin_n  => \-cin0\,  -- p7 (-CIN0)
    m      => alumode,  -- p8 (ALUMODE)
    f0     => alu0,     -- p9 (ALU0)
    f1     => alu1,     -- p10 (ALU1)
    f2     => alu2,     -- p11 (ALU2)
    f3     => alu3,     -- p13 (ALU3)
    aeb    => aeqm,     -- p14 (AEQM)
    x      => xout3,    -- p15 (XOUT3)
    cout_n => open,    -- p16 (NC)
    y      => yout3,    -- p17 (YOUT3)
    b3     => a3,       -- p18 (A3)
    a3     => m3,       -- p19 (M3)
    b2     => a2,       -- p20 (A2)
    a2     => m2,       -- p21 (M2)
    b1     => a1,       -- p22 (A1)
    a1     => m1       -- p23 (M1)
  );
end architecture;
