library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_opcs is
  port (
    hi2       : in  std_logic;
    opc13     : out std_logic;
    gnd       : in  std_logic;
    pc13      : in  std_logic;
    opcinha   : out std_logic;
    opcclka   : out std_logic;
    pc12      : in  std_logic;
    opc12     : out std_logic;
    opc11     : out std_logic;
    pc11      : in  std_logic;
    pc10      : in  std_logic;
    opc10     : out std_logic;
    opc9      : out std_logic;
    pc9       : in  std_logic;
    opcclkc   : out std_logic;
    pc8       : in  std_logic;
    opc8      : out std_logic;
    opc7      : out std_logic;
    pc7       : in  std_logic;
    pc6       : in  std_logic;
    opc6      : out std_logic;
    \-opcinh\ : in  std_logic;
    opcinhb   : out std_logic;
    opc5      : out std_logic;
    pc5       : in  std_logic;
    opcclkb   : out std_logic;
    pc4       : in  std_logic;
    opc4      : out std_logic;
    opc3      : out std_logic;
    pc3       : in  std_logic;
    pc2       : in  std_logic;
    opc2      : out std_logic;
    opc1      : out std_logic;
    pc1       : in  std_logic;
    pc0       : in  std_logic;
    opc0      : out std_logic;
    \-clk5\   : in  std_logic;
    opcclk    : in  std_logic);
end;

architecture ttl of cadr4_opcs is
  signal nc47 : std_logic;
  signal nc48 : std_logic;
  signal nc49 : std_logic;
  signal nc50 : std_logic;
  signal nc51 : std_logic;
  signal nc52 : std_logic;
  signal nc53 : std_logic;
  signal nc54 : std_logic;
  signal nc55 : std_logic;
  signal nc56 : std_logic;
  signal nc57 : std_logic;
  signal nc58 : std_logic;
  signal nc59 : std_logic;
  signal nc60 : std_logic;
  signal nc61 : std_logic;
  signal nc62 : std_logic;
  signal nc63 : std_logic;
  signal nc64 : std_logic;
  signal nc65 : std_logic;
  signal nc66 : std_logic;
  signal nc67 : std_logic;
  signal nc68 : std_logic;
  signal nc69 : std_logic;
  signal nc70 : std_logic;
  signal nc71 : std_logic;
  signal nc72 : std_logic;
  signal nc73 : std_logic;
  signal nc74 : std_logic;
begin
  opcs_1f06 : dm9328 port map(clr_n  => hi2, aq_n => nc71, aq => opc13, asel => gnd, ai1 => nc72, ai0 => pc13, aclk => opcinha, comclk => opcclka, bclk => opcinha, bi0 => pc12, bi1 => nc73, bsel => gnd, bq => opc12, bq_n => nc74);
  opcs_1f07 : dm9328 port map(clr_n  => hi2, aq_n => nc67, aq => opc11, asel => gnd, ai1 => nc68, ai0 => pc11, aclk => opcinha, comclk => opcclka, bclk => opcinha, bi0 => pc10, bi1 => nc69, bsel => gnd, bq => opc10, bq_n => nc70);
  opcs_1f08 : dm9328 port map(clr_n  => hi2, aq_n => nc63, aq => opc9, asel => gnd, ai1 => nc64, ai0 => pc9, aclk => opcinha, comclk => opcclkc, bclk => opcinha, bi0 => pc8, bi1 => nc65, bsel => gnd, bq => opc8, bq_n => nc66);
  opcs_1f09 : dm9328 port map(clr_n  => hi2, aq_n => nc59, aq => opc7, asel => gnd, ai1 => nc60, ai0 => pc7, aclk => opcinha, comclk => opcclkc, bclk => opcinha, bi0 => pc6, bi1 => nc61, bsel => gnd, bq => opc6, bq_n => nc62);
  opcs_1f10 : sn74s04 port map(g1a   => \-opcinh\, g1q_n => opcinha, g2a => \-opcinh\, g2q_n => opcinhb, g3a => '0', g4a => '0', g5a => '0', g6a => '0');
  opcs_1f11 : dm9328 port map(clr_n  => hi2, aq_n => nc55, aq => opc5, asel => gnd, ai1 => nc56, ai0 => pc5, aclk => opcinhb, comclk => opcclkb, bclk => opcinhb, bi0 => pc4, bi1 => nc57, bsel => gnd, bq => opc4, bq_n => nc58);
  opcs_1f12 : dm9328 port map(clr_n  => hi2, aq_n => nc51, aq => opc3, asel => gnd, ai1 => nc52, ai0 => pc3, aclk => opcinhb, comclk => opcclkb, bclk => opcinhb, bi0 => pc2, bi1 => nc53, bsel => gnd, bq => opc2, bq_n => nc54);
  opcs_1f13 : dm9328 port map(clr_n  => hi2, aq_n => nc47, aq => opc1, asel => gnd, ai1 => nc48, ai0 => pc1, aclk => opcinhb, comclk => opcclkb, bclk => opcinhb, bi0 => pc0, bi1 => nc49, bsel => gnd, bq => opc0, bq_n => nc50);
  opcs_1f14 : sn74s02 port map(g1q_n => opcclka, g1a => \-clk5\, g1b => opcclk, g2q_n => opcclkb, g2a => \-clk5\, g2b => opcclk, g3b => opcclk, g3a => \-clk5\, g3q_n => opcclkc, g4b => '0', g4a => '0');
end architecture;
