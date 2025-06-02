library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_apar is
  port (
    a26       : in  std_logic;
    a27       : in  std_logic;
    a28       : in  std_logic;
    a29       : in  std_logic;
    a30       : in  std_logic;
    a31b      : in  std_logic;
    aparity   : in  std_logic;
    aparok    : out std_logic;
    aparl     : out std_logic;
    aparm     : out std_logic;
    gnd       : in  std_logic;
    a24       : in  std_logic;
    a25       : in  std_logic;
    a17       : in  std_logic;
    a18       : in  std_logic;
    a19       : in  std_logic;
    a20       : in  std_logic;
    a21       : in  std_logic;
    a22       : in  std_logic;
    a23       : in  std_logic;
    a12       : in  std_logic;
    a13       : in  std_logic;
    a14       : in  std_logic;
    a15       : in  std_logic;
    a16       : in  std_logic;
    a5        : in  std_logic;
    a6        : in  std_logic;
    a7        : in  std_logic;
    a8        : in  std_logic;
    a9        : in  std_logic;
    a10       : in  std_logic;
    a11       : in  std_logic;
    a0        : in  std_logic;
    a1        : in  std_logic;
    a2        : in  std_logic;
    a3        : in  std_logic;
    a4        : in  std_logic;
    m17       : in  std_logic;
    m18       : in  std_logic;
    m19       : in  std_logic;
    m20       : in  std_logic;
    m21       : in  std_logic;
    m22       : in  std_logic;
    m23       : in  std_logic;
    mparm     : out std_logic;
    m12       : in  std_logic;
    m13       : in  std_logic;
    m14       : in  std_logic;
    m15       : in  std_logic;
    m16       : in  std_logic;
    m5        : in  std_logic;
    m6        : in  std_logic;
    m7        : in  std_logic;
    m8        : in  std_logic;
    m9        : in  std_logic;
    m10       : in  std_logic;
    m11       : in  std_logic;
    mparl     : out std_logic;
    m0        : in  std_logic;
    m1        : in  std_logic;
    m2        : in  std_logic;
    m3        : in  std_logic;
    m4        : in  std_logic;
    mpareven  : out std_logic;
    srcm      : in  std_logic;
    mmemparok : out std_logic;
    pdlenb    : in  std_logic;
    pdlparok  : out std_logic;
    m26       : in  std_logic;
    m27       : in  std_logic;
    m28       : in  std_logic;
    m29       : in  std_logic;
    m30       : in  std_logic;
    m31       : in  std_logic;
    mparity   : in  std_logic;
    mparodd   : out std_logic;
    m24       : in  std_logic;
    m25       : in  std_logic);
end;

architecture ttl of cadr_apar is
begin
  apar_3a28 : am93s48 port map(
    i6  => a26,     -- p1 (A26)
    i5 => a27,     -- p2 (A27)
    i4 => a28,     -- p3 (A28)
    i3 => a29,     -- p4 (A29)
    i2 => a30,     -- p5 (A30)
    i1 => a31b,    -- p6 (A31B)
    i0 => aparity, -- p7 (APARITY)
    po => aparok,  -- p9 (APAROK)
    pe => open,   -- p10 (NC)
    i11 => aparl,  -- p11 (APARL)
    i10 => aparm,  -- p12 (APARM)
    i9 => gnd,     -- p13 (GND)
    i8 => a24,     -- p14 (A24)
    i7 => a25      -- p15 (A25)
  );
  apar_3a29 : am93s48 port map(
    i6  => a17,     -- p1 (A17)
    i5 => a18,     -- p2 (A18)
    i4 => a19,     -- p3 (A19)
    i3 => a20,     -- p4 (A20)
    i2 => a21,     -- p5 (A21)
    i1 => a22,     -- p6 (A22)
    i0 => a23,     -- p7 (A23)
    po => aparm,  -- p9 (APARM)
    pe => open,   -- p10 (NC)
    i11 => a12,    -- p11 (A12)
    i10 => a13,    -- p12 (A13)
    i9 => a14,     -- p13 (A14)
    i8 => a15,     -- p14 (A15)
    i7 => a16      -- p15 (A16)
  );
  apar_3a30 : am93s48 port map(
    i6  => a5,      -- p1 (A5)
    i5 => a6,      -- p2 (A6)
    i4 => a7,      -- p3 (A7)
    i3 => a8,      -- p4 (A8)
    i2 => a9,      -- p5 (A9)
    i1 => a10,     -- p6 (A10)
    i0 => a11,     -- p7 (A11)
    po => aparl,  -- p9 (APARL)
    pe => open,   -- p10 (NC)
    i11 => a0,     -- p11 (A0)
    i10 => a1,     -- p12 (A1)
    i9 => a2,      -- p13 (A2)
    i8 => a3,      -- p14 (A3)
    i7 => a4       -- p15 (A4)
  );
  apar_4a12 : am93s48 port map(
    i6  => m17,     -- p1 (M17)
    i5 => m18,     -- p2 (M18)
    i4 => m19,     -- p3 (M19)
    i3 => m20,     -- p4 (M20)
    i2 => m21,     -- p5 (M21)
    i1 => m22,     -- p6 (M22)
    i0 => m23,     -- p7 (M23)
    po => mparm,  -- p9 (MPARM)
    pe => open,   -- p10 (NC)
    i11 => m12,    -- p11 (M12)
    i10 => m13,    -- p12 (M13)
    i9 => m14,     -- p13 (M14)
    i8 => m15,     -- p14 (M15)
    i7 => m16      -- p15 (M16)
  );
  apar_4a14 : am93s48 port map(
    i6  => m5,      -- p1 (M5)
    i5 => m6,      -- p2 (M6)
    i4 => m7,      -- p3 (M7)
    i3 => m8,      -- p4 (M8)
    i2 => m9,      -- p5 (M9)
    i1 => m10,     -- p6 (M10)
    i0 => m11,     -- p7 (M11)
    po => mparl,  -- p9 (MPARL)
    pe => open,   -- p10 (NC)
    i11 => m0,     -- p11 (M0)
    i10 => m1,     -- p12 (M1)
    i9 => m2,      -- p13 (M2)
    i8 => m3,      -- p14 (M3)
    i7 => m4       -- p15 (M4)
  );
  apar_4a17 : sn74s00 port map(
    g1a => srcm,      -- p1 (MPAREVEN) -- Netlist: MPAREVEN, VHDL: srcm
    g1q_n => mmemparok, -- p2 (SRCM) -- Netlist: SRCM, VHDL: mmemparok
    g1b => mpareven,  -- p4 (MPAREVEN)
    g2b => mpareven,  -- p5 (PDLENB) -- Netlist: PDLENB, VHDL: mpareven
    g2a => pdlenb,    -- p6 (PDLPAROK) -- Netlist: PDLPAROK, VHDL: pdlenb
    g3b => '0',      -- p7 (MMEMPAROK) -- Netlist: MMEMPAROK, VHDL: '0'
    g3a => '0',      -- p8 (GND)
    g4a => '0',      -- p9 (GND)
    g4b => '0'       -- p10 (GND)
  );
  apar_4b15 : am93s48 port map(
    i6  => m26,     -- p1 (M26)
    i5 => m27,     -- p2 (M27)
    i4 => m28,     -- p3 (M28)
    i3 => m29,     -- p4 (M29)
    i2 => m30,     -- p5 (M30)
    i1 => m31,     -- p6 (M31)
    i0 => mparity, -- p7 (MPARITY)
    po => mparodd,  -- p9 (MPARODD)
    pe => mpareven, -- p10 (MPAREVEN)
    i11 => mparl,  -- p11 (MPARL)
    i10 => mparm,  -- p12 (MPARM)
    i9 => gnd,     -- p13 (GND)
    i8 => m24,     -- p14 (M24)
    i7 => m25      -- p15 (M25)
  );
end architecture;
