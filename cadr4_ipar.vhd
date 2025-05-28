library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_ipar is
  port (
    ir41    : in  std_logic;
    ir42    : in  std_logic;
    ir43    : in  std_logic;
    ir44    : in  std_logic;
    ir45    : in  std_logic;
    ir46    : in  std_logic;
    ir47    : in  std_logic;
    ipar3   : out std_logic;
    ir36    : in  std_logic;
    ir37    : in  std_logic;
    ir38    : in  std_logic;
    ir39    : in  std_logic;
    ir40    : in  std_logic;
    ir5     : in  std_logic;
    ir6     : in  std_logic;
    ir7     : in  std_logic;
    ir8     : in  std_logic;
    ir9     : in  std_logic;
    ir10    : in  std_logic;
    ir11    : in  std_logic;
    ipar0   : out std_logic;
    ir0     : in  std_logic;
    ir1     : in  std_logic;
    ir2     : in  std_logic;
    ir3     : in  std_logic;
    ir4     : in  std_logic;
    ir29    : in  std_logic;
    ir30    : in  std_logic;
    ir31    : in  std_logic;
    ir32    : in  std_logic;
    ir33    : in  std_logic;
    ir34    : in  std_logic;
    ir35    : in  std_logic;
    ipar2   : out std_logic;
    ir24    : in  std_logic;
    ir25    : in  std_logic;
    ir26    : in  std_logic;
    ir27    : in  std_logic;
    ir28    : in  std_logic;
    gnd     : in  std_logic;
    iparity : out std_logic;
    ipar1   : out std_logic;
    ir48    : in  std_logic;
    ir17    : in  std_logic;
    ir18    : in  std_logic;
    ir19    : in  std_logic;
    ir20    : in  std_logic;
    ir21    : in  std_logic;
    ir22    : in  std_logic;
    ir23    : in  std_logic;
    ir12    : in  std_logic;
    ir13    : in  std_logic;
    ir14    : in  std_logic;
    ir15    : in  std_logic;
    ir16    : in  std_logic;
    imodd   : in  std_logic;
    iparok  : out std_logic
    );
end;

architecture ttl of cadr4_ipar is
begin
  ipar_3e02 : am93s48 port map(
    i6  => ir41,    -- p1 (IR41)
    i5  => ir42,    -- p2 (IR42)
    i4  => ir43,    -- p3 (IR43)
    i3  => ir44,    -- p4 (IR44)
    i2  => ir45,    -- p5 (IR45)
    i1  => ir46,    -- p6 (IR46)
    i0  => ir47,    -- p7 (IR47)
    po  => ipar3,   -- p9 (IPAR3)
    pe  => open,   -- p10 (NC)
    i11 => ir36,    -- p11 (IR36)
    i10 => ir37,    -- p12 (IR37)
    i9  => ir38,    -- p13 (IR38)
    i8  => ir39,    -- p14 (IR39)
    i7  => ir40     -- p15 (IR40)
    );
  ipar_3e04 : am93s48 port map(
    i6  => ir5,     -- p1 (IR5)
    i5  => ir6,     -- p2 (IR6)
    i4  => ir7,     -- p3 (IR7)
    i3  => ir8,     -- p4 (IR8)
    i2  => ir9,     -- p5 (IR9)
    i1  => ir10,    -- p6 (IR10)
    i0  => ir11,    -- p7 (IR11)
    po  => ipar0,   -- p9 (IPAR0)
    pe  => open,   -- p10 (NC)
    i11 => ir0,     -- p11 (IR0)
    i10 => ir1,     -- p1)
    i9  => ir2,     -- p13 (IR2)
    i8  => ir3,     -- p14 (IR3)
    i7  => ir4      -- p15 (IR4)
    );
  ipar_3e21 : am93s48 port map(
    i6  => ir29,    -- p1 (IR29)
    i5  => ir30,    -- p2 (IR30)
    i4  => ir31,    -- p3 (IR31)
    i3  => ir32,    -- p4 (IR32)
    i2  => ir33,    -- p5 (IR33)
    i1  => ir34,    -- p6 (IR34)
    i0  => ir35,    -- p7 (IR35)
    po  => ipar2,   -- p9 (IPAR2)
    pe  => open,   -- p10 (NC)
    i11 => ir24,    -- p11 (IR24)
    i10 => ir25,    -- p12 (IR25)
    i9  => ir26,    -- p13 (IR26)
    i8  => ir27,    -- p14 (IR27)
    i7  => ir28     -- p15 (IR28)
    );
  ipar_3f22 : am93s48 port map(
    i6  => gnd,     -- p1 (GND)
    i5  => gnd,     -- p2 (GND)
    i4  => gnd,     -- p3 (GND)
    i3  => gnd,     -- p4 (GND)
    i2  => gnd,     -- p5 (GND)
    i1  => gnd,     -- p6 (GND)
    i0  => gnd,     -- p7 (GND)
    po  => iparity, -- p9 (IPARITY)
    pe  => open,   -- p10 (NC)
    i11 => ipar0,   -- p11 (IPAR0)
    i10 => ipar1,   -- p12 (IPAR1)
    i9  => ipar2,   -- p13 (IPAR2)
    i8  => ipar3,   -- p14 (IPAR3)
    i7  => ir48     -- p15 (IR48)
    );
  ipar_3f24 : am93s48 port map(
    i6  => ir17,    -- p1 (IR17)
    i5  => ir18,    -- p2 (IR18)
    i4  => ir19,    -- p3 (IR19)
    i3  => ir20,    -- p4 (IR20)
    i2  => ir21,    -- p5 (IR21)
    i1  => ir22,    -- p6 (IR22)
    i0  => ir23,    -- p7 (IR23)
    po  => ipar1,   -- p9 (IPAR1)
    pe  => open,   -- p10 (NC)
    i11 => ir12,    -- p11 (IR12)
    i10 => ir13,    -- p12 (IR13)
    i9  => ir14,    -- p13 (IR14)
    i8  => ir15,    -- p14 (IR15)
    i7  => ir16     -- p15 (IR16)
    );
  ipar_4e03 : sn74s32 port map(
    g2a => imodd,   -- p4 (IMODD)
    g2b => iparity, -- p5 (IPARITY)
    g2y => iparok,  -- p6 (IPAROK)
    g1a => '0',     -- unconnected
    g1b => '0',     -- unconnected
    g3a => '0',     -- unconnected
    g3b => '0',     -- unconnected
    g4a => '0',     -- unconnected
    g4b => '0'      -- unconnected
    );
end architecture;
