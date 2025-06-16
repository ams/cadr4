library ieee;
use ieee.std_logic_1164.all;
use work.cadr_book.all;

entity sm_set is
  port (
    IR : in std_logic_vector(13 downto 0);
    M : in std_logic_vector(31 downto 0);
    MSK : out std_logic_vector(31 downto 0);
    R : out std_logic_vector(31 downto 0);
    SA : in std_logic_vector(31 downto 0);
    \-irbyte\ : in std_logic;
    \-sh3\ : in std_logic;
    \-sh4\ : in std_logic;
    ir31 : in std_logic;
    \a=m\ : out std_logic
  );
end;

architecture rtl of sm_set is
  -- Internal signals for interconnections
  signal mskl0, mskl1, mskl2, mskl3, mskl4 : std_logic;
  signal mskr0, mskr1, mskr2, mskr3, mskr4 : std_logic;
  signal s0, s1, s2a, s2b, s3a, s3b, s4 : std_logic;
  signal ns4 : std_logic;
  signal m5 : std_logic;

begin

  -- cadr_smctl instance
  u_smctl: cadr_smctl port map (
    \-ir0\ => IR(0), \-ir1\ => IR(1), \-ir2\ => IR(2),
    ir5 => IR(5), ir6 => IR(6), ir7 => IR(7), ir8 => IR(8), ir9 => IR(9),
    ir12 => IR(12), ir13 => IR(13),
    \-irbyte\ => \-irbyte\, \-sh3\ => \-sh3\, \-sh4\ => \-sh4\,
    \-mr\ => \-mr\, \-sr\ => \-sr\,
    mskl0 => mskl0, mskl1 => mskl1, mskl2 => mskl2, mskl3 => mskl3, mskl4 => mskl4,
    mskr0 => mskr0, mskr1 => mskr1, mskr2 => mskr2, mskr3 => mskr3, mskr4 => mskr4,
    s0 => s0, s1 => s1, s2a => s2a, s2b => s2b, s3a => s3a, s3b => s3b,
    \-s4\ => ns4, s4 => s4,
    mskl3cry => open
  );

  -- cadr_shift0 instance
  u_shift0: cadr_shift0 port map (
    m0 => M(0), m1 => M(1), m2 => M(2), m3 => M(3), m4 => M(4), m6 => M(6), m7 => M(7), m8 => M(8), m9 => M(9), m10 => M(10), m11 => M(11), m12 => M(12), m13 => M(13), m14 => M(14), m15 => M(15), m29 => M(29), m30 => M(30), m31 => M(31),
    s0 => s0, s1 => s1, s2a => s2a, s3a => s3a, \-s4\ => ns4, s4 => s4,
    sa16 => SA(16), sa17 => SA(17), sa18 => SA(18), sa19 => SA(19), sa20 => SA(20), sa21 => SA(21), sa22 => SA(22), sa23 => SA(23), sa24 => SA(24), sa25 => SA(25), sa26 => SA(26), sa27 => SA(27), sa28 => SA(28), sa29 => SA(29), sa30 => SA(30), sa31 => SA(31),
    m5 => m5,
    r0 => R(0), r1 => R(1), r2 => R(2), r3 => R(3), r4 => R(4), r5 => R(5), r6 => R(6), r7 => R(7), r8 => R(8), r9 => R(9), r10 => R(10), r11 => R(11), r12 => R(12), r13 => R(13), r14 => R(14), r15 => R(15)
  );

  -- cadr_shift1 instance
  u_shift1: cadr_shift1 port map (
    m13 => M(13), m14 => M(14), m15 => M(15), m16 => M(16), m17 => M(17), m18 => M(18), m19 => M(19), m20 => M(20), m21 => M(21), m22 => M(22), m23 => M(23), m24 => M(24), m25 => M(25), m26 => M(26), m27 => M(27), m28 => M(28), m29 => M(29), m30 => M(30), m31 => M(31),
    s0 => s0, s1 => s1, s2b => s2b, s3b => s3b, \-s4\ => ns4, s4 => s4,
    sa0 => SA(0), sa1 => SA(1), sa2 => SA(2), sa3 => SA(3), sa4 => SA(4), sa5 => SA(5), sa6 => SA(6), sa7 => SA(7), sa8 => SA(8), sa9 => SA(9), sa10 => SA(10), sa11 => SA(11), sa12 => SA(12), sa13 => SA(13), sa14 => SA(14), sa15 => SA(15),
    r16 => R(16), r17 => R(17), r18 => R(18), r19 => R(19), r20 => R(20), r21 => R(21), r22 => R(22), r23 => R(23), r24 => R(24), r25 => R(25), r26 => R(26), r27 => R(27), r28 => R(28), r29 => R(29), r30 => R(30), r31 => R(31)
  );

  -- cadr_mskg4 instance
  u_mskg4: cadr_mskg4 port map (
    ir12 => IR(12), ir13 => IR(13), ir31 => ir31,
    mskl0 => mskl0, mskl1 => mskl1, mskl2 => mskl2, mskl3 => mskl3, mskl4 => mskl4,
    mskr0 => mskr0, mskr1 => mskr1, mskr2 => mskr2, mskr3 => mskr3, mskr4 => mskr4,
    \a=m\ => \a=m\,
    \-ir12\ => open, \-ir13\ => open, \-ir31\ => open,
    msk0 => MSK(0), msk1 => MSK(1), msk2 => MSK(2), msk3 => MSK(3), msk4 => MSK(4), msk5 => MSK(5), msk6 => MSK(6), msk7 => MSK(7), msk8 => MSK(8), msk9 => MSK(9), msk10 => MSK(10), msk11 => MSK(11), msk12 => MSK(12), msk13 => MSK(13), msk14 => MSK(14), msk15 => MSK(15), msk16 => MSK(16), msk17 => MSK(17), msk18 => MSK(18), msk19 => MSK(19), msk20 => MSK(20), msk21 => MSK(21), msk22 => MSK(22), msk23 => MSK(23), msk24 => MSK(24), msk25 => MSK(25), msk26 => MSK(26), msk27 => MSK(27), msk28 => MSK(28), msk29 => MSK(29), msk30 => MSK(30), msk31 => MSK(31)
  );

end; 