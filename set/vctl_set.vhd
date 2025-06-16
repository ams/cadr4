library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity vctl_set is
  port (
    clk2a : in std_logic;
    clk2c : in std_logic;
    mclk1a : in std_logic;
    \-clk3g\ : in std_logic;
    IR : in std_logic_vector(25 downto 19);
    VMA : in std_logic_vector(26 downto 25);
    \-reset\ : in std_logic;
    wmap : in std_logic;
    \-memwr\ : in std_logic;
    \-memprepare\ : in std_logic;
    \-lvmo22\ : in std_logic;
    \-pfr\ : in std_logic;
    \-lvmo23\ : in std_logic;
    memrq : in std_logic;
    \-memack\ : in std_logic;
    \-memrd\ : in std_logic;
    \-ifetch\ : in std_logic;
    destmem : in std_logic;
    \-memgrant\ : in std_logic;
    \use.md\ : in std_logic;
    needfetch : in std_logic;
    lcinc : in std_logic;
    \-destmdr\ : in std_logic;
    \-destmem\ : in std_logic;
    \-destvma\ : in std_logic;
    \lm drive enb\ : in std_logic;
    wp1a : in std_logic;
    wp1b : in std_logic;
    wrcyc : in std_logic;
    \-srcmd\ : in std_logic;
    \-nopa\ : in std_logic;
    wmapd : out std_logic;
    \-pfw\ : out std_logic;
    \-vmaok\ : out std_logic;
    \-memstart\ : out std_logic;
    \-wait\ : out std_logic;
    \-hang\ : out std_logic;
    mdsela : out std_logic;
    mdselb : out std_logic;
    \-memdrive.a\ : out std_logic;
    \-memdrive.b\ : out std_logic;
    \-vm0wpa\ : out std_logic;
    \-vm0wpb\ : out std_logic;
    \-vm1wpa\ : out std_logic;
    \-vm1wpb\ : out std_logic;
    \-vmaenb\ : out std_logic;
    vmasela : out std_logic;
    vmaselb : out std_logic
  );
end vctl_set;

architecture rtl of vctl_set is
  -- Internal signals
  signal destmem : std_logic;
  signal memprepare : std_logic;
  signal memrq : std_logic;
  signal wmap : std_logic;
  signal wmapd : std_logic;

begin

  -- cadr_vctl1 instance
  u_vctl1: cadr_vctl1 port map (
    \-reset\ => \-reset\, clk2a => clk2a, clk2c => clk2c, mclk1a => mclk1a, \-clk3g\ => \-clk3g\,
    wmap => int_wmap, \-memwr\ => \-memwr\, \-memprepare\ => \-memprepare\, \-lvmo22\ => \-lvmo22\,
    \-pfr\ => \-pfr\, memrq => int_memrq, \-memack\ => \-memack\, \-memrd\ => \-memrd\,
    \-ifetch\ => \-ifetch\, destmem => int_destmem, \-memgrant\ => \-memgrant\, \use.md\ => \use.md\,
    needfetch => needfetch, lcinc => lcinc,
    rdcyc => rdcyc, wrcyc => wrcyc_out, \-wmapd\ => \-wmapd\, wmapd => wmapd,
    memprepare => int_memprepare, \-pfw\ => \-pfw\, \-vmaok\ => \-vmaok\, \-mfinishd\ => \-mfinishd\,
    memrq => int_memrq, mbusy => mbusy, \rd.in.progress\ => \rd.in.progress\,
    \set.rd.in.progress\ => \set.rd.in.progress\, \-rdfinish\ => \-rdfinish\, \-mfinish\ => \-mfinish\,
    \-memop\ => \-memop\, memstart => memstart, \-memstart\ => \-memstart\,
    \-mbusy.sync\ => \-mbusy.sync\, \mbusy.sync\ => \mbusy.sync\, \-wait\ => \-wait\, \-hang\ => \-hang\
  );

  -- cadr_vctl2 instance
  u_vctl2: cadr_vctl2 port map (
    clk2c => clk2c, \-destmdr\ => \-destmdr\, \-destmem\ => \-destmem\, \-destvma\ => \-destvma\,
    \-ifetch\ => \-ifetch\, ir19 => IR(19), ir20 => IR(20), \lm drive enb\ => \lm drive enb\,
    \-lvmo23\ => \-lvmo23\, memprepare => int_memprepare, memrq => int_memrq, \-nopa\ => \-nopa\,
    \-srcmd\ => \-srcmd\, \-vma25\ => VMA(25), \-vma26\ => VMA(26), wp1a => wp1a, wp1b => wp1b, wrcyc => wrcyc,
    destmem => int_destmem, mapwr0d => mapwr0d, mapwr1d => mapwr1d, mdsela => mdsela, mdselb => mdselb,
    \-memdrive.a\ => \-memdrive.a\, \-memdrive.b\ => \-memdrive.b\, \-memprepare\ => \-memprepare_out\,
    \-memrd\ => \-memrd_out\, \-memrq\ => \-memrq_out\, \-memwr\ => \-memwr_out\, nopa => nopa,
    \-pfr\ => \-pfr_out\, \use.md\ => \use.md_out\, \-vm0wpa\ => \-vm0wpa\, \-vm0wpb\ => \-vm0wpb\,
    \-vm1wpa\ => \-vm1wpa\, \-vm1wpb\ => \-vm1wpb\, \-vmaenb\ => \-vmaenb\, vmasela => vmasela,
    vmaselb => vmaselb, \-wmap\ => \-wmap\, wmap => int_wmap, \-wmapd\ => \-wmapd_out\
  );

  -- Connect outputs
  memprepare <= int_memprepare;
  memrq_out <= int_memrq;
  wmap_out <= int_wmap;
  wmapd <= int_wmapd;

end rtl; 