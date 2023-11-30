library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_prom1 is
  port (
    \-prompc0\ : in  std_logic;
    \-prompc1\ : in  std_logic;
    \-prompc2\ : in  std_logic;
    \-prompc3\ : in  std_logic;
    \-prompc4\ : in  std_logic;
    i24        : out std_logic;
    i25        : out std_logic;
    i26        : out std_logic;
    i27        : out std_logic;
    i28        : out std_logic;
    i29        : out std_logic;
    i30        : out std_logic;
    i31        : out std_logic;
    \-promce1\ : in  std_logic;
    \-prompc5\ : in  std_logic;
    \-prompc6\ : in  std_logic;
    \-prompc7\ : in  std_logic;
    \-prompc8\ : in  std_logic;
    i32        : out std_logic;
    i33        : out std_logic;
    i34        : out std_logic;
    i35        : out std_logic;
    i36        : out std_logic;
    i37        : out std_logic;
    i38        : out std_logic;
    i39        : out std_logic;
    i40        : out std_logic;
    i41        : out std_logic;
    i42        : out std_logic;
    i43        : out std_logic;
    i44        : out std_logic;
    i45        : out std_logic;
    i47        : out std_logic;
    i48        : out std_logic;
    i16        : out std_logic;
    i17        : out std_logic;
    i18        : out std_logic;
    i19        : out std_logic;
    i20        : out std_logic;
    i21        : out std_logic;
    i22        : out std_logic;
    i23        : out std_logic;
    i0         : out std_logic;
    i1         : out std_logic;
    i2         : out std_logic;
    i3         : out std_logic;
    i4         : out std_logic;
    i5         : out std_logic;
    i6         : out std_logic;
    i7         : out std_logic;
    i8         : out std_logic;
    i9         : out std_logic;
    i10        : out std_logic;
    i11        : out std_logic;
    i12        : out std_logic;
    i13        : out std_logic;
    i14        : out std_logic;
    i15        : out std_logic);
end;

architecture ttl of cadr4_prom1 is
begin
  prom1_1b16 : dm74s472 generic map (fn => "rom/prom1_1b16.hex") port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i24, d1 => i25, d2 => i26, d3 => i27, d4 => i28, d5 => i29, d6 => i30, d7 => i31, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\, a8 => \-prompc8\);
  prom1_1b18 : dm74s472 generic map (fn => "rom/prom1_1b18.hex") port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i32, d1 => i33, d2 => i34, d3 => i35, d4 => i36, d5 => i37, d6 => i38, d7 => i39, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\, a8 => \-prompc8\);
  prom1_1b20 : dm74s472 generic map (fn => "rom/prom1_1b20.hex") port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i40, d1 => i41, d2 => i42, d3 => i43, d4 => i44, d5 => i45, d6 => i47, d7 => i48, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\, a8 => \-prompc8\);
  prom1_1d17 : dm74s472 generic map (fn => "rom/prom1_1d17.hex") port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i16, d1 => i17, d2 => i18, d3 => i19, d4 => i20, d5 => i21, d6 => i22, d7 => i23, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\, a8 => \-prompc8\);
  prom1_1e18 : dm74s472 generic map (fn => "rom/prom1_1e18.hex") port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i0, d1 => i1, d2 => i2, d3 => i3, d4 => i4, d5 => i5, d6 => i6, d7 => i7, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\, a8 => \-prompc8\);
  prom1_1e20 : dm74s472 generic map (fn => "rom/prom1_1e20.hex") port map(a0 => \-prompc0\, a1 => \-prompc1\, a2 => \-prompc2\, a3 => \-prompc3\, a4 => \-prompc4\, d0 => i8, d1 => i9, d2 => i10, d3 => i11, d4 => i12, d5 => i13, d6 => i14, d7 => i15, ce_n => \-promce1\, a5 => \-prompc5\, a6 => \-prompc6\, a7 => \-prompc7\, a8 => \-prompc8\);
end architecture;
