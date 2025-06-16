library ieee;
use ieee.std_logic_1164.all;
use work.cadr_book.all;

entity spy_set is
  port (
    \-dbread\ : in std_logic;
    \-dbwrite\ : in std_logic;
    EADR : in std_logic_vector(3 downto 0);
    IR : in std_logic_vector(47 downto 0);
    OB : in std_logic_vector(31 downto 0);
    \-spy.irh\ : in std_logic;
    \-spy.irl\ : in std_logic;
    \-spy.irm\ : in std_logic;
    \-spy.obh\ : in std_logic;
    A : in std_logic_vector(31 downto 16);
    AA : in std_logic_vector(15 downto 0);
    M : in std_logic_vector(31 downto 0);
    destspcd : in std_logic;
    imodd : in std_logic;
    ir48 : in std_logic;
    iwrited : in std_logic;
    jcond : in std_logic;
    nop : in std_logic;
    pcs0 : in std_logic;
    pcs1 : in std_logic;
    pdlwrited : in std_logic;
    spushd : in std_logic;
    \-spy.ah\ : in std_logic;
    \-spy.flag2\ : in std_logic;
    \-spy.mh\ : in std_logic;
    \-spy.ml\ : in std_logic;
    \-vmaok\ : in std_logic;
    wmapd : in std_logic;
    \-ape\ : in std_logic;
    \-dpe\ : in std_logic;
    err : in std_logic;
    \-higherr\ : in std_logic;
    \-ipe\ : in std_logic;
    \-mempe\ : in std_logic;
    \-mpe\ : in std_logic;
    OPC : in std_logic_vector(13 downto 0);
    PC : in std_logic_vector(13 downto 0);
    \-pdlpe\ : in std_logic;
    promdisable : in std_logic;
    \-spe\ : in std_logic;
    \-spy.opc\ : in std_logic;
    \-spy.pc\ : in std_logic;
    srun : in std_logic;
    ssdone : in std_logic;
    \-stathalt\ : in std_logic;
    \-v0pe\ : in std_logic;
    \-v1pe\ : in std_logic;
    \-wait\ : in std_logic;
    SPY : out std_logic_vector(15 downto 0);
    \-ldclk\ : out std_logic;
    \-lddbirh\ : out std_logic;
    \-lddbirl\ : out std_logic;
    \-lddbirm\ : out std_logic;
    \-ldmode\ : out std_logic;
    \-ldopc\ : out std_logic;
    \-spy.sth\ : out std_logic;
    \-spy.stl\ : out std_logic
  );
end entity;

architecture rtl of spy_set is
  signal spy0_out, spy1_out, spy2_out, spy4_out : std_logic_vector(15 downto 0);

begin
  
  -- SPY0 - PDP11 examine control
  spy0_inst: cadr_spy0 port map (\-dbread\ => \-dbread\, \-dbwrite\ => \-dbwrite\, eadr0 => EADR(0), eadr1 => EADR(1), eadr2 => EADR(2), eadr3 => EADR(3), \-ldclk\ => \-ldclk\, \-lddbirh\ => \-lddbirh\, \-lddbirl\ => \-lddbirl\, \-lddbirm\ => \-lddbirm\, \-ldmode\ => \-ldmode\, \-ldopc\ => \-ldopc\, \-spy.ah\ => \-spy.ah\, \-spy.al\ => \-spy.al\, \-spy.flag1\ => \-spy.flag1\, \-spy.flag2\ => \-spy.flag2\, \-spy.irh\ => \-spy.irh\, \-spy.irl\ => \-spy.irl\, \-spy.irm\ => \-spy.irm\, \-spy.mh\ => \-spy.mh\, \-spy.ml\ => \-spy.ml\, \-spy.obh\ => \-spy.obh\, \-spy.obl\ => \-spy.obl\, \-spy.opc\ => \-spy.opc\, \-spy.pc\ => \-spy.pc\, \-spy.sth\ => \-spy.sth\, \-spy.stl\ => \-spy.stl\);

  -- SPY1 - Instruction and OB register spy
  spy1_inst: cadr_spy1 port map (ir0 => IR(0), ir1 => IR(1), ir10 => IR(10), ir11 => IR(11), ir12 => IR(12), ir13 => IR(13), ir14 => IR(14), ir15 => IR(15), ir16 => IR(16), ir17 => IR(17), ir18 => IR(18), ir19 => IR(19), ir2 => IR(2), ir20 => IR(20), ir21 => IR(21), ir22 => IR(22), ir23 => IR(23), ir24 => IR(24), ir25 => IR(25), ir26 => IR(26), ir27 => IR(27), ir28 => IR(28), ir29 => IR(29), ir3 => IR(3), ir30 => IR(30), ir31 => IR(31), ir32 => IR(32), ir33 => IR(33), ir34 => IR(34), ir35 => IR(35), ir36 => IR(36), ir37 => IR(37), ir38 => IR(38), ir39 => IR(39), ir4 => IR(4), ir40 => IR(40), ir41 => IR(41), ir42 => IR(42), ir43 => IR(43), ir44 => IR(44), ir45 => IR(45), ir46 => IR(46), ir47 => IR(47), ir5 => IR(5), ir6 => IR(6), ir7 => IR(7), ir8 => IR(8), ir9 => IR(9), ob0 => OB(0), ob1 => OB(1), ob10 => OB(10), ob11 => OB(11), ob12 => OB(12), ob13 => OB(13), ob14 => OB(14), ob15 => OB(15), ob16 => OB(16), ob17 => OB(17), ob18 => OB(18), ob19 => OB(19), ob2 => OB(2), ob20 => OB(20), ob21 => OB(21), ob22 => OB(22), ob23 => OB(23), ob24 => OB(24), ob25 => OB(25), ob26 => OB(26), ob27 => OB(27), ob28 => OB(28), ob29 => OB(29), ob3 => OB(3), ob30 => OB(30), ob31 => OB(31), ob4 => OB(4), ob5 => OB(5), ob6 => OB(6), ob7 => OB(7), ob8 => OB(8), ob9 => OB(9), \-spy.irh\ => \-spy.irh\, \-spy.irl\ => \-spy.irl\, \-spy.irm\ => \-spy.irm\, \-spy.obh\ => \-spy.obh\, \-spy.obl\ => \-spy.obl\, spy0 => spy1_out(0), spy1 => spy1_out(1), spy10 => spy1_out(10), spy11 => spy1_out(11), spy12 => spy1_out(12), spy13 => spy1_out(13), spy14 => spy1_out(14), spy15 => spy1_out(15), spy2 => spy1_out(2), spy3 => spy1_out(3), spy4 => spy1_out(4), spy5 => spy1_out(5), spy6 => spy1_out(6), spy7 => spy1_out(7), spy8 => spy1_out(8), spy9 => spy1_out(9));

  -- SPY2 - Address and M register spy
  spy2_inst: cadr_spy2 port map (a16 => A(16), a17 => A(17), a18 => A(18), a19 => A(19), a20 => A(20), a21 => A(21), a22 => A(22), a23 => A(23), a24 => A(24), a25 => A(25), a26 => A(26), a27 => A(27), a28 => A(28), a29 => A(29), a30 => A(30), a31a => A(31), aa0 => AA(0), aa1 => AA(1), aa10 => AA(10), aa11 => AA(11), aa12 => AA(12), aa13 => AA(13), aa14 => AA(14), aa15 => AA(15), aa2 => AA(2), aa3 => AA(3), aa4 => AA(4), aa5 => AA(5), aa6 => AA(6), aa7 => AA(7), aa8 => AA(8), aa9 => AA(9), destspcd => destspcd, imodd => imodd, ir48 => ir48, iwrited => iwrited, jcond => jcond, m0 => M(0), m1 => M(1), m10 => M(10), m11 => M(11), m12 => M(12), m13 => M(13), m14 => M(14), m15 => M(15), m16 => M(16), m17 => M(17), m18 => M(18), m19 => M(19), m2 => M(2), m20 => M(20), m21 => M(21), m22 => M(22), m23 => M(23), m24 => M(24), m25 => M(25), m26 => M(26), m27 => M(27), m28 => M(28), m29 => M(29), m3 => M(3), m30 => M(30), m31 => M(31), m4 => M(4), m5 => M(5), m6 => M(6), m7 => M(7), m8 => M(8), m9 => M(9), nop => nop, pcs0 => pcs0, pcs1 => pcs1, pdlwrited => pdlwrited, spushd => spushd, \-spy.ah\ => \-spy.ah\, \-spy.flag2\ => \-spy.flag2\, \-spy.mh\ => \-spy.mh\, \-spy.ml\ => \-spy.ml\, \-vmaok\ => \-vmaok\, wmapd => wmapd, \-spy.al\ => \-spy.al\, spy0 => spy2_out(0), spy1 => spy2_out(1), spy10 => spy2_out(10), spy11 => spy2_out(11), spy12 => spy2_out(12), spy13 => spy2_out(13), spy14 => spy2_out(14), spy15 => spy2_out(15), spy2 => spy2_out(2), spy3 => spy2_out(3), spy4 => spy2_out(4), spy5 => spy2_out(5), spy6 => spy2_out(6), spy7 => spy2_out(7), spy8 => spy2_out(8), spy9 => spy2_out(9));

  -- SPY4 - PC, OPC and flag spy
  spy4_inst: cadr_spy4 port map (\-ape\ => \-ape\, \-dpe\ => \-dpe\, err => err, \-higherr\ => \-higherr\, \-ipe\ => \-ipe\, \-mempe\ => \-mempe\, \-mpe\ => \-mpe\, opc0 => OPC(0), opc1 => OPC(1), opc10 => OPC(10), opc11 => OPC(11), opc12 => OPC(12), opc13 => OPC(13), opc2 => OPC(2), opc3 => OPC(3), opc4 => OPC(4), opc5 => OPC(5), opc6 => OPC(6), opc7 => OPC(7), opc8 => OPC(8), opc9 => OPC(9), pc0 => PC(0), pc1 => PC(1), pc10 => PC(10), pc11 => PC(11), pc12 => PC(12), pc13 => PC(13), pc2 => PC(2), pc3 => PC(3), pc4 => PC(4), pc5 => PC(5), pc6 => PC(6), pc7 => PC(7), pc8 => PC(8), pc9 => PC(9), \-pdlpe\ => \-pdlpe\, promdisable => promdisable, \-spe\ => \-spe\, \-spy.opc\ => \-spy.opc\, \-spy.pc\ => \-spy.pc\, srun => srun, ssdone => ssdone, \-stathalt\ => \-stathalt\, \-v0pe\ => \-v0pe\, \-v1pe\ => \-v1pe\, \-wait\ => \-wait\, \-spy.flag1\ => \-spy.flag1\, spy0 => spy4_out(0), spy1 => spy4_out(1), spy10 => spy4_out(10), spy11 => spy4_out(11), spy12 => spy4_out(12), spy13 => spy4_out(13), spy14 => spy4_out(14), spy15 => spy4_out(15), spy2 => spy4_out(2), spy3 => spy4_out(3), spy4 => spy4_out(4), spy5 => spy4_out(5), spy6 => spy4_out(6), spy7 => spy4_out(7), spy8 => spy4_out(8), spy9 => spy4_out(9));

  -- Combine spy outputs into single bus
  -- The actual spy bus output would be selected by external control logic
  SPY <= spy1_out or spy2_out or spy4_out;

end architecture; 