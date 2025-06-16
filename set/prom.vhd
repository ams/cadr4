library ieee;
use ieee.std_logic_1164.all;
use work.icmem_book.all;

entity prom is
  port (
    -- Inputs to pctl (external interface only)
    hi2             : in  std_logic;
    PC              : in  std_logic_vector(13 downto 0);  -- pc0 to pc13
    \-idebug\       : in  std_logic;
    \-promdisabled\ : in  std_logic;
    \-iwriteda\     : in  std_logic;
    \-ape\          : in  std_logic;
    \-pdlpe\        : in  std_logic;
    \-spe\          : in  std_logic;
    \-mpe\          : in  std_logic;
    \-mempe\        : in  std_logic;
    \-v1pe\         : in  std_logic;
    \-v0pe\         : in  std_logic;
    \-dpe\          : in  std_logic;
    \-ipe\          : in  std_logic;
    
    -- Outputs from pctl (external interface only)
    dpe             : out std_logic;
    ipe             : out std_logic;
    
    -- Combined outputs from prom0 and prom1
    I               : out std_logic_vector(48 downto 0)   -- i0 to i48
  );
end;

architecture structural of prom is
  -- Internal signals from pctl to proms (now hidden)
  signal \-prompc0\  : std_logic;
  signal \-prompc1\  : std_logic;
  signal \-prompc2\  : std_logic;
  signal \-prompc3\  : std_logic;
  signal \-prompc4\  : std_logic;
  signal \-prompc5\  : std_logic;
  signal \-prompc6\  : std_logic;
  signal \-prompc7\  : std_logic;
  signal \-prompc8\  : std_logic;
  signal \-promce0\  : std_logic;
  signal \-promce1\  : std_logic;
  
  -- Internal signals for pctl outputs that don't need to be exposed
  signal \-promenable\   : std_logic;
  signal \-prompc9\      : std_logic;
  signal \bottom.1k\     : std_logic;
  signal tilt1           : std_logic;
  signal tilt0           : std_logic;
  signal promenable      : std_logic;

begin
  
  -- Instantiate pctl
  pctl_inst : cadr_pctl
    port map (
      \-promenable\   => \-promenable\,
      i46             => I(46),
      hi2             => hi2,
      pc0             => PC(0),
      \-prompc0\      => \-prompc0\,
      pc1             => PC(1),
      \-prompc1\      => \-prompc1\,
      pc2             => PC(2),
      \-prompc2\      => \-prompc2\,
      \-prompc3\      => \-prompc3\,
      pc3             => PC(3),
      \-prompc4\      => \-prompc4\,
      pc4             => PC(4),
      pc9             => PC(9),
      \-promce0\      => \-promce0\,
      \-prompc9\      => \-prompc9\,
      \-promce1\      => \-promce1\,
      \bottom.1k\     => \bottom.1k\,
      \-idebug\       => \-idebug\,
      \-promdisabled\ => \-promdisabled\,
      \-iwriteda\     => \-iwriteda\,
      pc13            => PC(13),
      pc11            => PC(11),
      pc10            => PC(10),
      pc5             => PC(5),
      \-prompc5\      => \-prompc5\,
      pc6             => PC(6),
      \-prompc6\      => \-prompc6\,
      pc7             => PC(7),
      \-prompc7\      => \-prompc7\,
      \-prompc8\      => \-prompc8\,
      pc8             => PC(8),
      \-ape\          => \-ape\,
      \-pdlpe\        => \-pdlpe\,
      \-spe\          => \-spe\,
      \-mpe\          => \-mpe\,
      tilt1           => tilt1,
      tilt0           => tilt0,
      \-mempe\        => \-mempe\,
      \-v1pe\         => \-v1pe\,
      \-v0pe\         => \-v0pe\,
      promenable      => promenable,
      dpe             => dpe,
      \-dpe\          => \-dpe\,
      ipe             => ipe,
      \-ipe\          => \-ipe\,
      pc12            => PC(12)
    );
  
  -- Instantiate prom0 - connects directly to I bus
  -- When -promce0 is active, prom0 drives the bus
  -- When -promce0 is inactive, prom0 outputs are high-Z
  prom0_inst : cadr_prom0
    port map (
      \-prompc0\  => \-prompc0\,
      \-prompc1\  => \-prompc1\,
      \-prompc2\  => \-prompc2\,
      \-prompc3\  => \-prompc3\,
      \-prompc4\  => \-prompc4\,
      i32         => I(32),
      i33         => I(33),
      i34         => I(34),
      i35         => I(35),
      i36         => I(36),
      i37         => I(37),
      i38         => I(38),
      i39         => I(39),
      \-promce0\  => \-promce0\,
      \-prompc5\  => \-prompc5\,
      \-prompc6\  => \-prompc6\,
      \-prompc7\  => \-prompc7\,
      \-prompc8\  => \-prompc8\,
      i40         => I(40),
      i41         => I(41),
      i42         => I(42),
      i43         => I(43),
      i44         => I(44),
      i45         => I(45),
      i47         => I(47),
      i48         => I(48),
      i24         => I(24),
      i25         => I(25),
      i26         => I(26),
      i27         => I(27),
      i28         => I(28),
      i29         => I(29),
      i30         => I(30),
      i31         => I(31),
      i16         => I(16),
      i17         => I(17),
      i18         => I(18),
      i19         => I(19),
      i20         => I(20),
      i21         => I(21),
      i22         => I(22),
      i23         => I(23),
      i0          => I(0),
      i1          => I(1),
      i2          => I(2),
      i3          => I(3),
      i4          => I(4),
      i5          => I(5),
      i6          => I(6),
      i7          => I(7),
      i8          => I(8),
      i9          => I(9),
      i10         => I(10),
      i11         => I(11),
      i12         => I(12),
      i13         => I(13),
      i14         => I(14),
      i15         => I(15)
    );
  
  -- Instantiate prom1 - also connects directly to I bus
  -- When -promce1 is active, prom1 drives the bus
  -- When -promce1 is inactive, prom1 outputs are high-Z
  prom1_inst : cadr_prom1
    port map (
      \-prompc0\  => \-prompc0\,
      \-prompc1\  => \-prompc1\,
      \-prompc2\  => \-prompc2\,
      \-prompc3\  => \-prompc3\,
      \-prompc4\  => \-prompc4\,
      i24         => I(24),
      i25         => I(25),
      i26         => I(26),
      i27         => I(27),
      i28         => I(28),
      i29         => I(29),
      i30         => I(30),
      i31         => I(31),
      \-promce1\  => \-promce1\,
      \-prompc5\  => \-prompc5\,
      \-prompc6\  => \-prompc6\,
      \-prompc7\  => \-prompc7\,
      \-prompc8\  => \-prompc8\,
      i32         => I(32),
      i33         => I(33),
      i34         => I(34),
      i35         => I(35),
      i36         => I(36),
      i37         => I(37),
      i38         => I(38),
      i39         => I(39),
      i40         => I(40),
      i41         => I(41),
      i42         => I(42),
      i43         => I(43),
      i44         => I(44),
      i45         => I(45),
      i47         => I(47),
      i48         => I(48),
      i16         => I(16),
      i17         => I(17),
      i18         => I(18),
      i19         => I(19),
      i20         => I(20),
      i21         => I(21),
      i22         => I(22),
      i23         => I(23),
      i0          => I(0),
      i1          => I(1),
      i2          => I(2),
      i3          => I(3),
      i4          => I(4),
      i5          => I(5),
      i6          => I(6),
      i7          => I(7),
      i8          => I(8),
      i9          => I(9),
      i10         => I(10),
      i11         => I(11),
      i12         => I(12),
      i13         => I(13),
      i14         => I(14),
      i15         => I(15)
    );

end; 