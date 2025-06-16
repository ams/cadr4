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
  signal \-prompc0\, \-prompc1\, \-prompc2\, \-prompc3\, \-prompc4\ : std_logic;
  signal \-prompc5\, \-prompc6\, \-prompc7\, \-prompc8\, \-prompc9\ : std_logic;
  signal \-promce0\, \-promce1\ : std_logic;

begin
  
  -- PROM control
  pctl_inst: cadr_pctl port map (\-ape\ => \-ape\, \-dpe\ => \-dpe\, \-idebug\ => \-idebug\, \-ipe\ => \-ipe\, \-iwriteda\ => \-iwriteda\, \-mempe\ => \-mempe\, \-mpe\ => \-mpe\, pc0 => PC(0), pc1 => PC(1), pc10 => PC(10), pc11 => PC(11), pc12 => PC(12), pc13 => PC(13), pc2 => PC(2), pc3 => PC(3), pc4 => PC(4), pc5 => PC(5), pc6 => PC(6), pc7 => PC(7), pc8 => PC(8), pc9 => PC(9), \-pdlpe\ => \-pdlpe\, \-promdisabled\ => \-promdisabled\, \-spe\ => \-spe\, \-v0pe\ => \-v0pe\, \-v1pe\ => \-v1pe\, \bottom.1k\ => \bottom.1k\, dpe => dpe, i46 => i46, ipe => ipe, \-promce0\ => \-promce0\, \-promce1\ => \-promce1\, \-promenable\ => \-promenable\, promenable => promenable, \-prompc0\ => \-prompc0\, \-prompc1\ => \-prompc1\, \-prompc2\ => \-prompc2\, \-prompc3\ => \-prompc3\, \-prompc4\ => \-prompc4\, \-prompc5\ => \-prompc5\, \-prompc6\ => \-prompc6\, \-prompc7\ => \-prompc7\, \-prompc8\ => \-prompc8\, \-prompc9\ => \-prompc9\, tilt0 => tilt0, tilt1 => tilt1);

  -- PROM0 (lower 512 entries) - connected directly to I bus
  prom0_inst: cadr_prom0 port map (\-promce0\ => \-promce0\, \-prompc0\ => \-prompc0\, \-prompc1\ => \-prompc1\, \-prompc2\ => \-prompc2\, \-prompc3\ => \-prompc3\, \-prompc4\ => \-prompc4\, \-prompc5\ => \-prompc5\, \-prompc6\ => \-prompc6\, \-prompc7\ => \-prompc7\, \-prompc8\ => \-prompc8\, i0 => I(0), i1 => I(1), i10 => I(10), i11 => I(11), i12 => I(12), i13 => I(13), i14 => I(14), i15 => I(15), i16 => I(16), i17 => I(17), i18 => I(18), i19 => I(19), i2 => I(2), i20 => I(20), i21 => I(21), i22 => I(22), i23 => I(23), i24 => I(24), i25 => I(25), i26 => I(26), i27 => I(27), i28 => I(28), i29 => I(29), i3 => I(3), i30 => I(30), i31 => I(31), i32 => I(32), i33 => I(33), i34 => I(34), i35 => I(35), i36 => I(36), i37 => I(37), i38 => I(38), i39 => I(39), i4 => I(4), i40 => I(40), i41 => I(41), i42 => I(42), i43 => I(43), i44 => I(44), i45 => I(45), i47 => I(47), i48 => I(48), i5 => I(5), i6 => I(6), i7 => I(7), i8 => I(8), i9 => I(9));

  -- PROM1 (upper 512 entries) - connected directly to I bus
  prom1_inst: cadr_prom1 port map (\-promce1\ => \-promce1\, \-prompc0\ => \-prompc0\, \-prompc1\ => \-prompc1\, \-prompc2\ => \-prompc2\, \-prompc3\ => \-prompc3\, \-prompc4\ => \-prompc4\, \-prompc5\ => \-prompc5\, \-prompc6\ => \-prompc6\, \-prompc7\ => \-prompc7\, \-prompc8\ => \-prompc8\, i0 => I(0), i1 => I(1), i10 => I(10), i11 => I(11), i12 => I(12), i13 => I(13), i14 => I(14), i15 => I(15), i16 => I(16), i17 => I(17), i18 => I(18), i19 => I(19), i2 => I(2), i20 => I(20), i21 => I(21), i22 => I(22), i23 => I(23), i24 => I(24), i25 => I(25), i26 => I(26), i27 => I(27), i28 => I(28), i29 => I(29), i3 => I(3), i30 => I(30), i31 => I(31), i32 => I(32), i33 => I(33), i34 => I(34), i35 => I(35), i36 => I(36), i37 => I(37), i38 => I(38), i39 => I(39), i4 => I(4), i40 => I(40), i41 => I(41), i42 => I(42), i43 => I(43), i44 => I(44), i45 => I(45), i47 => I(47), i48 => I(48), i5 => I(5), i6 => I(6), i7 => I(7), i8 => I(8), i9 => I(9));

  -- I(46) comes directly from PCTL
  I(46) <= i46;

end architecture; 