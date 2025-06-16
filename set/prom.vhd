library ieee;
use ieee.std_logic_1164.all;
use work.icmem_book.all;

entity prom is
  port (
    -- PC bus input
    PC : in std_logic_vector(13 downto 0);
    
    -- Control inputs for PCTL
    \-ape\ : in std_logic;
    \-dpe\ : in std_logic;
    \-idebug\ : in std_logic;
    \-ipe\ : in std_logic;
    \-iwriteda\ : in std_logic;
    \-mempe\ : in std_logic;
    \-mpe\ : in std_logic;
    \-pdlpe\ : in std_logic;
    \-promdisabled\ : in std_logic;
    \-spe\ : in std_logic;
    \-v0pe\ : in std_logic;
    \-v1pe\ : in std_logic;
    
    -- Instruction bus output
    I : out std_logic_vector(48 downto 0);
    
    -- PCTL outputs
    \bottom.1k\ : out std_logic;
    dpe : out std_logic;
    i46 : out std_logic;
    ipe : out std_logic;
    \-promenable\ : out std_logic;
    promenable : out std_logic;
    tilt0 : out std_logic;
    tilt1 : out std_logic
  );
end entity;

architecture rtl of prom is
  signal prompc0, prompc1, prompc2, prompc3, prompc4 : std_logic;
  signal prompc5, prompc6, prompc7, prompc8, prompc9 : std_logic;
  signal promce0, promce1 : std_logic;
  signal i0_0, i1_0, i2_0, i3_0, i4_0, i5_0, i6_0, i7_0 : std_logic;
  signal i8_0, i9_0, i10_0, i11_0, i12_0, i13_0, i14_0, i15_0 : std_logic;
  signal i16_0, i17_0, i18_0, i19_0, i20_0, i21_0, i22_0, i23_0 : std_logic;
  signal i24_0, i25_0, i26_0, i27_0, i28_0, i29_0, i30_0, i31_0 : std_logic;
  signal i32_0, i33_0, i34_0, i35_0, i36_0, i37_0, i38_0, i39_0 : std_logic;
  signal i40_0, i41_0, i42_0, i43_0, i44_0, i45_0, i47_0, i48_0 : std_logic;
  signal i0_1, i1_1, i2_1, i3_1, i4_1, i5_1, i6_1, i7_1 : std_logic;
  signal i8_1, i9_1, i10_1, i11_1, i12_1, i13_1, i14_1, i15_1 : std_logic;
  signal i16_1, i17_1, i18_1, i19_1, i20_1, i21_1, i22_1, i23_1 : std_logic;
  signal i24_1, i25_1, i26_1, i27_1, i28_1, i29_1, i30_1, i31_1 : std_logic;
  signal i32_1, i33_1, i34_1, i35_1, i36_1, i37_1, i38_1, i39_1 : std_logic;
  signal i40_1, i41_1, i42_1, i43_1, i44_1, i45_1, i47_1, i48_1 : std_logic;

begin
  
  -- PROM control
  pctl_inst: cadr_pctl port map (\-ape\ => \-ape\, \-dpe\ => \-dpe\, \-idebug\ => \-idebug\, \-ipe\ => \-ipe\, \-iwriteda\ => \-iwriteda\, \-mempe\ => \-mempe\, \-mpe\ => \-mpe\, pc0 => PC(0), pc1 => PC(1), pc10 => PC(10), pc11 => PC(11), pc12 => PC(12), pc13 => PC(13), pc2 => PC(2), pc3 => PC(3), pc4 => PC(4), pc5 => PC(5), pc6 => PC(6), pc7 => PC(7), pc8 => PC(8), pc9 => PC(9), \-pdlpe\ => \-pdlpe\, \-promdisabled\ => \-promdisabled\, \-spe\ => \-spe\, \-v0pe\ => \-v0pe\, \-v1pe\ => \-v1pe\, \bottom.1k\ => \bottom.1k\, dpe => dpe, i46 => i46, ipe => ipe, \-promce0\ => promce0, \-promce1\ => promce1, \-promenable\ => \-promenable\, promenable => promenable, \-prompc0\ => prompc0, \-prompc1\ => prompc1, \-prompc2\ => prompc2, \-prompc3\ => prompc3, \-prompc4\ => prompc4, \-prompc5\ => prompc5, \-prompc6\ => prompc6, \-prompc7\ => prompc7, \-prompc8\ => prompc8, \-prompc9\ => prompc9, tilt0 => tilt0, tilt1 => tilt1);

  -- PROM0 (lower 512 entries)
  prom0_inst: cadr_prom0 port map (\-promce0\ => promce0, \-prompc0\ => prompc0, \-prompc1\ => prompc1, \-prompc2\ => prompc2, \-prompc3\ => prompc3, \-prompc4\ => prompc4, \-prompc5\ => prompc5, \-prompc6\ => prompc6, \-prompc7\ => prompc7, \-prompc8\ => prompc8, i0 => i0_0, i1 => i1_0, i10 => i10_0, i11 => i11_0, i12 => i12_0, i13 => i13_0, i14 => i14_0, i15 => i15_0, i16 => i16_0, i17 => i17_0, i18 => i18_0, i19 => i19_0, i2 => i2_0, i20 => i20_0, i21 => i21_0, i22 => i22_0, i23 => i23_0, i24 => i24_0, i25 => i25_0, i26 => i26_0, i27 => i27_0, i28 => i28_0, i29 => i29_0, i3 => i3_0, i30 => i30_0, i31 => i31_0, i32 => i32_0, i33 => i33_0, i34 => i34_0, i35 => i35_0, i36 => i36_0, i37 => i37_0, i38 => i38_0, i39 => i39_0, i4 => i4_0, i40 => i40_0, i41 => i41_0, i42 => i42_0, i43 => i43_0, i44 => i44_0, i45 => i45_0, i47 => i47_0, i48 => i48_0, i5 => i5_0, i6 => i6_0, i7 => i7_0, i8 => i8_0, i9 => i9_0);

  -- PROM1 (upper 512 entries)
  prom1_inst: cadr_prom1 port map (\-promce1\ => promce1, \-prompc0\ => prompc0, \-prompc1\ => prompc1, \-prompc2\ => prompc2, \-prompc3\ => prompc3, \-prompc4\ => prompc4, \-prompc5\ => prompc5, \-prompc6\ => prompc6, \-prompc7\ => prompc7, \-prompc8\ => prompc8, i0 => i0_1, i1 => i1_1, i10 => i10_1, i11 => i11_1, i12 => i12_1, i13 => i13_1, i14 => i14_1, i15 => i15_1, i16 => i16_1, i17 => i17_1, i18 => i18_1, i19 => i19_1, i2 => i2_1, i20 => i20_1, i21 => i21_1, i22 => i22_1, i23 => i23_1, i24 => i24_1, i25 => i25_1, i26 => i26_1, i27 => i27_1, i28 => i28_1, i29 => i29_1, i3 => i3_1, i30 => i30_1, i31 => i31_1, i32 => i32_1, i33 => i33_1, i34 => i34_1, i35 => i35_1, i36 => i36_1, i37 => i37_1, i38 => i38_1, i39 => i39_1, i4 => i4_1, i40 => i40_1, i41 => i41_1, i42 => i42_1, i43 => i43_1, i44 => i44_1, i45 => i45_1, i47 => i47_1, i48 => i48_1, i5 => i5_1, i6 => i6_1, i7 => i7_1, i8 => i8_1, i9 => i9_1);

  -- Multiplex PROM outputs to instruction bus
  -- PROM selection is based on PC bit 9 (promce0/promce1)
  I(0) <= i0_0 when promce0 = '0' else i0_1;
  I(1) <= i1_0 when promce0 = '0' else i1_1;
  I(2) <= i2_0 when promce0 = '0' else i2_1;
  I(3) <= i3_0 when promce0 = '0' else i3_1;
  I(4) <= i4_0 when promce0 = '0' else i4_1;
  I(5) <= i5_0 when promce0 = '0' else i5_1;
  I(6) <= i6_0 when promce0 = '0' else i6_1;
  I(7) <= i7_0 when promce0 = '0' else i7_1;
  I(8) <= i8_0 when promce0 = '0' else i8_1;
  I(9) <= i9_0 when promce0 = '0' else i9_1;
  I(10) <= i10_0 when promce0 = '0' else i10_1;
  I(11) <= i11_0 when promce0 = '0' else i11_1;
  I(12) <= i12_0 when promce0 = '0' else i12_1;
  I(13) <= i13_0 when promce0 = '0' else i13_1;
  I(14) <= i14_0 when promce0 = '0' else i14_1;
  I(15) <= i15_0 when promce0 = '0' else i15_1;
  I(16) <= i16_0 when promce0 = '0' else i16_1;
  I(17) <= i17_0 when promce0 = '0' else i17_1;
  I(18) <= i18_0 when promce0 = '0' else i18_1;
  I(19) <= i19_0 when promce0 = '0' else i19_1;
  I(20) <= i20_0 when promce0 = '0' else i20_1;
  I(21) <= i21_0 when promce0 = '0' else i21_1;
  I(22) <= i22_0 when promce0 = '0' else i22_1;
  I(23) <= i23_0 when promce0 = '0' else i23_1;
  I(24) <= i24_0 when promce0 = '0' else i24_1;
  I(25) <= i25_0 when promce0 = '0' else i25_1;
  I(26) <= i26_0 when promce0 = '0' else i26_1;
  I(27) <= i27_0 when promce0 = '0' else i27_1;
  I(28) <= i28_0 when promce0 = '0' else i28_1;
  I(29) <= i29_0 when promce0 = '0' else i29_1;
  I(30) <= i30_0 when promce0 = '0' else i30_1;
  I(31) <= i31_0 when promce0 = '0' else i31_1;
  I(32) <= i32_0 when promce0 = '0' else i32_1;
  I(33) <= i33_0 when promce0 = '0' else i33_1;
  I(34) <= i34_0 when promce0 = '0' else i34_1;
  I(35) <= i35_0 when promce0 = '0' else i35_1;
  I(36) <= i36_0 when promce0 = '0' else i36_1;
  I(37) <= i37_0 when promce0 = '0' else i37_1;
  I(38) <= i38_0 when promce0 = '0' else i38_1;
  I(39) <= i39_0 when promce0 = '0' else i39_1;
  I(40) <= i40_0 when promce0 = '0' else i40_1;
  I(41) <= i41_0 when promce0 = '0' else i41_1;
  I(42) <= i42_0 when promce0 = '0' else i42_1;
  I(43) <= i43_0 when promce0 = '0' else i43_1;
  I(44) <= i44_0 when promce0 = '0' else i44_1;
  I(45) <= i45_0 when promce0 = '0' else i45_1;
  I(46) <= i46;  -- From PCTL
  I(47) <= i47_0 when promce0 = '0' else i47_1;
  I(48) <= i48_0 when promce0 = '0' else i48_1;

end architecture; 