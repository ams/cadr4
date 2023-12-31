library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_mo1 is
  port (
    alu31  : in  std_logic;
    r31    : in  std_logic;
    a31b   : in  std_logic;
    ob31   : out std_logic;
    gnd    : in  std_logic;
    osel1a : in  std_logic;
    osel0a : in  std_logic;
    msk31  : in  std_logic;
    alu30  : in  std_logic;
    alu32  : in  std_logic;
    r30    : in  std_logic;
    a30    : in  std_logic;
    ob30   : out std_logic;
    msk30  : in  std_logic;
    alu29  : in  std_logic;
    r29    : in  std_logic;
    a29    : in  std_logic;
    ob29   : out std_logic;
    msk29  : in  std_logic;
    alu28  : in  std_logic;
    r28    : in  std_logic;
    a28    : in  std_logic;
    ob28   : out std_logic;
    msk28  : in  std_logic;
    alu27  : in  std_logic;
    alu23  : in  std_logic;
    r23    : in  std_logic;
    a23    : in  std_logic;
    ob23   : out std_logic;
    msk23  : in  std_logic;
    alu22  : in  std_logic;
    alu24  : in  std_logic;
    r22    : in  std_logic;
    a22    : in  std_logic;
    ob22   : out std_logic;
    msk22  : in  std_logic;
    alu21  : in  std_logic;
    r21    : in  std_logic;
    a21    : in  std_logic;
    ob21   : out std_logic;
    msk21  : in  std_logic;
    alu20  : in  std_logic;
    r20    : in  std_logic;
    a20    : in  std_logic;
    ob20   : out std_logic;
    msk20  : in  std_logic;
    alu19  : in  std_logic;
    r27    : in  std_logic;
    a27    : in  std_logic;
    ob27   : out std_logic;
    msk27  : in  std_logic;
    alu26  : in  std_logic;
    r24    : in  std_logic;
    a24    : in  std_logic;
    ob24   : out std_logic;
    msk24  : in  std_logic;
    alu25  : in  std_logic;
    r26    : in  std_logic;
    a26    : in  std_logic;
    ob26   : out std_logic;
    msk26  : in  std_logic;
    r25    : in  std_logic;
    a25    : in  std_logic;
    ob25   : out std_logic;
    msk25  : in  std_logic;
    r19    : in  std_logic;
    a19    : in  std_logic;
    ob19   : out std_logic;
    msk19  : in  std_logic;
    alu18  : in  std_logic;
    r18    : in  std_logic;
    a18    : in  std_logic;
    ob18   : out std_logic;
    msk18  : in  std_logic;
    alu17  : in  std_logic;
    r17    : in  std_logic;
    a17    : in  std_logic;
    ob17   : out std_logic;
    msk17  : in  std_logic;
    alu16  : in  std_logic;
    r16    : in  std_logic;
    a16    : in  std_logic;
    ob16   : out std_logic;
    msk16  : in  std_logic;
    alu15  : in  std_logic);
end;

architecture ttl of cadr4_mo1 is
  signal nc259 : std_logic;
  signal nc260 : std_logic;
  signal nc261 : std_logic;
  signal nc262 : std_logic;
  signal nc263 : std_logic;
  signal nc264 : std_logic;
  signal nc265 : std_logic;
  signal nc266 : std_logic;
  signal nc267 : std_logic;
  signal nc268 : std_logic;
  signal nc269 : std_logic;
  signal nc270 : std_logic;
  signal nc271 : std_logic;
  signal nc272 : std_logic;
  signal nc273 : std_logic;
  signal nc274 : std_logic;
begin
  mo1_2a09 : sn74s151 port map(i3 => alu31, i2 => alu31, i1 => r31, i0 => a31b, q => ob31, q_n => nc274, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk31, i7 => alu30, i6 => alu30, i5 => alu32, i4 => alu32);
  mo1_2a10 : sn74s151 port map(i3 => alu30, i2 => alu30, i1 => r30, i0 => a30, q => ob30, q_n => nc273, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk30, i7 => alu29, i6 => alu29, i5 => alu31, i4 => alu31);
  mo1_2a14 : sn74s151 port map(i3 => alu29, i2 => alu29, i1 => r29, i0 => a29, q => ob29, q_n => nc272, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk29, i7 => alu28, i6 => alu28, i5 => alu30, i4 => alu30);
  mo1_2a15 : sn74s151 port map(i3 => alu28, i2 => alu28, i1 => r28, i0 => a28, q => ob28, q_n => nc271, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk28, i7 => alu27, i6 => alu27, i5 => alu29, i4 => alu29);
  mo1_2b09 : sn74s151 port map(i3 => alu23, i2 => alu23, i1 => r23, i0 => a23, q => ob23, q_n => nc266, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk23, i7 => alu22, i6 => alu22, i5 => alu24, i4 => alu24);
  mo1_2b10 : sn74s151 port map(i3 => alu22, i2 => alu22, i1 => r22, i0 => a22, q => ob22, q_n => nc265, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk22, i7 => alu21, i6 => alu21, i5 => alu23, i4 => alu23);
  mo1_2b14 : sn74s151 port map(i3 => alu21, i2 => alu21, i1 => r21, i0 => a21, q => ob21, q_n => nc264, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk21, i7 => alu20, i6 => alu20, i5 => alu22, i4 => alu22);
  mo1_2b15 : sn74s151 port map(i3 => alu20, i2 => alu20, i1 => r20, i0 => a20, q => ob20, q_n => nc263, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk20, i7 => alu19, i6 => alu19, i5 => alu21, i4 => alu21);
  mo1_2c09 : sn74s151 port map(i3 => alu27, i2 => alu27, i1 => r27, i0 => a27, q => ob27, q_n => nc270, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk27, i7 => alu26, i6 => alu26, i5 => alu28, i4 => alu28);
  mo1_2c14 : sn74s151 port map(i3 => alu24, i2 => alu24, i1 => r24, i0 => a24, q => ob24, q_n => nc267, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk24, i7 => alu23, i6 => alu23, i5 => alu25, i4 => alu25);
  mo1_2d04 : sn74s151 port map(i3 => alu26, i2 => alu26, i1 => r26, i0 => a26, q => ob26, q_n => nc269, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk26, i7 => alu25, i6 => alu25, i5 => alu27, i4 => alu27);
  mo1_2d09 : sn74s151 port map(i3 => alu25, i2 => alu25, i1 => r25, i0 => a25, q => ob25, q_n => nc268, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk25, i7 => alu24, i6 => alu24, i5 => alu26, i4 => alu26);
  mo1_2d13 : sn74s151 port map(i3 => alu19, i2 => alu19, i1 => r19, i0 => a19, q => ob19, q_n => nc262, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk19, i7 => alu18, i6 => alu18, i5 => alu20, i4 => alu20);
  mo1_2d14 : sn74s151 port map(i3 => alu18, i2 => alu18, i1 => r18, i0 => a18, q => ob18, q_n => nc261, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk18, i7 => alu17, i6 => alu17, i5 => alu19, i4 => alu19);
  mo1_2d18 : sn74s151 port map(i3 => alu17, i2 => alu17, i1 => r17, i0 => a17, q => ob17, q_n => nc260, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk17, i7 => alu16, i6 => alu16, i5 => alu18, i4 => alu18);
  mo1_2d19 : sn74s151 port map(i3 => alu16, i2 => alu16, i1 => r16, i0 => a16, q => ob16, q_n => nc259, ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk16, i7 => alu15, i6 => alu15, i5 => alu17, i4 => alu17);
end architecture;
