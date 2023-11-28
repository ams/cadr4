-- The MIT CADR

library ieee;
use ieee.std_logic_1164.all;

use std.env.finish;

library ttl;
use ttl.sn74.all;
use ttl.other.all;
use ttl.unsorted.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_tb is
end;

architecture testbench of cadr4_tb is

  signal gnd : std_logic;
  signal vcc : std_logic;

  -- CLOCK1 (outbound) signals

  signal \-tpr0\ : std_logic;
  signal \-tpr5\ : std_logic;
  signal \-tpr10\ : std_logic;
  signal \-tpr15\ : std_logic;
  signal \-tpr20\ : std_logic;
  signal \-tpr20a\ : std_logic;
  signal \-tpr25\ : std_logic;
  signal \-tpr40\ : std_logic;
  signal \-tpr60\ : std_logic;
  signal \-tpr65\ : std_logic;
  signal \-tpr70\ : std_logic;
  signal \-tpr75\ : std_logic;
  signal \-tpr80\ : std_logic;
  signal \-tpr80a\ : std_logic;
  signal \-tpr85\ : std_logic;
  signal \-tpr100\ : std_logic;
  signal \-tpr105\ : std_logic;
  signal \-tpr110\ : std_logic;
  signal \-tpr115\ : std_logic;
  signal \-tpr120\ : std_logic;
  signal \-tpr120a\ : std_logic;
  signal \-tpr125\ : std_logic;
  signal \-tpr140\ : std_logic;
  signal \-tpr160\ : std_logic;
  signal \-tpr180\ : std_logic;
  signal \-tpr200\ : std_logic;

  signal tprend, \-tprend\ : std_logic;

  signal \-tpw10\ : std_logic;
  signal \-tpw20\ : std_logic;
  signal \-tpw25\ : std_logic;
  signal \-tpw30\ : std_logic;
  signal \-tpw30a\ : std_logic;
  signal \-tpw35\ : std_logic;
  signal \-tpw40\ : std_logic;
  signal \-tpw40a\ : std_logic;
  signal \-tpw45\ : std_logic;
  signal \-tpw50\ : std_logic;
  signal \-tpw60\ : std_logic;
  signal \-tpw55\ : std_logic;
  signal \-tpw65\ : std_logic;
  signal \-tpw70\ : std_logic;
  signal \-tpw75\ : std_logic;

  alias \-tpdone\ is \-tpw60\;

  -- CLOCK2 (outbound) signals

  signal tpclk, \-tpclk\ : std_logic;

  signal \-clk0\, clk1, clk2, clk3, clk4, clk5 : std_logic;

  signal mclk5 : std_logic;
  signal mclk7 : std_logic;
  signal mclk1 : std_logic;
  signal \-mclk0\ : std_logic;

  signal \-wp1\, \-wp2\, \-wp3\, \-wp4\, \-wp5\ : std_logic;

  signal \-tse1\, \-tse2\, \-tse3\, \-tse4\ : std_logic;

  signal tptse, \-tptse\ : std_logic;

  signal tpwpiram : std_logic;
  signal tpwp : std_logic;

  --------------------------------------------------------------------------------

  signal \-a31\ : std_logic;
  signal \-aadr0a\, \-aadr1a\, \-aadr2a\, \-aadr3a\, \-aadr4a\, \-aadr5a\, \-aadr6a\, \-aadr7a\, \-aadr8a\, \-aadr9a\ : std_logic;
  signal \-aadr0b\, \-aadr1b\, \-aadr2b\, \-aadr3b\, \-aadr4b\, \-aadr5b\, \-aadr6b\, \-aadr7b\, \-aadr8b\, \-aadr9b\ : std_logic;
  signal \-adrpar\ : std_logic;
  signal \-alu31\, \-alu32\ : std_logic;
  signal \-aluf0\, \-aluf1\, \-aluf2\, \-aluf3\ : std_logic;
  signal \-alumode\ : std_logic;
  signal \-amemenb\ : std_logic;
  signal \-apass\ : std_logic;
  signal \-apassenb\ : std_logic;
  signal \-ape\ : std_logic;
  signal \-awpa\ : std_logic;
  signal \-awpb\ : std_logic;
  signal \-awpc\ : std_logic;
  signal \-boot1\ : std_logic;
  signal \-boot2\ : std_logic;
  signal \-boot\ : std_logic;
  signal \-bus.reset\ : std_logic;
  signal \-busint.lm.reset\ : std_logic;
  signal \-cin0\, \-cin4\, \-cin8\, \-cin12\, \-cin16\, \-cin20\, \-cin24\, \-cin28\, \-cin32\ : std_logic;
  signal \-clk1\ : std_logic;
  signal \-clk2a\ : std_logic;
  signal \-clk2c\ : std_logic;
  signal \-clk3a\ : std_logic;
  signal \-clk3d\ : std_logic;
  signal \-clk3g\ : std_logic;
  signal \-clk4a\ : std_logic;
  signal \-clk4d\ : std_logic;
  signal \-clk4e\ : std_logic;
  signal \-clk5\ : std_logic;
  signal \-clock_reset_a\ : std_logic;
  signal \-clock_reset_b\ : std_logic;
  signal \-dadr0a\, \-dadr2a\, \-dadr3a\, \-dadr4a\, \-dadr5a\, \-dadr6a\, \-dadr7a\, \-dadr8a\, \-dadr9a\, \-dadr10a\ : std_logic;
  signal \-dadr0b\, \-dadr1a\, \-dadr1b\, \-dadr2b\, \-dadr3b\, \-dadr4b\, \-dadr5b\, \-dadr6b\, \-dadr7b\, \-dadr8b\, \-dadr9b\ : std_logic;
  signal \-dadr0c\, \-dadr1c\, \-dadr2c\, \-dadr3c\, \-dadr4c\, \-dadr5c\, \-dadr6c\, \-dadr7c\, \-dadr8c\, \-dadr9c\, \-dadr10c\ : std_logic;
  signal \-dbread\ : std_logic;
  signal \-dbwrite\ : std_logic;
  signal \-destimod0\ : std_logic;
  signal \-destimod1\ : std_logic;
  signal \-destintctl\ : std_logic;
  signal \-destlc\ : std_logic;
  signal \-destmdr\ : std_logic;
  signal \-destmem\ : std_logic;
  signal \-destpdl(p)\ : std_logic;
  signal \-destpdl(x)\ : std_logic;
  signal \-destpdlp\ : std_logic;
  signal \-destpdltop\ : std_logic;
  signal \-destpdlx\ : std_logic;
  signal \-destspc\ : std_logic;
  signal \-destspcd\ : std_logic;
  signal \-destvma\ : std_logic;
  signal \-dfall\ : std_logic;
  signal \-div\ : std_logic;
  signal \-divposlasttime\ : std_logic;
  signal \-dmapbenb\ : std_logic;
  signal \-dp\ : std_logic;
  signal \-dparh\ : std_logic;
  signal \-dpe\ : std_logic;
  signal \-dr\ : std_logic;
  signal \-dwea\ : std_logic;
  signal \-dweb\ : std_logic;
  signal \-dwec\ : std_logic;
  signal \-errhalt\ : std_logic;
  signal \-funct0\, \-funct1\, \-funct2\, \-funct3\ : std_logic;
  signal \-halt\ : std_logic;
  signal \-halted\ : std_logic;
  signal \-hang\ : std_logic;
  signal \-higherr\ : std_logic;
  signal \-ice0a\, \-ice0b\, \-ice0c\, \-ice0d\ : std_logic;
  signal \-ice1a\, \-ice1b\, \-ice1c\, \-ice1d\ : std_logic;
  signal \-ice2a\, \-ice2b\, \-ice2c\, \-ice2d\ : std_logic;
  signal \-ice3a\, \-ice3b\, \-ice3c\, \-ice3d\ : std_logic;
  signal \-idebug\ : std_logic;
  signal \-ifetch\ : std_logic;
  signal \-ignpar\ : std_logic;
  signal \-ignpopj\ : std_logic;
  signal \-ilong\ : std_logic;
  signal \-imodd\ : std_logic;
  signal \-inop\ : std_logic;
  signal \-ipe\ : std_logic;
  signal \-ipopj\ : std_logic;
  signal \-ir0\, \-ir1\, \-ir2\, \-ir3\, \-ir4\, \-ir6\, \-ir8\, \-ir12\, \-ir13\, \-ir22\, \-ir25\, \-ir31\ : std_logic;
  signal \-iralu\ : std_logic;
  signal \-irbyte\ : std_logic;
  signal \-irdisp\ : std_logic;
  signal \-irjump\ : std_logic;
  signal \-iwea\, \-iweb\, \-iwec\, \-iwed\, \-iwee\, \-iwef\, \-iweg\, \-iweh\, \-iwei\, \-iwej\, \-iwek\, \-iwel\, \-iwem\, \-iwen\, \-iweo\, \-iwep\ : std_logic;
  signal \-iwrited\ : std_logic;
  signal \-iwriteda\ : std_logic;
  signal \-jcond\ : std_logic;
  signal \-lc_modifies_mrot\ : std_logic;
  signal \-lcdrive\ : std_logic;
  signal \-lcinc\ : std_logic;
  signal \-lcry11\ : std_logic;
  signal \-lcry15\ : std_logic;
  signal \-lcry19\ : std_logic;
  signal \-lcry23\ : std_logic;
  signal \-lcry3\ : std_logic;
  signal \-lcry7\ : std_logic;
  signal \-ldclk\ : std_logic;
  signal \-lddbirh\ : std_logic;
  signal \-lddbirl\ : std_logic;
  signal \-lddbirm\ : std_logic;
  signal \-ldmode\ : std_logic;
  signal \-ldopc\ : std_logic;
  signal \-ldstat\ : std_logic;
  signal \-loadmd\ : std_logic;
  signal \-lowerhighok\ : std_logic;
  signal \-lparity\ : std_logic;
  signal \-lparm\ : std_logic;
  signal \-lpc.hold\ : std_logic;
  signal \-lvmo22\, \-lvmo23\ : std_logic;
  signal \-machrun\ : std_logic;
  signal \-machruna\ : std_logic;
  signal \-madr0a\, \-madr1a\, \-madr2a\, \-madr3a\, \-madr4a\ : std_logic;
  signal \-madr0b\, \-madr1b\, \-madr2b\, \-madr3b\, \-madr4b\ : std_logic;
  signal \-mapdrive\ : std_logic;
  signal \-mapi8b\, \-mapi9b\, \-mapi10b\, \-mapi11b\, \-mapi12b\ : std_logic;
  signal \-mapi8a\, \-mapi9a\, \-mapi10a\, \-mapi11a\, \-mapi12a\ : std_logic;
  signal \-mapi23\ : std_logic;
  signal \-mbusy.sync\ : std_logic;
  signal \-mclk1\ : std_logic;
  signal \-mclk5\ : std_logic;
  signal \-md\ : std_logic_vector(0 to 31);
  signal \-mddrive\ : std_logic;
  signal \-mds\ : std_logic_vector(0 to 31);
  signal \-memack\ : std_logic;
  signal \-memdrive.a\ : std_logic;
  signal \-memdrive.b\ : std_logic;
  signal \-memgrant\ : std_logic;
  signal \-memop\ : std_logic;
  signal \-memparok\ : std_logic;
  signal \-mempe\ : std_logic;
  signal \-memprepare\ : std_logic;
  signal \-memrd\ : std_logic;
  signal \-memrq\ : std_logic;
  signal \-memstart\ : std_logic;
  signal \-memwr\ : std_logic;
  signal \-mfdrive\ : std_logic;
  signal \-mfinish\ : std_logic;
  signal \-mfinishd\ : std_logic;
  signal \-mpass\ : std_logic;
  signal \-mpassl\ : std_logic;
  signal \-mpassm\ : std_logic;
  signal \-mpe\ : std_logic;
  signal \-mr\ : std_logic;
  signal \-mul\ : std_logic;
  signal \-mulnop\ : std_logic;
  signal \-mwpa\ : std_logic;
  signal \-mwpb\ : std_logic;
  signal \-needfetch\ : std_logic;
  signal \-newlc.in\ : std_logic;
  signal \-newlc\ : std_logic;
  signal \-nop11\ : std_logic;
  signal \-nop\ : std_logic;
  signal \-nopa\ : std_logic;
  signal \-opcclk\ : std_logic;
  signal \-opcdrive\ : std_logic;
  signal \-opcinh\ : std_logic;
  signal \-parerr\ : std_logic;
  signal \-pc12b\, \-pc13b\ : std_logic;
  signal \-pcb0\, \-pcb1\, \-pcb2\, \-pcb3\, \-pcb4\, \-pcb5\, \-pcb6\, \-pcb7\, \-pcb8\, \-pcb9\, \-pcb10\, \-pcb11\ : std_logic;
  signal \-pcc0\, \-pcc1\, \-pcc2\, \-pcc3\, \-pcc4\, \-pcc5\, \-pcc6\, \-pcc7\, \-pcc8\, \-pcc9\, \-pcc10\, \-pcc11\ : std_logic;
  signal \-pdla0a\, \-pdla1a\, \-pdla2a\, \-pdla3a\, \-pdla4a\, \-pdla5a\, \-pdla6a\, \-pdla7a\, \-pdla8a\, \-pdla9a\ : std_logic;
  signal \-pdla0b\, \-pdla1b\, \-pdla2b\, \-pdla3b\, \-pdla4b\, \-pdla5b\, \-pdla6b\, \-pdla7b\, \-pdla8b\, \-pdla9b\ : std_logic;
  signal \-pdlcnt\ : std_logic;
  signal \-pdlcry3\ : std_logic;
  signal \-pdlcry7\ : std_logic;
  signal \-pdldrive\ : std_logic;
  signal \-pdlpa\ : std_logic;
  signal \-pdlpb\ : std_logic;
  signal \-pdlpe\ : std_logic;
  signal \-pdlwrited\ : std_logic;
  signal \-pfr\ : std_logic;
  signal \-pfw\ : std_logic;
  signal \-pma8\, \-pma9\, \-pma10\, \-pma11\, \-pma12\, \-pma13\, \-pma14\, \-pma15\, \-pma16\, \-pma17\, \-pma18\, \-pma19\, \-pma20\, \-pma21\ : std_logic;
  signal \-popj\ : std_logic;
  signal \-power_reset\ : std_logic;
  signal \-ppdrive\ : std_logic;
  signal \-prog.reset\ : std_logic;
  signal \-promce0\, \-promce1\ : std_logic;
  signal \-promdisabled\ : std_logic;
  signal \-promenable\ : std_logic;
  signal \-prompc\ : std_logic_vector(0 to 9);
  signal \-pwidx\ : std_logic;
  signal \-pwpa\ : std_logic;
  signal \-pwpb\ : std_logic;
  signal \-pwpc\ : std_logic;
  signal \-qdrive\ : std_logic;
  signal \-rdfinish\ : std_logic;
  signal \-reset\ : std_logic;
  signal \-run\ : std_logic;
  signal \-s4\ : std_logic;
  signal \-sh3\, \-sh4\ : std_logic;
  signal \-spccry\ : std_logic;
  signal \-spcdrive\ : std_logic;
  signal \-spcnt\ : std_logic;
  signal \-spcpass\ : std_logic;
  signal \-spcwparl\ : std_logic;
  signal \-spcwpass\ : std_logic;
  signal \-spe\ : std_logic;
  signal \-specalu\ : std_logic;
  signal \-spop\ : std_logic;
  signal \-spush\ : std_logic;
  signal \-spushd\ : std_logic;
  signal \-spy.ah\ : std_logic;
  signal \-spy.al\ : std_logic;
  signal \-spy.flag1\ : std_logic;
  signal \-spy.flag2\ : std_logic;
  signal \-spy.irh\ : std_logic;
  signal \-spy.irl\ : std_logic;
  signal \-spy.irm\ : std_logic;
  signal \-spy.mh\ : std_logic;
  signal \-spy.ml\ : std_logic;
  signal \-spy.obh\ : std_logic;
  signal \-spy.obl\ : std_logic;
  signal \-spy.opc\ : std_logic;
  signal \-spy.pc\ : std_logic;
  signal \-spy.sth\ : std_logic;
  signal \-spy.stl\ : std_logic;
  signal \-sr\ : std_logic;
  signal \-srcdc\ : std_logic;
  signal \-srclc\ : std_logic;
  signal \-srcm\ : std_logic;
  signal \-srcmap\ : std_logic;
  signal \-srcmd\ : std_logic;
  signal \-srcopc\ : std_logic;
  signal \-srcpdlidx\ : std_logic;
  signal \-srcpdlpop\ : std_logic;
  signal \-srcpdlptr\ : std_logic;
  signal \-srcpdltop\ : std_logic;
  signal \-srcq\ : std_logic;
  signal \-srcspc\ : std_logic;
  signal \-srcspcpop\ : std_logic;
  signal \-srcspcpopreal\ : std_logic;
  signal \-srcvma\ : std_logic;
  signal \-ssdone\ : std_logic;
  signal \-statbit\ : std_logic;
  signal \-stathalt\ : std_logic;
  signal \-stc4\, \-stc8\, \-stc12\, \-stc16\, \-stc20\, \-stc24\, \-stc28\, \-stc32\ : std_logic;
  signal \-step\ : std_logic;
  signal \-swpa\ : std_logic;
  signal \-swpb\ : std_logic;
  signal \-trap\ : std_logic;
  signal \-trapenb\ : std_logic;
  signal \-upperhighok\ : std_logic;
  signal \-use.map\ : std_logic;
  signal \-v0pe\ : std_logic;
  signal \-v1pe\ : std_logic;
  signal \-vm0wpa\, \-vm0wpb\ : std_logic;
  signal \-vm1lpar\ : std_logic;
  signal \-vm1wpa\, \-vm1wpb\ : std_logic;
  signal \-vma\ : std_logic_vector(0 to 31);
  signal \-vmadrive\ : std_logic;
  signal \-vmaenb\ : std_logic;
  signal \-vmaok\ : std_logic;
  signal \-vmap0\, \-vmap1\, \-vmap2\, \-vmap3\, \-vmap4\ : std_logic;
  signal \-vmas\ : std_logic_vector(0 to 31);
  signal \-vmo\ : std_logic_vector(0 to 23);
  signal \-wait\ : std_logic;
  signal \-wmap\ : std_logic;
  signal \-wmapd\ : std_logic;
  signal \-zero16.drive\ : std_logic;
  signal \boot.trap\ : std_logic;
  signal \bottom.1k\ : std_logic;
  signal \bus.power.reset_l\ : std_logic;
  signal \destimod0_l\ : std_logic;
  signal \have_wrong_word\ : std_logic;
  signal \inst_in_2nd_or_4th_quarter\ : std_logic;
  signal \inst_in_left_half\ : std_logic;
  signal \int.enable\ : std_logic;
  signal \iwrited_l\ : std_logic;
  signal \last_byte_in_word\ : std_logic;
  signal \lc_byte_mode\ : std_logic;
  signal \lm_drive_enb\ : std_logic;
  signal \lpc.hold\ : std_logic;
  signal \machruna_l\ : std_logic;
  signal \mbusy.sync\ : std_logic;
  signal \mempar_in\ : std_logic;
  signal \mempar_out\ : std_logic;
  signal \next.instr\ : std_logic;
  signal \next.instrd\ : std_logic;
  signal \pgf.or.int.or.sb\ : std_logic;
  signal \pgf.or.int\ : std_logic;
  signal \power_reset_a\ : std_logic;
  signal \prog.boot\ : std_logic;
  signal \prog.bus.reset\ : std_logic;
  signal \prog.unibus.reset\ : std_logic;
  signal \rd.in.progress\ : std_logic;
  signal \sequence.break\ : std_logic;
  signal \set.rd.in.progress\ : std_logic;
  signal \stat.ovf\ : std_logic;
  signal \use.md\ : std_logic;
  signal \zero12.drive\ : std_logic;
  signal \zero16.drive\ : std_logic;
  signal a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31a, a31b : std_logic;
  signal aa0, aa1, aa2, aa3, aa4, aa5, aa6, aa7, aa8, aa9, aa10, aa11, aa12, aa13, aa14, aa15, aa16, aa17 : std_logic;
  signal aeqm : std_logic;
  signal alu : std_logic_vector(0 to 32);
  signal aluadd : std_logic;
  signal aluf0a, aluf1a, aluf2a, aluf3a : std_logic;
  signal aluf0b, aluf1b, aluf2b, aluf3b : std_logic;
  signal alumode : std_logic;
  signal aluneg : std_logic;
  signal alusub : std_logic;
  signal amem : std_logic_vector(0 to 31);
  signal amemparity : std_logic;
  signal aparity : std_logic;
  signal aparl : std_logic;
  signal aparm : std_logic;
  signal aparok : std_logic;
  signal apass1 : std_logic;
  signal apass2 : std_logic;
  signal apassenb : std_logic;
  signal clk1a : std_logic;
  signal clk2a : std_logic;
  signal clk2b : std_logic;
  signal clk2c : std_logic;
  signal clk3a : std_logic;
  signal clk3b : std_logic;
  signal clk3c : std_logic;
  signal clk3d : std_logic;
  signal clk3e : std_logic;
  signal clk3f : std_logic;
  signal clk4a : std_logic;
  signal clk4b : std_logic;
  signal clk4c : std_logic;
  signal clk4d : std_logic;
  signal clk4e : std_logic;
  signal clk4f : std_logic;
  signal clk5a : std_logic;
  signal conds0 : std_logic;
  signal conds1 : std_logic;
  signal conds2 : std_logic;
  signal cyclecompleted : std_logic;
  signal dadr10a : std_logic;
  signal dadr10c : std_logic;
  signal dc : std_logic_vector (0 to 9);
  signal dcdrive : std_logic;
  signal dest : std_logic;
  signal destd : std_logic;
  signal destm : std_logic;
  signal destmd : std_logic;
  signal destmdr : std_logic;
  signal destmem : std_logic;
  signal destspc : std_logic;
  signal destspcd : std_logic;
  signal dispenb : std_logic;
  signal dispwr : std_logic;
  signal divaddcond : std_logic;
  signal divsubcond : std_logic;
  signal dmask : std_logic_vector(0 to 6);
  signal dn : std_logic;
  signal dp : std_logic;
  signal dpar : std_logic;
  signal dpareven : std_logic;
  signal dparl : std_logic;
  signal dparok : std_logic;
  signal dpc : std_logic_vector(0 to 13);
  signal dpe : std_logic;
  signal dr : std_logic;
  signal eadr : std_logic_vector(0 to 3);
  signal err : std_logic;
  signal errstop : std_logic;
  signal hi1, hi2, hi3, hi4, hi5, hi6, hi7, hi8, hi9, hi10, hi11, hi12 : std_logic;
  signal highok : std_logic;
  signal i : std_logic_vector(0 to 48);
  signal idebug : std_logic;
  signal imod : std_logic;
  signal imodd : std_logic;
  signal inop : std_logic;
  signal int : std_logic;
  signal internal1, internal2, internal3, internal4, internal5, internal7, internal8, internal9, internal10, internal11, internal12, internal13, internal14, internal15, internal16, internal17, internal18, internal19, internal20, internal21, internal22, internal23, internal24, internal25, internal26, internal27, internal28, internal29, internal30, internal31, internal32, internal33, internal34, internal35, internal36, internal37 : std_logic;
  signal iob : std_logic_vector(0 to 47);
  signal ipar0, ipar1, ipar2, ipar3 : std_logic;
  signal iparity : std_logic;
  signal iparok : std_logic;
  signal ipc : std_logic_vector(0 to 13);
  signal ipe : std_logic;
  signal ir12b : std_logic;
  signal ir13b : std_logic;
  signal ir14b : std_logic;
  signal ir15b : std_logic;
  signal ir16b : std_logic;
  signal ir17b : std_logic;
  signal ir18b : std_logic;
  signal ir19b : std_logic;
  signal ir20b : std_logic;
  signal ir21b : std_logic;
  signal ir22b : std_logic;
  signal ir : std_logic_vector(0 to 48);
  signal ir9b : std_logic;
  signal ir8b : std_logic;
  signal iralu : std_logic;
  signal irdisp : std_logic;
  signal irjump : std_logic;
  signal iwr : std_logic_vector(0 to 48);
  signal iwrite : std_logic;
  signal iwrited : std_logic;
  signal iwriteda : std_logic;
  signal iwritedb : std_logic;
  signal iwritedc : std_logic;
  signal iwritedd : std_logic;
  signal iwrp1, iwrp2, iwrp3, iwrp4 : std_logic;
  signal jcalf : std_logic;
  signal jcond : std_logic;
  signal jfalse : std_logic;
  signal jret : std_logic;
  signal jretf : std_logic;
  signal l : std_logic_vector(0 to 31);
  signal lc0b : std_logic;
  signal lc : std_logic_vector(0 to 25);
  signal lca0, lca1, lca2, lca3 : std_logic;
  signal lcdrive : std_logic;
  signal lcinc : std_logic;
  signal lcry3 : std_logic;
  signal ldmode : std_logic;
  signal ldstat : std_logic;
  signal loadmd : std_logic;
  signal lparity : std_logic;
  signal lparl : std_logic;
  signal lpc : std_logic_vector(0 to 13);
  signal m : std_logic_vector(0 to 31);
  signal m31b : std_logic;
  signal machrun : std_logic;
  signal mapi8, mapi9, mapi10, mapi11, mapi12, mapi13, mapi14, mapi15, mapi16, mapi17, mapi18, mapi19, mapi20, mapi21, mapi22, mapi23 : std_logic;
  signal mapwr0d : std_logic;
  signal mapwr1d : std_logic;
  signal mbusy : std_logic;
  signal mclk1a : std_logic;
  signal mclk5a : std_logic;
  signal mdclk : std_logic;
  signal mdgetspar : std_logic;
  signal mdhaspar : std_logic;
  signal mdpar : std_logic;
  signal mdparerr : std_logic;
  signal mdpareven : std_logic;
  signal mdparl : std_logic;
  signal mdparm : std_logic;
  signal mdparodd : std_logic;
  signal mdsela : std_logic;
  signal mdselb : std_logic;
  signal mem : std_logic_vector(0 to 31);
  signal memparok : std_logic;
  signal memprepare : std_logic;
  signal memrq : std_logic;
  signal memstart : std_logic;
  signal mf : std_logic_vector(0 to 31);
  signal mfdrive : std_logic;
  signal mfenb : std_logic;
  signal mmem : std_logic_vector(0 to 31);
  signal mmemparity : std_logic;
  signal mmemparok : std_logic;
  signal mpareven : std_logic;
  signal mparity : std_logic;
  signal mparl : std_logic;
  signal mparm : std_logic;
  signal mparodd : std_logic;
  signal mpass : std_logic;
  signal mpassl : std_logic;
  signal msk : std_logic_vector(0 to 31);
  signal mskl : std_logic_vector(0 to 4);
  signal mskl3cry : std_logic;
  signal mskr : std_logic_vector(0 to 4);
  signal n : std_logic;
  signal nc : std_logic_vector(0 to 500);  -- Not connected ...
  signal needfetch : std_logic;
  signal newlc : std_logic;
  signal nop11 : std_logic;
  signal nop : std_logic;
  signal nopa : std_logic;
  signal npc : std_logic_vector(0 to 13);
  signal ob : std_logic_vector(0 to 31);
  signal opc : std_logic_vector(0 to 13);
  signal opcclk : std_logic;
  signal opcclka, opcclkb, opcclkc : std_logic;
  signal opcinh : std_logic;
  signal opcinha, opcinhb : std_logic;
  signal osel0a, osel0b : std_logic;
  signal osel1a, osel1b : std_logic;
  signal pc : std_logic_vector(0 to 13);
  signal pc0a, pc0b, pc0c, pc0d, pc0e, pc0f, pc0g, pc0h, pc0i, pc0j, pc0k, pc0l, pc0m, pc0n, pc0o, pc0p : std_logic;
  signal pc1a, pc1b, pc1c, pc1d, pc1e, pc1f, pc1g, pc1h, pc1i, pc1j, pc1k, pc1l, pc1m, pc1n, pc1o, pc1p : std_logic;
  signal pc2a, pc2b, pc2c, pc2d, pc2e, pc2f, pc2g, pc2h, pc2i, pc2j, pc2k, pc2l, pc2m, pc2n, pc2o, pc2p : std_logic;
  signal pc3a, pc3b, pc3c, pc3d, pc3e, pc3f, pc3g, pc3h, pc3i, pc3j, pc3k, pc3l, pc3m, pc3n, pc3o, pc3p : std_logic;
  signal pc4a, pc4b, pc4c, pc4d, pc4e, pc4f, pc4g, pc4h, pc4i, pc4j, pc4k, pc4l, pc4m, pc4n, pc4o, pc4p : std_logic;
  signal pc5a, pc5b, pc5c, pc5d, pc5e, pc5f, pc5g, pc5h, pc5i, pc5j, pc5k, pc5l, pc5m, pc5n, pc5o, pc5p : std_logic;
  signal pc6a, pc6b, pc6c, pc6d, pc6e, pc6f, pc6g, pc6h, pc6i, pc6j, pc6k, pc6l, pc6m, pc6n, pc6o, pc6p : std_logic;
  signal pc7a, pc7b, pc7c, pc7d, pc7e, pc7f, pc7g, pc7h, pc7i, pc7j, pc7k, pc7l, pc7m, pc7n, pc7o, pc7p : std_logic;
  signal pc8a, pc8b, pc8c, pc8d, pc8e, pc8f, pc8g, pc8h, pc8i, pc8j, pc8k, pc8l, pc8m, pc8n, pc8o, pc8p : std_logic;
  signal pc9a, pc9b, pc9c, pc9d, pc9e, pc9f, pc9g, pc9h, pc9i, pc9j, pc9k, pc9l, pc9m, pc9n, pc9o, pc9p : std_logic;
  signal pc10a, pc10b, pc10c, pc10d, pc10e, pc10f, pc10g, pc10h, pc10i, pc10j, pc10k, pc10l, pc10m, pc10n, pc10o, pc10p : std_logic;
  signal pc11a, pc11b, pc11c, pc11d, pc11e, pc11f, pc11g, pc11h, pc11i, pc11j, pc11k, pc11l, pc11m, pc11n, pc11o, pc11p : std_logic;
  signal pc12b : std_logic;
  signal pc13b : std_logic;
  signal pccry3 : std_logic;
  signal pccry7 : std_logic;
  signal pccry11 : std_logic;
  signal pcs0, pcs1 : std_logic;
  signal pdl : std_logic_vector(0 to 31);
  signal pdlenb : std_logic;
  signal pdlidx : std_logic_vector(0 to 9);
  signal pdlparity : std_logic;
  signal pdlparok : std_logic;
  signal pdlptr : std_logic_vector(0 to 9);
  signal pdlwrite : std_logic;
  signal pdlwrited : std_logic;
  signal pidrive : std_logic;
  signal popj : std_logic;
  signal promdisable : std_logic;
  signal promdisabled : std_logic;
  signal promenable : std_logic;
  signal pwidx : std_logic;
  signal q : std_logic_vector(0 to 31);
  signal qdrive : std_logic;
  signal qs0, qs1 : std_logic;
  signal r : std_logic_vector(0 to 31);
  signal ramdisable : std_logic;
  signal rdcyc : std_logic;
  signal reset : std_logic;
  signal reta : std_logic_vector(0 to 13);
  signal run : std_logic;
  signal s0 : std_logic;
  signal s1 : std_logic;
  signal s2a : std_logic;
  signal s2b : std_logic;
  signal s3a : std_logic;
  signal s3b : std_logic;
  signal s4 : std_logic;
  signal sa : std_logic_vector(0 to 31);
  signal sint : std_logic;
  signal sintr : std_logic;
  signal spc1a : std_logic;
  signal spc : std_logic_vector(0 to 18);
  signal spcdrive : std_logic;
  signal spcenb : std_logic;
  signal spcmung : std_logic;
  signal spco : std_logic_vector(0 to 18);
  signal spcopar : std_logic;
  signal spcpar : std_logic;
  signal spcparh : std_logic;
  signal spcparok : std_logic;
  signal spcptr : std_logic_vector(0 to 4);
  signal spcw : std_logic_vector(0 to 18);
  signal spcwpar : std_logic;
  signal spcwparh : std_logic;
  signal spcwpass : std_logic;
  signal speed0 : std_logic;
  signal speed0a : std_logic;
  signal speed1 : std_logic;
  signal speed1a : std_logic;
  signal speedclk : std_logic;
  signal spush : std_logic;
  signal spushd : std_logic;
  signal spy : std_logic_vector(0 to 15);
  signal srclc : std_logic;
  signal srcm : std_logic;
  signal srcmap : std_logic;
  signal srcmd : std_logic;
  signal srcpdlidx : std_logic;
  signal srcpdlptr : std_logic;
  signal srcq : std_logic;
  signal srcvma : std_logic;
  signal srun : std_logic;
  signal ssdone : std_logic;
  signal sspeed0 : std_logic;
  signal sspeed1 : std_logic;
  signal sstep : std_logic;
  signal st : std_logic_vector(0 to 31);
  signal stathenb : std_logic;
  signal statstop : std_logic;
  signal step : std_logic;
  signal tilt0 : std_logic;
  signal tilt1 : std_logic;
  signal trapa : std_logic;
  signal trapb : std_logic;
  signal trapenb : std_logic;
  signal tse1a : std_logic;
  signal tse1b : std_logic;
  signal tse2 : std_logic;
  signal tse3a : std_logic;
  signal tse4a : std_logic;
  signal tse4b : std_logic;
  signal v0parok : std_logic;

  signal vm0pari : std_logic;
  signal vm1mpar : std_logic;
  signal vm1pari : std_logic;
  signal vmap0a : std_logic;
  signal vmap0b : std_logic;
  signal vmap1a : std_logic;
  signal vmap1b : std_logic;
  signal vmap2a : std_logic;
  signal vmap2b : std_logic;
  signal vmap3a : std_logic;
  signal vmap3b : std_logic;
  signal vmap4a : std_logic;
  signal vmap4b : std_logic;
  signal vmasela : std_logic;
  signal vmaselb : std_logic;
  signal vmo18 : std_logic;
  signal vmo19 : std_logic;
  signal vmopar : std_logic;
  signal vmoparck : std_logic;
  signal vmoparl : std_logic;
  signal vmoparm : std_logic;
  signal vmoparodd : std_logic;
  signal vmoparok : std_logic;
  signal vpari : std_logic;
  signal wadr : std_logic_vector(0 to 9);
  signal wmap : std_logic;
  signal wmapd : std_logic;
  signal wp1a : std_logic;
  signal wp1b : std_logic;
  signal wp2 : std_logic;
  signal wp3a : std_logic;
  signal wp4a : std_logic;
  signal wp4b : std_logic;
  signal wp4c : std_logic;
  signal wp5a : std_logic;
  signal wp5b : std_logic;
  signal wp5c : std_logic;
  signal wp5d : std_logic;
  signal wpc0 : std_logic;
  signal wpc1 : std_logic;
  signal wpc2 : std_logic;
  signal wpc3 : std_logic;
  signal wpc4 : std_logic;
  signal wpc5 : std_logic;
  signal wpc6 : std_logic;
  signal wpc7 : std_logic;
  signal wpc8 : std_logic;
  signal wpc9 : std_logic;
  signal wpc10 : std_logic;
  signal wpc11 : std_logic;
  signal wpc12 : std_logic;
  signal wpc13 : std_logic;
  signal wrcyc : std_logic;
  signal xout11 : std_logic;
  signal xout15 : std_logic;
  signal xout19 : std_logic;
  signal xout23 : std_logic;
  signal xout27 : std_logic;
  signal xout31 : std_logic;
  signal xout3 : std_logic;
  signal xout7 : std_logic;
  signal xx0 : std_logic;
  signal xx1 : std_logic;
  signal yout11 : std_logic;
  signal yout15 : std_logic;
  signal yout19 : std_logic;
  signal yout23 : std_logic;
  signal yout27 : std_logic;
  signal yout31 : std_logic;
  signal yout3 : std_logic;
  signal yout7 : std_logic;
  signal yy0 : std_logic;
  signal yy1 : std_logic;
  signal zero16 : std_logic;

begin

--- Clock Generation

  clock1_1c08 : sn74s10 port map(g1a => \-clock_reset_b\, g1b => \-tpdone\, g2a => \-hang\, g2b => \-clock_reset_b\, g2c => cyclecompleted, g2y_n => \-tpr0\, g1y_n => internal12, g1c => internal11, g3a => '0', g3b => '0', g3c => '0');
  clock1_1c09 : sn74s00 port map(g1b => internal12, g1a => \-tpr40\, g1q_n => internal11, g2b => '0', g2a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
  clock1_1c10 : sn74s02 port map(g4b => internal11, g4a => gnd, g4q_n => cyclecompleted, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g3b => '0', g3a => '0');
  clock1_1c12 : td50 port map(input => \-tprend\, o_20ns => \-tpw20\, o_40ns => \-tpw40\, o_50ns => \-tpw50\, o_30ns => \-tpw30\, o_10ns => \-tpw10\);
  clock1_1c14 : td25 port map(input => \-tpw50\, o_10ns => \-tpw60\, o_20ns => \-tpw70\, o_25ns => \-tpw75\, o_15ns => \-tpw65\, o_5ns => \-tpw55\);
  clock1_1c15 : td25 port map(input => \-tpw20\, o_10ns => \-tpw30a\, o_20ns => \-tpw40a\, o_25ns => \-tpw45\, o_15ns => \-tpw35\, o_5ns => \-tpw25\);
  clock1_1d08 : sn74s151 port map(i3 => \-tpr100\, i2 => \-tpr140\, i1 => \-tpr160\, i0 => \-tpr160\, q => \-tprend\, q_n => tprend, ce_n => gnd, sel2 => sspeed1, sel1 => sspeed0, sel0 => \-ilong\, i7 => \-tpr75\, i6 => \-tpr115\, i5 => \-tpr85\, i4 => \-tpr125\);
  clock1_1d11 : td25 port map(input => \-tpr0\, o_10ns => \-tpr10\, o_20ns => \-tpr20a\, o_25ns => \-tpr25\, o_15ns => \-tpr15\, o_5ns => \-tpr5\);
  clock1_1d12 : td100 port map(input => \-tpr0\, o_40ns => \-tpr40\, o_80ns => \-tpr80\, o_100ns => \-tpr100\, o_60ns => \-tpr60\, o_20ns => \-tpr20\);
  clock1_1d13 : td100 port map(input => \-tpr100\, o_40ns => \-tpr140\, o_80ns => \-tpr180\, o_100ns => \-tpr200\, o_60ns => \-tpr160\, o_20ns => \-tpr120\);
  clock1_1d14 : td25 port map(input => \-tpr100\, o_10ns => \-tpr110\, o_20ns => \-tpr120a\, o_25ns => \-tpr125\, o_15ns => \-tpr115\, o_5ns => \-tpr105\);
  clock1_1d15 : td25 port map(input => \-tpr60\, o_10ns => \-tpr70\, o_20ns => \-tpr80a\, o_25ns => \-tpr85\, o_15ns => \-tpr75\, o_5ns => \-tpr65\);

--  clock2_1c01 : sn7428 port map(g1q_n => clk4, g1a => \-clk0\, g1b => gnd, g2q_n => mclk7, g2a => \-mclk0\, g2b => gnd, g3a => '0', g4a => '0', g4b => '0', g3b => '0');
--  clock2_1c02 : sn7428 port map(g1q_n => \-wp1\, g1a => tpwp, g1b => gnd, g2q_n => \-wp2\, g2a => tpwp, g2b => gnd, g3a => gnd, g3b => tpwp, g3q_n => \-wp3\, g4a => gnd, g4b => tpwp, g4q_n => \-wp4\);
--  clock2_1c06 : sn74s10 port map(g1a => \-tprend\, g1b => tpclk, g2a => \-tptse\, g2b => \-tpr25\, g2c => \-clock_reset_b\, g2y_n => tptse, g3y_n => internal7, g3a => \-clock_reset_b\, g3b => \-tpw70\, g3c => internal10, g1y_n => \-tpclk\, g1c => \-clock_reset_b\);
--  clock2_1c07 : sn74s00 port map(g1b => \-tpr0\, g1a => \-tpclk\, g1q_n => tpclk, g2b => \-tpr5\, g2a => tptse, g2q_n => \-tptse\, g3q_n => internal10, g3b => internal7, g3a => \-tpw30\, g4a => '0', g4b => '0');
--  clock2_1c10 : sn74s02 port map(g2q_n => tpwp, g2a => internal7, g2b => \machruna_l\, g3b => \machruna_l\, g3a => internal8, g3q_n => tpwpiram, g1a => '0', g1b => '0', g4b => '0', g4a => '0');
--  clock2_1c11 : sn7428 port map(g1q_n => \-wp5\, g1a => tpwpiram, g1b => gnd, g2q_n => clk5, g2a => \-clk0\, g2b => gnd, g3a => gnd, g3b => \-mclk0\, g3q_n => mclk5, g4a => '0', g4b => '0');
--  clock2_1c13 : sn74s10 port map(g2a => \-tprend\, g2b => internal8, g2c => internal8, g2y_n => internal9, g3y_n => internal8, g3a => \-tpw45\, g3b => \-clock_reset_b\, g3c => internal9, g1a => '0', g1b => '0', g1c => '0');
--  clock2_1d04 : sn7428 port map(g1q_n => \-tse1\, g1a => tptse, g1b => gnd, g2q_n => \-tse2\, g2a => tptse, g2b => gnd, g3a => gnd, g3b => tptse, g3q_n => \-tse3\, g4a => gnd, g4b => tptse, g4q_n => \-tse4\);
--  clock2_1d05 : sn7428 port map(g1q_n => clk1, g1a => \-clk0\, g1b => gnd, g2q_n => clk2, g2a => \-clk0\, g2b => gnd, g3a => gnd, g3b => \-clk0\, g3q_n => clk3, g4a => gnd, g4b => \-mclk0\, g4q_n => mclk1);
--  clock2_1d10 : sn74s08 port map(g1b => \-tpclk\, g1a => machrun, g1q => \-clk0\, g3q => \-mclk0\, g3a => hi1, g3b => \-tpclk\, g2b => '0', g2a => '0', g4a => '0', g4b => '0');

--  clockd_1b18 : sn74s37 port map(g1a => \-clk1\, g1b => hi12, g1y => clk1a, g2a => reset, g2b => hi12, g2y => \-reset\, g3y => mclk1a, g3a => hi12, g3b => \-mclk1\, g4a => '0', g4b => '0');
--  clockd_1b19 : sn74s04 port map(g1a => mclk1, g1q_n => \-mclk1\, g2a => clk1, g2q_n => \-clk1\, g3a => \-wp1\, g3q_n => wp1b, g4q_n => wp1a, g4a => \-wp1\, g5q_n => tse1b, g5a => \-tse1\, g6q_n => tse1a, g6a => \-tse1\);
--  clockd_1f05 : sn74s133 port map(g => hi1, f => hi2, e => hi3, d => hi4, c => hi5, b => hi6, a => hi7, q_n => \-upperhighok\, h => hi8, i => hi9, j => hi10, k => hi11, l => hi12, m => hi11);
--  clockd_2c02 : sn74s04 port map(g1a => lcry3, g1q_n => \-lcry3\, g2a => nc(429), g2q_n => nc(430), g3a => clk2, g3q_n => \-clk2c\, g4q_n => \-clk2a\, g4a => clk2, g5q_n => wp2, g5a => \-wp2\, g6q_n => tse2, g6a => \-tse2\);
--  clockd_2c03 : sn74s37 port map(g1a => \-clk2a\, g1b => hi7, g1y => clk2a, g2a => \-clk2a\, g2b => hi7, g2y => clk2b, g3y => clk2c, g3a => hi7, g3b => \-clk2c\, g4a => '0', g4b => '0');
--  clockd_3c11 : sn74s37 port map(g1a => \-clk3a\, g1b => hi5, g1y => clk3a, g2a => \-clk3a\, g2b => hi5, g2y => clk3b, g3y => clk3c, g3a => hi5, g3b => \-clk3a\, g4a => '0', g4b => '0');
--  clockd_3c12 : sn74s04 port map(g1a => nc(427), g1q_n => nc(428), g2a => clk3, g2q_n => \-clk3g\, g3a => clk3, g3q_n => \-clk3d\, g4q_n => \-clk3a\, g4a => clk3, g5q_n => wp3a, g5a => \-wp3\, g6q_n => tse3a, g6a => \-tse3\);
--  clockd_3c13 : sn74s37 port map(g1a => \-clk3d\, g1b => hi5, g1y => clk3d, g2a => \-clk3d\, g2b => hi5, g2y => clk3e, g3y => clk3f, g3a => hi5, g3b => \-clk3d\, g4a => '0', g4b => '0');
--  clockd_4c02 : sn74s37 port map(g1a => \-clk4a\, g1b => hi5, g1y => clk4a, g2a => \-clk4a\, g2b => hi5, g2y => clk4b, g3y => clk4c, g3a => hi5, g3b => \-clk4a\, g4a => '0', g4b => '0');
--  clockd_4c06 : sn74s04 port map(g1a => clk4, g1q_n => \-clk4e\, g2a => clk4, g2q_n => \-clk4d\, g3a => clk4, g3q_n => \-clk4a\, g4q_n => wp4c, g4a => \-wp4\, g5q_n => wp4b, g5a => \-wp4\, g6q_n => wp4a, g6a => \-wp4\);
--  clockd_4c07 : sn74s37 port map(g1a => \-clk4d\, g1b => hi2, g1y => clk4d, g2a => \-clk4d\, g2b => hi2, g2y => clk4e, g3y => clk4f, g3a => hi2, g3b => \-clk4d\, g4a => '0', g4b => '0');
--  clockd_4d03 : sn74s04 port map(g1a => nc(423), g1q_n => nc(424), g2a => nc(425), g2q_n => nc(426), g3a => \-tse4\, g3q_n => tse4b, g4q_n => tse4a, g4a => \-tse4\, g5q_n => srcpdlptr, g5a => \-srcpdlptr\, g6q_n => srcpdlidx, g6a => \-srcpdlidx\);

--- Microinstruction Fetch

--  ictl_1a15 : dm9s42_1 port map(out2 => ramdisable, g2d2 => hi1, g2c2 => hi1, g2b2 => \-iwriteda\, g2a2 => \-promdisabled\, g1b2 => hi1, g1a2 => idebug, g1a1 => '0', g1b1 => '0', g2a1 => '0', g2b1 => '0', g2c1 => '0', g2d1 => '0');
--  ictl_1c16 : sn74s04 port map(g1a => iwriteda, g1q_n => \-iwriteda\, g2a => promdisabled, g2q_n => \-promdisabled\, g3a => \-wp5\, g3q_n => wp5d, g4q_n => wp5c, g4a => \-wp5\, g5q_n => wp5b, g5a => \-wp5\, g6q_n => wp5a, g6a => \-wp5\);
--  ictl_1c21 : sn74s04 port map(g1a => pc(0), g1q_n => \-pcb0\, g2a => pc(1), g2q_n => \-pcb1\, g3a => pc(2), g3q_n => \-pcb2\, g4q_n => \-pcb3\, g4a => pc(3), g5q_n => \-pcb4\, g5a => pc(4), g6q_n => \-pcb5\, g6a => pc(5));
--  ictl_1c26 : sn74s37 port map(g1a => wp5a, g1b => iwriteda, g1y => \-iwea\, g2a => wp5a, g2b => iwriteda, g2y => \-iweb\, g3y => \-iwei\, g3a => iwriteda, g3b => wp5a, g4y => \-iwej\, g4a => iwriteda, g4b => wp5a);
--  ictl_1d20 : sn74s04 port map(g1a => pc(13), g1q_n => \-pc13b\, g2a => pc(12), g2q_n => \-pc12b\, g3a => \-iwrited\, g3q_n => iwritedd, g4q_n => iwritedc, g4a => \-iwrited\, g5q_n => iwritedb, g5a => \-iwrited\, g6q_n => iwriteda, g6a => \-iwrited\);
--  ictl_1d25 : sn74s04 port map(g1a => pc(6), g1q_n => \-pcb6\, g2a => pc(7), g2q_n => \-pcb7\, g3a => pc(8), g3q_n => \-pcb8\, g4q_n => \-pcb9\, g4a => pc(9), g5q_n => \-pcb10\, g5a => pc(10), g6q_n => \-pcb11\, g6a => pc(11));
--  ictl_1d30 : sn74s139 port map(g1 => ramdisable, a1 => \-pc12b\, b1 => \-pc13b\, g1y0 => \-ice3a\, g1y1 => \-ice2a\, g1y2 => \-ice1a\, g1y3 => \-ice0a\, g2y3 => \-ice0b\, g2y2 => \-ice1b\, g2y1 => \-ice2b\, g2y0 => \-ice3b\, b2 => \-pc13b\, a2 => \-pc12b\, g2 => ramdisable);
--  ictl_2c01 : sn74s37 port map(g1a => wp5b, g1b => iwritedb, g1y => \-iwec\, g2a => wp5b, g2b => iwritedb, g2y => \-iwed\, g3y => \-iwek\, g3a => iwritedb, g3b => wp5b, g4y => \-iwel\, g4a => iwritedb, g4b => wp5b);
--  ictl_2c06 : sn74s04 port map(g1a => pc(0), g1q_n => \-pcc0\, g2a => pc(1), g2q_n => \-pcc1\, g3a => pc(2), g3q_n => \-pcc2\, g4q_n => \-pcc3\, g4a => pc(3), g5q_n => \-pcc4\, g5a => pc(4), g6q_n => \-pcc5\, g6a => pc(5));
--  ictl_2d10 : sn74s04 port map(g1a => pc(6), g1q_n => \-pcc6\, g2a => pc(7), g2q_n => \-pcc7\, g3a => pc(8), g3q_n => \-pcc8\, g4q_n => \-pcc9\, g4a => pc(9), g5q_n => \-pcc10\, g5a => pc(10), g6q_n => \-pcc11\, g6a => pc(11));
--  ictl_2d15 : sn74s37 port map(g1a => wp5c, g1b => iwritedc, g1y => \-iwee\, g2a => wp5c, g2b => iwritedc, g2y => \-iwef\, g3y => \-iwem\, g3a => iwritedc, g3b => wp5c, g4y => \-iwen\, g4a => iwritedc, g4b => wp5c);
--  ictl_2d25 : sn74s139 port map(g1 => ramdisable, a1 => \-pc12b\, b1 => \-pc13b\, g1y0 => \-ice3c\, g1y1 => \-ice2c\, g1y2 => \-ice1c\, g1y3 => \-ice0c\, g2y3 => \-ice0d\, g2y2 => \-ice1d\, g2y1 => \-ice2d\, g2y0 => \-ice3d\, b2 => \-pc13b\, a2 => \-pc12b\, g2 => ramdisable);
--  ictl_2d30 : sn74s37 port map(g1a => wp5d, g1b => iwritedd, g1y => \-iweg\, g2a => wp5d, g2b => iwritedd, g2y => \-iweh\, g3y => \-iweo\, g3a => iwritedd, g3b => wp5d, g4y => \-iwep\, g4a => iwritedd, g4b => wp5d);

--  iram00_1d21 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(10), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(10), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1d22 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(11), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(11), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1d23 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6a, g2a => \-pcb7\, g2q_n => pc7a, g3a => \-pcb8\, g3q_n => pc8a, g4q_n => pc9a, g4a => \-pcb9\, g5q_n => pc10a, g5a => \-pcb10\, g6q_n => pc11a, g6a => \-pcb11\);
--  iram00_1d24 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0a, g2a => \-pcb1\, g2q_n => pc1a, g3a => \-pcb2\, g3q_n => pc2a, g4q_n => pc3a, g4a => \-pcb3\, g5q_n => pc4a, g5a => \-pcb4\, g6q_n => pc5a, g6a => \-pcb5\);
--  iram00_1e21 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(5), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(5), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1e22 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(6), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(6), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1e23 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(7), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(7), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1e24 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(8), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(8), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1e25 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(9), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(9), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1f21 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(0), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(0), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1f22 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(1), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(1), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1f23 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(2), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(2), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1f24 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(3), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(3), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);
--  iram00_1f25 : am2147 port map(a0 => pc0a, a1 => pc1a, a2 => pc2a, a3 => pc3a, a4 => pc4a, a5 => pc5a, do => i(4), we_n => \-iwea\, ce_n => \-ice0a\, di => iwr(4), a11 => pc11a, a10 => pc10a, a9 => pc9a, a8 => pc8a, a7 => pc7a, a6 => pc6a);

--  iram01_1d26 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(10), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(10), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1d27 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(11), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(11), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1d28 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6b, g2a => \-pcb7\, g2q_n => pc7b, g3a => \-pcb8\, g3q_n => pc8b, g4q_n => pc9b, g4a => \-pcb9\, g5q_n => pc10b, g5a => \-pcb10\, g6q_n => pc11b, g6a => \-pcb11\);
--  iram01_1d29 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0b, g2a => \-pcb1\, g2q_n => pc1b, g3a => \-pcb2\, g3q_n => pc2b, g4q_n => pc3b, g4a => \-pcb3\, g5q_n => pc4b, g5a => \-pcb4\, g6q_n => pc5b, g6a => \-pcb5\);
--  iram01_1e26 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(5), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(5), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1e27 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(6), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(6), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1e28 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(7), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(7), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1e29 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(8), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(8), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1e30 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(9), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(9), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1f26 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(0), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(0), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1f27 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(1), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(1), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1f28 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(2), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(2), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1f29 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(3), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(3), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);
--  iram01_1f30 : am2147 port map(a0 => pc0b, a1 => pc1b, a2 => pc2b, a3 => pc3b, a4 => pc4b, a5 => pc5b, do => i(4), we_n => \-iweb\, ce_n => \-ice1a\, di => iwr(4), a11 => pc11b, a10 => pc10b, a9 => pc9b, a8 => pc8b, a7 => pc7b, a6 => pc6b);

--  iram02_2d01 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(10), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(10), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2d02 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(11), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(11), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2d03 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6c, g2a => \-pcb7\, g2q_n => pc7c, g3a => \-pcb8\, g3q_n => pc8c, g4q_n => pc9c, g4a => \-pcb9\, g5q_n => pc10c, g5a => \-pcb10\, g6q_n => pc11c, g6a => \-pcb11\);
--  iram02_2d04 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0c, g2a => \-pcb1\, g2q_n => pc1c, g3a => \-pcb2\, g3q_n => pc2c, g4q_n => pc3c, g4a => \-pcb3\, g5q_n => pc4c, g5a => \-pcb4\, g6q_n => pc5c, g6a => \-pcb5\);
--  iram02_2e01 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(5), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(5), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2e02 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(6), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(6), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2e03 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(7), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(7), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2e04 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(8), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(8), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2e05 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(9), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(9), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2f01 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(0), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(0), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2f02 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(1), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(1), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2f03 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(2), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(2), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2f04 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(3), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(3), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);
--  iram02_2f05 : am2147 port map(a0 => pc0c, a1 => pc1c, a2 => pc2c, a3 => pc3c, a4 => pc4c, a5 => pc5c, do => i(4), we_n => \-iwec\, ce_n => \-ice2a\, di => iwr(4), a11 => pc11c, a10 => pc10c, a9 => pc9c, a8 => pc8c, a7 => pc7c, a6 => pc6c);

--  iram03_2d06 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(10), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(10), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2d07 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(11), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(11), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2d08 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6d, g2a => \-pcb7\, g2q_n => pc7d, g3a => \-pcb8\, g3q_n => pc8d, g4q_n => pc9d, g4a => \-pcb9\, g5q_n => pc10d, g5a => \-pcb10\, g6q_n => pc11d, g6a => \-pcb11\);
--  iram03_2d09 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0d, g2a => \-pcb1\, g2q_n => pc1d, g3a => \-pcb2\, g3q_n => pc2d, g4q_n => pc3d, g4a => \-pcb3\, g5q_n => pc4d, g5a => \-pcb4\, g6q_n => pc5d, g6a => \-pcb5\);
--  iram03_2e06 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(5), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(5), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2e07 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(6), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(6), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2e08 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(7), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(7), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2e09 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(8), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(8), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2e10 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(9), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(9), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2f06 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(0), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(0), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2f07 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(1), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(1), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2f08 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(2), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(2), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2f09 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(3), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(3), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);
--  iram03_2f10 : am2147 port map(a0 => pc0d, a1 => pc1d, a2 => pc2d, a3 => pc3d, a4 => pc4d, a5 => pc5d, do => i(4), we_n => \-iwed\, ce_n => \-ice3a\, di => iwr(4), a11 => pc11d, a10 => pc10d, a9 => pc9d, a8 => pc8d, a7 => pc7d, a6 => pc6d);

--  iram10_2d11 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(22), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(22), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2d12 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(23), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(23), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2d13 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6e, g2a => \-pcb7\, g2q_n => pc7e, g3a => \-pcb8\, g3q_n => pc8e, g4q_n => pc9e, g4a => \-pcb9\, g5q_n => pc10e, g5a => \-pcb10\, g6q_n => pc11e, g6a => \-pcb11\);
--  iram10_2d14 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0e, g2a => \-pcb1\, g2q_n => pc1e, g3a => \-pcb2\, g3q_n => pc2e, g4q_n => pc3e, g4a => \-pcb3\, g5q_n => pc4e, g5a => \-pcb4\, g6q_n => pc5e, g6a => \-pcb5\);
--  iram10_2e11 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(17), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(17), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2e12 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(18), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(18), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2e13 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(19), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(19), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2e14 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(20), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(20), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2e15 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(21), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(21), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2f11 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(12), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(12), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2f12 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(13), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(13), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2f13 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(14), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(14), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2f14 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(15), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(15), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);
--  iram10_2f15 : am2147 port map(a0 => pc0e, a1 => pc1e, a2 => pc2e, a3 => pc3e, a4 => pc4e, a5 => pc5e, do => i(16), we_n => \-iwee\, ce_n => \-ice0b\, di => iwr(16), a11 => pc11e, a10 => pc10e, a9 => pc9e, a8 => pc8e, a7 => pc7e, a6 => pc6e);

--  iram11_2d16 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(22), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(22), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2d17 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(23), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(23), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2d18 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6f, g2a => \-pcb7\, g2q_n => pc7f, g3a => \-pcb8\, g3q_n => pc8f, g4q_n => pc9f, g4a => \-pcb9\, g5q_n => pc10f, g5a => \-pcb10\, g6q_n => pc11f, g6a => \-pcb11\);
--  iram11_2d19 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0f, g2a => \-pcb1\, g2q_n => pc1f, g3a => \-pcb2\, g3q_n => pc2f, g4q_n => pc3f, g4a => \-pcb3\, g5q_n => pc4f, g5a => \-pcb4\, g6q_n => pc5f, g6a => \-pcb5\);
--  iram11_2e16 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(17), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(17), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2e17 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(18), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(18), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2e18 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(19), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(19), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2e19 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(20), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(20), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2e20 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(21), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(21), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2f16 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(12), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(12), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2f17 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(13), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(13), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2f18 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(14), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(14), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2f19 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(15), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(15), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);
--  iram11_2f20 : am2147 port map(a0 => pc0f, a1 => pc1f, a2 => pc2f, a3 => pc3f, a4 => pc4f, a5 => pc5f, do => i(16), we_n => \-iwef\, ce_n => \-ice1b\, di => iwr(16), a11 => pc11f, a10 => pc10f, a9 => pc9f, a8 => pc8f, a7 => pc7f, a6 => pc6f);

--  iram12_2d21 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(22), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(22), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2d22 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(23), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(23), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2d23 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6g, g2a => \-pcb7\, g2q_n => pc7g, g3a => \-pcb8\, g3q_n => pc8g, g4q_n => pc9g, g4a => \-pcb9\, g5q_n => pc10g, g5a => \-pcb10\, g6q_n => pc11g, g6a => \-pcb11\);
--  iram12_2d24 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0g, g2a => \-pcb1\, g2q_n => pc1g, g3a => \-pcb2\, g3q_n => pc2g, g4q_n => pc3g, g4a => \-pcb3\, g5q_n => pc4g, g5a => \-pcb4\, g6q_n => pc5g, g6a => \-pcb5\);
--  iram12_2e21 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(17), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(17), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2e22 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(18), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(18), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2e23 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(19), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(19), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2e24 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(20), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(20), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2e25 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(21), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(21), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2f21 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(12), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(12), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2f22 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(13), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(13), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2f23 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(14), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(14), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2f24 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(15), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(15), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);
--  iram12_2f25 : am2147 port map(a0 => pc0g, a1 => pc1g, a2 => pc2g, a3 => pc3g, a4 => pc4g, a5 => pc5g, do => i(16), we_n => \-iweg\, ce_n => \-ice2b\, di => iwr(16), a11 => pc11g, a10 => pc10g, a9 => pc9g, a8 => pc8g, a7 => pc7g, a6 => pc6g);

--  iram13_2d26 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(22), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(22), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2d27 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(23), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(23), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2d28 : sn74s04 port map(g1a => \-pcb6\, g1q_n => pc6h, g2a => \-pcb7\, g2q_n => pc7h, g3a => \-pcb8\, g3q_n => pc8h, g4q_n => pc9h, g4a => \-pcb9\, g5q_n => pc10h, g5a => \-pcb10\, g6q_n => pc11h, g6a => \-pcb11\);
--  iram13_2d29 : sn74s04 port map(g1a => \-pcb0\, g1q_n => pc0h, g2a => \-pcb1\, g2q_n => pc1h, g3a => \-pcb2\, g3q_n => pc2h, g4q_n => pc3h, g4a => \-pcb3\, g5q_n => pc4h, g5a => \-pcb4\, g6q_n => pc5h, g6a => \-pcb5\);
--  iram13_2e26 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(17), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(17), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2e27 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(18), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(18), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2e28 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(19), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(19), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2e29 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(20), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(20), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2e30 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(21), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(21), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2f26 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(12), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(12), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2f27 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(13), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(13), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2f28 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(14), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(14), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2f29 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(15), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(15), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);
--  iram13_2f30 : am2147 port map(a0 => pc0h, a1 => pc1h, a2 => pc2h, a3 => pc3h, a4 => pc4h, a5 => pc5h, do => i(16), we_n => \-iweh\, ce_n => \-ice3b\, di => iwr(16), a11 => pc11h, a10 => pc10h, a9 => pc9h, a8 => pc8h, a7 => pc7h, a6 => pc6h);

--  iram20_1a21 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(31), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(31), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1a22 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(32), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(32), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1a23 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(33), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(33), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1a24 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(34), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(34), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1a25 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(35), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(35), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1b21 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(26), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(26), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1b22 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(27), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(27), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1b23 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(28), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(28), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1b24 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(29), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(29), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1b25 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(30), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(30), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1c22 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6i, g2a => \-pcc7\, g2q_n => pc7i, g3a => \-pcc8\, g3q_n => pc8i, g4q_n => pc9i, g4a => \-pcc9\, g5q_n => pc10i, g5a => \-pcc10\, g6q_n => pc11i, g6a => \-pcc11\);
--  iram20_1c23 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0i, g2a => \-pcc1\, g2q_n => pc1i, g3a => \-pcc2\, g3q_n => pc2i, g4q_n => pc3i, g4a => \-pcc3\, g5q_n => pc4i, g5a => \-pcc4\, g6q_n => pc5i, g6a => \-pcc5\);
--  iram20_1c24 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(24), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(24), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);
--  iram20_1c25 : am2147 port map(a0 => pc0i, a1 => pc1i, a2 => pc2i, a3 => pc3i, a4 => pc4i, a5 => pc5i, do => i(25), we_n => \-iwei\, ce_n => \-ice0c\, di => iwr(25), a11 => pc11i, a10 => pc10i, a9 => pc9i, a8 => pc8i, a7 => pc7i, a6 => pc6i);

--  iram21_1a26 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(31), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(31), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1a27 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(32), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(32), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1a28 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(33), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(33), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1a29 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(34), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(34), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1a30 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(35), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(35), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1b26 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(26), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(26), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1b27 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(27), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(27), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1b28 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(28), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(28), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1b29 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(29), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(29), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1b30 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(30), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(30), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1c27 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6j, g2a => \-pcc7\, g2q_n => pc7j, g3a => \-pcc8\, g3q_n => pc8j, g4q_n => pc9j, g4a => \-pcc9\, g5q_n => pc10j, g5a => \-pcc10\, g6q_n => pc11j, g6a => \-pcc11\);
--  iram21_1c28 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0j, g2a => \-pcc1\, g2q_n => pc1j, g3a => \-pcc2\, g3q_n => pc2j, g4q_n => pc3j, g4a => \-pcc3\, g5q_n => pc4j, g5a => \-pcc4\, g6q_n => pc5j, g6a => \-pcc5\);
--  iram21_1c29 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(24), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(24), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);
--  iram21_1c30 : am2147 port map(a0 => pc0j, a1 => pc1j, a2 => pc2j, a3 => pc3j, a4 => pc4j, a5 => pc5j, do => i(25), we_n => \-iwej\, ce_n => \-ice1c\, di => iwr(25), a11 => pc11j, a10 => pc10j, a9 => pc9j, a8 => pc8j, a7 => pc7j, a6 => pc6j);

--  iram22_2a01 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(31), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(31), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2a02 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(32), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(32), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2a03 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(33), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(33), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2a04 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(34), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(34), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2a05 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(35), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(35), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2b01 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(26), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(26), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2b02 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(27), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(27), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2b03 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(28), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(28), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2b04 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(29), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(29), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2b05 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(30), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(30), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2c02 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6k, g2a => \-pcc7\, g2q_n => pc7k, g3a => \-pcc8\, g3q_n => pc8k, g4q_n => pc9k, g4a => \-pcc9\, g5q_n => pc10k, g5a => \-pcc10\, g6q_n => pc11k, g6a => \-pcc11\);
--  iram22_2c03 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0k, g2a => \-pcc1\, g2q_n => pc1k, g3a => \-pcc2\, g3q_n => pc2k, g4q_n => pc3k, g4a => \-pcc3\, g5q_n => pc4k, g5a => \-pcc4\, g6q_n => pc5k, g6a => \-pcc5\);
--  iram22_2c04 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(24), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(24), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);
--  iram22_2c05 : am2147 port map(a0 => pc0k, a1 => pc1k, a2 => pc2k, a3 => pc3k, a4 => pc4k, a5 => pc5k, do => i(25), we_n => \-iwek\, ce_n => \-ice2c\, di => iwr(25), a11 => pc11k, a10 => pc10k, a9 => pc9k, a8 => pc8k, a7 => pc7k, a6 => pc6k);

--  iram23_2a06 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(31), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(31), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2a07 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(32), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(32), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2a08 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(33), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(33), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2a09 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(34), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(34), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2a10 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(35), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(35), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2b06 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(26), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(26), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2b07 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(27), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(27), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2b08 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(28), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(28), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2b09 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(29), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(29), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2b10 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(30), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(30), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2c07 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6l, g2a => \-pcc7\, g2q_n => pc7l, g3a => \-pcc8\, g3q_n => pc8l, g4q_n => pc9l, g4a => \-pcc9\, g5q_n => pc10l, g5a => \-pcc10\, g6q_n => pc11l, g6a => \-pcc11\);
--  iram23_2c08 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0l, g2a => \-pcc1\, g2q_n => pc1l, g3a => \-pcc2\, g3q_n => pc2l, g4q_n => pc3l, g4a => \-pcc3\, g5q_n => pc4l, g5a => \-pcc4\, g6q_n => pc5l, g6a => \-pcc5\);
--  iram23_2c09 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(24), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(24), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);
--  iram23_2c10 : am2147 port map(a0 => pc0l, a1 => pc1l, a2 => pc2l, a3 => pc3l, a4 => pc4l, a5 => pc5l, do => i(25), we_n => \-iwel\, ce_n => \-ice3c\, di => iwr(25), a11 => pc11l, a10 => pc10l, a9 => pc9l, a8 => pc8l, a7 => pc7l, a6 => pc6l);

--  iram30_2a11 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(44), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(44), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2a12 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(45), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(45), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2a13 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(46), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(46), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2a14 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(47), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(47), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2a15 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(48), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(48), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2b11 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(39), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(39), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2b12 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(40), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(40), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2b13 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(41), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(41), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2b14 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(42), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(42), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2b15 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(43), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(43), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2c11 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6m, g2a => \-pcc7\, g2q_n => pc7m, g3a => \-pcc8\, g3q_n => pc8m, g4q_n => pc9m, g4a => \-pcc9\, g5q_n => pc10m, g5a => \-pcc10\, g6q_n => pc11m, g6a => \-pcc11\);
--  iram30_2c12 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0m, g2a => \-pcc1\, g2q_n => pc1m, g3a => \-pcc2\, g3q_n => pc2m, g4q_n => pc3m, g4a => \-pcc3\, g5q_n => pc4m, g5a => \-pcc4\, g6q_n => pc5m, g6a => \-pcc5\);
--  iram30_2c13 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(36), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(36), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2c14 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(37), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(37), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);
--  iram30_2c15 : am2147 port map(a0 => pc0m, a1 => pc1m, a2 => pc2m, a3 => pc3m, a4 => pc4m, a5 => pc5m, do => i(38), we_n => \-iwem\, ce_n => \-ice0d\, di => iwr(38), a11 => pc11m, a10 => pc10m, a9 => pc9m, a8 => pc8m, a7 => pc7m, a6 => pc6m);

--  iram31_2a16 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(44), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(44), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2a17 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(45), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(45), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2a18 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(46), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(46), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2a19 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(47), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(47), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2a20 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(48), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(48), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2b16 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(39), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(39), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2b17 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(40), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(40), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2b18 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(41), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(41), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2b19 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(42), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(42), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2b20 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(43), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(43), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2c16 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6n, g2a => \-pcc7\, g2q_n => pc7n, g3a => \-pcc8\, g3q_n => pc8n, g4q_n => pc9n, g4a => \-pcc9\, g5q_n => pc10n, g5a => \-pcc10\, g6q_n => pc11n, g6a => \-pcc11\);
--  iram31_2c17 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0n, g2a => \-pcc1\, g2q_n => pc1n, g3a => \-pcc2\, g3q_n => pc2n, g4q_n => pc3n, g4a => \-pcc3\, g5q_n => pc4n, g5a => \-pcc4\, g6q_n => pc5n, g6a => \-pcc5\);
--  iram31_2c18 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(36), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(36), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2c19 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(37), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(37), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);
--  iram31_2c20 : am2147 port map(a0 => pc0n, a1 => pc1n, a2 => pc2n, a3 => pc3n, a4 => pc4n, a5 => pc5n, do => i(38), we_n => \-iwen\, ce_n => \-ice1d\, di => iwr(38), a11 => pc11n, a10 => pc10n, a9 => pc9n, a8 => pc8n, a7 => pc7n, a6 => pc6n);

--  iram32_2a21 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(44), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(44), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2a22 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(45), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(45), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2a23 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(46), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(46), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2a24 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(47), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(47), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2a25 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(48), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(48), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2b21 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(39), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(39), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2b22 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(40), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(40), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2b23 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(41), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(41), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2b24 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(42), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(42), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2b25 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(43), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(43), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2c21 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6o, g2a => \-pcc7\, g2q_n => pc7o, g3a => \-pcc8\, g3q_n => pc8o, g4q_n => pc9o, g4a => \-pcc9\, g5q_n => pc10o, g5a => \-pcc10\, g6q_n => pc11o, g6a => \-pcc11\);
--  iram32_2c22 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0o, g2a => \-pcc1\, g2q_n => pc1o, g3a => \-pcc2\, g3q_n => pc2o, g4q_n => pc3o, g4a => \-pcc3\, g5q_n => pc4o, g5a => \-pcc4\, g6q_n => pc5o, g6a => \-pcc5\);
--  iram32_2c23 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(36), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(36), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2c24 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(37), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(37), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);
--  iram32_2c25 : am2147 port map(a0 => pc0o, a1 => pc1o, a2 => pc2o, a3 => pc3o, a4 => pc4o, a5 => pc5o, do => i(38), we_n => \-iweo\, ce_n => \-ice2d\, di => iwr(38), a11 => pc11o, a10 => pc10o, a9 => pc9o, a8 => pc8o, a7 => pc7o, a6 => pc6o);

--  iram33_2a26 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(44), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(44), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2a27 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(45), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(45), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2a28 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(46), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(46), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2a29 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(47), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(47), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2a30 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(48), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(48), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2b26 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(39), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(39), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2b27 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(40), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(40), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2b28 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(41), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(41), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2b29 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(42), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(42), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2b30 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(43), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(43), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2c26 : sn74s04 port map(g1a => \-pcc6\, g1q_n => pc6p, g2a => \-pcc7\, g2q_n => pc7p, g3a => \-pcc8\, g3q_n => pc8p, g4q_n => pc9p, g4a => \-pcc9\, g5q_n => pc10p, g5a => \-pcc10\, g6q_n => pc11p, g6a => \-pcc11\);
--  iram33_2c27 : sn74s04 port map(g1a => \-pcc0\, g1q_n => pc0p, g2a => \-pcc1\, g2q_n => pc1p, g3a => \-pcc2\, g3q_n => pc2p, g4q_n => pc3p, g4a => \-pcc3\, g5q_n => pc4p, g5a => \-pcc4\, g6q_n => pc5p, g6a => \-pcc5\);
--  iram33_2c28 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(36), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(36), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2c29 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(37), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(37), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);
--  iram33_2c30 : am2147 port map(a0 => pc0p, a1 => pc1p, a2 => pc2p, a3 => pc3p, a4 => pc4p, a5 => pc5p, do => i(38), we_n => \-iwep\, ce_n => \-ice3d\, di => iwr(38), a11 => pc11p, a10 => pc10p, a9 => pc9p, a8 => pc8p, a7 => pc7p, a6 => pc6p);

--  iwr_1f12 : sn74s374 port map(oenb_n => gnd, o0 => iwr(47), i0 => aa15, i1 => aa14, o1 => iwr(46), o2 => iwr(45), i2 => aa13, i3 => aa12, o3 => iwr(44), clk => clk2c, o4 => iwr(43), i4 => aa11, i5 => aa10, o5 => iwr(42), o6 => iwr(41), i6 => aa9, i7 => aa8, o7 => iwr(40));
--  iwr_1f14 : sn74s374 port map(oenb_n => gnd, o0 => iwr(39), i0 => aa7, i1 => aa6, o1 => iwr(38), o2 => iwr(37), i2 => aa5, i3 => aa4, o3 => iwr(36), clk => clk2c, o4 => iwr(35), i4 => aa3, i5 => aa2, o5 => iwr(34), o6 => iwr(33), i6 => aa1, i7 => aa0, o7 => iwr(32));
--  iwr_4b01 : sn74s374 port map(oenb_n => gnd, o0 => iwr(15), i0 => m(15), i1 => m(14), o1 => iwr(14), o2 => iwr(13), i2 => m(13), i3 => m(12), o3 => iwr(12), clk => clk4c, o4 => iwr(11), i4 => m(11), i5 => m(10), o5 => iwr(10), o6 => iwr(9), i6 => m(9), i7 => m(8), o7 => iwr(8));
--  iwr_4b06 : sn74s374 port map(oenb_n => gnd, o0 => iwr(7), i0 => m(7), i1 => m(6), o1 => iwr(6), o2 => iwr(5), i2 => m(5), i3 => m(4), o3 => iwr(4), clk => clk4c, o4 => iwr(3), i4 => m(3), i5 => m(2), o5 => iwr(2), o6 => iwr(1), i6 => m(1), i7 => m(0), o7 => iwr(0));
--  iwr_4c04 : sn74s374 port map(oenb_n => gnd, o0 => iwr(31), i0 => m(31), i1 => m(30), o1 => iwr(30), o2 => iwr(29), i2 => m(29), i3 => m(28), o3 => iwr(28), clk => clk4c, o4 => iwr(27), i4 => m(27), i5 => m(26), o5 => iwr(26), o6 => iwr(25), i6 => m(25), i7 => m(24), o7 => iwr(24));
--  iwr_4c05 : sn74s374 port map(oenb_n => gnd, o0 => iwr(23), i0 => m(23), i1 => m(22), o1 => iwr(22), o2 => iwr(21), i2 => m(21), i3 => m(20), o3 => iwr(20), clk => clk4c, o4 => iwr(19), i4 => m(19), i5 => m(18), o5 => iwr(18), o6 => iwr(17), i6 => m(17), i7 => m(16), o7 => iwr(16));

--  pctl_1a16 : sn74ls244 port map(aenb_n => \-promenable\, ain0 => gnd, bout3 => nc(29), ain1 => nc(30), bout2 => nc(31), ain2 => nc(32), bout1 => nc(33), ain3 => nc(34), bout0 => nc(35), bin0 => nc(36), aout3 => nc(37), bin1 => nc(38), aout2 => nc(39), bin2 => nc(40), aout1 => nc(41), bin3 => nc(42), aout0 => i(46), benb_n => hi2);
--  pctl_1c17 : sn74s04 port map(g1a => pc(0), g1q_n => \-prompc\(0), g2a => pc(1), g2q_n => \-prompc\(1), g3a => pc(2), g3q_n => \-prompc\(2), g4q_n => \-prompc\(3), g4a => pc(3), g5q_n => \-prompc\(4), g5a => pc(4), g6q_n => nc(45), g6a => nc(46));
--  pctl_1c18 : sn74s32 port map(g1a => \-promenable\, g1b => pc(9), g1y => \-promce0\, g2a => \-prompc\(9), g2b => \-promenable\, g2y => \-promce1\, g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  pctl_1c19 : sn74s20 port map(g1a => \bottom.1k\, g1b => \-idebug\, g1c => \-promdisabled\, g1d => \-iwriteda\, g1y_n => \-promenable\, g2a => '0', g2b => '0', g2c => '0', g2d => '0');
--  pctl_1d18 : sn74s260 port map(g1a => gnd, g2a => pc(13), g3a => pc(12), g1y_n => \bottom.1k\, g4a => pc(11), g5a => pc(10));
--  pctl_1d19 : sn74s04 port map(g1a => pc(5), g1q_n => \-prompc\(5), g2a => pc(6), g2q_n => \-prompc\(6), g3a => pc(7), g3q_n => \-prompc\(7), g4q_n => \-prompc\(8), g4a => pc(8), g5q_n => \-prompc\(9), g5a => pc(9), g6q_n => nc(43), g6a => nc(44));
--  pctl_1e16 : sn74s20 port map(g1a => \-ape\, g1b => \-pdlpe\, g1c => \-spe\, g1d => \-mpe\, g1y_n => tilt1, g2y_n => tilt0, g2a => hi2, g2b => \-mempe\, g2c => \-v1pe\, g2d => \-v0pe\);
--  pctl_1f10 : sn74s04 port map(g3a => \-promenable\, g3q_n => promenable, g5q_n => dpe, g5a => \-dpe\, g6q_n => ipe, g6a => \-ipe\, g1a => '0', g2a => '0', g4a => '0');
--  pctl_1f16 : til309 port map(l2 => nc(4), l4 => nc(5), l8 => nc(6), l1 => nc(7), latch => gnd, i4 => pc(2), i8 => gnd, i2 => pc(1), blank_n => hi2, dp => tilt1, test_n => hi2, ldp => nc(8), i1 => pc(0));
--  pctl_1f17 : til309 port map(l2 => nc(9), l4 => nc(10), l8 => nc(11), l1 => nc(12), latch => gnd, i4 => pc(5), i8 => gnd, i2 => pc(4), blank_n => hi2, dp => tilt0, test_n => hi2, ldp => nc(13), i1 => pc(3));
--  pctl_1f18 : til309 port map(l2 => nc(14), l4 => nc(15), l8 => nc(16), l1 => nc(17), latch => gnd, i4 => pc(8), i8 => gnd, i2 => pc(7), blank_n => hi2, dp => dpe, test_n => hi2, ldp => nc(18), i1 => pc(6));
--  pctl_1f19 : til309 port map(l2 => nc(19), l4 => nc(20), l8 => nc(21), l1 => nc(22), latch => gnd, i4 => pc(11), i8 => gnd, i2 => pc(10), blank_n => hi2, dp => ipe, test_n => hi2, ldp => nc(23), i1 => pc(9));
--  pctl_1f20 : til309 port map(l2 => nc(24), l4 => nc(25), l8 => nc(26), l1 => nc(27), latch => gnd, i4 => gnd, i8 => gnd, i2 => pc(13), blank_n => hi2, dp => promenable, test_n => hi2, ldp => nc(28), i1 => pc(12));

--  prom0_1b17 : dm74s472 generic map (fn => "rom/prom0_1b17.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(32), d1 => i(33), d2 => i(34), d3 => i(35), d4 => i(36), d5 => i(37), d6 => i(38), d7 => i(39), ce_n => \-promce0\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));
--  prom0_1b19 : dm74s472 generic map (fn => "rom/prom0_1b19.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(40), d1 => i(41), d2 => i(42), d3 => i(43), d4 => i(44), d5 => i(45), d6 => i(47), d7 => i(48), ce_n => \-promce0\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));
--  prom0_1c20 : dm74s472 generic map (fn => "rom/prom0_1c20.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(24), d1 => i(25), d2 => i(26), d3 => i(27), d4 => i(28), d5 => i(29), d6 => i(30), d7 => i(31), ce_n => \-promce0\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));
--  prom0_1d16 : dm74s472 generic map (fn => "rom/prom0_1d16.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(16), d1 => i(17), d2 => i(18), d3 => i(19), d4 => i(20), d5 => i(21), d6 => i(22), d7 => i(23), ce_n => \-promce0\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));
--  prom0_1e17 : dm74s472 generic map (fn => "rom/prom0_1e17.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(0), d1 => i(1), d2 => i(2), d3 => i(3), d4 => i(4), d5 => i(5), d6 => i(6), d7 => i(7), ce_n => \-promce0\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));
--  prom0_1e19 : dm74s472 generic map (fn => "rom/prom0_1e19.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(8), d1 => i(9), d2 => i(10), d3 => i(11), d4 => i(12), d5 => i(13), d6 => i(14), d7 => i(15), ce_n => \-promce0\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));

--  prom1_1b16 : dm74s472 generic map (fn => "rom/prom1_1b16.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(24), d1 => i(25), d2 => i(26), d3 => i(27), d4 => i(28), d5 => i(29), d6 => i(30), d7 => i(31), ce_n => \-promce1\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));
--  prom1_1b18 : dm74s472 generic map (fn => "rom/prom1_1b18.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(32), d1 => i(33), d2 => i(34), d3 => i(35), d4 => i(36), d5 => i(37), d6 => i(38), d7 => i(39), ce_n => \-promce1\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));
--  prom1_1b20 : dm74s472 generic map (fn => "rom/prom1_1b20.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(40), d1 => i(41), d2 => i(42), d3 => i(43), d4 => i(44), d5 => i(45), d6 => i(47), d7 => i(48), ce_n => \-promce1\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));
--  prom1_1d17 : dm74s472 generic map (fn => "rom/prom1_1d17.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(16), d1 => i(17), d2 => i(18), d3 => i(19), d4 => i(20), d5 => i(21), d6 => i(22), d7 => i(23), ce_n => \-promce1\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));
--  prom1_1e18 : dm74s472 generic map (fn => "rom/prom1_1e18.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(0), d1 => i(1), d2 => i(2), d3 => i(3), d4 => i(4), d5 => i(5), d6 => i(6), d7 => i(7), ce_n => \-promce1\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));
--  prom1_1e20 : dm74s472 generic map (fn => "rom/prom1_1e20.hex") port map(a0 => \-prompc\(0), a1 => \-prompc\(1), a2 => \-prompc\(2), a3 => \-prompc\(3), a4 => \-prompc\(4), d0 => i(8), d1 => i(9), d2 => i(10), d3 => i(11), d4 => i(12), d5 => i(13), d6 => i(14), d7 => i(15), ce_n => \-promce1\, a5 => \-prompc\(5), a6 => \-prompc\(6), a7 => \-prompc\(7), a8 => \-prompc\(8));

--  debug_1e11 : sn74s374 port map(oenb_n => \-idebug\, o0 => i(39), i0 => spy(7), i1 => spy(6), o1 => i(38), o2 => i(37), i2 => spy(5), i3 => spy(4), o3 => i(36), clk => \-lddbirh\, o4 => i(35), i4 => spy(3), i5 => spy(2), o5 => i(34), o6 => i(33), i6 => spy(1), i7 => spy(0), o7 => i(32));
--  debug_1e12 : sn74s374 port map(oenb_n => \-idebug\, o0 => i(31), i0 => spy(15), i1 => spy(14), o1 => i(30), o2 => i(29), i2 => spy(13), i3 => spy(12), o3 => i(28), clk => \-lddbirm\, o4 => i(27), i4 => spy(11), i5 => spy(10), o5 => i(26), o6 => i(25), i6 => spy(9), i7 => spy(8), o7 => i(24));
--  debug_1e13 : sn74s374 port map(oenb_n => \-idebug\, o0 => i(23), i0 => spy(7), i1 => spy(6), o1 => i(22), o2 => i(21), i2 => spy(5), i3 => spy(4), o3 => i(20), clk => \-lddbirm\, o4 => i(19), i4 => spy(3), i5 => spy(2), o5 => i(18), o6 => i(17), i6 => spy(1), i7 => spy(0), o7 => i(16));
--  debug_1e14 : sn74s374 port map(oenb_n => \-idebug\, o0 => i(15), i0 => spy(15), i1 => spy(14), o1 => i(14), o2 => i(13), i2 => spy(13), i3 => spy(12), o3 => i(12), clk => \-lddbirl\, o4 => i(11), i4 => spy(11), i5 => spy(10), o5 => i(10), o6 => i(9), i6 => spy(9), i7 => spy(8), o7 => i(8));
--  debug_1e15 : sn74s374 port map(oenb_n => \-idebug\, o0 => i(7), i0 => spy(7), i1 => spy(6), o1 => i(6), o2 => i(5), i2 => spy(5), i3 => spy(4), o3 => i(4), clk => \-lddbirl\, o4 => i(3), i4 => spy(3), i5 => spy(2), o5 => i(2), o6 => i(1), i6 => spy(1), i7 => spy(0), o7 => i(0));
--  debug_1f15 : sn74s374 port map(oenb_n => \-idebug\, o0 => i(47), i0 => spy(15), i1 => spy(14), o1 => i(46), o2 => i(45), i2 => spy(13), i3 => spy(12), o3 => i(44), clk => \-lddbirh\, o4 => i(43), i4 => spy(11), i5 => spy(10), o5 => i(42), o6 => i(41), i6 => spy(9), i7 => spy(8), o7 => i(40));

--- Microinstrction Modification and Main Instruction Register

--  ior_3c06 : sn74s32 port map(g1a => i(12), g1b => ob(12), g1y => iob(12), g2a => i(13), g2b => ob(13), g2y => iob(13), g3y => iob(14), g3a => i(14), g3b => ob(14), g4y => iob(15), g4a => i(15), g4b => ob(15));
--  ior_3c07 : sn74s32 port map(g1a => i(8), g1b => ob(8), g1y => iob(8), g2a => i(9), g2b => ob(9), g2y => iob(9), g3y => iob(10), g3a => i(10), g3b => ob(10), g4y => iob(11), g4a => i(11), g4b => ob(11));
--  ior_3c08 : sn74s32 port map(g1a => i(4), g1b => ob(4), g1y => iob(4), g2a => i(5), g2b => ob(5), g2y => iob(5), g3y => iob(6), g3a => i(6), g3b => ob(6), g4y => iob(7), g4a => i(7), g4b => ob(7));
--  ior_3c09 : sn74s32 port map(g1a => i(0), g1b => ob(0), g1y => iob(0), g2a => i(1), g2b => ob(1), g2y => iob(1), g3y => iob(2), g3a => i(2), g3b => ob(2), g4y => iob(3), g4a => i(3), g4b => ob(3));
--  ior_3c16 : sn74s32 port map(g1a => i(20), g1b => ob(20), g1y => iob(20), g2a => i(21), g2b => ob(21), g2y => iob(21), g3y => iob(22), g3a => i(22), g3b => ob(22), g4y => iob(23), g4a => i(23), g4b => ob(23));
--  ior_3c18 : sn74s32 port map(g1a => i(16), g1b => ob(16), g1y => iob(16), g2a => i(17), g2b => ob(17), g2y => iob(17), g3y => iob(18), g3a => i(18), g3b => ob(18), g4y => iob(19), g4a => i(19), g4b => ob(19));
--  ior_3d08 : sn74s32 port map(g1a => i(44), g1b => ob(18), g1y => iob(44), g2a => i(45), g2b => ob(19), g2y => iob(45), g3y => iob(46), g3a => i(46), g3b => ob(20), g4y => iob(47), g4a => i(47), g4b => ob(21));
--  ior_3d09 : sn74s32 port map(g1a => i(40), g1b => ob(14), g1y => iob(40), g2a => i(41), g2b => ob(15), g2y => iob(41), g3y => iob(42), g3a => i(42), g3b => ob(16), g4y => iob(43), g4a => i(43), g4b => ob(17));
--  ior_3d10 : sn74s32 port map(g1a => i(36), g1b => ob(10), g1y => iob(36), g2a => i(37), g2b => ob(11), g2y => iob(37), g3y => iob(38), g3a => i(38), g3b => ob(12), g4y => iob(39), g4a => i(39), g4b => ob(13));
--  ior_3d13 : sn74s32 port map(g1a => i(32), g1b => ob(6), g1y => iob(32), g2a => i(33), g2b => ob(7), g2y => iob(33), g3y => iob(34), g3a => i(34), g3b => ob(8), g4y => iob(35), g4a => i(35), g4b => ob(9));
--  ior_3d14 : sn74s32 port map(g1a => i(28), g1b => ob(2), g1y => iob(28), g2a => i(29), g2b => ob(3), g2y => iob(29), g3y => iob(30), g3a => i(30), g3b => ob(4), g4y => iob(31), g4a => i(31), g4b => ob(5));
--  ior_3d15 : sn74s32 port map(g1a => i(24), g1b => ob(24), g1y => iob(24), g2a => i(25), g2b => ob(25), g2y => iob(25), g3y => iob(26), g3a => i(26), g3b => ob(0), g4y => iob(27), g4a => i(27), g4b => ob(1));

--  ireg_3c01 : am25s09 port map(sel => \-destimod0\, aq => ir(15), a0 => iob(15), a1 => i(15), b1 => i(14), b0 => iob(14), bq => ir(14), clk => clk3a, cq => ir(13), c0 => iob(13), c1 => i(13), d1 => i(12), d0 => iob(12), dq => ir(12));
--  ireg_3c02 : am25s09 port map(sel => \-destimod0\, aq => ir(11), a0 => iob(11), a1 => i(11), b1 => i(10), b0 => iob(10), bq => ir(10), clk => clk3a, cq => ir(9), c0 => iob(9), c1 => i(9), d1 => i(8), d0 => iob(8), dq => ir(8));
--  ireg_3c03 : am25s09 port map(sel => \-destimod0\, aq => ir(7), a0 => iob(7), a1 => i(7), b1 => i(6), b0 => iob(6), bq => ir(6), clk => clk3a, cq => ir(5), c0 => iob(5), c1 => i(5), d1 => i(4), d0 => iob(4), dq => ir(4));
--  ireg_3c04 : am25s09 port map(sel => \-destimod0\, aq => ir(3), a0 => iob(3), a1 => i(3), b1 => i(2), b0 => iob(2), bq => ir(2), clk => clk3a, cq => ir(1), c0 => iob(1), c1 => i(1), d1 => i(0), d0 => iob(0), dq => ir(0));
--  ireg_3c17 : am25s09 port map(sel => \-destimod0\, aq => ir(23), a0 => iob(23), a1 => i(23), b1 => i(22), b0 => iob(22), bq => ir(22), clk => clk3b, cq => ir(21), c0 => iob(21), c1 => i(21), d1 => i(20), d0 => iob(20), dq => ir(20));
--  ireg_3c19 : am25s09 port map(sel => \-destimod0\, aq => ir(19), a0 => iob(19), a1 => i(19), b1 => i(18), b0 => iob(18), bq => ir(18), clk => clk3b, cq => ir(17), c0 => iob(17), c1 => i(17), d1 => i(16), d0 => iob(16), dq => ir(16));
--  ireg_3d06 : am25s09 port map(sel => \-destimod1\, aq => nc(371), a0 => nc(372), a1 => nc(373), b1 => i(48), b0 => gnd, bq => ir(48), clk => clk3a, cq => ir(47), c0 => iob(47), c1 => i(47), d1 => i(46), d0 => iob(46), dq => ir(46));
--  ireg_3d07 : am25s09 port map(sel => \-destimod1\, aq => ir(45), a0 => iob(45), a1 => i(45), b1 => i(44), b0 => iob(44), bq => ir(44), clk => clk3a, cq => ir(43), c0 => iob(43), c1 => i(43), d1 => i(42), d0 => iob(42), dq => ir(42));
--  ireg_3d16 : am25s09 port map(sel => \-destimod1\, aq => ir(41), a0 => iob(41), a1 => i(41), b1 => i(40), b0 => iob(40), bq => ir(40), clk => clk3b, cq => ir(39), c0 => iob(39), c1 => i(39), d1 => i(38), d0 => iob(38), dq => ir(38));
--  ireg_3d17 : am25s09 port map(sel => \-destimod1\, aq => ir(37), a0 => iob(37), a1 => i(37), b1 => i(36), b0 => iob(36), bq => ir(36), clk => clk3b, cq => ir(35), c0 => iob(35), c1 => i(35), d1 => i(34), d0 => iob(34), dq => ir(34));
--  ireg_3d18 : am25s09 port map(sel => \-destimod1\, aq => ir(33), a0 => iob(33), a1 => i(33), b1 => i(32), b0 => iob(32), bq => ir(32), clk => clk3b, cq => ir(31), c0 => iob(31), c1 => i(31), d1 => i(30), d0 => iob(30), dq => ir(30));
--  ireg_3d19 : am25s09 port map(sel => \-destimod1\, aq => ir(29), a0 => iob(29), a1 => i(29), b1 => i(28), b0 => iob(28), bq => ir(28), clk => clk3b, cq => ir(27), c0 => iob(27), c1 => i(27), d1 => i(26), d0 => iob(26), dq => ir(26));
--  ireg_3d20 : am25s09 port map(sel => \-destimod0\, aq => nc(374), a0 => nc(375), a1 => nc(376), b1 => nc(377), b0 => nc(378), bq => nc(379), clk => clk3b, cq => ir(25), c0 => iob(25), c1 => i(25), d1 => i(24), d0 => iob(24), dq => ir(24));

--- IR Decoding

--  source_3d02 : sn74s00 port map(g2b => \-iralu\, g2a => \-irbyte\, g2q_n => dest, g3q_n => \-destmem\, g3b => ir(23), g3a => destm, g4q_n => \-specalu\, g4a => ir(8), g4b => iralu, g1b => '0', g1a => '0');
--  source_3d03 : sn74s04 port map(g1a => ir(22), g1q_n => \-ir22\, g2a => ir(25), g2q_n => \-ir25\, g3a => nc(198), g3q_n => nc(199), g4q_n => irdisp, g4a => \-irdisp\, g5q_n => irjump, g5a => \-irjump\, g6q_n => iralu, g6a => \-iralu\);
  source_3d04 : sn74s139 port map(nENB => \-specalu\, SEL(0) => ir(3), SEL(1) => ir(4),
                                  nY(0) => \-mul\, nY(1) => \-div\, nY(2) => nc(196), nY(3) => nc(197));
  source_3d05u: sn74s139 port map(nENB => nop, SEL(0) => ir(43), SEL(1) => ir(44),
                                  nY(0) => \-iralu\, nY(1) => \-irjump\, nY(2) => \-irdisp\, nY(3) => \-irbyte\);
  source_3d05l: sn74s139 port map(nY(3) => \-funct3\, nY(2) => \-funct2\, nY(1) => \-funct1\, nY(0) => \-funct0\,
                                   SEL(1) => ir(11), SEL(0) => ir(10), nENB => nop);
  source_3d11 : sn74s138 port map(SEL(0) => ir(19), SEL(1) => ir(20), SEL(2) => ir(21),
                                  nCE0 => ir(22), nCE1 => ir(23), CE2 => destm,
                                  nY(7) => nc(200), nY(6) => nc(201), nY(5) => nc(202), nY(4) => nc(203),
                                  nY(3) => nc(204), nY(2) => \-destintctl\, nY(1) => \-destlc\, nY(0) => nc(205));
  source_3d12 : sn74s138 port map(SEL(0) => ir(19), SEL(1) => ir(20), SEL(2) => ir(21),
                                  nCE0 => \-ir22\, nCE1 => ir(23), CE2 => destm,
                                  nY(7) => \-destimod1\, nY(6) => \-destimod0\, nY(5) => \-destspc\, nY(4) => \-destpdlp\,
                                  nY(3) => \-destpdlx\, nY(2) => \-destpdl(x)\, nY(1) => \-destpdl(p)\, nY(0) => \-destpdltop\);
--  source_3d21 : sn74s08 port map(g4q => destm, g4a => \-ir25\, g4b => dest, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3a => '0', g3b => '0');
  source_3d22 : sn74s138 port map(SEL(0) => ir(26), SEL(1) => ir(27), SEL(2) => ir(28),
                                  nCE0 => \-ir31\, nCE1 => ir(29), CE2 => hi5,
                                  nY(7) => \-srcq\, nY(6) => \-srcopc\, nY(5) => \-srcpdltop\, nY(4) => \-srcpdlpop\,
                                  nY(3) => \-srcpdlidx\, nY(2) => \-srcpdlptr\, nY(1) => \-srcspc\, nY(0) => \-srcdc\);
  source_3d23 : sn74s138 port map(SEL(0) => ir(26), SEL(1) => ir(27), SEL(2) => ir(28),
                                  nCE0 => \-ir31\, nCE1 => gnd, CE2 => ir(29),
                                  nY(7) => nc(206), nY(6) => nc(207), nY(5) => nc(208), nY(4) => \-srcspcpop\,
                                  nY(3) => \-srclc\, nY(2) => \-srcmd\, nY(1) => \-srcmap\, nY(0) => \-srcvma\);
--  source_3e05 : sn74s08 port map(g2b => \destimod0_l\, g2a => \iwrited_l\, g2q => internal18, g1b => '0', g1a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  source_3e09 : sn74s32 port map(g2a => \-destmem\, g2b => \-ir22\, g2y => \-destmdr\, g3y => \-destvma\, g3a => ir(22), g3b => \-destmem\, g1a => '0', g1b => '0', g4a => '0', g4b => '0');
--  source_4d10 : sn74s10 port map(g2a => internal18, g2b => \-destimod1\, g2c => \-idebug\, g2y_n => imod, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g3c => '0', g1c => '0');

--- A Memory

--  actl_3a06 : sn74s258 port map(sel => clk3e, d0 => wadr(0), d1 => ir(32), dy => \-aadr0b\, c0 => wadr(1), c1 => ir(33), cy => \-aadr1b\, by => \-aadr2b\, b1 => ir(34), b0 => wadr(2), ay => \-aadr3b\, a1 => ir(35), a0 => wadr(3), enb_n => gnd);
--  actl_3a12 : sn74s258 port map(sel => clk3d, d0 => wadr(4), d1 => ir(36), dy => \-aadr4b\, c0 => wadr(5), c1 => ir(37), cy => \-aadr5b\, by => \-aadr6b\, b1 => ir(38), b0 => wadr(6), ay => \-aadr7b\, a1 => ir(39), a0 => wadr(7), enb_n => gnd);
--  actl_3a16 : sn74s258 port map(sel => clk3d, d0 => wadr(0), d1 => ir(32), dy => \-aadr0a\, c0 => wadr(1), c1 => ir(33), cy => \-aadr1a\, by => \-aadr2a\, b1 => ir(34), b0 => wadr(2), ay => \-aadr3a\, a1 => ir(35), a0 => wadr(3), enb_n => gnd);
--  actl_3a21 : sn74s258 port map(sel => clk3d, d0 => wadr(4), d1 => ir(36), dy => \-aadr4a\, c0 => wadr(5), c1 => ir(37), cy => \-aadr5a\, by => \-aadr6a\, b1 => ir(38), b0 => wadr(6), ay => \-aadr7a\, a1 => ir(39), a0 => wadr(7), enb_n => gnd);
--  actl_3b15 : sn74s258 port map(sel => clk3d, d0 => wadr(8), d1 => ir(40), dy => \-aadr8a\, c0 => wadr(9), c1 => ir(41), cy => \-aadr9a\, by => \-aadr8b\, b1 => ir(40), b0 => wadr(8), ay => \-aadr9b\, a1 => ir(41), a0 => wadr(9), enb_n => gnd);
--  actl_3b16 : sn74s00 port map(g1b => apass1, g1a => apass2, g1q_n => \-apass\, g2b => \-apass\, g2a => tse3a, g2q_n => \-amemenb\, g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  actl_3b21 : dm93s46 port map(a0 => ir(32), b0 => wadr(0), a1 => ir(33), b1 => wadr(1), a2 => ir(34), b2 => wadr(2), enb => hi3, eq => apass1, a3 => ir(35), b3 => wadr(3), a4 => ir(36), b4 => wadr(4), a5 => ir(37), b5 => wadr(5));
--  actl_3b26 : sn74s174 port map(clr_n => \-reset\, q1 => wadr(0), d1 => ir(14), d2 => ir(15), q2 => wadr(1), d3 => ir(16), q3 => wadr(2), clk => clk3d, q4 => wadr(3), d4 => ir(17), q5 => destmd, d5 => destm, d6 => dest, q6 => destd);
--  actl_3b27 : dm93s46 port map(a0 => ir(38), b0 => wadr(6), a1 => ir(39), b1 => wadr(7), a2 => ir(40), b2 => wadr(8), enb => hi3, eq => apass2, a3 => ir(41), b3 => wadr(9), a4 => hi3, b4 => destd, a5 => gnd, b5 => gnd);
--  actl_3b28 : am25s09 port map(sel => destm, aq => wadr(7), a0 => ir(21), a1 => gnd, b1 => gnd, b0 => ir(20), bq => wadr(6), clk => clk3d, cq => wadr(5), c0 => ir(19), c1 => gnd, d1 => ir(18), d0 => ir(18), dq => wadr(4));
--  actl_3b29 : am25s09 port map(sel => destm, aq => nc(489), a0 => nc(490), a1 => nc(491), b1 => nc(492), b0 => nc(493), bq => nc(494), clk => clk3d, cq => wadr(9), c0 => ir(23), c1 => gnd, d1 => gnd, d0 => ir(22), dq => wadr(8));
--  actl_3b30 : sn74s37 port map(g1a => wp3a, g1b => destd, g1y => \-awpa\, g2a => wp3a, g2b => destd, g2y => \-awpb\, g3y => \-awpc\, g3a => destd, g3b => wp3a, g4a => '0', g4b => '0');
--  actl_4b11 : sn74s11 port map(g2a => apass1, g2b => apass2, g2c => tse4a, g2y => apassenb, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g3c => '0', g1c => '0');
--  actl_4b14 : sn74s10 port map(g3y_n => \-apassenb\, g3a => tse4a, g3b => apass2, g3c => apass1, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g2c => '0', g1c => '0');

--  amem0_3a07 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(22), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(22));
--  amem0_3a08 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(20), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(20));
--  amem0_3a09 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(18), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(18));
--  amem0_3a10 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(16), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(16));
--  amem0_3a11 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(23), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(23));
--  amem0_3a13 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(21), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(21));
--  amem0_3a14 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(19), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(19));
--  amem0_3a15 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(17), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(17));
--  amem0_3b06 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amemparity, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => lparity);
--  amem0_3b07 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(30), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(30));
--  amem0_3b08 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(28), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(28));
--  amem0_3b09 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(26), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(26));
--  amem0_3b10 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(24), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(24));
--  amem0_3b11 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(31), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(31));
--  amem0_3b12 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(29), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(29));
--  amem0_3b13 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(27), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(27));
--  amem0_3b14 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem(25), a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l(25));

--  amem1_3a17 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(6), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(6));
--  amem1_3a18 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(4), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(4));
--  amem1_3a19 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(2), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(2));
--  amem1_3a20 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(0), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(0));
--  amem1_3a22 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(7), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(7));
--  amem1_3a23 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(5), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(5));
--  amem1_3a24 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(3), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(3));
--  amem1_3a25 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(1), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(1));
--  amem1_3b17 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(14), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\, di => l(14));
--  amem1_3b18 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(12), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\, di => l(12));
--  amem1_3b19 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(10), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(10));
--  amem1_3b20 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(8), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(8));
--  amem1_3b22 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(15), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\, di => l(15));
--  amem1_3b23 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(13), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\, di => l(13));
--  amem1_3b24 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(11), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\, di => l(11));
--  amem1_3b25 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem(9), a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l(9));

--  alatch_3a01 : sn74s373 port map(oenb_n => \-amemenb\, o0 => a23, i0 => amem(23), i1 => amem(22), o1 => a22, o2 => a21, i2 => amem(21), i3 => amem(20), o3 => a20, hold_n => clk3e, o4 => a19, i4 => amem(19), i5 => amem(18), o5 => a18, o6 => a17, i6 => amem(17), i7 => amem(16), o7 => a16);
--  alatch_3a02 : sn74s241 port map(aenb_n => \-apassenb\, ain0 => l(15), bout3 => a8, ain1 => l(14), bout2 => a9, ain2 => l(13), bout1 => a10, ain3 => l(12), bout0 => a11, bin0 => l(11), aout3 => a12, bin1 => l(10), aout2 => a13, bin2 => l(9), aout1 => a14, bin3 => l(8), aout0 => a15, benb => apassenb);
--  alatch_3a03 : sn74s373 port map(oenb_n => \-amemenb\, o0 => a15, i0 => amem(15), i1 => amem(14), o1 => a14, o2 => a13, i2 => amem(13), i3 => amem(12), o3 => a12, hold_n => clk3e, o4 => a11, i4 => amem(11), i5 => amem(10), o5 => a10, o6 => a9, i6 => amem(9), i7 => amem(8), o7 => a8);
--  alatch_3a04 : sn74s241 port map(aenb_n => \-apassenb\, ain0 => l(7), bout3 => a0, ain1 => l(6), bout2 => a1, ain2 => l(5), bout1 => a2, ain3 => l(4), bout0 => a3, bin0 => l(3), aout3 => a4, bin1 => l(2), aout2 => a5, bin2 => l(1), aout1 => a6, bin3 => l(0), aout0 => a7, benb => apassenb);
--  alatch_3a05 : sn74s373 port map(oenb_n => \-amemenb\, o0 => a7, i0 => amem(7), i1 => amem(6), o1 => a6, o2 => a5, i2 => amem(5), i3 => amem(4), o3 => a4, hold_n => clk3e, o4 => a3, i4 => amem(3), i5 => amem(2), o5 => a2, o6 => a1, i6 => amem(1), i7 => amem(0), o7 => a0);
--  alatch_3b01 : sn74s241 port map(aenb_n => hi5, ain0 => nc(465), bout3 => a31b, ain1 => nc(466), bout2 => aparity, ain2 => nc(467), bout1 => nc(468), ain3 => nc(469), bout0 => nc(470), bin0 => nc(471), aout3 => nc(472), bin1 => nc(473), aout2 => nc(474), bin2 => lparity, aout1 => nc(475), bin3 => l(31), aout0 => nc(476), benb => apassenb);
--  alatch_3b02 : sn74s373 port map(oenb_n => \-amemenb\, o0 => nc(477), i0 => nc(478), i1 => nc(479), o1 => nc(480), o2 => nc(481), i2 => nc(482), i3 => nc(483), o3 => nc(484), hold_n => clk3e, o4 => nc(485), i4 => nc(486), i5 => nc(487), o5 => nc(488), o6 => aparity, i6 => amemparity, i7 => amem(31), o7 => a31b);
--  alatch_3b03 : sn74s241 port map(aenb_n => \-apassenb\, ain0 => l(31), bout3 => a24, ain1 => l(30), bout2 => a25, ain2 => l(29), bout1 => a26, ain3 => l(28), bout0 => a27, bin0 => l(27), aout3 => a28, bin1 => l(26), aout2 => a29, bin2 => l(25), aout1 => a30, bin3 => l(24), aout0 => a31a, benb => apassenb);
--  alatch_3b04 : sn74s373 port map(oenb_n => \-amemenb\, o0 => a31a, i0 => amem(31), i1 => amem(30), o1 => a30, o2 => a29, i2 => amem(29), i3 => amem(28), o3 => a28, hold_n => clk3e, o4 => a27, i4 => amem(27), i5 => amem(26), o5 => a26, o6 => a25, i6 => amem(25), i7 => amem(24), o7 => a24);
--  alatch_3b05 : sn74s241 port map(aenb_n => \-apassenb\, ain0 => l(23), bout3 => a16, ain1 => l(22), bout2 => a17, ain2 => l(21), bout1 => a18, ain3 => l(20), bout0 => a19, bin0 => l(19), aout3 => a20, bin1 => l(18), aout2 => a21, bin2 => l(17), aout1 => a22, bin3 => l(16), aout0 => a23, benb => apassenb);

--  apar_3a28 : am93s48 port map(i6 => a26, i5 => a27, i4 => a28, i3 => a29, i2 => a30, i1 => a31b, i0 => aparity, po => aparok, pe => nc(432), i11 => aparl, i10 => aparm, i9 => gnd, i8 => a24, i7 => a25);
--  apar_3a29 : am93s48 port map(i6 => a17, i5 => a18, i4 => a19, i3 => a20, i2 => a21, i1 => a22, i0 => a23, po => aparm, pe => nc(433), i11 => a12, i10 => a13, i9 => a14, i8 => a15, i7 => a16);
--  apar_3a30 : am93s48 port map(i6 => a5, i5 => a6, i4 => a7, i3 => a8, i2 => a9, i1 => a10, i0 => a11, po => aparl, pe => nc(434), i11 => a0, i10 => a1, i9 => a2, i8 => a3, i7 => a4);
--  apar_4a12 : am93s48 port map(i6 => m(17), i5 => m(18), i4 => m(19), i3 => m(20), i2 => m(21), i1 => m(22), i0 => m(23), po => mparm, pe => nc(436), i11 => m(12), i10 => m(13), i9 => m(14), i8 => m(15), i7 => m(16));
--  apar_4a14 : am93s48 port map(i6 => m(5), i5 => m(6), i4 => m(7), i3 => m(8), i2 => m(9), i1 => m(10), i0 => m(11), po => mparl, pe => nc(435), i11 => m(0), i10 => m(1), i9 => m(2), i8 => m(3), i7 => m(4));
--  apar_4a17 : sn74s00 port map(g1b => mpareven, g1a => srcm, g1q_n => mmemparok, g2b => mpareven, g2a => pdlenb, g2q_n => pdlparok, g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  apar_4b15 : am93s48 port map(i6 => m(26), i5 => m(27), i4 => m(28), i3 => m(29), i2 => m(30), i1 => m(31), i0 => mparity, po => mparodd, pe => mpareven, i11 => mparl, i10 => mparm, i9 => gnd, i8 => m(24), i7 => m(25));

--- M Memory

--  mctl_4a16 : sn74s258 port map(sel => clk4e, d0 => wadr(4), d1 => ir(30), dy => \-madr4a\, c0 => nc(335), c1 => nc(336), cy => nc(337), by => nc(338), b1 => nc(339), b0 => nc(340), ay => \-madr4b\, a1 => ir(30), a0 => wadr(4), enb_n => gnd);
--  mctl_4a18 : sn74s258 port map(sel => clk4e, d0 => wadr(0), d1 => ir(26), dy => \-madr0b\, c0 => wadr(1), c1 => ir(27), cy => \-madr1b\, by => \-madr2b\, b1 => ir(28), b0 => wadr(2), ay => \-madr3b\, a1 => ir(29), a0 => wadr(3), enb_n => gnd);
--  mctl_4a19 : res20 port map(r2 => nc(334), r3 => mmem(15), r4 => mmem(14), r5 => mmem(13), r6 => mmem(12), r7 => mmem(11), r8 => mmem(10), r9 => mmem(9), r11 => mmem(8), r12 => mmem(7), r13 => mmem(6), r14 => mmem(5), r15 => mmem(4), r16 => mmem(3), r17 => mmem(2), r18 => mmem(1), r19 => mmem(0));
--  mctl_4b11 : sn74s11 port map(g1a => mpass, g1b => tse4a, g3y => srcm, g3a => hi2, g3b => \-ir31\, g3c => \-mpass\, g1y => mpassl, g1c => \-ir31\, g2a => '0', g2b => '0', g2c => '0');
--  mctl_4b12 : sn74s04 port map(g1a => mpass, g1q_n => \-mpass\, g2a => '0', g3a => '0', g4a => '0', g5a => '0', g6a => '0');
--  mctl_4b14 : sn74s10 port map(g1a => mpass, g1b => tse4a, g2a => tse4a, g2b => \-ir31\, g2c => \-mpass\, g2y_n => \-mpassm\, g1y_n => \-mpassl\, g1c => \-ir31\, g3a => '0', g3b => '0', g3c => '0');
--  mctl_4b18 : dm93s46 port map(a0 => ir(26), b0 => wadr(0), a1 => ir(27), b1 => wadr(1), a2 => ir(28), b2 => wadr(2), enb => hi2, eq => mpass, a3 => ir(29), b3 => wadr(3), a4 => ir(30), b4 => wadr(4), a5 => hi2, b5 => destmd);
--  mctl_4b19 : sn74s258 port map(sel => clk4e, d0 => wadr(0), d1 => ir(26), dy => \-madr0a\, c0 => wadr(1), c1 => ir(27), cy => \-madr1a\, by => \-madr2a\, b1 => ir(28), b0 => wadr(2), ay => \-madr3a\, a1 => ir(29), a0 => wadr(3), enb_n => gnd);
--  mctl_4b20 : res20 port map(r2 => mmemparity, r3 => mmem(31), r4 => mmem(30), r5 => mmem(29), r6 => mmem(28), r7 => mmem(27), r8 => mmem(26), r9 => mmem(25), r11 => mmem(24), r12 => mmem(23), r13 => mmem(22), r14 => mmem(21), r15 => mmem(20), r16 => mmem(19), r17 => mmem(18), r18 => mmem(17), r19 => mmem(16));
--  mctl_4b22 : sn74s37 port map(g1a => destmd, g1b => wp4b, g1y => \-mwpa\, g2a => destmd, g2b => wp4b, g2y => \-mwpb\, g3a => '0', g3b => '0', g4a => '0', g4b => '0');

--  mmem_4a21 : dm82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l(16), a4 => \-madr4a\, ce => hi3, strobe => hi3, d0 => mmem(16), d1 => mmem(17), a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l(17), we1_n => gnd);
--  mmem_4a22 : dm82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l(12), a4 => \-madr4b\, ce => hi2, strobe => hi2, d0 => mmem(12), d1 => mmem(13), a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l(13), we1_n => gnd);
--  mmem_4a23 : dm82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l(8), a4 => \-madr4b\, ce => hi2, strobe => hi2, d0 => mmem(8), d1 => mmem(9), a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l(9), we1_n => gnd);
--  mmem_4a24 : dm82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l(4), a4 => \-madr4b\, ce => hi2, strobe => hi2, d0 => mmem(4), d1 => mmem(5), a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l(5), we1_n => gnd);
--  mmem_4a25 : dm82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l(0), a4 => \-madr4b\, ce => hi2, strobe => hi2, d0 => mmem(0), d1 => mmem(1), a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l(1), we1_n => gnd);
--  mmem_4a26 : dm82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l(18), a4 => \-madr4a\, ce => hi3, strobe => hi3, d0 => mmem(18), d1 => mmem(19), a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l(19), we1_n => gnd);
--  mmem_4a27 : dm82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l(14), a4 => \-madr4b\, ce => hi2, strobe => hi2, d0 => mmem(14), d1 => mmem(15), a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l(15), we1_n => gnd);
--  mmem_4a28 : dm82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l(10), a4 => \-madr4b\, ce => hi2, strobe => hi2, d0 => mmem(10), d1 => mmem(11), a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l(11), we1_n => gnd);
--  mmem_4a29 : dm82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l(6), a4 => \-madr4b\, ce => hi2, strobe => hi2, d0 => mmem(6), d1 => mmem(7), a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l(7), we1_n => gnd);
--  mmem_4a30 : dm82s21 port map(wclk_n => \-mwpb\, we0_n => gnd, i0 => l(2), a4 => \-madr4b\, ce => hi2, strobe => hi2, d0 => mmem(2), d1 => mmem(3), a3 => \-madr3b\, a2 => \-madr2b\, a1 => \-madr1b\, a0 => \-madr0b\, i1 => l(3), we1_n => gnd);
--  mmem_4b23 : dm82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l(28), a4 => \-madr4a\, ce => hi3, strobe => hi3, d0 => mmem(28), d1 => mmem(29), a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l(29), we1_n => gnd);
--  mmem_4b24 : dm82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l(24), a4 => \-madr4a\, ce => hi3, strobe => hi3, d0 => mmem(24), d1 => mmem(25), a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l(25), we1_n => gnd);
--  mmem_4b25 : dm82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l(20), a4 => \-madr4a\, ce => hi3, strobe => hi3, d0 => mmem(20), d1 => mmem(21), a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l(21), we1_n => gnd);
--  mmem_4b27 : dm82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => lparity, a4 => \-madr4a\, ce => hi3, strobe => hi3, d0 => mmemparity, d1 => nc(291), a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => nc(292), we1_n => nc(293));
--  mmem_4b28 : dm82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l(30), a4 => \-madr4a\, ce => hi3, strobe => hi3, d0 => mmem(30), d1 => mmem(31), a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l(31), we1_n => gnd);
--  mmem_4b29 : dm82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l(26), a4 => \-madr4a\, ce => hi3, strobe => hi3, d0 => mmem(26), d1 => mmem(27), a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l(27), we1_n => gnd);
--  mmem_4b30 : dm82s21 port map(wclk_n => \-mwpa\, we0_n => gnd, i0 => l(22), a4 => \-madr4a\, ce => hi3, strobe => hi3, d0 => mmem(22), d1 => mmem(23), a3 => \-madr3a\, a2 => \-madr2a\, a1 => \-madr1a\, a0 => \-madr0a\, i1 => l(23), we1_n => gnd);

--  mlatch_4a01 : sn74s373 port map(oenb_n => \-mpassm\, o0 => m(23), i0 => mmem(23), i1 => mmem(22), o1 => m(22), o2 => m(21), i2 => mmem(21), i3 => mmem(20), o3 => m(20), hold_n => clk4a, o4 => m(19), i4 => mmem(19), i5 => mmem(18), o5 => m(18), o6 => m(17), i6 => mmem(17), i7 => mmem(16), o7 => m(16));
--  mlatch_4a03 : sn74s373 port map(oenb_n => \-mpassm\, o0 => m(15), i0 => mmem(15), i1 => mmem(14), o1 => m(14), o2 => m(13), i2 => mmem(13), i3 => mmem(12), o3 => m(12), hold_n => clk4a, o4 => m(11), i4 => mmem(11), i5 => mmem(10), o5 => m(10), o6 => m(9), i6 => mmem(9), i7 => mmem(8), o7 => m(8));
--  mlatch_4a05 : sn74s373 port map(oenb_n => \-mpassm\, o0 => m(7), i0 => mmem(7), i1 => mmem(6), o1 => m(6), o2 => m(5), i2 => mmem(5), i3 => mmem(4), o3 => m(4), hold_n => clk4a, o4 => m(3), i4 => mmem(3), i5 => mmem(2), o5 => m(2), o6 => m(1), i6 => mmem(1), i7 => mmem(0), o7 => m(0));
--  mlatch_4a06 : sn74s241 port map(aenb_n => \-mpassl\, ain0 => l(15), bout3 => mf(8), ain1 => l(14), bout2 => mf(9), ain2 => l(13), bout1 => mf(10), ain3 => l(12), bout0 => mf(11), bin0 => l(11), aout3 => mf(12), bin1 => l(10), aout2 => mf(13), bin2 => l(9), aout1 => mf(14), bin3 => l(8), aout0 => mf(15), benb => mpassl);
--  mlatch_4a08 : sn74s241 port map(aenb_n => \-mpassl\, ain0 => l(7), bout3 => mf(0), ain1 => l(6), bout2 => mf(1), ain2 => l(5), bout1 => mf(2), ain3 => l(4), bout0 => mf(3), bin0 => l(3), aout3 => mf(4), bin1 => l(2), aout2 => mf(5), bin2 => l(1), aout1 => mf(6), bin3 => l(0), aout0 => mf(7), benb => mpassl);
--  mlatch_4b02 : sn74s373 port map(oenb_n => \-mpassm\, o0 => nc(294), i0 => nc(295), i1 => nc(296), o1 => nc(297), o2 => nc(298), i2 => nc(299), i3 => nc(300), o3 => nc(301), hold_n => clk4a, o4 => nc(302), i4 => nc(303), i5 => nc(304), o5 => nc(305), o6 => nc(306), i6 => nc(307), i7 => mmemparity, o7 => mparity);
--  mlatch_4b04 : sn74s373 port map(oenb_n => \-mpassm\, o0 => m(31), i0 => mmem(31), i1 => mmem(30), o1 => m(30), o2 => m(29), i2 => mmem(29), i3 => mmem(28), o3 => m(28), hold_n => clk4a, o4 => m(27), i4 => mmem(27), i5 => mmem(26), o5 => m(26), o6 => m(25), i6 => mmem(25), i7 => mmem(24), o7 => m(24));
--  mlatch_4b07 : sn74s241 port map(aenb_n => \-mpassl\, ain0 => l(31), bout3 => mf(24), ain1 => l(30), bout2 => mf(25), ain2 => l(29), bout1 => mf(26), ain3 => l(28), bout0 => mf(27), bin0 => l(27), aout3 => mf(28), bin1 => l(26), aout2 => mf(29), bin2 => l(25), aout1 => mf(30), bin3 => l(24), aout0 => mf(31), benb => mpassl);
--  mlatch_4b09 : sn74s241 port map(aenb_n => \-mpassl\, ain0 => l(23), bout3 => mf(16), ain1 => l(22), bout2 => mf(17), ain2 => l(21), bout1 => mf(18), ain3 => l(20), bout0 => mf(19), bin0 => l(19), aout3 => mf(20), bin1 => l(18), aout2 => mf(21), bin2 => l(17), aout1 => mf(22), bin3 => l(16), aout0 => mf(23), benb => mpassl);

--  mf_1a18 : sn74s00 port map(g1b => tse1a, g1a => mfenb, g1q_n => \-mfdrive\, g2b => '0', g2a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  mf_1a21 : sn74s241 port map(aenb_n => \-mfdrive\, ain0 => mf(23), bout3 => m(16), ain1 => mf(22), bout2 => m(17), ain2 => mf(21), bout1 => m(18), ain3 => mf(20), bout0 => m(19), bin0 => mf(19), aout3 => m(20), bin1 => mf(18), aout2 => m(21), bin2 => mf(17), aout1 => m(22), bin3 => mf(16), aout0 => m(23), benb => mfdrive);
--  mf_1a23 : sn74s241 port map(aenb_n => \-mfdrive\, ain0 => mf(15), bout3 => m(8), ain1 => mf(14), bout2 => m(9), ain2 => mf(13), bout1 => m(10), ain3 => mf(12), bout0 => m(11), bin0 => mf(11), aout3 => m(12), bin1 => mf(10), aout2 => m(13), bin2 => mf(9), aout1 => m(14), bin3 => mf(8), aout0 => m(15), benb => mfdrive);
--  mf_1a25 : sn74s241 port map(aenb_n => \-mfdrive\, ain0 => mf(7), bout3 => m(0), ain1 => mf(6), bout2 => m(1), ain2 => mf(5), bout1 => m(2), ain3 => mf(4), bout0 => m(3), bin0 => mf(3), aout3 => m(4), bin1 => mf(2), aout2 => m(5), bin2 => mf(1), aout1 => m(6), bin3 => mf(0), aout0 => m(7), benb => mfdrive);
--  mf_1b24 : sn74s241 port map(aenb_n => \-mfdrive\, ain0 => mf(31), bout3 => m(24), ain1 => mf(30), bout2 => m(25), ain2 => mf(29), bout1 => m(26), ain3 => mf(28), bout0 => m(27), bin0 => mf(27), aout3 => m(28), bin1 => mf(26), aout2 => m(29), bin2 => mf(25), aout1 => m(30), bin3 => mf(24), aout0 => m(31), benb => mfdrive);
--  mf_2a04 : sn74s08 port map(g2b => tse1a, g2a => mfenb, g2q => mfdrive, g1b => '0', g1a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  mf_3f14 : sn74s02 port map(g3b => pdlenb, g3a => spcenb, g3q_n => internal22, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g4b => '0', g4a => '0');
--  mf_4d06 : sn74s08 port map(g4q => mfenb, g4a => internal22, g4b => \-srcm\, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3a => '0', g3b => '0');
--  mf_4d08 : sn74s00 port map(g4q_n => \-srcm\, g4a => \-ir31\, g4b => \-mpass\, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3b => '0', g3a => '0');

--- Stack Buffer

--  pdlptr_3c21 : sn74s169 port map(up_dn => \-srcpdlpop\, clk => clk3f, i0 => ob(8), i1 => ob(9), i2 => nc(237), i3 => nc(238), enb_p_n => gnd, load_n => \-destpdlp\, enb_t_n => \-pdlcry7\, o3 => nc(239), o2 => nc(240), o1 => pdlptr(9), o0 => pdlptr(8), co_n => nc(241));
--  pdlptr_3c22 : am25s07 port map(enb_n => \-destpdlx\, d0 => pdlidx(6), i0 => ob(6), i1 => ob(7), d1 => pdlidx(7), i2 => ob(8), d2 => pdlidx(8), clk => clk3f, d3 => pdlidx(9), i3 => ob(9), d4 => nc(233), i4 => nc(234), i5 => nc(235), d5 => nc(236));
--  pdlptr_3d24 : sn74s169 port map(up_dn => \-srcpdlpop\, clk => clk3f, i0 => ob(4), i1 => ob(5), i2 => ob(6), i3 => ob(7), enb_p_n => gnd, load_n => \-destpdlp\, enb_t_n => \-pdlcry3\, o3 => pdlptr(7), o2 => pdlptr(6), o1 => pdlptr(5), o0 => pdlptr(4), co_n => \-pdlcry7\);
--  pdlptr_3d25 : am25s07 port map(enb_n => \-destpdlx\, d0 => pdlidx(0), i0 => ob(0), i1 => ob(1), d1 => pdlidx(1), i2 => ob(2), d2 => pdlidx(2), clk => clk3f, d3 => pdlidx(3), i3 => ob(3), d4 => pdlidx(4), i4 => ob(4), i5 => ob(5), d5 => pdlidx(5));
--  pdlptr_3d30 : sn74s169 port map(up_dn => \-srcpdlpop\, clk => clk3f, i0 => ob(0), i1 => ob(1), i2 => ob(2), i3 => ob(3), enb_p_n => gnd, load_n => \-destpdlp\, enb_t_n => \-pdlcnt\, o3 => pdlptr(3), o2 => pdlptr(2), o1 => pdlptr(1), o0 => pdlptr(0), co_n => \-pdlcry3\);
--  pdlptr_4c01 : sn74s241 port map(aenb_n => \-ppdrive\, ain0 => pdlptr(3), bout3 => mf(0), ain1 => pdlptr(2), bout2 => mf(1), ain2 => pdlptr(1), bout1 => mf(2), ain3 => pdlptr(0), bout0 => mf(3), bin0 => pdlidx(3), aout3 => mf(0), bin1 => pdlidx(2), aout2 => mf(1), bin2 => pdlidx(1), aout1 => mf(2), bin3 => pdlidx(0), aout0 => mf(3), benb => pidrive);
--  pdlptr_4d04 : sn74s241 port map(aenb_n => \-ppdrive\, ain0 => gnd, bout3 => mf(8), ain1 => gnd, bout2 => mf(9), ain2 => pdlptr(9), bout1 => mf(10), ain3 => pdlptr(8), bout0 => mf(11), bin0 => gnd, aout3 => mf(8), bin1 => gnd, aout2 => mf(9), bin2 => pdlidx(9), aout1 => mf(10), bin3 => pdlidx(8), aout0 => mf(11), benb => pidrive);
--  pdlptr_4d05 : sn74s241 port map(aenb_n => \-ppdrive\, ain0 => pdlptr(7), bout3 => mf(4), ain1 => pdlptr(6), bout2 => mf(5), ain2 => pdlptr(5), bout1 => mf(6), ain3 => pdlptr(4), bout0 => mf(7), bin0 => pdlidx(7), aout3 => mf(4), bin1 => pdlidx(6), aout2 => mf(5), bin2 => pdlidx(5), aout1 => mf(6), bin3 => pdlidx(4), aout0 => mf(7), benb => pidrive);
--  pdlptr_4d06 : sn74s08 port map(g3q => pidrive, g3a => srcpdlidx, g3b => tse4b, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g4a => '0', g4b => '0');
--  pdlptr_4d08 : sn74s00 port map(g3q_n => \-ppdrive\, g3b => srcpdlptr, g3a => tse4b, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g4a => '0', g4b => '0');

--  pdlctl_4c11 : sn74s175 port map(clr_n => \-reset\, q0 => pdlwrited, q0_n => \-pdlwrited\, d0 => pdlwrite, d1 => \-destpdl(x)\, q1_n => pwidx, q1 => \-pwidx\, clk => clk4f, q2 => imodd, q2_n => \-imodd\, d2 => imod, d3 => \-destspc\, q3_n => nc(242), q3 => \-destspcd\);
--  pdlctl_4c12 : sn74s258 port map(sel => \-pdlpb\, d0 => pdlptr(0), d1 => pdlidx(0), dy => \-pdla0b\, c0 => pdlptr(1), c1 => pdlidx(1), cy => \-pdla1b\, by => \-pdla2b\, b1 => pdlidx(2), b0 => pdlptr(2), ay => \-pdla3b\, a1 => pdlidx(3), a0 => pdlptr(3), enb_n => gnd);
--  pdlctl_4c16 : sn74s258 port map(sel => \-pdlpa\, d0 => pdlptr(8), d1 => pdlidx(8), dy => \-pdla8b\, c0 => pdlptr(9), c1 => pdlidx(9), cy => \-pdla9b\, by => \-pdla0a\, b1 => pdlidx(0), b0 => pdlptr(0), ay => \-pdla1a\, a1 => pdlidx(1), a0 => pdlptr(1), enb_n => gnd);
--  pdlctl_4c22 : sn74s258 port map(sel => \-pdlpa\, d0 => pdlptr(2), d1 => pdlidx(2), dy => \-pdla2a\, c0 => pdlptr(3), c1 => pdlidx(3), cy => \-pdla3a\, by => \-pdla4a\, b1 => pdlidx(4), b0 => pdlptr(4), ay => \-pdla5a\, a1 => pdlidx(5), a0 => pdlptr(5), enb_n => gnd);
--  pdlctl_4d06 : sn74s08 port map(g2b => internal19, g2a => \-destpdl(p)\, g2q => \-pdlcnt\, g1b => '0', g1a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  pdlctl_4d07 : sn74s51 port map(g1a => \-pwidx\, g2a => clk4b, g2b => ir(30), g2c => \-clk4e\, g2d => \-pwidx\, g2y => \-pdlpa\, g1y => \-pdlpb\, g1c => clk4b, g1d => ir(30), g1b => \-clk4e\);
--  pdlctl_4d08 : sn74s00 port map(g1b => \-srcpdlpop\, g1a => \-srcpdltop\, g1q_n => pdlenb, g2b => pdlenb, g2a => tse4b, g2q_n => \-pdldrive\, g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  pdlctl_4d10 : sn74s10 port map(g1a => \-destpdltop\, g1b => \-destpdl(x)\, g1y_n => pdlwrite, g1c => \-destpdl(p)\, g2a => '0', g2b => '0', g2c => '0', g3a => '0', g3b => '0', g3c => '0');
--  pdlctl_4d14 : sn74s258 port map(sel => \-pdlpb\, d0 => pdlptr(4), d1 => pdlidx(4), dy => \-pdla4b\, c0 => pdlptr(5), c1 => pdlidx(5), cy => \-pdla5b\, by => \-pdla6b\, b1 => pdlidx(6), b0 => pdlptr(6), ay => \-pdla7b\, a1 => pdlidx(7), a0 => pdlptr(7), enb_n => gnd);
--  pdlctl_4d20 : sn74s37 port map(g1a => pdlwrited, g1b => wp4a, g1y => \-pwpa\, g2a => pdlwrited, g2b => wp4a, g2y => \-pwpb\, g3y => \-pwpc\, g3a => wp4a, g3b => pdlwrited, g4a => '0', g4b => '0');
--  pdlctl_4d24 : sn74s258 port map(sel => \-pdlpa\, d0 => pdlptr(6), d1 => pdlidx(6), dy => \-pdla6a\, c0 => pdlptr(7), c1 => pdlidx(7), cy => \-pdla7a\, by => \-pdla8a\, b1 => pdlidx(8), b0 => pdlptr(8), ay => \-pdla9a\, a1 => pdlidx(9), a0 => pdlptr(9), enb_n => gnd);
--  pdlctl_4e03 : sn74s32 port map(g3y => internal19, g3a => \-srcpdlpop\, g3b => nop, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g4a => '0', g4b => '0');

--  pdl0_4c10 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdlparity, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => lparity);
--  pdl0_4c13 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(28), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l(28));
--  pdl0_4c14 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(27), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l(27));
--  pdl0_4c15 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(26), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l(26));
--  pdl0_4c17 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(21), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l(21));
--  pdl0_4c18 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(20), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l(20));
--  pdl0_4c19 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(19), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l(19));
--  pdl0_4c20 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(18), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l(18));
--  pdl0_4d11 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(31), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l(31));
--  pdl0_4d12 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(30), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l(30));
--  pdl0_4d13 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(29), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l(29));
--  pdl0_4d16 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(25), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l(25));
--  pdl0_4d17 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(24), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l(24));
--  pdl0_4d18 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(23), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l(23));
--  pdl0_4d19 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(22), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l(22));
--  pdl0_4d21 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(17), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l(17));
--  pdl0_4d22 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl(16), a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l(16));

--  pdl1_4c21 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(13), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\, di => l(13));
--  pdl1_4c23 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(12), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\, di => l(12));
--  pdl1_4c24 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(11), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\, di => l(11));
--  pdl1_4c25 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(10), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(10));
--  pdl1_4c26 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(4), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(4));
--  pdl1_4c27 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(3), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(3));
--  pdl1_4c28 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(2), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(2));
--  pdl1_4c29 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(1), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(1));
--  pdl1_4c30 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(0), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(0));
--  pdl1_4d23 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(15), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\, di => l(15));
--  pdl1_4d25 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(14), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\, di => l(14));
--  pdl1_4d26 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(9), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(9));
--  pdl1_4d27 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(8), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(8));
--  pdl1_4d28 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(7), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(7));
--  pdl1_4d29 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(6), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(6));
--  pdl1_4d30 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl(5), a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l(5));

--  platch_4a02 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m(15), i0 => pdl(15), i1 => pdl(14), o1 => m(14), o2 => m(13), i2 => pdl(13), i3 => pdl(12), o3 => m(12), hold_n => clk4a, o4 => m(11), i4 => pdl(11), i5 => pdl(10), o5 => m(10), o6 => m(9), i6 => pdl(9), i7 => pdl(8), o7 => m(8));
--  platch_4a04 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m(7), i0 => pdl(7), i1 => pdl(6), o1 => m(6), o2 => m(5), i2 => pdl(5), i3 => pdl(4), o3 => m(4), hold_n => clk4a, o4 => m(3), i4 => pdl(3), i5 => pdl(2), o5 => m(2), o6 => m(1), i6 => pdl(1), i7 => pdl(0), o7 => m(0));
--  platch_4b03 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m(31), i0 => pdl(31), i1 => pdl(30), o1 => m(30), o2 => m(29), i2 => pdl(29), i3 => pdl(28), o3 => m(28), hold_n => clk4a, o4 => m(27), i4 => pdl(27), i5 => pdl(26), o5 => m(26), o6 => m(25), i6 => pdl(25), i7 => pdl(24), o7 => m(24));
--  platch_4b05 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => m(23), i0 => pdl(23), i1 => pdl(22), o1 => m(22), o2 => m(21), i2 => pdl(21), i3 => pdl(20), o3 => m(20), hold_n => clk4a, o4 => m(19), i4 => pdl(19), i5 => pdl(18), o5 => m(18), o6 => m(17), i6 => pdl(17), i7 => pdl(16), o7 => m(16));
--  platch_4b08 : sn74s373 port map(oenb_n => \-pdldrive\, o0 => nc(219), i0 => nc(220), i1 => nc(221), o1 => nc(222), o2 => nc(223), i2 => nc(224), i3 => nc(225), o3 => nc(226), hold_n => clk4a, o4 => nc(227), i4 => nc(228), i5 => nc(229), o5 => nc(230), o6 => nc(231), i6 => nc(232), i7 => pdlparity, o7 => mparity);

--- The Shifter\Masker

--  smctl_2d15 : sn74s32 port map(g1a => \-sh4\, g1b => \-sr\, g1y => \-s4\, g2a => '0', g2b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  smctl_2d20 : sn74s02 port map(g1q_n => \-mr\, g1a => \-irbyte\, g1b => ir(13), g2q_n => \-sr\, g2a => \-irbyte\, g2b => ir(12), g3b => \-ir0\, g3a => \-sr\, g3q_n => s0, g4b => \-ir1\, g4a => \-sr\, g4q_n => s1);
--  smctl_2e10 : sn74s283 port map(s1 => nc(209), b1 => nc(210), a1 => nc(211), s0 => mskl(4), a0 => ir(9), b0 => mskr(4), c0 => mskl3cry, c4 => nc(212), s3 => nc(213), b3 => nc(214), a3 => nc(215), s2 => nc(216), a2 => nc(217), b2 => nc(218));
--  smctl_2e14 : sn74s02 port map(g1q_n => s3a, g1a => \-sr\, g1b => \-sh3\, g2q_n => s3b, g2a => \-sh3\, g2b => \-sr\, g3b => \-ir2\, g3a => \-sr\, g3q_n => s2a, g4b => \-sr\, g4a => \-ir2\, g4q_n => s2b);
--  smctl_2e19 : sn74s02 port map(g1q_n => s4, g1a => \-sr\, g1b => \-sh4\, g2q_n => mskr(0), g2a => \-mr\, g2b => \-ir0\, g3b => \-ir1\, g3a => \-mr\, g3q_n => mskr(1), g4b => \-ir2\, g4a => \-mr\, g4q_n => mskr(2));
--  smctl_2e25 : sn74s283 port map(s1 => mskl(1), b1 => mskr(1), a1 => ir(6), s0 => mskl(0), a0 => ir(5), b0 => mskr(0), c0 => gnd, c4 => mskl3cry, s3 => mskl(3), b3 => mskr(3), a3 => ir(8), s2 => mskl(2), a2 => ir(7), b2 => mskr(2));
--  smctl_2e30 : sn74s02 port map(g1q_n => mskr(3), g1a => \-mr\, g1b => \-sh3\, g2q_n => mskr(4), g2a => \-mr\, g2b => \-sh4\, g3b => '0', g3a => '0', g4b => '0', g4a => '0');

--  shift0_2c21 : am25s10 port map(i_3 => m(5), i_2 => m(6), i_1 => m(7), i0 => m(8), i1 => m(9), i2 => m(10), i3 => m(11), sel1 => s1, sel0 => s0, o3 => sa(11), o2 => sa(10), ce_n => gnd, o1 => sa(9), o0 => sa(8));
--  shift0_2c26 : am25s10 port map(i_3 => m(29), i_2 => m(30), i_1 => m(31), i0 => m(0), i1 => m(1), i2 => m(2), i3 => m(3), sel1 => s1, sel0 => s0, o3 => sa(3), o2 => sa(2), ce_n => gnd, o1 => sa(1), o0 => sa(0));
--  shift0_2d25 : am25s10 port map(i_3 => m(9), i_2 => m(10), i_1 => m(11), i0 => m(12), i1 => m(13), i2 => m(14), i3 => m(15), sel1 => s1, sel0 => s0, o3 => sa(15), o2 => sa(14), ce_n => gnd, o1 => sa(13), o0 => sa(12));
--  shift0_2d30 : am25s10 port map(i_3 => m(1), i_2 => m(2), i_1 => m(3), i0 => m(4), i1 => m(5), i2 => m(6), i3 => m(7), sel1 => s1, sel0 => s0, o3 => sa(7), o2 => sa(6), ce_n => gnd, o1 => sa(5), o0 => sa(4));
--  shift0_2e21 : am25s10 port map(i_3 => sa(6), i_2 => sa(10), i_1 => sa(14), i0 => sa(18), i1 => sa(22), i2 => sa(26), i3 => sa(30), sel1 => s3a, sel0 => s2a, o3 => r(14), o2 => r(10), ce_n => \-s4\, o1 => r(6), o0 => r(2));
--  shift0_2e22 : am25s10 port map(i_3 => sa(22), i_2 => sa(26), i_1 => sa(30), i0 => sa(2), i1 => sa(6), i2 => sa(10), i3 => sa(14), sel1 => s3a, sel0 => s2a, o3 => r(14), o2 => r(10), ce_n => s4, o1 => r(6), o0 => r(2));
--  shift0_2e23 : am25s10 port map(i_3 => sa(7), i_2 => sa(11), i_1 => sa(15), i0 => sa(19), i1 => sa(23), i2 => sa(27), i3 => sa(31), sel1 => s3a, sel0 => s2a, o3 => r(15), o2 => r(11), ce_n => \-s4\, o1 => r(7), o0 => r(3));
--  shift0_2e24 : am25s10 port map(i_3 => sa(23), i_2 => sa(27), i_1 => sa(31), i0 => sa(3), i1 => sa(7), i2 => sa(11), i3 => sa(15), sel1 => s3a, sel0 => s2a, o3 => r(15), o2 => r(11), ce_n => s4, o1 => r(7), o0 => r(3));
--  shift0_2e26 : am25s10 port map(i_3 => sa(4), i_2 => sa(8), i_1 => sa(12), i0 => sa(16), i1 => sa(20), i2 => sa(24), i3 => sa(28), sel1 => s3a, sel0 => s2a, o3 => r(12), o2 => r(8), ce_n => \-s4\, o1 => r(4), o0 => r(0));
--  shift0_2e27 : am25s10 port map(i_3 => sa(20), i_2 => sa(24), i_1 => sa(28), i0 => sa(0), i1 => sa(4), i2 => sa(8), i3 => sa(12), sel1 => s3a, sel0 => s2a, o3 => r(12), o2 => r(8), ce_n => s4, o1 => r(4), o0 => r(0));
--  shift0_2e28 : am25s10 port map(i_3 => sa(5), i_2 => sa(9), i_1 => sa(13), i0 => sa(17), i1 => sa(21), i2 => sa(25), i3 => sa(29), sel1 => s3a, sel0 => s2a, o3 => r(13), o2 => r(9), ce_n => \-s4\, o1 => r(5), o0 => r(1));
--  shift0_2e29 : am25s10 port map(i_3 => sa(21), i_2 => sa(25), i_1 => sa(29), i0 => sa(1), i1 => sa(5), i2 => sa(9), i3 => sa(13), sel1 => s3a, sel0 => s2a, o3 => r(13), o2 => r(9), ce_n => s4, o1 => r(5), o0 => r(1));

--  shift1_2c01 : am25s10 port map(i_3 => m(21), i_2 => m(22), i_1 => m(23), i0 => m(24), i1 => m(25), i2 => m(26), i3 => m(27), sel1 => s1, sel0 => s0, o3 => sa(27), o2 => sa(26), ce_n => gnd, o1 => sa(25), o0 => sa(24));
--  shift1_2c06 : am25s10 port map(i_3 => m(13), i_2 => m(14), i_1 => m(15), i0 => m(16), i1 => m(17), i2 => m(18), i3 => m(19), sel1 => s1, sel0 => s0, o3 => sa(19), o2 => sa(18), ce_n => gnd, o1 => sa(17), o0 => sa(16));
--  shift1_2d05 : am25s10 port map(i_3 => m(25), i_2 => m(26), i_1 => m(27), i0 => m(28), i1 => m(29), i2 => m(30), i3 => m(31), sel1 => s1, sel0 => s0, o3 => sa(31), o2 => sa(30), ce_n => gnd, o1 => sa(29), o0 => sa(28));
--  shift1_2d10 : am25s10 port map(i_3 => m(17), i_2 => m(18), i_1 => m(19), i0 => m(20), i1 => m(21), i2 => m(22), i3 => m(23), sel1 => s1, sel0 => s0, o3 => sa(23), o2 => sa(22), ce_n => gnd, o1 => sa(21), o0 => sa(20));
--  shift1_2e01 : am25s10 port map(i_3 => sa(22), i_2 => sa(26), i_1 => sa(30), i0 => sa(2), i1 => sa(6), i2 => sa(10), i3 => sa(14), sel1 => s3b, sel0 => s2b, o3 => r(30), o2 => r(26), ce_n => \-s4\, o1 => r(22), o0 => r(18));
--  shift1_2e02 : am25s10 port map(i_3 => sa(6), i_2 => sa(10), i_1 => sa(14), i0 => sa(18), i1 => sa(22), i2 => sa(26), i3 => sa(30), sel1 => s3b, sel0 => s2b, o3 => r(30), o2 => r(26), ce_n => s4, o1 => r(22), o0 => r(18));
--  shift1_2e03 : am25s10 port map(i_3 => sa(23), i_2 => sa(27), i_1 => sa(31), i0 => sa(3), i1 => sa(7), i2 => sa(11), i3 => sa(15), sel1 => s3b, sel0 => s2b, o3 => r(31), o2 => r(27), ce_n => \-s4\, o1 => r(23), o0 => r(19));
--  shift1_2e04 : am25s10 port map(i_3 => sa(7), i_2 => sa(11), i_1 => sa(15), i0 => sa(19), i1 => sa(23), i2 => sa(27), i3 => sa(31), sel1 => s3b, sel0 => s2b, o3 => r(31), o2 => r(27), ce_n => s4, o1 => r(23), o0 => r(19));
--  shift1_2e06 : am25s10 port map(i_3 => sa(20), i_2 => sa(24), i_1 => sa(28), i0 => sa(0), i1 => sa(4), i2 => sa(8), i3 => sa(12), sel1 => s3b, sel0 => s2b, o3 => r(28), o2 => r(24), ce_n => \-s4\, o1 => r(20), o0 => r(16));
--  shift1_2e07 : am25s10 port map(i_3 => sa(4), i_2 => sa(8), i_1 => sa(12), i0 => sa(16), i1 => sa(20), i2 => sa(24), i3 => sa(28), sel1 => s3b, sel0 => s2b, o3 => r(28), o2 => r(24), ce_n => s4, o1 => r(20), o0 => r(16));
--  shift1_2e08 : am25s10 port map(i_3 => sa(21), i_2 => sa(25), i_1 => sa(29), i0 => sa(1), i1 => sa(5), i2 => sa(9), i3 => sa(13), sel1 => s3b, sel0 => s2b, o3 => r(29), o2 => r(25), ce_n => \-s4\, o1 => r(21), o0 => r(17));
--  shift1_2e09 : am25s10 port map(i_3 => sa(5), i_2 => sa(9), i_1 => sa(13), i0 => sa(17), i1 => sa(21), i2 => sa(25), i3 => sa(29), sel1 => s3b, sel0 => s2b, o3 => r(29), o2 => r(25), ce_n => s4, o1 => r(21), o0 => r(17));

--  mskg4_2d11 : im5600 generic map(fn => "rom/mskg4_2d11.hex") port map(o0 => msk(24), o1 => msk(25), o2 => msk(26), o3 => msk(27), o4 => msk(28), o5 => msk(29), o6 => msk(30), o7 => msk(31), a0 => mskl(0), a1 => mskl(1), a2 => mskl(2), a3 => mskl(3), a4 => mskl(4), ce_n => gnd);
--  mskg4_2d12 : im5600 generic map(fn => "rom/mskg4_2d12.hex") port map(o0 => msk(24), o1 => msk(25), o2 => msk(26), o3 => msk(27), o4 => msk(28), o5 => msk(29), o6 => msk(30), o7 => msk(31), a0 => mskr(0), a1 => mskr(1), a2 => mskr(2), a3 => mskr(3), a4 => mskr(4), ce_n => gnd);
--  mskg4_2d16 : im5600 generic map(fn => "rom/mskg4_2d16.hex") port map(o0 => msk(8), o1 => msk(9), o2 => msk(10), o3 => msk(11), o4 => msk(12), o5 => msk(13), o6 => msk(14), o7 => msk(15), a0 => mskl(0), a1 => mskl(1), a2 => mskl(2), a3 => mskl(3), a4 => mskl(4), ce_n => gnd);
--  mskg4_2d17 : im5600 generic map(fn => "rom/mskg4_2d17.hex") port map(o0 => msk(8), o1 => msk(9), o2 => msk(10), o3 => msk(11), o4 => msk(12), o5 => msk(13), o6 => msk(14), o7 => msk(15), a0 => mskr(0), a1 => mskr(1), a2 => mskr(2), a3 => mskr(3), a4 => mskr(4), ce_n => gnd);
--  mskg4_2d26 : sn74s04 port map(g1a => nc(253), g1q_n => nc(254), g2a => ir(31), g2q_n => \-ir31\, g3a => ir(13), g3q_n => \-ir13\, g4q_n => \-ir12\, g4a => ir(12), g5q_n => nc(255), g5a => nc(256), g6q_n => nc(257), g6a => nc(258));
--  mskg4_2e11 : im5600 generic map(fn => "rom/mskg4_2e11.hex") port map(o0 => msk(16), o1 => msk(17), o2 => msk(18), o3 => msk(19), o4 => msk(20), o5 => msk(21), o6 => msk(22), o7 => msk(23), a0 => mskl(0), a1 => mskl(1), a2 => mskl(2), a3 => mskl(3), a4 => mskl(4), ce_n => gnd);
--  mskg4_2e12 : im5600 generic map(fn => "rom/mskg4_2e12.hex") port map(o0 => msk(16), o1 => msk(17), o2 => msk(18), o3 => msk(19), o4 => msk(20), o5 => msk(21), o6 => msk(22), o7 => msk(23), a0 => mskr(0), a1 => mskr(1), a2 => mskr(2), a3 => mskr(3), a4 => mskr(4), ce_n => gnd);
--  mskg4_2e15 : res20 port map(r2 => aeqm, r3 => msk(31), r4 => msk(30), r5 => msk(29), r6 => msk(28), r7 => msk(27), r8 => msk(26), r9 => msk(25), r11 => msk(24), r12 => msk(23), r13 => msk(22), r14 => msk(21), r15 => msk(20), r16 => msk(19), r17 => msk(18), r18 => msk(17), r19 => msk(16));
--  mskg4_2e16 : im5600 generic map(fn => "rom/mskg4_2e16.hex") port map(o0 => msk(0), o1 => msk(1), o2 => msk(2), o3 => msk(3), o4 => msk(4), o5 => msk(5), o6 => msk(6), o7 => msk(7), a0 => mskl(0), a1 => mskl(1), a2 => mskl(2), a3 => mskl(3), a4 => mskl(4), ce_n => gnd);
--  mskg4_2e17 : im5600 generic map(fn => "rom/mskg4_2e17.hex") port map(o0 => msk(0), o1 => msk(1), o2 => msk(2), o3 => msk(3), o4 => msk(4), o5 => msk(5), o6 => msk(6), o7 => msk(7), a0 => mskr(0), a1 => mskr(1), a2 => mskr(2), a3 => mskr(3), a4 => mskr(4), ce_n => gnd);
--  mskg4_2e20 : res20 port map(r2 => nc(252), r3 => msk(15), r4 => msk(14), r5 => msk(13), r6 => msk(12), r7 => msk(11), r8 => msk(10), r9 => msk(9), r11 => msk(8), r12 => msk(7), r13 => msk(6), r14 => msk(5), r15 => msk(4), r16 => msk(3), r17 => msk(2), r18 => msk(1), r19 => msk(0));

--- The ALU

--  aluc4_2a16 : sn74s37 port map(g1a => \-aluf0\, g1b => \-aluf0\, g1y => aluf0b, g2a => \-aluf1\, g2b => \-aluf1\, g2y => aluf1b, g3y => aluf2b, g3a => \-aluf2\, g3b => \-aluf2\, g4y => aluf3b, g4a => \-aluf3\, g4b => \-aluf3\);
--  aluc4_2a17 : sn74s37 port map(g1a => \-aluf0\, g1b => \-aluf0\, g1y => aluf0a, g2a => \-aluf1\, g2b => \-aluf1\, g2y => aluf1a, g3y => aluf2a, g3a => \-aluf2\, g3b => \-aluf2\, g4y => aluf3a, g4a => \-aluf3\, g4b => \-aluf3\);
--  aluc4_2a18 : sn74s182 port map(y1 => yy1, x1 => xx1, y0 => yy0, x0 => xx0, y3 => nc(437), x3 => nc(438), xout => nc(439), cout2_n => nc(440), yout => nc(441), cout1_n => \-cin32\, cout0_n => \-cin16\, cin_n => \-cin0\, y2 => nc(442), x2 => nc(443));
--  aluc4_2a19 : sn74s182 port map(y1 => yout23, x1 => xout23, y0 => yout19, x0 => xout19, y3 => yout31, x3 => xout31, xout => xx1, cout2_n => \-cin28\, yout => yy1, cout1_n => \-cin24\, cout0_n => \-cin20\, cin_n => \-cin16\, y2 => yout27, x2 => xout27);
--  aluc4_2a20 : sn74s182 port map(y1 => yout7, x1 => xout7, y0 => yout3, x0 => xout3, y3 => yout15, x3 => xout15, xout => xx0, cout2_n => \-cin12\, yout => yy0, cout1_n => \-cin8\, cout0_n => \-cin4\, cin_n => \-cin0\, y2 => yout11, x2 => xout11);
--  aluc4_2b16 : sn74s153 port map(enb1_n => gnd, sel1 => alusub, g1c3 => gnd, g1c2 => hi12, g1c1 => gnd, g1c0 => \-ir3\, g1q => \-aluf3\, g2q => \-aluf2\, g2c0 => \-ir4\, g2c1 => hi12, g2c2 => gnd, g2c3 => gnd, sel0 => aluadd, enb2_n => gnd);
--  aluc4_2b17 : sn74s153 port map(enb1_n => gnd, sel1 => alusub, g1c3 => gnd, g1c2 => gnd, g1c1 => hi12, g1c0 => ir(6), g1q => \-aluf1\, g2q => \-aluf0\, g2c0 => ir(5), g2c1 => gnd, g2c2 => hi12, g2c3 => gnd, sel0 => aluadd, enb2_n => gnd);
--  aluc4_2b18 : sn74s153 port map(enb1_n => gnd, sel1 => alusub, g1c3 => gnd, g1c2 => hi12, g1c1 => hi12, g1c0 => ir(7), g1q => \-alumode\, g2q => \-cin0\, g2c0 => \-ir2\, g2c1 => hi12, g2c2 => irjump, g2c3 => gnd, sel0 => aluadd, enb2_n => gnd);
--  aluc4_2b20 : sn74s37 port map(g1a => \-alumode\, g1b => \-alumode\, g1y => alumode, g2a => '0', g2b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  aluc4_2c10 : sn74s02 port map(g1q_n => internal33, g1a => ir(5), g1b => \-divposlasttime\, g2q_n => \-divposlasttime\, g2a => q(0), g2b => ir(6), g3b => \-divposlasttime\, g3a => \-div\, g3q_n => divsubcond, g4b => internal33, g4a => \-div\, g4q_n => divaddcond);
--  aluc4_2c11 : sn74s04 port map(g1a => a31b, g1q_n => \-a31\, g2a => ir(4), g2q_n => \-ir4\, g3a => ir(3), g3q_n => \-ir3\, g4q_n => \-ir2\, g4a => ir(2), g5q_n => \-ir1\, g5a => ir(1), g6q_n => \-ir0\, g6a => ir(0));
--  aluc4_2c15 : sn74s00 port map(g1b => divaddcond, g1a => \-a31\, g1q_n => internal34, g2b => divsubcond, g2a => a31a, g2q_n => internal35, g3q_n => internal36, g3b => divsubcond, g3a => \-a31\, g4q_n => internal37, g4a => divaddcond, g4b => a31a);
--  aluc4_2c20 : sn74s20 port map(g1a => \-mulnop\, g1b => internal36, g1c => internal37, g1d => \-irjump\, g1y_n => alusub, g2y_n => aluadd, g2a => \-mul\, g2b => hi12, g2c => internal35, g2d => internal34);
--  aluc4_2d15 : sn74s32 port map(g2a => \-mul\, g2b => q(0), g2y => \-mulnop\, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  aluc4_2d21 : sn7428 port map(g1q_n => osel1a, g1a => \-ir13\, g1b => \-iralu\, g2q_n => osel0a, g2a => \-ir12\, g2b => \-iralu\, g3a => \-iralu\, g3b => \-ir13\, g3q_n => osel1b, g4a => \-iralu\, g4b => \-ir12\, g4q_n => osel0b);

  alu0_2a23 : sn74s181 port map(B(0) => a12, B(1) => a13, B(2) => a14, B(3) => a15,
                                A(0) => m(12), A(1) => m(13), A(2) => m(14), A(3) => m(15),
                                S(3) => aluf3b, S(2) => aluf2b, S(1) => aluf1b, S(0) => aluf0b,
                                nC_in => \-cin12\, M => alumode,
                                F(0) => alu(12), F(1) => alu(13), F(2) => alu(14), F(3) => alu(15),
                                A_EQ_B => aeqm, X => xout15, nC_out => nc(461), Y => yout15);
  alu0_2a28 : sn74s181 port map(B(3) => a7, B(2) => a6, B(1) => a5, B(0) => a4,
                                A(3) => m(7), A(2) => m(6), A(1) => m(5), A(0) => m(4),
                                S(3) => aluf3b, S(2) => aluf2b, S(1) => aluf1b, S(0) => aluf0b, nC_in => \-cin4\, M => alumode,
                                F(0) => alu(4), F(1) => alu(5), F(2)=> alu(6), F(3) => alu(7),
                                A_EQ_B => aeqm, X => xout7, nC_out => nc(463), Y => yout7);
--  alu0_2b23 : sn74s181 port map(b0 => a8, a0 => m(8), s3 => aluf3b, s2 => aluf2b, s1 => aluf1b, s0 => aluf0b, cin_n => \-cin8\, m => alumode, f0 => alu(8), f1 => alu(9), f2 => alu(10), f3 => alu(11), aeb => aeqm, x => xout11, cout_n => nc(462), y => yout11, b3 => a11, a3 => m(11), b2 => a10, a2 => m(10), b1 => a9, a1 => m(9));
--  alu0_2b28 : sn74s181 port map(b0 => a0, a0 => m(0), s3 => aluf3b, s2 => aluf2b, s1 => aluf1b, s0 => aluf0b, cin_n => \-cin0\, m => alumode, f0 => alu(0), f1 => alu(1), f2 => alu(2), f3 => alu(3), aeb => aeqm, x => xout3, cout_n => nc(464), y => yout3, b3 => a3, a3 => m(3), b2 => a2, a2 => m(2), b1 => a1, a1 => m(1));

--  alu1_2a03 : sn74s181 port map(b0 => a31a, a0 => m31b, s3 => aluf3a, s2 => aluf2a, s1 => aluf1a, s0 => aluf0a, cin_n => \-cin32\, m => alumode, f0 => alu(32), f1 => nc(444), f2 => nc(445), f3 => nc(446), aeb => nc(447), x => nc(448), cout_n => nc(449), y => nc(450), b3 => nc(451), a3 => nc(452), b2 => nc(453), a2 => nc(454), b1 => nc(455), a1 => nc(456));
--  alu1_2a04 : sn74s08 port map(g1b => m(31), g1a => hi12, g1q => m31b, g2b => '0', g2a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  alu1_2a08 : sn74s181 port map(b0 => a28, a0 => m(28), s3 => aluf3a, s2 => aluf2a, s1 => aluf1a, s0 => aluf0a, cin_n => \-cin28\, m => alumode, f0 => alu(28), f1 => alu(29), f2 => alu(30), f3 => alu(31), aeb => aeqm, x => xout31, cout_n => nc(457), y => yout31, b3 => a31b, a3 => m31b, b2 => a30, a2 => m(30), b1 => a29, a1 => m(29));
--  alu1_2a13 : sn74s181 port map(b0 => a20, a0 => m(20), s3 => aluf3a, s2 => aluf2a, s1 => aluf1a, s0 => aluf0a, cin_n => \-cin20\, m => alumode, f0 => alu(20), f1 => alu(21), f2 => alu(22), f3 => alu(23), aeb => aeqm, x => xout23, cout_n => nc(459), y => yout23, b3 => a23, a3 => m(23), b2 => a22, a2 => m(22), b1 => a21, a1 => m(21));
--  alu1_2b08 : sn74s181 port map(b0 => a24, a0 => m(24), s3 => aluf3a, s2 => aluf2a, s1 => aluf1a, s0 => aluf0a, cin_n => \-cin24\, m => alumode, f0 => alu(24), f1 => alu(25), f2 => alu(26), f3 => alu(27), aeb => aeqm, x => xout27, cout_n => nc(458), y => yout27, b3 => a27, a3 => m(27), b2 => a26, a2 => m(26), b1 => a25, a1 => m(25));
--  alu1_2b13 : sn74s181 port map(b0 => a16, a0 => m(16), s3 => aluf3a, s2 => aluf2a, s1 => aluf1a, s0 => aluf0a, cin_n => \-cin16\, m => alumode, f0 => alu(16), f1 => alu(17), f2 => alu(18), f3 => alu(19), aeb => aeqm, x => xout19, cout_n => nc(460), y => yout19, b3 => a19, a3 => m(19), b2 => a18, a2 => m(18), b1 => a17, a1 => m(17));

--- The Q Register

--  qctl_1a18 : sn74s00 port map(g3q_n => \-qdrive\, g3b => tse2, g3a => srcq, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g4a => '0', g4b => '0');
--  qctl_1e12 : sn74s241 port map(aenb_n => \-qdrive\, ain0 => q(7), bout3 => mf(0), ain1 => q(6), bout2 => mf(1), ain2 => q(5), bout1 => mf(2), ain3 => q(4), bout0 => mf(3), bin0 => q(3), aout3 => mf(4), bin1 => q(2), aout2 => mf(5), bin2 => q(1), aout1 => mf(6), bin3 => q(0), aout0 => mf(7), benb => qdrive);
--  qctl_1f08 : sn74s241 port map(aenb_n => \-qdrive\, ain0 => q(31), bout3 => mf(24), ain1 => q(30), bout2 => mf(25), ain2 => q(29), bout1 => mf(26), ain3 => q(28), bout0 => mf(27), bin0 => q(27), aout3 => mf(28), bin1 => q(26), aout2 => mf(29), bin2 => q(25), aout1 => mf(30), bin3 => q(24), aout0 => mf(31), benb => qdrive);
--  qctl_1f10 : sn74s241 port map(aenb_n => \-qdrive\, ain0 => q(23), bout3 => mf(16), ain1 => q(22), bout2 => mf(17), ain2 => q(21), bout1 => mf(18), ain3 => q(20), bout0 => mf(19), bin0 => q(19), aout3 => mf(20), bin1 => q(18), aout2 => mf(21), bin2 => q(17), aout1 => mf(22), bin3 => q(16), aout0 => mf(23), benb => qdrive);
--  qctl_1f15 : sn74s241 port map(aenb_n => \-qdrive\, ain0 => q(15), bout3 => mf(8), ain1 => q(14), bout2 => mf(9), ain2 => q(13), bout1 => mf(10), ain3 => q(12), bout0 => mf(11), bin0 => q(11), aout3 => mf(12), bin1 => q(10), aout2 => mf(13), bin2 => q(9), aout1 => mf(14), bin3 => q(8), aout0 => mf(15), benb => qdrive);
--  qctl_2a04 : sn74s08 port map(g4q => qdrive, g4a => tse2, g4b => srcq, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3a => '0', g3b => '0');
--  qctl_2a05 : sn74s04 port map(g5q_n => srcq, g5a => \-srcq\, g6q_n => \-alu31\, g6a => alu(31), g1a => '0', g2a => '0', g3a => '0', g4a => '0');
--  qctl_2b19 : sn7428 port map(g3a => \-iralu\, g3b => \-ir1\, g3q_n => qs1, g4a => \-iralu\, g4b => \-ir0\, g4q_n => qs0, g1a => '0', g1b => '0', g2a => '0', g2b => '0');

--  q_2c07 : sn74s194 port map(clr_n => hi7, sir => q(23), i0 => alu(24), i1 => alu(25), i2 => alu(26), i3 => alu(27), sil => q(28), s0 => qs0, s1 => qs1, clk => clk2b, q3 => q(27), q2 => q(26), q1 => q(25), q0 => q(24));
--  q_2c08 : sn74s194 port map(clr_n => hi7, sir => q(27), i0 => alu(28), i1 => alu(29), i2 => alu(30), i3 => alu(31), sil => alu(0), s0 => qs0, s1 => qs1, clk => clk2b, q3 => q(31), q2 => q(30), q1 => q(29), q0 => q(28));
--  q_2c12 : sn74s194 port map(clr_n => hi7, sir => q(15), i0 => alu(16), i1 => alu(17), i2 => alu(18), i3 => alu(19), sil => q(20), s0 => qs0, s1 => qs1, clk => clk2b, q3 => q(19), q2 => q(18), q1 => q(17), q0 => q(16));
--  q_2c13 : sn74s194 port map(clr_n => hi7, sir => q(19), i0 => alu(20), i1 => alu(21), i2 => alu(22), i3 => alu(23), sil => q(24), s0 => qs0, s1 => qs1, clk => clk2b, q3 => q(23), q2 => q(22), q1 => q(21), q0 => q(20));
--  q_2c22 : sn74s194 port map(clr_n => hi7, sir => q(7), i0 => alu(8), i1 => alu(9), i2 => alu(10), i3 => alu(11), sil => q(12), s0 => qs0, s1 => qs1, clk => clk2b, q3 => q(11), q2 => q(10), q1 => q(9), q0 => q(8));
--  q_2c23 : sn74s194 port map(clr_n => hi7, sir => q(11), i0 => alu(12), i1 => alu(13), i2 => alu(14), i3 => alu(15), sil => q(16), s0 => qs0, s1 => qs1, clk => clk2b, q3 => q(15), q2 => q(14), q1 => q(13), q0 => q(12));
--  q_2c27 : sn74s194 port map(clr_n => hi7, sir => \-alu31\, i0 => alu(0), i1 => alu(1), i2 => alu(2), i3 => alu(3), sil => q(4), s0 => qs0, s1 => qs1, clk => clk2b, q3 => q(3), q2 => q(2), q1 => q(1), q0 => q(0));
--  q_2c28 : sn74s194 port map(clr_n => hi7, sir => q(3), i0 => alu(4), i1 => alu(5), i2 => alu(6), i3 => alu(7), sil => q(8), s0 => qs0, s1 => qs1, clk => clk2b, q3 => q(7), q2 => q(6), q1 => q(5), q0 => q(4));

--- The L Register

--  l_3c26 : sn74s374 port map(oenb_n => gnd, o0 => l(7), i0 => ob(7), i1 => ob(6), o1 => l(6), o2 => l(5), i2 => ob(5), i3 => ob(4), o3 => l(4), clk => clk3f, o4 => l(3), i4 => ob(3), i5 => ob(2), o5 => l(2), o6 => l(1), i6 => ob(1), i7 => ob(0), o7 => l(0));
--  l_3c27 : sn74s374 port map(oenb_n => gnd, o0 => l(15), i0 => ob(15), i1 => ob(14), o1 => l(14), o2 => l(13), i2 => ob(13), i3 => ob(12), o3 => l(12), clk => clk3f, o4 => l(11), i4 => ob(11), i5 => ob(10), o5 => l(10), o6 => l(9), i6 => ob(9), i7 => ob(8), o7 => l(8));
--  l_3c28 : sn74s374 port map(oenb_n => gnd, o0 => l(23), i0 => ob(23), i1 => ob(22), o1 => l(22), o2 => l(21), i2 => ob(21), i3 => ob(20), o3 => l(20), clk => clk3f, o4 => l(19), i4 => ob(19), i5 => ob(18), o5 => l(18), o6 => l(17), i6 => ob(17), i7 => ob(16), o7 => l(16));
--  l_3c29 : sn74s374 port map(oenb_n => gnd, o0 => l(31), i0 => ob(31), i1 => ob(30), o1 => l(30), o2 => l(29), i2 => ob(29), i3 => ob(28), o3 => l(28), clk => clk3f, o4 => l(27), i4 => ob(27), i5 => ob(26), o5 => l(26), o6 => l(25), i6 => ob(25), i7 => ob(24), o7 => l(24));
--  l_4c03 : am93s48 port map(i6 => l(5), i5 => l(6), i4 => l(7), i3 => l(8), i2 => l(9), i1 => l(10), i0 => l(11), po => lparl, pe => nc(369), i11 => l(0), i10 => l(1), i9 => l(2), i8 => l(3), i7 => l(4));
--  l_4c08 : am93s48 port map(i6 => l(17), i5 => l(18), i4 => l(19), i3 => l(20), i2 => l(21), i1 => l(22), i0 => l(23), po => nc(370), pe => \-lparm\, i11 => l(12), i10 => l(13), i9 => l(14), i8 => l(15), i7 => l(16));
--  l_4c09 : am93s48 port map(i6 => l(25), i5 => l(26), i4 => l(27), i3 => l(28), i2 => l(29), i1 => l(30), i0 => l(31), po => lparity, pe => \-lparity\, i11 => lparl, i10 => \-lparm\, i9 => gnd, i8 => gnd, i7 => l(24));

--- The Dispatch Memory

--  dspctl_2f22 : im5610 generic map (fn => "rom/dspctl_2f22.hex") port map(o0 => dmask(0), o1 => dmask(1), o2 => dmask(2), o3 => dmask(3), o4 => dmask(4), o5 => dmask(5), o6 => dmask(6), o7 => nc(407), a0 => ir(5), a1 => ir(6), a2 => ir(7), a3 => gnd, a4 => gnd, ce_n => gnd);
--  dspctl_3c14 : am25s07 port map(enb_n => \-irdisp\, d0 => dc(6), i0 => ir(38), i1 => ir(39), d1 => dc(7), i2 => ir(40), d2 => dc(8), clk => clk3e, d3 => dc(9), i3 => ir(41), d4 => nc(403), i4 => nc(404), i5 => nc(405), d5 => nc(406));
--  dspctl_3c15 : am25s07 port map(enb_n => \-irdisp\, d0 => dc(0), i0 => ir(32), i1 => ir(33), d1 => dc(1), i2 => ir(34), d2 => dc(2), clk => clk3e, d3 => dc(3), i3 => ir(35), d4 => dc(4), i4 => ir(36), i5 => ir(37), d5 => dc(5));
--  dspctl_3d02 : sn74s00 port map(g1b => dpareven, g1a => dispenb, g1q_n => dparok, g2b => '0', g2a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  dspctl_3e19 : sn74s86 port map(g3y => dpareven, g3a => \-dparh\, g3b => dparl, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g4a => '0', g4b => '0');
--  dspctl_3f11 : sn74s241 port map(aenb_n => hi4, ain0 => nc(389), bout3 => aa16, ain1 => nc(390), bout2 => aa17, ain2 => nc(391), bout1 => nc(392), ain3 => nc(393), bout0 => nc(394), bin0 => nc(395), aout3 => nc(396), bin1 => nc(397), aout2 => nc(398), bin2 => a17, aout1 => nc(399), bin3 => a16, aout0 => nc(400), benb => hi4);
--  dspctl_3f12 : sn74s241 port map(aenb_n => gnd, ain0 => a15, bout3 => aa8, ain1 => a14, bout2 => aa9, ain2 => a13, bout1 => aa10, ain3 => a12, bout0 => aa11, bin0 => a11, aout3 => aa12, bin1 => a10, aout2 => aa13, bin2 => a9, aout1 => aa14, bin3 => a8, aout0 => aa15, benb => hi4);
--  dspctl_3f13 : sn74s241 port map(aenb_n => gnd, ain0 => a7, bout3 => aa0, ain1 => a6, bout2 => aa1, ain2 => a5, bout1 => aa2, ain3 => a4, bout0 => aa3, bin0 => a3, aout3 => aa4, bin1 => a2, aout2 => aa5, bin2 => a1, aout1 => aa6, bin3 => a0, aout0 => aa7, benb => hi4);
--  dspctl_3f14 : sn74s02 port map(g1q_n => \-dmapbenb\, g1a => ir(8), g1b => ir(9), g2q_n => dispwr, g2a => \-irdisp\, g2b => \-funct2\, g3b => '0', g3a => '0', g4b => '0', g4a => '0');
--  dspctl_4f09 : sn74s280 port map(i0 => dpc(9), i1 => dpc(10), i2 => dpc(11), even => \-dparh\, odd => nc(402), i3 => dpc(12), i4 => dpc(13), i5 => dn, i6 => dp, i7 => dr, i8 => dpar);
--  dspctl_4f10 : sn74s280 port map(i0 => dpc(0), i1 => dpc(1), i2 => dpc(2), even => nc(401), odd => dparl, i3 => dpc(3), i4 => dpc(4), i5 => dpc(5), i6 => dpc(6), i7 => dpc(7), i8 => dpc(8));

--  dram0_2f03 : sn74s37 port map(g1a => wp2, g1b => dispwr, g1y => \-dwea\, g2a => '0', g2b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  dram0_2f21 : sn74s04 port map(g1a => nc(418), g1q_n => nc(419), g2a => \-dadr10a\, g2q_n => dadr10a, g3a => ir22b, g3q_n => \-dadr10a\, g4q_n => \-dadr9a\, g4a => ir21b, g5q_n => \-dadr8a\, g5a => ir20b, g6q_n => \-dadr7a\, g6a => ir19b);
--  dram0_2f24 : sn74s64 port map(d4 => ir12b, b2 => vmo19, a2 => ir9b, c3 => r(0), b3 => dmask(0), a3 => \-dmapbenb\, \out\ => \-dadr0a\, a1 => vmo18, b1 => ir8b, c4 => hi6, b4 => hi6, a4 => hi6);
--  dram0_2f25 : sn74s241 port map(aenb_n => gnd, ain0 => ir(12), bout3 => ir19b, ain1 => ir(13), bout2 => ir18b, ain2 => ir(14), bout1 => ir17b, ain3 => ir(15), bout0 => ir16b, bin0 => ir(16), aout3 => ir15b, bin1 => ir(17), aout2 => ir14b, bin2 => ir(18), aout1 => ir13b, bin3 => ir(19), aout0 => ir12b, benb => hi6);
--  dram0_2f26 : am93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(5), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa5);
--  dram0_2f27 : am93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(5), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa5);
--  dram0_2f28 : am93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(4), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa4);
--  dram0_2f29 : am93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(4), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa4);
--  dram0_2f30 : sn74s51 port map(g1a => r(3), g2a => ir18b, g2b => hi6, g2c => dmask(6), g2d => r(6), g2y => \-dadr6a\, g1y => \-dadr3a\, g1c => ir15b, g1d => hi6, g1b => dmask(3));
--  dram0_3f01 : am93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(3), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa3);
--  dram0_3f02 : am93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(3), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa3);
--  dram0_3f03 : am93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(2), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa2);
--  dram0_3f04 : am93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(2), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa2);
--  dram0_3f05 : sn74s51 port map(g1a => r(2), g2a => ir17b, g2b => hi4, g2c => dmask(5), g2d => r(5), g2y => \-dadr5a\, g1y => \-dadr2a\, g1c => ir14b, g1d => hi4, g1b => dmask(2));
--  dram0_3f06 : am93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(1), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa1);
--  dram0_3f07 : am93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(1), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa1);
--  dram0_3f08 : am93425a port map(ce_n => dadr10a, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(0), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa0);
--  dram0_3f09 : am93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0a\, a1 => \-dadr1a\, a2 => \-dadr2a\, a3 => \-dadr3a\, a4 => \-dadr4a\, do => dpc(0), a5 => \-dadr5a\, a6 => \-dadr6a\, a7 => \-dadr7a\, a8 => \-dadr8a\, a9 => \-dadr9a\, we_n => \-dwea\, di => aa0);
--  dram0_3f10 : sn74s51 port map(g1a => r(1), g2a => ir16b, g2b => hi4, g2c => dmask(4), g2d => r(4), g2y => \-dadr4a\, g1y => \-dadr1a\, g1c => ir13b, g1d => hi4, g1b => dmask(1));

--  dram1_2f03 : sn74s37 port map(g2a => wp2, g2b => dispwr, g2y => \-dweb\, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  dram1_2f04 : sn74s04 port map(g1a => nc(416), g1q_n => nc(417), g2a => \-vmo\(19), g2q_n => vmo19, g3a => \-vmo\(18), g3q_n => vmo18, g4q_n => \-dadr9b\, g4a => ir21b, g5q_n => \-dadr8b\, g5a => ir20b, g6q_n => \-dadr7b\, g6a => ir19b);
--  dram1_2f05 : sn74s64 port map(d4 => ir12b, b2 => vmo19, a2 => ir9b, c3 => r(0), b3 => dmask(0), a3 => \-dmapbenb\, \out\ => \-dadr0b\, a1 => vmo18, b1 => ir8b, c4 => hi6, b4 => hi6, a4 => hi6);
--  dram1_2f06 : am93425a port map(ce_n => dadr10a, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(11), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa11);
--  dram1_2f07 : am93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(11), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa11);
--  dram1_2f08 : am93425a port map(ce_n => dadr10a, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(10), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa10);
--  dram1_2f09 : am93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(10), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa10);
--  dram1_2f10 : sn74s51 port map(g1a => r(3), g2a => ir18b, g2b => hi6, g2c => dmask(6), g2d => r(6), g2y => \-dadr6b\, g1y => \-dadr3b\, g1c => ir15b, g1d => hi6, g1b => dmask(3));
--  dram1_2f11 : am93425a port map(ce_n => dadr10a, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(9), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa9);
--  dram1_2f12 : am93425a port map(ce_n => \-dadr10a\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(9), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa9);
--  dram1_2f13 : am93425a port map(ce_n => dadr10c, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(8), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa8);
--  dram1_2f14 : am93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(8), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa8);
--  dram1_2f15 : sn74s51 port map(g1a => r(2), g2a => ir17b, g2b => hi6, g2c => dmask(5), g2d => r(5), g2y => \-dadr5b\, g1y => \-dadr2b\, g1c => ir14b, g1d => hi6, g1b => dmask(2));
--  dram1_2f16 : am93425a port map(ce_n => dadr10c, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(7), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa7);
--  dram1_2f17 : am93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(7), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa7);
--  dram1_2f18 : am93425a port map(ce_n => dadr10c, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(6), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa6);
--  dram1_2f19 : am93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0b\, a1 => \-dadr1b\, a2 => \-dadr2b\, a3 => \-dadr3b\, a4 => \-dadr4b\, do => dpc(6), a5 => \-dadr5b\, a6 => \-dadr6b\, a7 => \-dadr7b\, a8 => \-dadr8b\, a9 => \-dadr9b\, we_n => \-dweb\, di => aa6);
--  dram1_2f20 : sn74s51 port map(g1a => r(1), g2a => ir16b, g2b => hi6, g2c => dmask(4), g2d => r(4), g2y => \-dadr4b\, g1y => \-dadr1b\, g1c => ir13b, g1d => hi6, g1b => dmask(1));
--  dram1_2f23 : sn74s241 port map(aenb_n => gnd, ain0 => ir(20), bout3 => nc(410), ain1 => ir(21), bout2 => nc(411), ain2 => ir(22), bout1 => nc(412), ain3 => ir(8), bout0 => ir9b, bin0 => ir(9), aout3 => ir8b, bin1 => nc(413), aout2 => ir22b, bin2 => nc(414), aout1 => ir21b, bin3 => nc(415), aout0 => ir20b, benb => hi6);

--  dram2_1f16 : am93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dpar, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa17);
--  dram2_1f17 : am93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dpar, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa17);
--  dram2_1f18 : am93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dr, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa16);
--  dram2_1f19 : am93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dr, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa16);
--  dram2_1f20 : sn74s51 port map(g1a => r(3), g2a => ir18b, g2b => hi11, g2c => dmask(6), g2d => r(6), g2y => \-dadr6c\, g1y => \-dadr3c\, g1c => ir15b, g1d => hi11, g1b => dmask(3));
--  dram2_1f21 : am93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dp, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa15);
--  dram2_1f22 : am93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dp, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa15);
--  dram2_1f23 : am93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dn, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa14);
--  dram2_1f24 : am93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dn, a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa14);
--  dram2_1f25 : sn74s51 port map(g1a => r(2), g2a => ir17b, g2b => hi11, g2c => dmask(5), g2d => r(5), g2y => \-dadr5c\, g1y => \-dadr2c\, g1c => ir14b, g1d => hi11, g1b => dmask(2));
--  dram2_1f26 : am93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dpc(13), a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa13);
--  dram2_1f27 : am93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dpc(13), a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa13);
--  dram2_1f28 : am93425a port map(ce_n => dadr10c, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dpc(12), a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa12);
--  dram2_1f29 : am93425a port map(ce_n => \-dadr10c\, a0 => \-dadr0c\, a1 => \-dadr1c\, a2 => \-dadr2c\, a3 => \-dadr3c\, a4 => \-dadr4c\, do => dpc(12), a5 => \-dadr5c\, a6 => \-dadr6c\, a7 => \-dadr7c\, a8 => \-dadr8c\, a9 => \-dadr9c\, we_n => \-dwec\, di => aa12);
--  dram2_1f30 : sn74s51 port map(g1a => r(1), g2a => ir16b, g2b => hi11, g2c => dmask(4), g2d => r(4), g2y => \-dadr4c\, g1y => \-dadr1c\, g1c => ir13b, g1d => hi11, g1b => dmask(1));
--  dram2_2f01 : sn74s64 port map(d4 => ir12b, b2 => vmo19, a2 => ir9b, c3 => r(0), b3 => dmask(0), a3 => \-dmapbenb\, \out\ => \-dadr0c\, a1 => vmo18, b1 => ir8b, c4 => hi6, b4 => hi6, a4 => hi6);
--  dram2_2f02 : sn74s04 port map(g1a => nc(408), g1q_n => nc(409), g2a => \-dadr10c\, g2q_n => dadr10c, g3a => ir22b, g3q_n => \-dadr10c\, g4q_n => \-dadr9c\, g4a => ir21b, g5q_n => \-dadr8c\, g5a => ir20b, g6q_n => \-dadr7c\, g6a => ir19b);
--  dram2_2f03 : sn74s37 port map(g3y => \-dwec\, g3a => dispwr, g3b => wp2, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g4a => '0', g4b => '0');

--- Jump Conditions

--  flag_3e07 : sn74s00 port map(g1b => ir(45), g1a => \-nopa\, g1q_n => \-ilong\, g2b => '0', g2a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  flag_3e08 : am25ls2519 port map(i0 => ob(29), q0a => nc(385), q0b => \lc_byte_mode\, i1 => ob(28), q1a => nc(386), q1b => \prog.unibus.reset\, o_enb_n => hi4, out_enb_n => gnd, clk => clk3c, q2b => \int.enable\, q2a => nc(387), i2 => ob(27), q3b => \sequence.break\, q3a => nc(388), i3 => ob(26), clk_enb_n => \-destintctl\, inv => hi4, asyn_clr_n => \-reset\);
--  flag_3e11 : sn74s00 port map(g4q_n => \-statbit\, g4a => \-nopa\, g4b => ir(46), g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3b => '0', g3a => '0');
--  flag_3e13 : sn74s151 port map(i3 => aeqm, i2 => alu(32), i1 => aluneg, i0 => r(0), q => jcond, q_n => \-jcond\, ce_n => gnd, sel2 => conds2, sel1 => conds1, sel0 => conds0, i7 => hi4, i6 => \pgf.or.int.or.sb\, i5 => \pgf.or.int\, i4 => \-vmaok\);
--  flag_3e14 : sn74s08 port map(g1b => ir(2), g1a => ir(5), g1q => conds2, g2b => ir(1), g2a => ir(5), g2q => conds1, g3q => conds0, g3a => ir(5), g3b => ir(0), g4a => '0', g4b => '0');
--  flag_3e17 : sn74s02 port map(g4b => \-alu32\, g4a => aeqm, g4q_n => aluneg, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g3b => '0', g3a => '0');
--  flag_3e18 : sn74s32 port map(g2a => \-vmaok\, g2b => sint, g2y => \pgf.or.int\, g3y => internal30, g3a => \sequence.break\, g3b => sint, g4y => \pgf.or.int.or.sb\, g4a => internal30, g4b => \-vmaok\, g1a => '0', g1b => '0');
--  flag_3e22 : sn74s04 port map(g4q_n => \-alu32\, g4a => alu(32), g1a => '0', g2a => '0', g3a => '0', g5a => '0', g6a => '0');
--  flag_4d09 : sn74s08 port map(g3q => sint, g3a => \int.enable\, g3b => sintr, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g4a => '0', g4b => '0');

--- Flow of Control

--  contrl_3d21 : sn74s08 port map(g1b => spushd, g1a => tse3a, g1q => spcwpass, g2b => \-ipopj\, g2a => \-iwrited\, g2q => \-popj\, g3q => spcdrive, g3a => spcenb, g3b => tse3a, g4a => '0', g4b => '0');
--  contrl_3d26 : sn74s175 port map(clr_n => \-reset\, q0 => inop, q0_n => \-inop\, d0 => n, d1 => nc(420), q1_n => nc(421), q1 => nc(422), clk => clk3c, q2 => spushd, q2_n => \-spushd\, d2 => spush, d3 => iwrite, q3_n => \-iwrited\, q3 => iwrited);
--  contrl_3d28 : sn74s00 port map(g1b => \-srcspc\, g1a => \-srcspcpop\, g1q_n => spcenb, g2b => spcenb, g2a => tse3a, g2q_n => \-spcdrive\, g3q_n => \-spcpass\, g3b => tse3a, g3a => \-spushd\, g4q_n => \-spcwpass\, g4a => tse3a, g4b => spushd);
--  contrl_3e07 : sn74s00 port map(g2b => ir(42), g2a => \-nop\, g2q_n => \-ipopj\, g1b => '0', g1a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  contrl_3e09 : sn74s32 port map(g1a => \-srcspcpop\, g1b => nop, g1y => \-srcspcpopreal\, g2a => '0', g2b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  contrl_3e14 : sn74s08 port map(g4q => \-nopa\, g4a => \-nop11\, g4b => \-inop\, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3a => '0', g3b => '0');
--  contrl_3e18 : sn74s32 port map(g1a => \-irdisp\, g1b => dr, g1y => \-ignpopj\, g2a => '0', g2b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  contrl_3e22 : sn74s04 port map(g1a => \-destspc\, g1q_n => destspc, g2a => nop, g2q_n => \-nop\, g3a => '0', g4a => '0', g5a => '0', g6a => '0');
--  contrl_3e23 : sn74s00 port map(g1b => dr, g1a => dp, g1q_n => \-dfall\, g2b => \-trap\, g2a => internal32, g2q_n => n, g3q_n => internal31, g3b => \-popj\, g3a => \-srcspcpopreal\, g4q_n => nop, g4a => \-trap\, g4b => \-nopa\);
--  contrl_3e24 : sn74s08 port map(g1b => irdisp, g1a => \-funct2\, g1q => dispenb, g2b => irjump, g2a => ir(6), g2q => jfalse, g3q => jcalf, g3a => ir(8), g3b => jfalse, g4q => jretf, g4a => ir(6), g4b => jret);
--  contrl_3e25 : sn74s64 port map(d4 => ir(7), b2 => dn, a2 => dispenb, c3 => ir(7), b3 => \-jcond\, a3 => jfalse, \out\ => internal32, a1 => hi4, b1 => iwrited, c4 => jcond, b4 => \-ir6\, a4 => irjump);
--  contrl_3e26 : sn74s64 port map(d4 => jcond, b2 => \-jcond\, a2 => jcalf, c3 => \-dr\, b3 => dp, a3 => dispenb, \out\ => \-spush\, a1 => hi4, b1 => destspc, c4 => ir(8), b4 => \-ir6\, a4 => irjump);
--  contrl_3e27 : sn74s64 port map(d4 => hi4, b2 => \-jcond\, a2 => jfalse, c3 => jcond, b3 => \-ir6\, a3 => irjump, \out\ => pcs1, a1 => \-ignpopj\, b1 => popj, c4 => \-dp\, b4 => dr, a4 => dispenb);
--  contrl_3e28 : sn74s64 port map(d4 => hi4, b2 => \-jcond\, a2 => jretf, c3 => jcond, b3 => \-ir6\, a3 => jret, \out\ => \-spop\, a1 => \-ignpopj\, b1 => internal31, c4 => \-dp\, b4 => dr, a4 => dispenb);
--  contrl_3e29 : sn74s11 port map(g1a => \-ir8\, g1b => irjump, g2a => irjump, g2b => ir(8), g2c => ir(9), g2y => iwrite, g1y => jret, g1c => ir(9), g3a => '0', g3b => '0', g3c => '0');
--  contrl_3f20 : sn74s04 port map(g1a => \-popj\, g1q_n => popj, g2a => ir(8), g2q_n => \-ir8\, g3a => ir(6), g3q_n => \-ir6\, g4q_n => spush, g4a => \-spush\, g5q_n => \-dp\, g5a => dp, g6q_n => \-dr\, g6a => dr);
--  contrl_3f30 : sn74s64 port map(d4 => hi4, b2 => \-dfall\, a2 => dispenb, c3 => hi4, b3 => \-jcond\, a3 => jretf, \out\ => pcs0, a1 => hi4, b1 => popj, c4 => jcond, b4 => \-ir6\, a4 => jret);
--  contrl_4d09 : sn74s08 port map(g1b => \-spush\, g1a => \-spop\, g1q => \-spcnt\, g2b => '0', g2a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  contrl_4e30 : sn74s37 port map(g1a => \-destspcd\, g1b => \-destspcd\, g1y => destspcd, g2a => wp4c, g2b => spushd, g2y => \-swpb\, g3y => \-swpa\, g3a => spushd, g3b => wp4c, g4a => '0', g4b => '0');

--- Microcode Subroutine Return Stack

--  spc_4e21 : dm82s21 port map(wclk_n => \-swpa\, we0_n => gnd, i0 => spcw(14), a4 => spcptr(4), ce => hi1, strobe => hi1, d0 => spco(14), d1 => spco(15), a3 => spcptr(3), a2 => spcptr(2), a1 => spcptr(1), a0 => spcptr(0), i1 => spcw(15), we1_n => gnd);
--  spc_4e22 : dm82s21 port map(wclk_n => \-swpa\, we0_n => gnd, i0 => spcw(12), a4 => spcptr(4), ce => hi1, strobe => hi1, d0 => spco(12), d1 => spco(13), a3 => spcptr(3), a2 => spcptr(2), a1 => spcptr(1), a0 => spcptr(0), i1 => spcw(13), we1_n => gnd);
--  spc_4e23 : dm82s21 port map(wclk_n => \-swpa\, we0_n => gnd, i0 => spcw(10), a4 => spcptr(4), ce => hi1, strobe => hi1, d0 => spco(10), d1 => spco(11), a3 => spcptr(3), a2 => spcptr(2), a1 => spcptr(1), a0 => spcptr(0), i1 => spcw(11), we1_n => gnd);
--  spc_4e24 : res20 port map(r2 => spcopar, r3 => spco(18), r4 => spco(17), r5 => spco(16), r6 => spco(15), r7 => hi1, r8 => hi2, r9 => hi3, r11 => hi4, r12 => hi5, r13 => hi6, r14 => hi7, r15 => spco(14), r16 => spco(13), r17 => spco(12), r18 => spco(11), r19 => spco(10));
--  spc_4e26 : dm82s21 port map(wclk_n => \-swpb\, we0_n => gnd, i0 => spcw(4), a4 => spcptr(4), ce => hi1, strobe => hi1, d0 => spco(4), d1 => spco(5), a3 => spcptr(3), a2 => spcptr(2), a1 => spcptr(1), a0 => spcptr(0), i1 => spcw(5), we1_n => gnd);
--  spc_4e27 : dm82s21 port map(wclk_n => \-swpb\, we0_n => gnd, i0 => spcw(2), a4 => spcptr(4), ce => hi1, strobe => hi1, d0 => spco(2), d1 => spco(3), a3 => spcptr(3), a2 => spcptr(2), a1 => spcptr(1), a0 => spcptr(0), i1 => spcw(3), we1_n => gnd);
--  spc_4e28 : dm82s21 port map(wclk_n => \-swpb\, we0_n => gnd, i0 => spcw(0), a4 => spcptr(4), ce => hi1, strobe => hi1, d0 => spco(0), d1 => spco(1), a3 => spcptr(3), a2 => spcptr(2), a1 => spcptr(1), a0 => spcptr(0), i1 => spcw(1), we1_n => gnd);
--  spc_4e29 : res20 port map(r2 => spco(9), r3 => spco(8), r4 => spco(7), r5 => spco(6), r6 => spco(5), r7 => hi8, r8 => hi9, r9 => hi10, r11 => hi11, r12 => hi12, r13 => nc(182), r14 => nc(183), r15 => spco(4), r16 => spco(3), r17 => spco(2), r18 => spco(1), r19 => spco(0));
--  spc_4f23 : sn74s169 port map(up_dn => spush, clk => clk4f, i0 => nc(192), i1 => nc(193), i2 => nc(194), i3 => nc(195), enb_p_n => gnd, load_n => hi1, enb_t_n => \-spcnt\, o3 => spcptr(3), o2 => spcptr(2), o1 => spcptr(1), o0 => spcptr(0), co_n => \-spccry\);
--  spc_4f24 : dm82s21 port map(wclk_n => \-swpa\, we0_n => gnd, i0 => spcw(18), a4 => spcptr(4), ce => hi1, strobe => hi1, d0 => spco(18), d1 => spcopar, a3 => spcptr(3), a2 => spcptr(2), a1 => spcptr(1), a0 => spcptr(0), i1 => spcwpar, we1_n => gnd);
--  spc_4f25 : dm82s21 port map(wclk_n => \-swpa\, we0_n => gnd, i0 => spcw(16), a4 => spcptr(4), ce => hi1, strobe => hi1, d0 => spco(16), d1 => spco(17), a3 => spcptr(3), a2 => spcptr(2), a1 => spcptr(1), a0 => spcptr(0), i1 => spcw(17), we1_n => gnd);
--  spc_4f28 : sn74s169 port map(up_dn => spush, clk => clk4f, i0 => nc(184), i1 => nc(185), i2 => nc(186), i3 => nc(187), enb_p_n => gnd, load_n => hi1, enb_t_n => \-spccry\, o3 => nc(188), o2 => nc(189), o1 => nc(190), o0 => spcptr(4), co_n => nc(191));
--  spc_4f29 : dm82s21 port map(wclk_n => \-swpb\, we0_n => gnd, i0 => spcw(8), a4 => spcptr(4), ce => hi1, strobe => hi1, d0 => spco(8), d1 => spco(9), a3 => spcptr(3), a2 => spcptr(2), a1 => spcptr(1), a0 => spcptr(0), i1 => spcw(9), we1_n => gnd);
--  spc_4f30 : dm82s21 port map(wclk_n => \-swpb\, we0_n => gnd, i0 => spcw(6), a4 => spcptr(4), ce => hi1, strobe => hi1, d0 => spco(6), d1 => spco(7), a3 => spcptr(3), a2 => spcptr(2), a1 => spcptr(1), a0 => spcptr(0), i1 => spcw(7), we1_n => gnd);

--  spclch_4a07 : sn74s373 port map(oenb_n => \-spcdrive\, o0 => m(23), i0 => gnd, i1 => gnd, o1 => m(22), o2 => m(21), i2 => gnd, i3 => gnd, o3 => m(20), hold_n => clk4c, o4 => m(19), i4 => gnd, i5 => spco(18), o5 => m(18), o6 => m(17), i6 => spco(17), i7 => spco(16), o7 => m(16));
--  spclch_4a09 : sn74s373 port map(oenb_n => \-spcdrive\, o0 => m(15), i0 => spco(15), i1 => spco(14), o1 => m(14), o2 => m(13), i2 => spco(13), i3 => spco(12), o3 => m(12), hold_n => clk4c, o4 => m(11), i4 => spco(11), i5 => spco(10), o5 => m(10), o6 => m(9), i6 => spco(9), i7 => spco(8), o7 => m(8));
--  spclch_4a10 : sn74s373 port map(oenb_n => \-spcdrive\, o0 => m(7), i0 => spco(7), i1 => spco(6), o1 => m(6), o2 => m(5), i2 => spco(5), i3 => spco(4), o3 => m(4), hold_n => clk4c, o4 => m(3), i4 => spco(3), i5 => spco(2), o5 => m(2), o6 => m(1), i6 => spco(1), i7 => spco(0), o7 => m(0));
--  spclch_4b10 : sn74s241 port map(aenb_n => \-spcdrive\, ain0 => gnd, bout3 => m(24), ain1 => gnd, bout2 => m(25), ain2 => gnd, bout1 => m(26), ain3 => spcptr(4), bout0 => m(27), bin0 => spcptr(3), aout3 => m(28), bin1 => spcptr(2), aout2 => m(29), bin2 => spcptr(1), aout1 => m(30), bin3 => spcptr(0), aout0 => m(31), benb => spcdrive);
--  spclch_4e16 : sn74s241 port map(aenb_n => hi1, ain0 => nc(166), bout3 => spc(16), ain1 => nc(167), bout2 => spc(17), ain2 => nc(168), bout1 => spc(18), ain3 => nc(169), bout0 => spcpar, bin0 => spcwpar, aout3 => nc(170), bin1 => spcw(18), aout2 => nc(171), bin2 => spcw(17), aout1 => nc(172), bin3 => spcw(16), aout0 => nc(173), benb => spcwpass);
--  spclch_4e17 : sn74s241 port map(aenb_n => \-spcwpass\, ain0 => spcw(15), bout3 => spc(8), ain1 => spcw(14), bout2 => spc(9), ain2 => spcw(13), bout1 => spc(10), ain3 => spcw(12), bout0 => spc(11), bin0 => spcw(11), aout3 => spc(12), bin1 => spcw(10), aout2 => spc(13), bin2 => spcw(9), aout1 => spc(14), bin3 => spcw(8), aout0 => spc(15), benb => spcwpass);
--  spclch_4e18 : sn74s241 port map(aenb_n => \-spcwpass\, ain0 => spcw(7), bout3 => spc(0), ain1 => spcw(6), bout2 => spc(1), ain2 => spcw(5), bout1 => spc(2), ain3 => spcw(4), bout0 => spc(3), bin0 => spcw(3), aout3 => spc(4), bin1 => spcw(2), aout2 => spc(5), bin2 => spcw(1), aout1 => spc(6), bin3 => spcw(0), aout0 => spc(7), benb => spcwpass);
--  spclch_4f18 : sn74s373 port map(oenb_n => \-spcpass\, o0 => nc(174), i0 => nc(175), i1 => nc(176), o1 => nc(177), o2 => nc(178), i2 => nc(179), i3 => nc(180), o3 => nc(181), hold_n => clk4d, o4 => spcpar, i4 => spcopar, i5 => spco(18), o5 => spc(18), o6 => spc(17), i6 => spco(17), i7 => spco(16), o7 => spc(16));
--  spclch_4f19 : sn74s373 port map(oenb_n => \-spcpass\, o0 => spc(15), i0 => spco(15), i1 => spco(14), o1 => spc(14), o2 => spc(13), i2 => spco(13), i3 => spco(12), o3 => spc(12), hold_n => clk4d, o4 => spc(11), i4 => spco(11), i5 => spco(10), o5 => spc(10), o6 => spc(9), i6 => spco(9), i7 => spco(8), o7 => spc(8));
--  spclch_4f20 : sn74s373 port map(oenb_n => \-spcpass\, o0 => spc(7), i0 => spco(7), i1 => spco(6), o1 => spc(6), o2 => spc(5), i2 => spco(5), i3 => spco(4), o3 => spc(4), hold_n => clk4d, o4 => spc(3), i4 => spco(3), i5 => spco(2), o5 => spc(2), o6 => spc(1), i6 => spco(1), i7 => spco(0), o7 => spc(0));

--  spcw_4e11 : sn74s157 port map(sel => destspcd, a4 => reta(12), b4 => l(12), y4 => spcw(12), a3 => reta(13), b3 => l(13), y3 => spcw(13), y2 => spcw(14), b2 => l(14), a2 => gnd, y1 => spcw(15), b1 => l(15), a1 => gnd, enb_n => gnd);
--  spcw_4e12 : sn74s157 port map(sel => destspcd, a4 => reta(8), b4 => l(8), y4 => spcw(8), a3 => reta(9), b3 => l(9), y3 => spcw(9), y2 => spcw(10), b2 => l(10), a2 => reta(10), y1 => spcw(11), b1 => l(11), a1 => reta(11), enb_n => gnd);
--  spcw_4e13 : sn74s157 port map(sel => destspcd, a4 => reta(4), b4 => l(4), y4 => spcw(4), a3 => reta(5), b3 => l(5), y3 => spcw(5), y2 => spcw(6), b2 => l(6), a2 => reta(6), y1 => spcw(7), b1 => l(7), a1 => reta(7), enb_n => gnd);
--  spcw_4e14 : sn74s157 port map(sel => destspcd, a4 => reta(0), b4 => l(0), y4 => spcw(0), a3 => reta(1), b3 => l(1), y3 => spcw(1), y2 => spcw(2), b2 => l(2), a2 => reta(2), y1 => spcw(3), b1 => l(3), a1 => reta(3), enb_n => gnd);
--  spcw_4f11 : am25s09 port map(sel => n, aq => reta(12), a0 => ipc(12), a1 => wpc12, b1 => wpc13, b0 => ipc(13), bq => reta(13), clk => clk4d, cq => nc(153), c0 => nc(154), c1 => nc(155), d1 => nc(156), d0 => nc(157), dq => nc(158));
--  spcw_4f12 : am25s09 port map(sel => n, aq => reta(8), a0 => ipc(8), a1 => wpc8, b1 => wpc9, b0 => ipc(9), bq => reta(9), clk => clk4d, cq => reta(10), c0 => ipc(10), c1 => wpc10, d1 => wpc11, d0 => ipc(11), dq => reta(11));
--  spcw_4f13 : am25s09 port map(sel => n, aq => reta(4), a0 => ipc(4), a1 => wpc4, b1 => wpc5, b0 => ipc(5), bq => reta(5), clk => clk4d, cq => reta(6), c0 => ipc(6), c1 => wpc6, d1 => wpc7, d0 => ipc(7), dq => reta(7));
--  spcw_4f14 : am25s09 port map(sel => n, aq => reta(0), a0 => ipc(0), a1 => wpc0, b1 => wpc1, b0 => ipc(1), bq => reta(1), clk => clk4d, cq => reta(2), c0 => ipc(2), c1 => wpc2, d1 => wpc3, d0 => ipc(3), dq => reta(3));
--  spcw_4f15 : sn74s157 port map(sel => destspcd, a4 => gnd, b4 => l(16), y4 => spcw(16), a3 => gnd, b3 => l(17), y3 => spcw(17), y2 => spcw(18), b2 => l(18), a2 => gnd, y1 => nc(159), b1 => nc(160), a1 => nc(161), enb_n => gnd);

--  spcpar_3e19 : sn74s86 port map(g2a => spcwparh, g2b => \-spcwparl\, g2y => spcwpar, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  spcpar_4f16 : am93s48 port map(i6 => spcw(17), i5 => spcw(18), i4 => gnd, i3 => gnd, i2 => gnd, i1 => gnd, i0 => gnd, po => spcwparh, pe => nc(162), i11 => spcw(12), i10 => spcw(13), i9 => spcw(14), i8 => spcw(15), i7 => spcw(16));
--  spcpar_4f17 : am93s48 port map(i6 => spcw(5), i5 => spcw(6), i4 => spcw(7), i3 => spcw(8), i2 => spcw(9), i1 => spcw(10), i0 => spcw(11), po => nc(163), pe => \-spcwparl\, i11 => spcw(0), i10 => spcw(1), i9 => spcw(2), i8 => spcw(3), i7 => spcw(4));
--  spcpar_4f21 : am93s48 port map(i6 => spc(16), i5 => spc(17), i4 => spc(18), i3 => spcpar, i2 => gnd, i1 => gnd, i0 => gnd, po => spcparh, pe => nc(164), i11 => spc(11), i10 => spc(12), i9 => spc(13), i8 => spc(14), i7 => spc(15));
--  spcpar_4f26 : am93s48 port map(i6 => spc(5), i5 => spc(6), i4 => spc(7), i3 => spc(8), i2 => spc(9), i1 => spc(10), i0 => spcparh, po => spcparok, pe => nc(165), i11 => spc(0), i10 => spc(1), i9 => spc(2), i8 => spc(3), i7 => spc(4));

--  lpc_4d01 : sn74s241 port map(aenb_n => gnd, ain0 => pc(8), bout3 => nc(341), ain1 => pc(9), bout2 => nc(342), ain2 => pc(10), bout1 => pc13b, ain3 => pc(11), bout0 => pc12b, bin0 => pc(12), aout3 => pc11b, bin1 => pc(13), aout2 => pc10b, bin2 => nc(343), aout1 => pc9b, bin3 => nc(344), aout0 => pc8b, benb => hi5);
--  lpc_4d02 : sn74s241 port map(aenb_n => gnd, ain0 => pc(0), bout3 => pc7b, ain1 => pc(1), bout2 => pc6b, ain2 => pc(2), bout1 => pc5b, ain3 => pc(3), bout0 => pc4b, bin0 => pc(4), aout3 => pc3b, bin1 => pc(5), aout2 => pc2b, bin2 => pc(6), aout1 => pc1b, bin3 => pc(7), aout0 => pc0b, benb => hi5);
--  lpc_4d06 : sn74s08 port map(g1b => irdisp, g1a => ir(25), g1q => internal23, g2b => '0', g2a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  lpc_4e06 : sn74s157 port map(sel => internal23, a4 => pc(12), b4 => lpc(12), y4 => wpc12, a3 => pc(13), b3 => lpc(13), y3 => wpc13, y2 => nc(345), b2 => nc(346), a2 => nc(347), y1 => nc(348), b1 => nc(349), a1 => nc(350), enb_n => gnd);
--  lpc_4e07 : sn74s157 port map(sel => internal24, a4 => pc(8), b4 => lpc(8), y4 => wpc8, a3 => pc(9), b3 => lpc(9), y3 => wpc9, y2 => wpc10, b2 => lpc(10), a2 => pc(10), y1 => wpc11, b1 => lpc(11), a1 => pc(11), enb_n => gnd);
--  lpc_4e08 : sn74s157 port map(sel => internal24, a4 => pc(4), b4 => lpc(4), y4 => wpc4, a3 => pc(5), b3 => lpc(5), y3 => wpc5, y2 => wpc6, b2 => lpc(6), a2 => pc(6), y1 => wpc7, b1 => lpc(7), a1 => pc(7), enb_n => gnd);
--  lpc_4e09 : sn74s157 port map(sel => internal24, a4 => pc(0), b4 => lpc(0), y4 => wpc0, a3 => pc(1), b3 => lpc(1), y3 => wpc1, y2 => wpc2, b2 => lpc(2), a2 => pc(2), y1 => wpc3, b1 => lpc(3), a1 => pc(3), enb_n => gnd);
--  lpc_4f06 : am25s07 port map(enb_n => \lpc.hold\, d0 => lpc(5), i0 => pc(5), i1 => pc(4), d1 => lpc(4), i2 => pc(3), d2 => lpc(3), clk => clk4b, d3 => lpc(2), i3 => pc(2), d4 => lpc(1), i4 => pc(1), i5 => pc(0), d5 => lpc(0));
--  lpc_4f07 : am25s07 port map(enb_n => \lpc.hold\, d0 => lpc(11), i0 => pc(11), i1 => pc(10), d1 => lpc(10), i2 => pc(9), d2 => lpc(9), clk => clk4b, d3 => lpc(8), i3 => pc(8), d4 => lpc(7), i4 => pc(7), i5 => pc(6), d5 => lpc(6));
--  lpc_4f08 : am25s07 port map(enb_n => \lpc.hold\, d0 => nc(351), i0 => nc(352), i1 => nc(353), d1 => nc(354), i2 => nc(355), d2 => nc(356), clk => clk4b, d3 => nc(357), i3 => nc(358), d4 => lpc(13), i4 => pc(13), i5 => pc(12), d5 => lpc(12));

--- Next PC Selector

--  npc_3f26 : sn74s283 port map(s1 => ipc(13), b1 => gnd, a1 => pc(13), s0 => ipc(12), a0 => pc(12), b0 => gnd, c0 => pccry11, c4 => nc(243), s3 => nc(244), b3 => gnd, a3 => nc(245), s2 => nc(246), a2 => nc(247), b2 => gnd);
--  npc_3f27 : sn74s283 port map(s1 => ipc(9), b1 => gnd, a1 => pc(9), s0 => ipc(8), a0 => pc(8), b0 => gnd, c0 => pccry7, c4 => pccry11, s3 => ipc(11), b3 => gnd, a3 => pc(11), s2 => ipc(10), a2 => pc(10), b2 => gnd);
--  npc_3f28 : sn74s283 port map(s1 => ipc(5), b1 => gnd, a1 => pc(5), s0 => ipc(4), a0 => pc(4), b0 => gnd, c0 => pccry3, c4 => pccry7, s3 => ipc(7), b3 => gnd, a3 => pc(7), s2 => ipc(6), a2 => pc(6), b2 => gnd);
--  npc_3f29 : sn74s283 port map(s1 => ipc(1), b1 => gnd, a1 => pc(1), s0 => ipc(0), a0 => pc(0), b0 => gnd, c0 => hi4, c4 => pccry3, s3 => ipc(3), b3 => gnd, a3 => pc(3), s2 => ipc(2), a2 => pc(2), b2 => gnd);
--  npc_4e01 : sn74s153 port map(enb1_n => trapb, sel1 => pcs1, g1c3 => ipc(3), g1c2 => dpc(3), g1c1 => ir(15), g1c0 => spc(3), g1q => npc(3), g2q => npc(2), g2c0 => spc(2), g2c1 => ir(14), g2c2 => dpc(2), g2c3 => ipc(2), sel0 => pcs0, enb2_n => trapb);
--  npc_4e02 : sn74s153 port map(enb1_n => trapb, sel1 => pcs1, g1c3 => ipc(1), g1c2 => dpc(1), g1c1 => ir(13), g1c0 => spc1a, g1q => npc(1), g2q => npc(0), g2c0 => spc(0), g2c1 => ir(12), g2c2 => dpc(0), g2c3 => ipc(0), sel0 => pcs0, enb2_n => trapb);
--  npc_4e04 : sn74s374 port map(oenb_n => gnd, o0 => nc(248), i0 => nc(249), i1 => nc(250), o1 => nc(251), o2 => pc(13), i2 => npc(13), i3 => npc(12), o3 => pc(12), clk => clk4b, o4 => pc(11), i4 => npc((11)), i5 => npc(10), o5 => pc(10), o6 => pc(9), i6 => npc(9), i7 => npc(8), o7 => pc(8));
--  npc_4e05 : sn74s374 port map(oenb_n => gnd, o0 => pc(7), i0 => npc(7), i1 => npc(6), o1 => pc(6), o2 => pc(5), i2 => npc(5), i3 => npc(4), o3 => pc(4), clk => clk4b, o4 => pc(3), i4 => npc((3)), i5 => npc(2), o5 => pc(2), o6 => pc(1), i6 => npc(1), i7 => npc(0), o7 => pc(0));
--  npc_4f01 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1c3 => ipc(13), g1c2 => dpc(13), g1c1 => ir(25), g1c0 => spc(13), g1q => npc(13), g2q => npc(12), g2c0 => spc(12), g2c1 => ir(24), g2c2 => dpc(12), g2c3 => ipc(12), sel0 => pcs0, enb2_n => trapa);
--  npc_4f02 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1c3 => ipc(11), g1c2 => dpc(11), g1c1 => ir(23), g1c0 => spc(11), g1q => npc(11), g2q => npc(10), g2c0 => spc(10), g2c1 => ir(22), g2c2 => dpc(10), g2c3 => ipc(10), sel0 => pcs0, enb2_n => trapa);
--  npc_4f03 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1c3 => ipc(9), g1c2 => dpc(9), g1c1 => ir(21), g1c0 => spc(9), g1q => npc((9)), g2q => npc(8), g2c0 => spc(8), g2c1 => ir(20), g2c2 => dpc(8), g2c3 => ipc(8), sel0 => pcs0, enb2_n => trapa);
--  npc_4f04 : sn74s153 port map(enb1_n => trapa, sel1 => pcs1, g1c3 => ipc(7), g1c2 => dpc(7), g1c1 => ir(19), g1c0 => spc(7), g1q => npc(7), g2q => npc(6), g2c0 => spc(6), g2c1 => ir(18), g2c2 => dpc(6), g2c3 => ipc(6), sel0 => pcs0, enb2_n => trapb);
--  npc_4f05 : sn74s153 port map(enb1_n => trapb, sel1 => pcs1, g1c3 => ipc(5), g1c2 => dpc(5), g1c1 => ir(17), g1c0 => spc(5), g1q => npc(5), g2q => npc(4), g2c0 => spc(4), g2c1 => ir(16), g2c2 => dpc(4), g2c3 => ipc(4), sel0 => pcs0, enb2_n => trapb);

--- The LC register and Instruction Prefetch

--  lc_1a16 : sn74s241 port map(aenb_n => \-lcdrive\, ain0 => needfetch, bout3 => mf(24), ain1 => gnd, bout2 => mf(25), ain2 => \lc_byte_mode\, bout1 => mf(26), ain3 => \prog.unibus.reset\, bout0 => mf(27), bin0 => \int.enable\, aout3 => mf(28), bin1 => \sequence.break\, aout2 => mf(29), bin2 => lc(25), aout1 => mf(30), bin3 => lc(24), aout0 => mf(31), benb => lcdrive);
--  lc_1a18 : sn74s00 port map(g2b => srclc, g2a => tse1a, g2q_n => \-lcdrive\, g1b => '0', g1a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  lc_1a20 : sn74s241 port map(aenb_n => \-lcdrive\, ain0 => lc(7), bout3 => mf(0), ain1 => lc(6), bout2 => mf(1), ain2 => lc(5), bout1 => mf(2), ain3 => lc(4), bout0 => mf(3), bin0 => lc(3), aout3 => mf(4), bin1 => lc(2), aout2 => mf(5), bin2 => lc(1), aout1 => mf(6), bin3 => lc0b, aout0 => mf(7), benb => lcdrive);
--  lc_1a22 : sn74s241 port map(aenb_n => \-lcdrive\, ain0 => lc(23), bout3 => mf(16), ain1 => lc(22), bout2 => mf(17), ain2 => lc(21), bout1 => mf(18), ain3 => lc(20), bout0 => mf(19), bin0 => lc(19), aout3 => mf(20), bin1 => lc(18), aout2 => mf(21), bin2 => lc(17), aout1 => mf(22), bin3 => lc(16), aout0 => mf(23), benb => lcdrive);
--  lc_1a24 : sn74s241 port map(aenb_n => \-lcdrive\, ain0 => lc(15), bout3 => mf(8), ain1 => lc(14), bout2 => mf(9), ain2 => lc(13), bout1 => mf(10), ain3 => lc(12), bout0 => mf(11), bin0 => lc(11), aout3 => mf(12), bin1 => lc(10), aout2 => mf(13), bin2 => lc(9), aout1 => mf(14), bin3 => lc(8), aout0 => mf(15), benb => lcdrive);
--  lc_1a26 : sn74s169 port map(up_dn => hi11, clk => clk1a, i0 => ob(20), i1 => ob(21), i2 => ob(22), i3 => ob(23), enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry19\, o3 => lc(23), o2 => lc(22), o1 => lc(21), o0 => lc(20), co_n => \-lcry23\);
--  lc_1b28 : sn74s169 port map(up_dn => hi11, clk => clk1a, i0 => ob(16), i1 => ob(17), i2 => ob(18), i3 => ob(19), enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry15\, o3 => lc(19), o2 => lc(18), o1 => lc(17), o0 => lc(16), co_n => \-lcry19\);
--  lc_1c30 : sn74s169 port map(up_dn => hi11, clk => clk2a, i0 => ob(12), i1 => ob(13), i2 => ob(14), i3 => ob(15), enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry11\, o3 => lc(15), o2 => lc(14), o1 => lc(13), o0 => lc(12), co_n => \-lcry15\);
--  lc_1d29 : sn74s169 port map(up_dn => hi11, clk => clk2c, i0 => ob(8), i1 => ob(9), i2 => ob(10), i3 => ob(11), enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry7\, o3 => lc(11), o2 => lc(10), o1 => lc(9), o0 => lc(8), co_n => \-lcry11\);
--  lc_2a04 : sn74s08 port map(g3q => lcdrive, g3a => tse1a, g3b => srclc, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g4a => '0', g4b => '0');
--  lc_2a05 : sn74s04 port map(g1a => \-srclc\, g1q_n => srclc, g2a => '0', g3a => '0', g4a => '0', g5a => '0', g6a => '0');
--  lc_2b03 : sn74s169 port map(up_dn => hi11, clk => clk1a, i0 => ob(24), i1 => ob(25), i2 => nc(364), i3 => nc(365), enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry23\, o3 => nc(366), o2 => nc(367), o1 => lc(25), o0 => lc(24), co_n => nc(368));
--  lc_2c05 : sn74s169 port map(up_dn => hi11, clk => clk2a, i0 => ob(4), i1 => ob(5), i2 => ob(6), i3 => ob(7), enb_p_n => gnd, load_n => \-destlc\, enb_t_n => \-lcry3\, o3 => lc(7), o2 => lc(6), o1 => lc(5), o0 => lc(4), co_n => \-lcry7\);

--  lcc_1c15 : sn74s02 port map(g3b => \lc_byte_mode\, g3a => \-lcinc\, g3q_n => internal25, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g4b => '0', g4a => '0');
--  lcc_1c21 : sn74s283 port map(s1 => lca1, b1 => gnd, a1 => lc(1), s0 => lca0, a0 => lc(0), b0 => internal25, c0 => lcinc, c4 => lcry3, s3 => lca3, b3 => gnd, a3 => lc(3), s2 => lca2, a2 => lc(2), b2 => gnd);
--  lcc_1c27 : am25s09 port map(sel => \-destlc\, aq => lc(3), a0 => ob(3), a1 => lca3, b1 => lca2, b0 => ob(2), bq => lc(2), clk => clk2a, cq => lc(1), c0 => ob(1), c1 => lca1, d1 => lca0, d0 => ob(0), dq => lc(0));
--  lcc_1e07 : sn74s08 port map(g4q => lc0b, g4a => \lc_byte_mode\, g4b => lc(0), g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3a => '0', g3b => '0');
--  lcc_2e05 : sn74s86 port map(g1a => \inst_in_left_half\, g1b => \-ir4\, g1y => \-sh4\, g2a => lc(1), g2b => lc0b, g2y => internal27, g3y => \-sh3\, g3a => \-ir3\, g3b => \inst_in_2nd_or_4th_quarter\, g4a => '0', g4b => '0');
--  lcc_2e30 : sn74s02 port map(g3b => \-lc_modifies_mrot\, g3a => internal27, g3q_n => \inst_in_left_half\, g4b => \-lc_modifies_mrot\, g4a => lc(0), g4q_n => internal26, g1a => '0', g1b => '0', g2a => '0', g2b => '0');
--  lcc_3e05 : sn74s08 port map(g1b => internal26, g1a => \lc_byte_mode\, g1q => \inst_in_2nd_or_4th_quarter\, g2b => '0', g2a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  lcc_3e07 : sn74s00 port map(g3q_n => internal28, g3b => spc(14), g3a => \-srcspcpopreal\, g4q_n => \-ifetch\, g4a => needfetch, g4b => lcinc, g1b => '0', g1a => '0', g2b => '0', g2a => '0');
--  lcc_3e09 : sn74s32 port map(g4y => needfetch, g4a => \have_wrong_word\, g4b => \last_byte_in_word\, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g3a => '0', g3b => '0');
--  lcc_3e11 : sn74s00 port map(g1b => ir(10), g1a => ir(11), g1q_n => \-lc_modifies_mrot\, g2b => \-newlc\, g2a => \-destlc\, g2q_n => \have_wrong_word\, g3q_n => \-newlc.in\, g3b => \-lcinc\, g3a => \have_wrong_word\, g4a => '0', g4b => '0');
--  lcc_3e12 : sn74s175 port map(clr_n => \-reset\, q0 => \-newlc\, q0_n => newlc, d0 => \-newlc.in\, d1 => int, q1_n => nc(359), q1 => sintr, clk => clk3c, q2 => \next.instrd\, q2_n => nc(360), d2 => \next.instr\, d3 => nc(361), q3_n => nc(362), q3 => nc(363));
--  lcc_3e17 : sn74s02 port map(g1q_n => \next.instr\, g1a => \-spop\, g1b => internal28, g2q_n => \last_byte_in_word\, g2a => lc(1), g2b => lc0b, g3b => internal29, g3a => \next.instrd\, g3q_n => \-lcinc\, g4b => '0', g4a => '0');
--  lcc_3e22 : sn74s04 port map(g3a => needfetch, g3q_n => \-needfetch\, g1a => '0', g2a => '0', g4a => '0', g5a => '0', g6a => '0');
--  lcc_4d09 : sn74s08 port map(g2b => spc(14), g2a => \-needfetch\, g2q => spcmung, g4q => internal29, g4a => ir(24), g4b => irdisp, g1b => '0', g1a => '0', g3a => '0', g3b => '0');
--  lcc_4e03 : sn74s32 port map(g1a => spcmung, g1b => spc(1), g1y => spc1a, g4y => lcinc, g4a => \next.instrd\, g4b => internal29, g2a => '0', g2b => '0', g3a => '0', g3b => '0');

--- The VMA and VMA Selector

--  vma_1a06 : sn74s240 port map(aenb_n => \-vmadrive\, ain0 => \-vma\(31), bout3 => mf(24), ain1 => \-vma\(30), bout2 => mf(25), ain2 => \-vma\(29), bout1 => mf(26), ain3 => \-vma\(28), bout0 => mf(27), bin0 => \-vma\(27), aout3 => mf(28), bin1 => \-vma\(26), aout2 => mf(29), bin2 => \-vma\(25), aout1 => mf(30), bin3 => \-vma\(24), aout0 => mf(31), benb_n => \-vmadrive\);
--  vma_1a10 : sn74s240 port map(aenb_n => \-vmadrive\, ain0 => \-vma\(7), bout3 => mf(0), ain1 => \-vma\(6), bout2 => mf(1), ain2 => \-vma\(5), bout1 => mf(2), ain3 => \-vma\(4), bout0 => mf(3), bin0 => \-vma\(3), aout3 => mf(4), bin1 => \-vma\(2), aout2 => mf(5), bin2 => \-vma\(1), aout1 => mf(6), bin3 => \-vma\(0), aout0 => mf(7), benb_n => \-vmadrive\);
--  vma_1a12 : sn74s240 port map(aenb_n => \-vmadrive\, ain0 => \-vma\(23), bout3 => mf(16), ain1 => \-vma\(22), bout2 => mf(17), ain2 => \-vma\(21), bout1 => mf(18), ain3 => \-vma\(20), bout0 => mf(19), bin0 => \-vma\(19), aout3 => mf(20), bin1 => \-vma\(18), aout2 => mf(21), bin2 => \-vma\(17), aout1 => mf(22), bin3 => \-vma\(16), aout0 => mf(23), benb_n => \-vmadrive\);
--  vma_1a14 : sn74s240 port map(aenb_n => \-vmadrive\, ain0 => \-vma\(15), bout3 => mf(8), ain1 => \-vma\(14), bout2 => mf(9), ain2 => \-vma\(13), bout1 => mf(10), ain3 => \-vma\(12), bout0 => mf(11), bin0 => \-vma\(11), aout3 => mf(12), bin1 => \-vma\(10), aout2 => mf(13), bin2 => \-vma\(9), aout1 => mf(14), bin3 => \-vma\(8), aout0 => mf(15), benb_n => \-vmadrive\);
--  vma_1a18 : sn74s00 port map(g4q_n => \-vmadrive\, g4a => tse2, g4b => srcvma, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3b => '0', g3a => '0');
--  vma_1b22 : am25s07 port map(enb_n => \-vmaenb\, d0 => \-vma\(24), i0 => \-vmas\(24), i1 => \-vmas\(25), d1 => \-vma\(25), i2 => \-vmas\(26), d2 => \-vma\(26), clk => clk1a, d3 => \-vma\(27), i3 => \-vmas\(27), d4 => \-vma\(28), i4 => \-vmas\(28), i5 => \-vmas\(29), d5 => \-vma\(29));
--  vma_1b23 : am25s07 port map(enb_n => \-vmaenb\, d0 => \-vma\(30), i0 => \-vmas\(30), i1 => \-vmas\(31), d1 => \-vma\(31), i2 => nc(115), d2 => nc(116), clk => clk1a, d3 => nc(117), i3 => nc(118), d4 => nc(119), i4 => nc(120), i5 => nc(121), d5 => nc(122));
--  vma_1c22 : am25s07 port map(enb_n => \-vmaenb\, d0 => \-vma\(0), i0 => \-vmas\(0), i1 => \-vmas\(1), d1 => \-vma\(1), i2 => \-vmas\(2), d2 => \-vma\(2), clk => clk2a, d3 => \-vma\(3), i3 => \-vmas\(3), d4 => \-vma\(4), i4 => \-vmas\(4), i5 => \-vmas\(5), d5 => \-vma\(5));
--  vma_1c24 : am25s07 port map(enb_n => \-vmaenb\, d0 => \-vma\(12), i0 => \-vmas\(12), i1 => \-vmas\(13), d1 => \-vma\(13), i2 => \-vmas\(14), d2 => \-vma\(14), clk => clk2a, d3 => \-vma\(15), i3 => \-vmas\(15), d4 => \-vma\(16), i4 => \-vmas\(16), i5 => \-vmas\(17), d5 => \-vma\(17));
--  vma_1c25 : am25s07 port map(enb_n => \-vmaenb\, d0 => \-vma\(18), i0 => \-vmas\(18), i1 => \-vmas\(19), d1 => \-vma\(19), i2 => \-vmas\(20), d2 => \-vma\(20), clk => clk2a, d3 => \-vma\(21), i3 => \-vmas\(21), d4 => \-vma\(22), i4 => \-vmas\(22), i5 => \-vmas\(23), d5 => \-vma\(23));
--  vma_1d25 : am25s07 port map(enb_n => \-vmaenb\, d0 => \-vma\(6), i0 => \-vmas\(6), i1 => \-vmas\(7), d1 => \-vma\(7), i2 => \-vmas\(8), d2 => \-vma\(8), clk => clk2c, d3 => \-vma\(9), i3 => \-vmas\(9), d4 => \-vma\(10), i4 => \-vmas\(10), i5 => \-vmas\(11), d5 => \-vma\(11));
--  vma_2a05 : sn74s04 port map(g3a => \-srcvma\, g3q_n => srcvma, g1a => '0', g2a => '0', g4a => '0', g5a => '0', g6a => '0');

--  vmas_1a27 : sn74s258 port map(sel => vmasela, d0 => lc(22), d1 => ob(20), dy => \-vmas\(20), c0 => lc(23), c1 => ob(21), cy => \-vmas\(21), by => \-vmas\(22), b1 => ob(22), b0 => lc(24), ay => \-vmas\(23), a1 => ob(23), a0 => lc(25), enb_n => gnd);
--  vmas_1a29 : sn74s258 port map(sel => vmasela, d0 => gnd, d1 => ob(28), dy => \-vmas\(28), c0 => gnd, c1 => ob(29), cy => \-vmas\(29), by => \-vmas\(30), b1 => ob(30), b0 => gnd, ay => \-vmas\(31), a1 => ob(31), a0 => gnd, enb_n => gnd);
--  vmas_1b26 : sn74s258 port map(sel => vmaselb, d0 => lc(14), d1 => ob(12), dy => \-vmas\(12), c0 => lc(15), c1 => ob(13), cy => \-vmas\(13), by => \-vmas\(14), b1 => ob(14), b0 => lc(16), ay => \-vmas\(15), a1 => ob(15), a0 => lc(17), enb_n => gnd);
--  vmas_1b29 : sn74s258 port map(sel => vmasela, d0 => lc(18), d1 => ob(16), dy => \-vmas\(16), c0 => lc(19), c1 => ob(17), cy => \-vmas\(17), by => \-vmas\(18), b1 => ob(18), b0 => lc(20), ay => \-vmas\(19), a1 => ob(19), a0 => lc(21), enb_n => gnd);
--  vmas_1c16 : sn74s258 port map(sel => \-memstart\, d0 => \-vma\(12), d1 => \-md\(12), dy => mapi12, c0 => \-vma\(13), c1 => \-md\(13), cy => mapi13, by => mapi14, b1 => \-md\(14), b0 => \-vma\(14), ay => mapi15, a1 => \-md\(15), a0 => \-vma\(15), enb_n => gnd);
--  vmas_1c18 : sn74s258 port map(sel => \-memstart\, d0 => \-vma\(16), d1 => \-md\(16), dy => mapi16, c0 => \-vma\(17), c1 => \-md\(17), cy => mapi17, by => mapi18, b1 => \-md\(18), b0 => \-vma\(18), ay => mapi19, a1 => \-md\(19), a0 => \-vma\(19), enb_n => gnd);
--  vmas_1c20 : sn74s258 port map(sel => \-memstart\, d0 => \-vma\(20), d1 => \-md\(20), dy => mapi20, c0 => \-vma\(21), c1 => \-md\(21), cy => mapi21, by => mapi22, b1 => \-md\(22), b0 => \-vma\(22), ay => mapi23, a1 => \-md\(23), a0 => \-vma\(23), enb_n => gnd);
--  vmas_1c28 : sn74s258 port map(sel => vmaselb, d0 => lc(2), d1 => ob(0), dy => \-vmas\(0), c0 => lc(3), c1 => ob(1), cy => \-vmas\(1), by => \-vmas\(2), b1 => ob(2), b0 => lc(4), ay => \-vmas\(3), a1 => ob(3), a0 => lc(5), enb_n => gnd);
--  vmas_1d19 : sn74s258 port map(sel => \-memstart\, d0 => \-vma\(8), d1 => \-md\(8), dy => mapi8, c0 => \-vma\(9), c1 => \-md\(9), cy => mapi9, by => mapi10, b1 => \-md\(10), b0 => \-vma\(10), ay => mapi11, a1 => \-md\(11), a0 => \-vma\(11), enb_n => gnd);
--  vmas_1d30 : sn74s258 port map(sel => vmaselb, d0 => lc(10), d1 => ob(8), dy => \-vmas\(8), c0 => lc(11), c1 => ob(9), cy => \-vmas\(9), by => \-vmas\(10), b1 => ob(10), b0 => lc(12), ay => \-vmas\(11), a1 => ob(11), a0 => lc(13), enb_n => gnd);
--  vmas_2b01 : sn74s258 port map(sel => vmaselb, d0 => lc(6), d1 => ob(4), dy => \-vmas\(4), c0 => lc(7), c1 => ob(5), cy => \-vmas\(5), by => \-vmas\(6), b1 => ob(6), b0 => lc(8), ay => \-vmas\(7), a1 => ob(7), a0 => lc(9), enb_n => gnd);
--  vmas_2b04 : sn74s258 port map(sel => vmasela, d0 => gnd, d1 => ob(24), dy => \-vmas\(24), c0 => gnd, c1 => ob(25), cy => \-vmas\(25), by => \-vmas\(26), b1 => ob(26), b0 => gnd, ay => \-vmas\(27), a1 => ob(27), a0 => gnd, enb_n => gnd);

--- The MD and the MD Selector

--  md_1a02 : sn74s240 port map(aenb_n => \-mddrive\, ain0 => \-md\(31), bout3 => mf(24), ain1 => \-md\(30), bout2 => mf(25), ain2 => \-md\(29), bout1 => mf(26), ain3 => \-md\(28), bout0 => mf(27), bin0 => \-md\(27), aout3 => mf(28), bin1 => \-md\(26), aout2 => mf(29), bin2 => \-md\(25), aout1 => mf(30), bin3 => \-md\(24), aout0 => mf(31), benb_n => \-mddrive\);
--  md_1a04 : sn74s240 port map(aenb_n => \-mddrive\, ain0 => \-md\(23), bout3 => mf(16), ain1 => \-md\(22), bout2 => mf(17), ain2 => \-md\(21), bout1 => mf(18), ain3 => \-md\(20), bout0 => mf(19), bin0 => \-md\(19), aout3 => mf(20), bin1 => \-md\(18), aout2 => mf(21), bin2 => \-md\(17), aout1 => mf(22), bin3 => \-md\(16), aout0 => mf(23), benb_n => \-mddrive\);
--  md_1a05 : sn74s240 port map(aenb_n => \-mddrive\, ain0 => \-md\(7), bout3 => mf(0), ain1 => \-md\(6), bout2 => mf(1), ain2 => \-md\(5), bout1 => mf(2), ain3 => \-md\(4), bout0 => mf(3), bin0 => \-md\(3), aout3 => mf(4), bin1 => \-md\(2), aout2 => mf(5), bin2 => \-md\(1), aout1 => mf(6), bin3 => \-md\(0), aout0 => mf(7), benb_n => \-mddrive\);
--  md_1a08 : sn74s00 port map(g2b => srcmd, g2a => tse2, g2q_n => \-mddrive\, g1b => '0', g1a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  md_1a09 : sn74s240 port map(aenb_n => \-mddrive\, ain0 => \-md\(15), bout3 => mf(8), ain1 => \-md\(14), bout2 => mf(9), ain2 => \-md\(13), bout1 => mf(10), ain3 => \-md\(12), bout0 => mf(11), bin0 => \-md\(11), aout3 => mf(12), bin1 => \-md\(10), aout2 => mf(13), bin2 => \-md\(9), aout1 => mf(14), bin3 => \-md\(8), aout0 => mf(15), benb_n => \-mddrive\);
--  md_1b16 : sn74s374 port map(oenb_n => gnd, o0 => \-md\(31), i0 => \-mds\(31), i1 => \-mds\(30), o1 => \-md\(30), o2 => \-md\(29), i2 => \-mds\(29), i3 => \-mds\(28), o3 => \-md\(28), clk => mdclk, o4 => \-md\(27), i4 => \-mds\(27), i5 => \-mds\(26), o5 => \-md\(26), o6 => \-md\(25), i6 => \-mds\(25), i7 => \-mds\(24), o7 => \-md\(24));
--  md_1c17 : sn74s374 port map(oenb_n => gnd, o0 => \-md\(7), i0 => \-mds\(7), i1 => \-mds\(6), o1 => \-md\(6), o2 => \-md\(5), i2 => \-mds\(5), i3 => \-mds\(4), o3 => \-md\(4), clk => mdclk, o4 => \-md\(3), i4 => \-mds\(3), i5 => \-mds\(2), o5 => \-md\(2), o6 => \-md\(1), i6 => \-mds\(1), i7 => \-mds\(0), o7 => \-md\(0));
--  md_1c19 : sn74s374 port map(oenb_n => gnd, o0 => \-md\(23), i0 => \-mds\(23), i1 => \-mds\(22), o1 => \-md\(22), o2 => \-md\(21), i2 => \-mds\(21), i3 => \-mds\(20), o3 => \-md\(20), clk => mdclk, o4 => \-md\(19), i4 => \-mds\(19), i5 => \-mds\(18), o5 => \-md\(18), o6 => \-md\(17), i6 => \-mds\(17), i7 => \-mds\(16), o7 => \-md\(16));
--  md_1d16 : sn74s51 port map(g2a => destmdr, g2b => \-clk2c\, g2c => loadmd, g2d => loadmd, g2y => mdclk, g1a => '0', g1c => '0', g1d => '0', g1b => '0');
--  md_1d18 : sn74s04 port map(g4q_n => loadmd, g4a => \-loadmd\, g5q_n => destmdr, g5a => \-destmdr\, g1a => '0', g2a => '0', g3a => '0', g6a => '0');
--  md_1d20 : sn74s374 port map(oenb_n => gnd, o0 => \-md\(15), i0 => \-mds\(15), i1 => \-mds\(14), o1 => \-md\(14), o2 => \-md\(13), i2 => \-mds\(13), i3 => \-mds\(12), o3 => \-md\(12), clk => mdclk, o4 => \-md\(11), i4 => \-mds\(11), i5 => \-mds\(10), o5 => \-md\(10), o6 => \-md\(9), i6 => \-mds\(9), i7 => \-mds\(8), o7 => \-md\(8));
--  md_1e07 : sn74s08 port map(g3q => mdgetspar, g3a => \-destmdr\, g3b => \-ignpar\, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g4a => '0', g4b => '0');
--  md_1e19 : sn74s374 port map(oenb_n => gnd, o0 => nc(322), i0 => nc(323), i1 => nc(324), o1 => nc(325), o2 => nc(326), i2 => nc(327), i3 => nc(328), o3 => nc(329), clk => mdclk, o4 => nc(330), i4 => nc(331), i5 => nc(332), o5 => nc(333), o6 => mdhaspar, i6 => mdgetspar, i7 => \mempar_in\, o7 => mdpar);
--  md_2a05 : sn74s04 port map(g2a => \-srcmd\, g2q_n => srcmd, g1a => '0', g3a => '0', g4a => '0', g5a => '0', g6a => '0');

--  mds_1a11 : sn74s240 port map(aenb_n => \-memdrive.a\, ain0 => \-md\(31), bout3 => mem(24), ain1 => \-md\(30), bout2 => mem(25), ain2 => \-md\(29), bout1 => mem(26), ain3 => \-md\(28), bout0 => mem(27), bin0 => \-md\(27), aout3 => mem(28), bin1 => \-md\(26), aout2 => mem(29), bin2 => \-md\(25), aout1 => mem(30), bin3 => \-md\(24), aout0 => mem(31), benb_n => \-memdrive.b\);
--  mds_1a15 : sn74s240 port map(aenb_n => \-memdrive.a\, ain0 => \-md\(7), bout3 => mem(0), ain1 => \-md\(6), bout2 => mem(1), ain2 => \-md\(5), bout1 => mem(2), ain3 => \-md\(4), bout0 => mem(3), bin0 => \-md\(3), aout3 => mem(4), bin1 => \-md\(2), aout2 => mem(5), bin2 => \-md\(1), aout1 => mem(6), bin3 => \-md\(0), aout0 => mem(7), benb_n => \-memdrive.b\);
--  mds_1a17 : sn74s240 port map(aenb_n => \-memdrive.a\, ain0 => \-md\(23), bout3 => mem(16), ain1 => \-md\(22), bout2 => mem(17), ain2 => \-md\(21), bout1 => mem(18), ain3 => \-md\(20), bout0 => mem(19), bin0 => \-md\(19), aout3 => mem(20), bin1 => \-md\(18), aout2 => mem(21), bin2 => \-md\(17), aout1 => mem(22), bin3 => \-md\(16), aout0 => mem(23), benb_n => \-memdrive.b\);
--  mds_1a19 : sn74s240 port map(aenb_n => \-memdrive.a\, ain0 => \-md\(15), bout3 => mem(8), ain1 => \-md\(14), bout2 => mem(9), ain2 => \-md\(13), bout1 => mem(10), ain3 => \-md\(12), bout0 => mem(11), bin0 => \-md\(11), aout3 => mem(12), bin1 => \-md\(10), aout2 => mem(13), bin2 => \-md\(9), aout1 => mem(14), bin3 => \-md\(8), aout0 => mem(15), benb_n => \-memdrive.b\);
--  mds_1a28 : sn74s258 port map(sel => mdsela, d0 => mem(20), d1 => ob(20), dy => \-mds\(20), c0 => mem(21), c1 => ob(21), cy => \-mds\(21), by => \-mds\(22), b1 => ob(22), b0 => mem(22), ay => \-mds\(23), a1 => ob(23), a0 => mem(23), enb_n => gnd);
--  mds_1a30 : sn74s258 port map(sel => mdsela, d0 => mem(28), d1 => ob(28), dy => \-mds\(28), c0 => mem(29), c1 => ob(29), cy => \-mds\(29), by => \-mds\(30), b1 => ob(30), b0 => mem(30), ay => \-mds\(31), a1 => ob(31), a0 => mem(31), enb_n => gnd);
--  mds_1b05 : sn74s240 port map(aenb_n => \-memdrive.a\, ain0 => nc(308), bout3 => nc(309), ain1 => nc(310), bout2 => nc(311), ain2 => nc(312), bout1 => nc(313), ain3 => mdparodd, bout0 => nc(314), bin0 => nc(315), aout3 => \mempar_out\, bin1 => nc(316), aout2 => nc(317), bin2 => nc(318), aout1 => nc(319), bin3 => nc(320), aout0 => nc(321), benb_n => hi11);
--  mds_1b27 : sn74s258 port map(sel => mdselb, d0 => mem(12), d1 => ob(12), dy => \-mds\(12), c0 => mem(13), c1 => ob(13), cy => \-mds\(13), by => \-mds\(14), b1 => ob(14), b0 => mem(14), ay => \-mds\(15), a1 => ob(15), a0 => mem(15), enb_n => gnd);
--  mds_1b30 : sn74s258 port map(sel => mdsela, d0 => mem(16), d1 => ob(16), dy => \-mds\(16), c0 => mem(17), c1 => ob(17), cy => \-mds\(17), by => \-mds\(18), b1 => ob(18), b0 => mem(18), ay => \-mds\(19), a1 => ob(19), a0 => mem(19), enb_n => gnd);
--  mds_1c26 : sn74s258 port map(sel => mdselb, d0 => mem(8), d1 => ob(8), dy => \-mds\(8), c0 => mem(9), c1 => ob(9), cy => \-mds\(9), by => \-mds\(10), b1 => ob(10), b0 => mem(10), ay => \-mds\(11), a1 => ob(11), a0 => mem(11), enb_n => gnd);
--  mds_1c29 : sn74s258 port map(sel => mdselb, d0 => mem(0), d1 => ob(0), dy => \-mds\(0), c0 => mem(1), c1 => ob(1), cy => \-mds\(1), by => \-mds\(2), b1 => ob(2), b0 => mem(2), ay => \-mds\(3), a1 => ob(3), a0 => mem(3), enb_n => gnd);
--  mds_2b02 : sn74s258 port map(sel => mdselb, d0 => mem(4), d1 => ob(4), dy => \-mds\(4), c0 => mem(5), c1 => ob(5), cy => \-mds\(5), by => \-mds\(6), b1 => ob(6), b0 => mem(6), ay => \-mds\(7), a1 => ob(7), a0 => mem(7), enb_n => gnd);
--  mds_2b05 : sn74s258 port map(sel => mdsela, d0 => mem(24), d1 => ob(24), dy => \-mds\(24), c0 => mem(25), c1 => ob(25), cy => \-mds\(25), by => \-mds\(26), b1 => ob(26), b0 => mem(26), ay => \-mds\(27), a1 => ob(27), a0 => mem(27), enb_n => gnd);

--- First and Second Level Maps

--  vmem0_1c01 : sn74s280 port map(i0 => \-vmap0\, i1 => \-vmap1\, i2 => \-vmap2\, even => nc(113), odd => internal14, i3 => \-vmap3\, i4 => \-vmap4\, i5 => vpari, i6 => gnd, i7 => gnd, i8 => gnd);
--  vmem0_1c02 : sn74s280 port map(i0 => \-vma\(27), i1 => \-vma\(28), i2 => \-vma\(29), even => vm0pari, odd => nc(114), i3 => \-vma\(30), i4 => \-vma\(31), i5 => gnd, i6 => gnd, i7 => gnd, i8 => gnd);
--  vmem0_1c06 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap2\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => \-vma\(29));
--  vmem0_1c07 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap0\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => \-vma\(27));
--  vmem0_1c08 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap1\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => \-vma\(28));
--  vmem0_1c09 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap2\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => \-vma\(29));
--  vmem0_1c11 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap3\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => \-vma\(30));
--  vmem0_1c12 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap4\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => \-vma\(31));
--  vmem0_1c13 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap3\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => \-vma\(30));
--  vmem0_1c14 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap4\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => \-vma\(31));
--  vmem0_1d04 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => vpari, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => vm0pari);
--  vmem0_1d05 : am93425a port map(ce_n => mapi23, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => vpari, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpa\, di => vm0pari);
--  vmem0_1d09 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap0\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => \-vma\(27));
--  vmem0_1d10 : am93425a port map(ce_n => \-mapi23\, a0 => mapi22, a1 => mapi21, a2 => mapi20, a3 => mapi19, a4 => mapi18, do => \-vmap1\, a5 => mapi17, a6 => mapi16, a7 => mapi15, a8 => mapi14, a9 => mapi13, we_n => \-vm0wpb\, di => \-vma\(28));
--  vmem0_1d18 : sn74s04 port map(g1a => mapi23, g1q_n => \-mapi23\, g2a => '0', g3a => '0', g4a => '0', g5a => '0', g6a => '0');
--  vmem0_1d27 : sn74s02 port map(g4b => memstart, g4a => srcmap, g4q_n => \-use.map\, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g3b => '0', g3a => '0');
--  vmem0_1e26 : sn74s32 port map(g1a => \-use.map\, g1b => internal14, g1y => v0parok, g2a => \-use.map\, g2b => vmoparodd, g2y => vmoparok, g3a => '0', g3b => '0', g4a => '0', g4b => '0');

--  vmem1_1c03 : am93s48 port map(i6 => \-vma\(17), i5 => \-vma\(18), i4 => \-vma\(19), i3 => \-vma\(20), i2 => \-vma\(21), i1 => \-vma\(22), i0 => \-vma\(23), po => vm1mpar, pe => nc(109), i11 => \-vma\(12), i10 => \-vma\(13), i9 => \-vma\(14), i8 => \-vma\(15), i7 => \-vma\(16));
--  vmem1_1c04 : am93s48 port map(i6 => \-vma\(5), i5 => \-vma\(6), i4 => \-vma\(7), i3 => \-vma\(8), i2 => \-vma\(9), i1 => \-vma\(10), i0 => \-vma\(11), po => nc(110), pe => \-vm1lpar\, i11 => \-vma\(0), i10 => \-vma\(1), i9 => \-vma\(2), i8 => \-vma\(3), i7 => \-vma\(4));
--  vmem1_1d01 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(10), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(10));
--  vmem1_1d02 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(4), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(4));
--  vmem1_1d06 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(2), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(2));
--  vmem1_1d08 : sn74s240 port map(aenb_n => gnd, ain0 => mapi10, bout3 => vmap0a, ain1 => mapi9, bout2 => vmap1a, ain2 => mapi8, bout1 => vmap2a, ain3 => \-vmap4\, bout0 => vmap3a, bin0 => \-vmap3\, aout3 => vmap4a, bin1 => \-vmap2\, aout2 => \-mapi8a\, bin2 => \-vmap1\, aout1 => \-mapi9a\, bin3 => \-vmap0\, aout0 => \-mapi10a\, benb_n => gnd);
--  vmem1_1d11 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(0), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(0));
--  vmem1_1d12 : sn74s86 port map(g1a => vm1mpar, g1b => \-vm1lpar\, g1y => vm1pari, g2a => '0', g2b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  vmem1_1d13 : sn74s240 port map(aenb_n => gnd, ain0 => mapi12, bout3 => \-mapi11a\, ain1 => mapi11, bout2 => \-mapi12a\, ain2 => mapi10, bout1 => nc(111), ain3 => mapi9, bout0 => \-mapi8b\, bin0 => mapi8, aout3 => \-mapi9b\, bin1 => nc(112), aout2 => \-mapi10b\, bin2 => mapi12, aout1 => \-mapi11b\, bin3 => mapi11, aout0 => \-mapi12b\, benb_n => gnd);
--  vmem1_1e04 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(11), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(11));
--  vmem1_1e05 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(5), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(5));
--  vmem1_1e08 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(9), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(9));
--  vmem1_1e09 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(3), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(3));
--  vmem1_1e10 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(8), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(8));
--  vmem1_1e13 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(7), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(7));
--  vmem1_1e14 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(1), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(1));
--  vmem1_1e15 : am93425a port map(ce_n => gnd, a0 => vmap4a, a1 => vmap3a, a2 => vmap2a, a3 => vmap1a, a4 => vmap0a, do => \-vmo\(6), a5 => \-mapi12a\, a6 => \-mapi11a\, a7 => \-mapi10a\, a8 => \-mapi9a\, a9 => \-mapi8a\, we_n => \-vm1wpa\, di => \-vma\(6));

--  vmem2_1b01 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(20), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(20));
--  vmem2_1b02 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(21), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(21));
--  vmem2_1b03 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(22), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(22));
--  vmem2_1b04 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(23), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(23));
--  vmem2_1b06 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(16), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(16));
--  vmem2_1b07 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(17), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(17));
--  vmem2_1b08 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(18), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(18));
--  vmem2_1b09 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(19), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(19));
--  vmem2_1b11 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(12), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(12));
--  vmem2_1b12 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(13), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(13));
--  vmem2_1b13 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(14), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(14));
--  vmem2_1b14 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => \-vmo\(15), a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => \-vma\(15));
--  vmem2_1b17 : am93s48 port map(i6 => \-vmo\(17), i5 => \-vmo\(18), i4 => \-vmo\(19), i3 => \-vmo\(20), i2 => \-vmo\(21), i1 => \-vmo\(22), i0 => \-vmo\(23), po => vmoparm, pe => nc(107), i11 => \-vmo\(12), i10 => \-vmo\(13), i9 => \-vmo\(14), i8 => \-vmo\(15), i7 => \-vmo\(16));
--  vmem2_1c05 : am93425a port map(ce_n => gnd, a0 => vmap4b, a1 => vmap3b, a2 => vmap2b, a3 => vmap1b, a4 => vmap0b, do => vmopar, a5 => \-mapi12b\, a6 => \-mapi11b\, a7 => \-mapi10b\, a8 => \-mapi9b\, a9 => \-mapi8b\, we_n => \-vm1wpb\, di => vm1pari);
--  vmem2_1c10 : sn74s240 port map(aenb_n => gnd, ain0 => nc(101), bout3 => vmap0b, ain1 => nc(102), bout2 => vmap1b, ain2 => nc(103), bout1 => vmap2b, ain3 => \-vmap4\, bout0 => vmap3b, bin0 => \-vmap3\, aout3 => vmap4b, bin1 => \-vmap2\, aout2 => nc(104), bin2 => \-vmap1\, aout1 => nc(105), bin3 => \-vmap0\, aout0 => nc(106), benb_n => gnd);
--  vmem2_1d03 : am93s48 port map(i6 => \-vmo\(5), i5 => \-vmo\(6), i4 => \-vmo\(7), i3 => \-vmo\(8), i2 => \-vmo\(9), i1 => \-vmo\(10), i0 => \-vmo\(11), po => vmoparl, pe => nc(108), i11 => \-vmo\(0), i10 => \-vmo\(1), i9 => \-vmo\(2), i8 => \-vmo\(3), i7 => \-vmo\(4));
--  vmem2_1d12 : sn74s86 port map(g2a => vmoparm, g2b => vmoparl, g2y => vmoparck, g3y => vmoparodd, g3a => vmopar, g3b => vmoparck, g1a => '0', g1b => '0', g4a => '0', g4b => '0');

--  vmemdr_1a01 : sn74s240 port map(aenb_n => \-mapdrive\, ain0 => \-pfw\, bout3 => mf(24), ain1 => \-pfr\, bout2 => mf(25), ain2 => hi12, bout1 => mf(26), ain3 => \-vmap4\, bout0 => mf(27), bin0 => \-vmap3\, aout3 => mf(28), bin1 => \-vmap2\, aout2 => mf(29), bin2 => \-vmap1\, aout1 => mf(30), bin3 => \-vmap0\, aout0 => mf(31), benb_n => \-mapdrive\);
--  vmemdr_1a03 : sn74s240 port map(aenb_n => \-mapdrive\, ain0 => \-vmo\(15), bout3 => mf(8), ain1 => \-vmo\(14), bout2 => mf(9), ain2 => \-vmo\(13), bout1 => mf(10), ain3 => \-vmo\(12), bout0 => mf(11), bin0 => \-vmo\(11), aout3 => mf(12), bin1 => \-vmo\(10), aout2 => mf(13), bin2 => \-vmo\(9), aout1 => mf(14), bin3 => \-vmo\(8), aout0 => mf(15), benb_n => \-mapdrive\);
--  vmemdr_1a07 : sn74s240 port map(aenb_n => \-mapdrive\, ain0 => \-vmo\(23), bout3 => mf(16), ain1 => \-vmo\(22), bout2 => mf(17), ain2 => \-vmo\(21), bout1 => mf(18), ain3 => \-vmo\(20), bout0 => mf(19), bin0 => \-vmo\(19), aout3 => mf(20), bin1 => \-vmo\(18), aout2 => mf(21), bin2 => \-vmo\(17), aout1 => mf(22), bin3 => \-vmo\(16), aout0 => mf(23), benb_n => \-mapdrive\);
--  vmemdr_1a08 : sn74s00 port map(g1b => tse1a, g1a => srcmap, g1q_n => \-mapdrive\, g2b => '0', g2a => '0', g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  vmemdr_1a13 : sn74s240 port map(aenb_n => \-mapdrive\, ain0 => \-vmo\(7), bout3 => mf(0), ain1 => \-vmo\(6), bout2 => mf(1), ain2 => \-vmo\(5), bout1 => mf(2), ain3 => \-vmo\(4), bout0 => mf(3), bin0 => \-vmo\(3), aout3 => mf(4), bin1 => \-vmo\(2), aout2 => mf(5), bin2 => \-vmo\(1), aout1 => mf(6), bin3 => \-vmo\(0), aout0 => mf(7), benb_n => \-mapdrive\);
--  vmemdr_1d14 : sn74s373 port map(oenb_n => gnd, o0 => \-lvmo23\, i0 => \-vmo\(23), i1 => \-vmo\(22), o1 => \-lvmo22\, o2 => \-pma21\, i2 => \-vmo\(13), i3 => \-vmo\(12), o3 => \-pma20\, hold_n => memstart, o4 => \-pma19\, i4 => \-vmo\(11), i5 => \-vmo\(10), o5 => \-pma18\, o6 => \-pma17\, i6 => \-vmo\(9), i7 => \-vmo\(8), o7 => \-pma16\);
--  vmemdr_1d15 : sn74s373 port map(oenb_n => gnd, o0 => \-pma15\, i0 => \-vmo\(7), i1 => \-vmo\(6), o1 => \-pma14\, o2 => \-pma13\, i2 => \-vmo\(5), i3 => \-vmo\(4), o3 => \-pma12\, hold_n => memstart, o4 => \-pma11\, i4 => \-vmo\(3), i5 => \-vmo\(2), o5 => \-pma10\, o6 => \-pma9\, i6 => \-vmo\(1), i7 => \-vmo\(0), o7 => \-pma8\);
--  vmemdr_1e17 : am93s48 port map(i6 => \-vma\(6), i5 => \-vma\(5), i4 => \-vma\(4), i3 => \-vma\(3), i2 => \-vma\(2), i1 => \-vma\(1), i0 => \-vma\(0), po => internal13, pe => nc(100), i11 => \-pma11\, i10 => \-pma10\, i9 => \-pma9\, i8 => \-pma8\, i7 => \-vma\(7));
--  vmemdr_1e18 : am93s48 port map(i6 => \-pma18\, i5 => \-pma17\, i4 => \-pma16\, i3 => \-pma15\, i2 => \-pma14\, i1 => \-pma13\, i0 => \-pma12\, po => \-adrpar\, pe => nc(99), i11 => internal13, i10 => gnd, i9 => \-pma21\, i8 => \-pma20\, i7 => \-pma19\);
--  vmemdr_2a05 : sn74s04 port map(g4q_n => srcmap, g4a => \-srcmap\, g1a => '0', g2a => '0', g3a => '0', g5a => '0', g6a => '0');

--- Memory Control Logic

--  vctl1_1c23 : sn74s175 port map(clr_n => \-reset\, q0 => nc(126), q0_n => nc(127), d0 => nc(128), d1 => internal15, q1_n => rdcyc, q1 => wrcyc, clk => clk2a, q2 => nc(129), q2_n => nc(130), d2 => nc(131), d3 => wmap, q3_n => \-wmapd\, q3 => wmapd);
--  vctl1_1d16 : sn74s51 port map(g1a => rdcyc, g1y => internal15, g1c => memprepare, g1d => \-memwr\, g1b => \-memprepare\, g2a => '0', g2b => '0', g2c => '0', g2d => '0');
--  vctl1_1d17 : sn74s00 port map(g1b => \-lvmo22\, g1a => wrcyc, g1q_n => \-pfw\, g2b => \-pfr\, g2a => \-pfw\, g2q_n => \-vmaok\, g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  vctl1_1d21 : sn74s74 port map(g1r_n => \-mfinishd\, g1d => memrq, g1clk => mclk1a, g1s_n => hi11, g1q => mbusy, g1q_n => nc(139), g2q_n => nc(140), g2q => \rd.in.progress\, g2s_n => hi11, g2clk => mclk1a, g2d => \set.rd.in.progress\, g2r_n => \-rdfinish\);
--  vctl1_1d22 : td250 port map(input => internal16, o_100ns => \-rdfinish\, o_200ns => nc(132), o_250ns => nc(133), o_150ns => nc(134), o_50ns => nc(135));
--  vctl1_1d23 : td50 port map(input => \-mfinish\, o_20ns => nc(136), o_40ns => internal16, o_50ns => nc(137), o_30ns => \-mfinishd\, o_10ns => nc(138));
--  vctl1_1d27 : sn74s02 port map(g3b => clk2c, g3a => \-memop\, g3q_n => memprepare, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g4b => '0', g4a => '0');
--  vctl1_1d28 : sn74s08 port map(g4q => \-mfinish\, g4a => \-reset\, g4b => \-memack\, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3a => '0', g3b => '0');
--  vctl1_1e16 : sn74s11 port map(g2a => \-memrd\, g2b => \-memwr\, g2c => \-ifetch\, g2y => \-memop\, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g3c => '0', g1c => '0');
--  vctl1_1e20 : sn74s175 port map(clr_n => \-reset\, q0 => memstart, q0_n => \-memstart\, d0 => memprepare, d1 => memrq, q1_n => \-mbusy.sync\, q1 => \mbusy.sync\, clk => mclk1a, q2 => nc(141), q2_n => nc(142), d2 => nc(143), d3 => nc(144), q3_n => nc(145), q3 => nc(146));
--  vctl1_1e25 : dm9s42_1 port map(g1a1 => mbusy, g1b1 => hi11, g2a1 => memstart, g2b1 => \-pfr\, g2c1 => \-pfw\, g2d1 => hi11, out1 => memrq, out2 => \set.rd.in.progress\, g2d2 => hi11, g2c2 => rdcyc, g2b2 => \-pfr\, g2a2 => memstart, g1b2 => hi11, g1a2 => \rd.in.progress\);
--  vctl1_3f16 : sn74s64 port map(d4 => hi4, b2 => \mbusy.sync\, a2 => destmem, c3 => \-memgrant\, b3 => mbusy, a3 => \use.md\, \out\ => \-wait\, a1 => gnd, b1 => gnd, c4 => \mbusy.sync\, b4 => needfetch, a4 => lcinc);
--  vctl1_3f17 : sn74s10 port map(g1a => \rd.in.progress\, g1b => \use.md\, g1y_n => \-hang\, g1c => \-clk3g\, g2a => '0', g2b => '0', g2c => '0', g3a => '0', g3b => '0', g3c => '0');

--  vctl2_1c15 : sn74s02 port map(g1q_n => mapwr0d, g1a => \-wmapd\, g1b => \-vma\(26), g2q_n => mapwr1d, g2a => \-wmapd\, g2b => \-vma\(25), g3b => '0', g3a => '0', g4b => '0', g4a => '0');
--  vctl2_1d07 : sn74s37 port map(g1a => mapwr0d, g1b => wp1a, g1y => \-vm0wpa\, g2a => mapwr0d, g2b => wp1a, g2y => \-vm0wpb\, g3y => \-vm1wpa\, g3a => wp1b, g3b => mapwr1d, g4y => \-vm1wpb\, g4a => wp1b, g4b => mapwr1d);
--  vctl2_1d26 : sn74s04 port map(g1a => nc(123), g1q_n => nc(124), g2a => \-lvmo23\, g2q_n => \-pfr\, g3a => \-wmap\, g3q_n => wmap, g4q_n => \-memrq\, g4a => memrq, g5q_n => \-memprepare\, g5a => memprepare, g6q_n => destmem, g6a => \-destmem\);
--  vctl2_1d27 : sn74s02 port map(g1q_n => mdsela, g1a => \-destmdr\, g1b => clk2c, g2q_n => mdselb, g2a => \-destmdr\, g2b => clk2c, g3b => '0', g3a => '0', g4b => '0', g4a => '0');
--  vctl2_1d28 : sn74s08 port map(g1b => \-destvma\, g1a => \-ifetch\, g1q => \-vmaenb\, g2b => \-ifetch\, g2a => hi11, g2q => vmasela, g3q => vmaselb, g3a => hi11, g3b => \-ifetch\, g4a => '0', g4b => '0');
--  vctl2_1e06 : sn74s00 port map(g1b => wrcyc, g1a => \lm_drive_enb\, g1q_n => \-memdrive.a\, g2b => wrcyc, g2a => \lm_drive_enb\, g2q_n => \-memdrive.b\, g3b => '0', g3a => '0', g4a => '0', g4b => '0');
--  vctl2_3d04 : sn74s139 port map(g2y3 => \-wmap\, g2y2 => \-memwr\, g2y1 => \-memrd\, g2y0 => nc(125), b2 => ir(20), a2 => ir(19), g2 => \-destmem\, g1 => '0', a1 => '0', b1 => '0');
--  vctl2_3f18 : sn74s02 port map(g1q_n => \use.md\, g1a => \-srcmd\, g1b => nopa, g2a => '0', g2b => '0', g3b => '0', g3a => '0', g4b => '0', g4a => '0');
--  vctl2_3f19 : sn74s04 port map(g5q_n => nopa, g5a => \-nopa\, g1a => '0', g2a => '0', g3a => '0', g4a => '0', g6a => '0');

--  olord1_1a01 : sn74s174 port map(clr_n => \-clock_reset_a\, q1 => nc(84), d1 => nc(85), d2 => nc(86), q2 => nc(87), d3 => speed1a, q3 => sspeed1, clk => speedclk, q4 => sspeed0, d4 => speed0a, q5 => speed1a, d5 => speed1, d6 => speed0, q6 => speed0a);
--  olord1_1a04 : sn74s174 port map(clr_n => \-reset\, q1 => speed0, d1 => spy(0), d2 => spy(1), q2 => speed1, d3 => spy(2), q3 => errstop, clk => \-ldmode\, q4 => stathenb, d4 => spy(3), q5 => trapenb, d5 => spy(4), d6 => spy(5), q6 => promdisable);
--  olord1_1a08 : sn74s175 port map(clr_n => \-reset\, q0 => nc(92), q0_n => nc(93), d0 => spy(3), d1 => spy(2), q1_n => \-opcinh\, q1 => opcinh, clk => \-ldopc\, q2 => opcclk, q2_n => \-opcclk\, d2 => spy(1), d3 => spy(0), q3_n => \-lpc.hold\, q3 => \lpc.hold\);
--  olord1_1a09 : sn74s175 port map(clr_n => \-reset\, q0 => ldstat, q0_n => \-ldstat\, d0 => spy(4), d1 => spy(3), q1_n => \-idebug\, q1 => idebug, clk => \-ldclk\, q2 => nop11, q2_n => \-nop11\, d2 => spy(2), d3 => spy(1), q3_n => \-step\, q3 => step);
--  olord1_1a10 : sn74s174 port map(clr_n => \-clock_reset_a\, q1 => promdisabled, d1 => promdisable, d2 => sstep, q2 => ssdone, d3 => step, q3 => sstep, clk => mclk5a, q4 => srun, d4 => run, q5 => nc(88), d5 => nc(89), d6 => nc(90), q6 => nc(91));
--  olord1_1a14 : sn74s74 port map(g1r_n => \-clock_reset_a\, g1d => spy(0), g1clk => \-ldclk\, g1s_n => \-boot\, g1q => run, g1q_n => \-run\, g2s_n => '0', g2clk => '0', g2d => '0', g2r_n => '0');
--  olord1_1a15 : dm9s42_1 port map(g1a1 => sstep, g1b1 => \-ssdone\, g2a1 => srun, g2b1 => \-errhalt\, g2c1 => \-wait\, g2d1 => \-stathalt\, out1 => machrun, g1a2 => '0', g1b2 => '0', g2a2 => '0', g2b2 => '0', g2c2 => '0', g2d2 => '0');
--  olord1_1b10 : sn74s04 port map(g2a => ssdone, g2q_n => \-ssdone\, g5q_n => \stat.ovf\, g5a => \-stc32\, g1a => '0', g3a => '0', g4a => '0', g6a => '0');
--  olord1_1c01 : sn7428 port map(g3a => \-tpr60\, g3b => gnd, g3q_n => speedclk, g1a => '0', g1b => '0', g2a => '0', g4a => '0', g4b => '0', g2b => '0');
--  olord1_1c09 : sn74s00 port map(g3q_n => \-stathalt\, g3b => stathenb, g3a => statstop, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g4a => '0', g4b => '0');
--  olord1_1c10 : sn74s02 port map(g1q_n => \-machruna\, g1a => gnd, g1b => machrun, g2a => '0', g2b => '0', g3b => '0', g3a => '0', g4b => '0', g4a => '0');
--  olord1_1f10 : sn74s04 port map(g4q_n => \-machrun\, g4a => machrun, g1a => '0', g2a => '0', g3a => '0', g5a => '0', g6a => '0');

--  olord2_1a02 : sn74s133 port map(g => \-ape\, f => \-mpe\, e => \-pdlpe\, d => \-dpe\, c => \-ipe\, b => \-spe\, a => \-higherr\, q_n => err, h => \-mempe\, i => \-v0pe\, j => \-v1pe\, k => \-halted\, l => hi1, m => hi1);
--  olord2_1a03 : sn74s374 port map(oenb_n => gnd, o0 => \-ape\, i0 => aparok, i1 => mmemparok, o1 => \-mpe\, o2 => \-pdlpe\, i2 => pdlparok, i3 => dparok, o3 => \-dpe\, clk => clk5a, o4 => \-ipe\, i4 => iparok, i5 => spcparok, o5 => \-spe\, o6 => \-higherr\, i6 => highok, i7 => memparok, o7 => \-mempe\);
--  olord2_1a05 : sn74s374 port map(oenb_n => gnd, o0 => \-v0pe\, i0 => v0parok, i1 => vmoparok, o1 => \-v1pe\, o2 => statstop, i2 => \stat.ovf\, i3 => \-halt\, o3 => \-halted\, clk => clk5a, o4 => nc(76), i4 => nc(77), i5 => nc(78), o5 => nc(79), o6 => nc(80), i6 => nc(81), i7 => nc(82), o7 => nc(83));
--  olord2_1a06 : sn74s37 port map(g1a => \-mclk5\, g1b => \-mclk5\, g1y => mclk5a, g2a => \-clk5\, g2b => \-clk5\, g2y => clk5a, g3y => \-reset\, g3a => hi1, g3b => reset, g4y => \bus.power.reset_l\, g4a => \power_reset_a\, g4b => \power_reset_a\);
--  olord2_1a07 : sn74s02 port map(g1q_n => highok, g1a => \-upperhighok\, g1b => \-lowerhighok\, g2q_n => \-boot\, g2a => internal5, g2b => internal2, g3b => \power_reset_a\, g3a => \prog.bus.reset\, g3q_n => \-bus.reset\, g4b => '0', g4a => '0');
--  olord2_1a11 : sn74s02 port map(g1q_n => \-clock_reset_b\, g1a => \power_reset_a\, g1b => internal1, g2q_n => \-clock_reset_a\, g2a => \power_reset_a\, g2b => internal1, g3b => gnd, g3a => \-power_reset\, g3q_n => \power_reset_a\, g4b => '0', g4a => '0');
--  olord2_1a18 : sn74ls109 port map(clr1_n => \-boot\, j1 => srun, k1_n => hi1, clk1 => mclk5a, pre1_n => \-clock_reset_a\, q1 => nc(75), q1_n => \boot.trap\, clr2_n => '0', j2 => '0', k2_n => '0', clk2 => '0', pre2_n => '0');
--  olord2_1a19 : ic_16dummy port map(hi1 => hi1, hi2 => hi2, \-boot1\ => \-boot1\, \-boot2\ => \-boot2\, \-power_reset\ => \-power_reset\);

--  olord2_1a20 : sn74ls14 port map(g1q_n => internal4, g2a => \-boot1\, g2q_n => internal5, g3a => \-boot2\, g3q_n => internal3, g4q_n => \-power_reset\, g4a => internal4, g1a => '0', g5a => '0', g6a => '0');
--  olord2_1b10 : sn74s04 port map(g1a => \-ldmode\, g1q_n => ldmode, g3a => mclk5, g3q_n => \-mclk5\, g4q_n => \-clk5\, g4a => clk5, g6q_n => internal1, g6a => \-busint.lm.reset\, g2a => '0', g5a => '0');
--  olord2_1c07 : sn74s00 port map(g4q_n => \-lowerhighok\, g4a => hi2, g4b => hi1, g1b => '0', g1a => '0', g2b => '0', g2a => '0', g3b => '0', g3a => '0');
--  olord2_1c08 : sn74s10 port map(g3y_n => reset, g3a => \-boot\, g3b => \-clock_reset_b\, g3c => \-prog.reset\, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g2c => '0', g1c => '0');
--  olord2_1c09 : sn74s00 port map(g2b => ldmode, g2a => spy(6), g2q_n => \-prog.reset\, g4q_n => \-errhalt\, g4a => errstop, g4b => err, g1b => '0', g1a => '0', g3b => '0', g3a => '0');
--  olord2_1c18 : sn74s32 port map(g3y => internal2, g3a => internal3, g3b => \prog.boot\, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g4a => '0', g4b => '0');
--  olord2_1d10 : sn74s08 port map(g2b => ldmode, g2a => spy(7), g2q => \prog.boot\, g1b => '0', g1a => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');

--- Other

--  stat_1b01 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr(12), i1 => iwr(13), i2 => iwr(14), i3 => iwr(15), enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc12\, o3 => st(15), o2 => st(14), o1 => st(13), o0 => st(12), co_n => \-stc16\);
--  stat_1b02 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr(16), i1 => iwr(17), i2 => iwr(18), i3 => iwr(19), enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc16\, o3 => st(19), o2 => st(18), o1 => st(17), o0 => st(16), co_n => \-stc20\);
--  stat_1b03 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr(20), i1 => iwr(21), i2 => iwr(22), i3 => iwr(23), enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc20\, o3 => st(23), o2 => st(22), o1 => st(21), o0 => st(20), co_n => \-stc24\);
--  stat_1b04 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr(24), i1 => iwr(25), i2 => iwr(26), i3 => iwr(27), enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc24\, o3 => st(27), o2 => st(26), o1 => st(25), o0 => st(24), co_n => \-stc28\);
--  stat_1b05 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr(28), i1 => iwr(29), i2 => iwr(30), i3 => iwr(31), enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc28\, o3 => st(31), o2 => st(30), o1 => st(29), o0 => st(28), co_n => \-stc32\);
--  stat_1b06 : sn74ls244 port map(aenb_n => \-spy.sth\, ain0 => st(31), bout3 => spy(8), ain1 => st(30), bout2 => spy(9), ain2 => st(29), bout1 => spy(10), ain3 => st(28), bout0 => spy(11), bin0 => st(27), aout3 => spy(12), bin1 => st(26), aout2 => spy(13), bin2 => st(25), aout1 => spy(14), bin3 => st(24), aout0 => spy(15), benb_n => \-spy.sth\);
--  stat_1b07 : sn74ls244 port map(aenb_n => \-spy.sth\, ain0 => st(23), bout3 => spy(0), ain1 => st(22), bout2 => spy(1), ain2 => st(21), bout1 => spy(2), ain3 => st(20), bout0 => spy(3), bin0 => st(19), aout3 => spy(4), bin1 => st(18), aout2 => spy(5), bin2 => st(17), aout1 => spy(6), bin3 => st(16), aout0 => spy(7), benb_n => \-spy.sth\);
--  stat_1b08 : sn74ls244 port map(aenb_n => \-spy.stl\, ain0 => st(15), bout3 => spy(8), ain1 => st(14), bout2 => spy(9), ain2 => st(13), bout1 => spy(10), ain3 => st(12), bout0 => spy(11), bin0 => st(11), aout3 => spy(12), bin1 => st(10), aout2 => spy(13), bin2 => st(9), aout1 => spy(14), bin3 => st(8), aout0 => spy(15), benb_n => \-spy.stl\);
--  stat_1b09 : sn74ls244 port map(aenb_n => \-spy.stl\, ain0 => st(7), bout3 => spy(0), ain1 => st(6), bout2 => spy(1), ain2 => st(5), bout1 => spy(2), ain3 => st(4), bout0 => spy(3), bin0 => st(3), aout3 => spy(4), bin1 => st(2), aout2 => spy(5), bin2 => st(1), aout1 => spy(6), bin3 => st(0), aout0 => spy(7), benb_n => \-spy.stl\);
--  stat_1c03 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr(0), i1 => iwr(1), i2 => iwr(2), i3 => iwr(3), enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-statbit\, o3 => st(3), o2 => st(2), o1 => st(1), o0 => st(0), co_n => \-stc4\);
--  stat_1c04 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr(4), i1 => iwr(5), i2 => iwr(6), i3 => iwr(7), enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc4\, o3 => st(7), o2 => st(6), o1 => st(5), o0 => st(4), co_n => \-stc8\);
--  stat_1c05 : sn74s169 port map(up_dn => hi1, clk => clk5a, i0 => iwr(8), i1 => iwr(9), i2 => iwr(10), i3 => iwr(11), enb_p_n => gnd, load_n => \-ldstat\, enb_t_n => \-stc8\, o3 => st(11), o2 => st(10), o1 => st(9), o0 => st(8), co_n => \-stc12\);

--  opcs_1f06 : dm9328 port map(clr_n => hi2, aq_n => nc(71), aq => opc(13), asel => gnd, ai1 => nc(72), ai0 => pc(13), aclk => opcinha, comclk => opcclka, bclk => opcinha, bi0 => pc(12), bi1 => nc(73), bsel => gnd, bq => opc(12), bq_n => nc(74));
--  opcs_1f07 : dm9328 port map(clr_n => hi2, aq_n => nc(67), aq => opc((11)), asel => gnd, ai1 => nc(68), ai0 => pc(11), aclk => opcinha, comclk => opcclka, bclk => opcinha, bi0 => pc(10), bi1 => nc(69), bsel => gnd, bq => opc(10), bq_n => nc(70));
--  opcs_1f08 : dm9328 port map(clr_n => hi2, aq_n => nc(63), aq => opc(9), asel => gnd, ai1 => nc(64), ai0 => pc(9), aclk => opcinha, comclk => opcclkc, bclk => opcinha, bi0 => pc(8), bi1 => nc(65), bsel => gnd, bq => opc(8), bq_n => nc(66));
--  opcs_1f09 : dm9328 port map(clr_n => hi2, aq_n => nc(59), aq => opc(7), asel => gnd, ai1 => nc(60), ai0 => pc(7), aclk => opcinha, comclk => opcclkc, bclk => opcinha, bi0 => pc(6), bi1 => nc(61), bsel => gnd, bq => opc(6), bq_n => nc(62));
--  opcs_1f10 : sn74s04 port map(g1a => \-opcinh\, g1q_n => opcinha, g2a => \-opcinh\, g2q_n => opcinhb, g3a => '0', g4a => '0', g5a => '0', g6a => '0');
--  opcs_1f11 : dm9328 port map(clr_n => hi2, aq_n => nc(55), aq => opc(5), asel => gnd, ai1 => nc(56), ai0 => pc(5), aclk => opcinhb, comclk => opcclkb, bclk => opcinhb, bi0 => pc(4), bi1 => nc(57), bsel => gnd, bq => opc(4), bq_n => nc(58));
--  opcs_1f12 : dm9328 port map(clr_n => hi2, aq_n => nc(51), aq => opc((3)), asel => gnd, ai1 => nc(52), ai0 => pc(3), aclk => opcinhb, comclk => opcclkb, bclk => opcinhb, bi0 => pc(2), bi1 => nc(53), bsel => gnd, bq => opc(2), bq_n => nc(54));
--  opcs_1f13 : dm9328 port map(clr_n => hi2, aq_n => nc(47), aq => opc(1), asel => gnd, ai1 => nc(48), ai0 => pc(1), aclk => opcinhb, comclk => opcclkb, bclk => opcinhb, bi0 => pc(0), bi1 => nc(49), bsel => gnd, bq => opc(0), bq_n => nc(50));
--  opcs_1f14 : sn74s02 port map(g1q_n => opcclka, g1a => \-clk5\, g1b => opcclk, g2q_n => opcclkb, g2a => \-clk5\, g2b => opcclk, g3b => opcclk, g3a => \-clk5\, g3q_n => opcclkc, g4b => '0', g4a => '0');

--  iwrpar_1b11 : am93s48 port map(i6 => iwr(41), i5 => iwr(42), i4 => iwr(43), i3 => iwr(44), i2 => iwr(45), i1 => iwr(46), i0 => iwr(47), po => iwrp4, pe => nc(98), i11 => iwr(36), i10 => iwr(37), i9 => iwr(38), i8 => iwr(39), i7 => iwr(40));
--  iwrpar_1b12 : am93s48 port map(i6 => iwr(29), i5 => iwr(30), i4 => iwr(31), i3 => iwr(32), i2 => iwr(33), i1 => iwr(34), i0 => iwr(35), po => iwrp3, pe => nc(97), i11 => iwr(24), i10 => iwr(25), i9 => iwr(26), i8 => iwr(27), i7 => iwr(28));
--  iwrpar_1b13 : am93s48 port map(i6 => iwr(17), i5 => iwr(18), i4 => iwr(19), i3 => iwr(20), i2 => iwr(21), i1 => iwr(22), i0 => iwr(23), po => iwrp2, pe => nc(96), i11 => iwr(12), i10 => iwr(13), i9 => iwr(14), i8 => iwr(15), i7 => iwr(16));
--  iwrpar_1b14 : am93s48 port map(i6 => iwr(5), i5 => iwr(6), i4 => iwr(7), i3 => iwr(8), i2 => iwr(9), i1 => iwr(10), i0 => iwr(11), po => iwrp1, pe => nc(95), i11 => iwr(0), i10 => iwr(1), i9 => iwr(2), i8 => iwr(3), i7 => iwr(4));
--  iwrpar_1b15 : am93s48 port map(i6 => gnd, i5 => gnd, i4 => gnd, i3 => gnd, i2 => gnd, i1 => gnd, i0 => gnd, po => nc(94), pe => iwr(48), i11 => iwrp1, i10 => iwrp2, i9 => iwrp3, i8 => iwrp4, i7 => gnd);

--  trap_1d12 : sn74s86 port map(g4y => mdparerr, g4a => mdpareven, g4b => mdpar, g1a => '0', g1b => '0', g2a => '0', g2b => '0', g3a => '0', g3b => '0');
--  trap_1e28 : am93s48 port map(i6 => \-md\(5), i5 => \-md\(6), i4 => \-md\(7), i3 => \-md\(8), i2 => \-md\(9), i1 => \-md\(10), i0 => \-md\(11), po => mdparl, pe => nc(148), i11 => \-md\(0), i10 => \-md\(1), i9 => \-md\(2), i8 => \-md\(3), i7 => \-md\(4));
--  trap_1e29 : am93s48 port map(i6 => \-md\(17), i5 => \-md\(18), i4 => \-md\(19), i3 => \-md\(20), i2 => \-md\(21), i1 => \-md\(22), i0 => \-md\(23), po => mdparm, pe => nc(147), i11 => \-md\(12), i10 => \-md\(13), i9 => \-md\(14), i8 => \-md\(15), i7 => \-md\(16));
--  trap_1e30 : am93s48 port map(i6 => \-md\(29), i5 => \-md\(30), i4 => \-md\(31), i3 => mdparl, i2 => mdparm, i1 => gnd, i0 => gnd, po => mdparodd, pe => mdpareven, i11 => \-md\(24), i10 => \-md\(25), i9 => \-md\(26), i8 => \-md\(27), i7 => \-md\(28));
--  trap_3e30 : sn74s20 port map(g1a => mdparerr, g1b => mdhaspar, g1c => \use.md\, g1d => \-wait\, g1y_n => \-parerr\, g2a => '0', g2b => '0', g2c => '0', g2d => '0');
--  trap_3f18 : sn74s02 port map(g2q_n => \-trap\, g2a => internal17, g2b => \boot.trap\, g3b => \-trapenb\, g3a => \-parerr\, g3q_n => internal17, g4b => trapenb, g4a => \-parerr\, g4q_n => \-memparok\, g1a => '0', g1b => '0');
--  trap_3f19 : sn74s04 port map(g1a => \-trap\, g1q_n => trapb, g2a => \-trap\, g2q_n => trapa, g3a => \-memparok\, g3q_n => memparok, g4q_n => \-trapenb\, g4a => trapenb, g5a => '0', g6a => '0');

--  spy0_1f01 : sn74s138 port map(a => eadr(0), b => eadr(1), c => eadr(2), g2a => \-dbread\, g2b => eadr(3), g1 => hi1, y7 => \-spy.obh\, y6 => \-spy.obl\, y5 => \-spy.pc\, y4 => \-spy.opc\, y3 => nc(3), y2 => \-spy.irh\, y1 => \-spy.irm\, y0 => \-spy.irl\);
--  spy0_1f02 : sn74s138 port map(a => eadr(0), b => eadr(1), c => eadr(2), g2a => \-dbread\, g2b => gnd, g1 => eadr(3), y7 => \-spy.sth\, y6 => \-spy.stl\, y5 => \-spy.ah\, y4 => \-spy.al\, y3 => \-spy.mh\, y2 => \-spy.ml\, y1 => \-spy.flag2\, y0 => \-spy.flag1\);
--  spy0_1f03 : sn74s138 port map(a => eadr(0), b => eadr(1), c => eadr(2), g2a => \-dbwrite\, g2b => gnd, g1 => hi1, y7 => nc(1), y6 => nc(2), y5 => \-ldmode\, y4 => \-ldopc\, y3 => \-ldclk\, y2 => \-lddbirh\, y1 => \-lddbirm\, y0 => \-lddbirl\);

--  spy1_2c17 : sn74ls244 port map(aenb_n => \-spy.obl\, ain0 => ob(7), bout3 => spy(0), ain1 => ob(6), bout2 => spy(1), ain2 => ob(5), bout1 => spy(2), ain3 => ob(4), bout0 => spy(3), bin0 => ob(3), aout3 => spy(4), bin1 => ob(2), aout2 => spy(5), bin2 => ob(1), aout1 => spy(6), bin3 => ob(0), aout0 => spy(7), benb_n => \-spy.obl\);
--  spy1_2c18 : sn74ls244 port map(aenb_n => \-spy.obl\, ain0 => ob(15), bout3 => spy(8), ain1 => ob(14), bout2 => spy(9), ain2 => ob(13), bout1 => spy(10), ain3 => ob(12), bout0 => spy(11), bin0 => ob(11), aout3 => spy(12), bin1 => ob(10), aout2 => spy(13), bin2 => ob(9), aout1 => spy(14), bin3 => ob(8), aout0 => spy(15), benb_n => \-spy.obl\);
--  spy1_3c23 : sn74ls244 port map(aenb_n => \-spy.obh\, ain0 => ob(23), bout3 => spy(0), ain1 => ob(22), bout2 => spy(1), ain2 => ob(21), bout1 => spy(2), ain3 => ob(20), bout0 => spy(3), bin0 => ob(19), aout3 => spy(4), bin1 => ob(18), aout2 => spy(5), bin2 => ob(17), aout1 => spy(6), bin3 => ob(16), aout0 => spy(7), benb_n => \-spy.obh\);
--  spy1_3c24 : sn74ls244 port map(aenb_n => \-spy.obh\, ain0 => ob(31), bout3 => spy(8), ain1 => ob(30), bout2 => spy(9), ain2 => ob(29), bout1 => spy(10), ain3 => ob(28), bout0 => spy(11), bin0 => ob(27), aout3 => spy(12), bin1 => ob(26), aout2 => spy(13), bin2 => ob(25), aout1 => spy(14), bin3 => ob(24), aout0 => spy(15), benb_n => \-spy.obh\);
--  spy1_3e01 : sn74ls244 port map(aenb_n => \-spy.irl\, ain0 => ir(7), bout3 => spy(0), ain1 => ir(6), bout2 => spy(1), ain2 => ir(5), bout1 => spy(2), ain3 => ir(4), bout0 => spy(3), bin0 => ir(3), aout3 => spy(4), bin1 => ir(2), aout2 => spy(5), bin2 => ir(1), aout1 => spy(6), bin3 => ir(0), aout0 => spy(7), benb_n => \-spy.irl\);
--  spy1_3e03 : sn74ls244 port map(aenb_n => \-spy.irl\, ain0 => ir(15), bout3 => spy(8), ain1 => ir(14), bout2 => spy(9), ain2 => ir(13), bout1 => spy(10), ain3 => ir(12), bout0 => spy(11), bin0 => ir(11), aout3 => spy(12), bin1 => ir(10), aout2 => spy(13), bin2 => ir(9), aout1 => spy(14), bin3 => ir(8), aout0 => spy(15), benb_n => \-spy.irl\);
--  spy1_3e06 : sn74ls244 port map(aenb_n => \-spy.irh\, ain0 => ir(47), bout3 => spy(8), ain1 => ir(46), bout2 => spy(9), ain2 => ir(45), bout1 => spy(10), ain3 => ir(44), bout0 => spy(11), bin0 => ir(43), aout3 => spy(12), bin1 => ir(42), aout2 => spy(13), bin2 => ir(41), aout1 => spy(14), bin3 => ir(40), aout0 => spy(15), benb_n => \-spy.irh\);
--  spy1_3f21 : sn74ls244 port map(aenb_n => \-spy.irh\, ain0 => ir(39), bout3 => spy(0), ain1 => ir(38), bout2 => spy(1), ain2 => ir(37), bout1 => spy(2), ain3 => ir(36), bout0 => spy(3), bin0 => ir(35), aout3 => spy(4), bin1 => ir(34), aout2 => spy(5), bin2 => ir(33), aout1 => spy(6), bin3 => ir(32), aout0 => spy(7), benb_n => \-spy.irh\);
--  spy1_3f23 : sn74ls244 port map(aenb_n => \-spy.irm\, ain0 => ir(31), bout3 => spy(8), ain1 => ir(30), bout2 => spy(9), ain2 => ir(29), bout1 => spy(10), ain3 => ir(28), bout0 => spy(11), bin0 => ir(27), aout3 => spy(12), bin1 => ir(26), aout2 => spy(13), bin2 => ir(25), aout1 => spy(14), bin3 => ir(24), aout0 => spy(15), benb_n => \-spy.irm\);
--  spy1_3f25 : sn74ls244 port map(aenb_n => \-spy.irm\, ain0 => ir(23), bout3 => spy(0), ain1 => ir(22), bout2 => spy(1), ain2 => ir(21), bout1 => spy(2), ain3 => ir(20), bout0 => spy(3), bin0 => ir(19), aout3 => spy(4), bin1 => ir(18), aout2 => spy(5), bin2 => ir(17), aout1 => spy(6), bin3 => ir(16), aout0 => spy(7), benb_n => \-spy.irm\);

--  spy2_1f11 : sn74ls244 port map(aenb_n => \-spy.al\, ain0 => aa15, bout3 => spy(8), ain1 => aa14, bout2 => spy(9), ain2 => aa13, bout1 => spy(10), ain3 => aa12, bout0 => spy(11), bin0 => aa11, aout3 => spy(12), bin1 => aa10, aout2 => spy(13), bin2 => aa9, aout1 => spy(14), bin3 => aa8, aout0 => spy(15), benb_n => \-spy.al\);
--  spy2_1f13 : sn74ls244 port map(aenb_n => \-spy.al\, ain0 => aa7, bout3 => spy(0), ain1 => aa6, bout2 => spy(1), ain2 => aa5, bout1 => spy(2), ain3 => aa4, bout0 => spy(3), bin0 => aa3, aout3 => spy(4), bin1 => aa2, aout2 => spy(5), bin2 => aa1, aout1 => spy(6), bin3 => aa0, aout0 => spy(7), benb_n => \-spy.al\);
--  spy2_3a26 : sn74ls244 port map(aenb_n => \-spy.ah\, ain0 => a31a, bout3 => spy(8), ain1 => a30, bout2 => spy(9), ain2 => a29, bout1 => spy(10), ain3 => a28, bout0 => spy(11), bin0 => a27, aout3 => spy(12), bin1 => a26, aout2 => spy(13), bin2 => a25, aout1 => spy(14), bin3 => a24, aout0 => spy(15), benb_n => \-spy.ah\);
--  spy2_3a27 : sn74ls244 port map(aenb_n => \-spy.ah\, ain0 => a23, bout3 => spy(0), ain1 => a22, bout2 => spy(1), ain2 => a21, bout1 => spy(2), ain3 => a20, bout0 => spy(3), bin0 => a19, aout3 => spy(4), bin1 => a18, aout2 => spy(5), bin2 => a17, aout1 => spy(6), bin3 => a16, aout0 => spy(7), benb_n => \-spy.ah\);
--  spy2_3e16 : sn74ls244 port map(aenb_n => \-spy.flag2\, ain0 => nc(149), bout3 => spy(0), ain1 => nc(150), bout2 => spy(1), ain2 => ir(48), bout1 => spy(2), ain3 => nop, bout0 => spy(3), bin0 => \-vmaok\, aout3 => spy(4), bin1 => jcond, aout2 => spy(5), bin2 => pcs1, aout1 => spy(6), bin3 => pcs0, aout0 => spy(7), benb_n => \-spy.flag2\);
--  spy2_3f15 : sn74ls244 port map(aenb_n => \-spy.flag2\, ain0 => nc(151), bout3 => spy(8), ain1 => nc(152), bout2 => spy(9), ain2 => wmapd, bout1 => spy(10), ain3 => destspcd, bout0 => spy(11), bin0 => iwrited, aout3 => spy(12), bin1 => imodd, aout2 => spy(13), bin2 => pdlwrited, aout1 => spy(14), bin3 => spushd, aout0 => spy(15), benb_n => \-spy.flag2\);
--  spy2_4a13 : sn74ls244 port map(aenb_n => \-spy.ml\, ain0 => m(15), bout3 => spy(8), ain1 => m(14), bout2 => spy(9), ain2 => m(13), bout1 => spy(10), ain3 => m(12), bout0 => spy(11), bin0 => m(11), aout3 => spy(12), bin1 => m(10), aout2 => spy(13), bin2 => m(9), aout1 => spy(14), bin3 => m(8), aout0 => spy(15), benb_n => \-spy.ml\);
--  spy2_4a15 : sn74ls244 port map(aenb_n => \-spy.ml\, ain0 => m(7), bout3 => spy(0), ain1 => m(6), bout2 => spy(1), ain2 => m(5), bout1 => spy(2), ain3 => m(4), bout0 => spy(3), bin0 => m(3), aout3 => spy(4), bin1 => m(2), aout2 => spy(5), bin2 => m(1), aout1 => spy(6), bin3 => m(0), aout0 => spy(7), benb_n => \-spy.ml\);
--  spy2_4b13 : sn74ls244 port map(aenb_n => \-spy.mh\, ain0 => m(23), bout3 => spy(0), ain1 => m(22), bout2 => spy(1), ain2 => m(21), bout1 => spy(2), ain3 => m(20), bout0 => spy(3), bin0 => m(19), aout3 => spy(4), bin1 => m(18), aout2 => spy(5), bin2 => m(17), aout1 => spy(6), bin3 => m(16), aout0 => spy(7), benb_n => \-spy.mh\);
--  spy2_4b17 : sn74ls244 port map(aenb_n => \-spy.mh\, ain0 => m(31), bout3 => spy(8), ain1 => m(30), bout2 => spy(9), ain2 => m(29), bout1 => spy(10), ain3 => m(28), bout0 => spy(11), bin0 => m(27), aout3 => spy(12), bin1 => m(26), aout2 => spy(13), bin2 => m(25), aout1 => spy(14), bin3 => m(24), aout0 => spy(15), benb_n => \-spy.mh\);

--  spy4_1a12 : sn74ls244 port map(aenb_n => \-spy.flag1\, ain0 => \-wait\, bout3 => spy(8), ain1 => \-v1pe\, bout2 => spy(9), ain2 => \-v0pe\, bout1 => spy(10), ain3 => promdisable, bout0 => spy(11), bin0 => \-stathalt\, aout3 => spy(12), bin1 => err, aout2 => spy(13), bin2 => ssdone, aout1 => spy(14), bin3 => srun, aout0 => spy(15), benb_n => \-spy.flag1\);
--  spy4_1a13 : sn74s240 port map(aenb_n => \-spy.flag1\, ain0 => \-higherr\, bout3 => spy(0), ain1 => \-mempe\, bout2 => spy(1), ain2 => \-ipe\, bout1 => spy(2), ain3 => \-dpe\, bout0 => spy(3), bin0 => \-spe\, aout3 => spy(4), bin1 => \-pdlpe\, aout2 => spy(5), bin2 => \-mpe\, aout1 => spy(6), bin3 => \-ape\, aout0 => spy(7), benb_n => \-spy.flag1\);
--  spy4_1d06 : sn74ls244 port map(aenb_n => \-spy.pc\, ain0 => gnd, bout3 => spy(8), ain1 => gnd, bout2 => spy(9), ain2 => pc(13), bout1 => spy(10), ain3 => pc(12), bout0 => spy(11), bin0 => pc(11), aout3 => spy(12), bin1 => pc(10), aout2 => spy(13), bin2 => pc(9), aout1 => spy(14), bin3 => pc(8), aout0 => spy(15), benb_n => \-spy.pc\);
--  spy4_1d07 : sn74ls244 port map(aenb_n => \-spy.pc\, ain0 => pc(7), bout3 => spy(0), ain1 => pc(6), bout2 => spy(1), ain2 => pc(5), bout1 => spy(2), ain3 => pc(4), bout0 => spy(3), bin0 => pc(3), aout3 => spy(4), bin1 => pc(2), aout2 => spy(5), bin2 => pc(1), aout1 => spy(6), bin3 => pc(0), aout0 => spy(7), benb_n => \-spy.pc\);
--  spy4_1e06 : sn74ls244 port map(aenb_n => \-spy.opc\, ain0 => gnd, bout3 => spy(8), ain1 => gnd, bout2 => spy(9), ain2 => opc(13), bout1 => spy(10), ain3 => opc(12), bout0 => spy(11), bin0 => opc(11), aout3 => spy(12), bin1 => opc(10), aout2 => spy(13), bin2 => opc((9)), aout1 => spy(14), bin3 => opc(8), aout0 => spy(15), benb_n => \-spy.opc\);
--  spy4_1e07 : sn74ls244 port map(aenb_n => \-spy.opc\, ain0 => opc(7), bout3 => spy(0), ain1 => opc(6), bout2 => spy(1), ain2 => opc(5), bout1 => spy(2), ain3 => opc(4), bout0 => spy(3), bin0 => opc(3), aout3 => spy(4), bin1 => opc(2), aout2 => spy(5), bin2 => opc((1)), aout1 => spy(6), bin3 => opc(0), aout0 => spy(7), benb_n => \-spy.opc\);

--  opcd_1d18 : sn74s04 port map(g2a => \-srcdc\, g2q_n => internal20, g3a => \-srcopc\, g3q_n => internal21, g1a => '0', g4a => '0', g5a => '0', g6a => '0');
--  opcd_1e01 : sn74s241 port map(aenb_n => \-opcdrive\, ain0 => opc(7), bout3 => mf(4), ain1 => opc(6), bout2 => mf(5), ain2 => opc(5), bout1 => mf(6), ain3 => opc(4), bout0 => mf(7), bin0 => dc(7), aout3 => mf(4), bin1 => dc(6), aout2 => mf(5), bin2 => dc(5), aout1 => mf(6), bin3 => dc(4), aout0 => mf(7), benb => dcdrive);
--  opcd_1e03 : sn74s241 port map(aenb_n => \-opcdrive\, ain0 => opc(3), bout3 => mf(0), ain1 => opc(2), bout2 => mf(1), ain2 => opc((1)), bout1 => mf(2), ain3 => opc(0), bout0 => mf(3), bin0 => dc(3), aout3 => mf(0), bin1 => dc(2), aout2 => mf(1), bin2 => dc(1), aout1 => mf(2), bin3 => dc(0), aout0 => mf(3), benb => dcdrive);
--  opcd_1e06 : sn74s00 port map(g3q_n => \-opcdrive\, g3b => internal21, g3a => tse1b, g4q_n => \-zero16.drive\, g4a => tse1b, g4b => zero16, g1b => '0', g1a => '0', g2b => '0', g2a => '0');
--  opcd_1e07 : sn74s08 port map(g1b => tse1b, g1a => internal20, g1q => dcdrive, g2b => zero16, g2a => tse1b, g2q => \zero16.drive\, g3a => '0', g3b => '0', g4a => '0', g4b => '0');
--  opcd_1e16 : sn74s11 port map(g1a => \-srcopc\, g1b => zero16, g1y => \zero12.drive\, g1c => tse1b, g2a => '0', g2b => '0', g2c => '0', g3a => '0', g3b => '0', g3c => '0');
--  opcd_1f01 : sn74s241 port map(aenb_n => \-zero16.drive\, ain0 => gnd, bout3 => mf(24), ain1 => gnd, bout2 => mf(25), ain2 => gnd, bout1 => mf(26), ain3 => gnd, bout0 => mf(27), bin0 => gnd, aout3 => mf(28), bin1 => gnd, aout2 => mf(29), bin2 => gnd, aout1 => mf(30), bin3 => gnd, aout0 => mf(31), benb => \zero16.drive\);
--  opcd_1f02 : sn74s241 port map(aenb_n => \-zero16.drive\, ain0 => gnd, bout3 => mf(16), ain1 => gnd, bout2 => mf(17), ain2 => gnd, bout1 => mf(18), ain3 => gnd, bout0 => mf(19), bin0 => gnd, aout3 => mf(20), bin1 => gnd, aout2 => mf(21), bin2 => gnd, aout1 => mf(22), bin3 => gnd, aout0 => mf(23), benb => \zero16.drive\);
--  opcd_1f03 : sn74s241 port map(aenb_n => \-opcdrive\, ain0 => gnd, bout3 => mf(12), ain1 => gnd, bout2 => mf(13), ain2 => opc(13), bout1 => mf(14), ain3 => opc(12), bout0 => mf(15), bin0 => gnd, aout3 => mf(12), bin1 => gnd, aout2 => mf(13), bin2 => gnd, aout1 => mf(14), bin3 => gnd, aout0 => mf(15), benb => \zero12.drive\);
--  opcd_1f04 : sn74s241 port map(aenb_n => \-opcdrive\, ain0 => opc(11), bout3 => mf(8), ain1 => opc(10), bout2 => mf(9), ain2 => opc(9), bout1 => mf(10), ain3 => opc(8), bout0 => mf(11), bin0 => gnd, aout3 => mf(8), bin1 => gnd, aout2 => mf(9), bin2 => dc(9), aout1 => mf(10), bin3 => dc(8), aout0 => mf(11), benb => dcdrive);
--  opcd_3e30 : sn74s20 port map(g2y_n => zero16, g2a => \-srcopc\, g2b => \-srcpdlidx\, g2c => \-srcpdlptr\, g2d => \-srcdc\, g1a => '0', g1b => '0', g1c => '0', g1d => '0');

--  mo0_2a24 : sn74s151 port map(i3 => alu(15), i2 => alu(15), i1 => r(15), i0 => a15, q => ob(15), q_n => nc(290), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(15), i7 => alu(14), i6 => alu(14), i5 => alu(16), i4 => alu(16));
--  mo0_2a25 : sn74s151 port map(i3 => alu(14), i2 => alu(14), i1 => r(14), i0 => a14, q => ob(14), q_n => nc(289), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(14), i7 => alu(13), i6 => alu(13), i5 => alu(15), i4 => alu(15));
--  mo0_2a29 : sn74s151 port map(i3 => alu(13), i2 => alu(13), i1 => r(13), i0 => a13, q => ob(13), q_n => nc(288), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(13), i7 => alu(12), i6 => alu(12), i5 => alu(14), i4 => alu(14));
--  mo0_2a30 : sn74s151 port map(i3 => alu(12), i2 => alu(12), i1 => r(12), i0 => a12, q => ob(12), q_n => nc(287), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(12), i7 => alu(11), i6 => alu(11), i5 => alu(13), i4 => alu(13));
--  mo0_2b24 : sn74s151 port map(i3 => alu(7), i2 => alu(7), i1 => r(7), i0 => a7, q => ob(7), q_n => nc(282), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(7), i7 => alu(6), i6 => alu(6), i5 => alu(8), i4 => alu(8));
--  mo0_2b25 : sn74s151 port map(i3 => alu(6), i2 => alu(6), i1 => r(6), i0 => a6, q => ob(6), q_n => nc(281), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(6), i7 => alu(5), i6 => alu(5), i5 => alu(7), i4 => alu(7));
--  mo0_2b29 : sn74s151 port map(i3 => alu(5), i2 => alu(5), i1 => r(5), i0 => a5, q => ob(5), q_n => nc(280), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(5), i7 => alu(4), i6 => alu(4), i5 => alu(6), i4 => alu(6));
--  mo0_2b30 : sn74s151 port map(i3 => alu(4), i2 => alu(4), i1 => r(4), i0 => a4, q => ob(4), q_n => nc(279), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(4), i7 => alu(3), i6 => alu(3), i5 => alu(5), i4 => alu(5));
--  mo0_2c19 : sn74s151 port map(i3 => alu(11), i2 => alu(11), i1 => r(11), i0 => a11, q => ob(11), q_n => nc(286), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(11), i7 => alu(10), i6 => alu(10), i5 => alu(12), i4 => alu(12));
--  mo0_2c24 : sn74s151 port map(i3 => alu(10), i2 => alu(10), i1 => r(10), i0 => a10, q => ob(10), q_n => nc(285), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(10), i7 => alu(9), i6 => alu(9), i5 => alu(11), i4 => alu(11));
--  mo0_2c29 : sn74s151 port map(i3 => alu(3), i2 => alu(3), i1 => r(3), i0 => a3, q => ob(3), q_n => nc(278), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(3), i7 => alu(2), i6 => alu(2), i5 => alu(4), i4 => alu(4));
--  mo0_2c30 : sn74s151 port map(i3 => alu(2), i2 => alu(2), i1 => r(2), i0 => a2, q => ob(2), q_n => nc(277), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(2), i7 => alu(1), i6 => alu(1), i5 => alu(3), i4 => alu(3));
--  mo0_2d23 : sn74s151 port map(i3 => alu(9), i2 => alu(9), i1 => r(9), i0 => a9, q => ob(9), q_n => nc(284), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(9), i7 => alu(8), i6 => alu(8), i5 => alu(10), i4 => alu(10));
--  mo0_2d24 : sn74s151 port map(i3 => alu(8), i2 => alu(8), i1 => r(8), i0 => a8, q => ob(8), q_n => nc(283), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(8), i7 => alu(7), i6 => alu(7), i5 => alu(9), i4 => alu(9));
--  mo0_2d28 : sn74s151 port map(i3 => alu(1), i2 => alu(1), i1 => r(1), i0 => a1, q => ob(1), q_n => nc(276), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(1), i7 => alu(0), i6 => alu(0), i5 => alu(2), i4 => alu(2));
--  mo0_2d29 : sn74s151 port map(i3 => alu(0), i2 => alu(0), i1 => r(0), i0 => a0, q => ob(0), q_n => nc(275), ce_n => gnd, sel2 => osel1b, sel1 => osel0b, sel0 => msk(0), i7 => q(31), i6 => q(31), i5 => alu(1), i4 => alu(1));

--  mo1_2a09 : sn74s151 port map(i3 => alu(31), i2 => alu(31), i1 => r(31), i0 => a31b, q => ob(31), q_n => nc(274), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(31), i7 => alu(30), i6 => alu(30), i5 => alu(32), i4 => alu(32));
--  mo1_2a10 : sn74s151 port map(i3 => alu(30), i2 => alu(30), i1 => r(30), i0 => a30, q => ob(30), q_n => nc(273), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(30), i7 => alu(29), i6 => alu(29), i5 => alu(31), i4 => alu(31));
--  mo1_2a14 : sn74s151 port map(i3 => alu(29), i2 => alu(29), i1 => r(29), i0 => a29, q => ob(29), q_n => nc(272), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(29), i7 => alu(28), i6 => alu(28), i5 => alu(30), i4 => alu(30));
--  mo1_2a15 : sn74s151 port map(i3 => alu(28), i2 => alu(28), i1 => r(28), i0 => a28, q => ob(28), q_n => nc(271), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(28), i7 => alu(27), i6 => alu(27), i5 => alu(29), i4 => alu(29));
--  mo1_2b09 : sn74s151 port map(i3 => alu(23), i2 => alu(23), i1 => r(23), i0 => a23, q => ob(23), q_n => nc(266), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(23), i7 => alu(22), i6 => alu(22), i5 => alu(24), i4 => alu(24));
--  mo1_2b10 : sn74s151 port map(i3 => alu(22), i2 => alu(22), i1 => r(22), i0 => a22, q => ob(22), q_n => nc(265), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(22), i7 => alu(21), i6 => alu(21), i5 => alu(23), i4 => alu(23));
--  mo1_2b14 : sn74s151 port map(i3 => alu(21), i2 => alu(21), i1 => r(21), i0 => a21, q => ob(21), q_n => nc(264), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(21), i7 => alu(20), i6 => alu(20), i5 => alu(22), i4 => alu(22));
--  mo1_2b15 : sn74s151 port map(i3 => alu(20), i2 => alu(20), i1 => r(20), i0 => a20, q => ob(20), q_n => nc(263), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(20), i7 => alu(19), i6 => alu(19), i5 => alu(21), i4 => alu(21));
--  mo1_2c09 : sn74s151 port map(i3 => alu(27), i2 => alu(27), i1 => r(27), i0 => a27, q => ob(27), q_n => nc(270), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(27), i7 => alu(26), i6 => alu(26), i5 => alu(28), i4 => alu(28));
--  mo1_2c14 : sn74s151 port map(i3 => alu(24), i2 => alu(24), i1 => r(24), i0 => a24, q => ob(24), q_n => nc(267), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(24), i7 => alu(23), i6 => alu(23), i5 => alu(25), i4 => alu(25));
--  mo1_2d04 : sn74s151 port map(i3 => alu(26), i2 => alu(26), i1 => r(26), i0 => a26, q => ob(26), q_n => nc(269), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(26), i7 => alu(25), i6 => alu(25), i5 => alu(27), i4 => alu(27));
--  mo1_2d09 : sn74s151 port map(i3 => alu(25), i2 => alu(25), i1 => r(25), i0 => a25, q => ob(25), q_n => nc(268), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(25), i7 => alu(24), i6 => alu(24), i5 => alu(26), i4 => alu(26));
--  mo1_2d13 : sn74s151 port map(i3 => alu(19), i2 => alu(19), i1 => r(19), i0 => a19, q => ob(19), q_n => nc(262), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(19), i7 => alu(18), i6 => alu(18), i5 => alu(20), i4 => alu(20));
--  mo1_2d14 : sn74s151 port map(i3 => alu(18), i2 => alu(18), i1 => r(18), i0 => a18, q => ob(18), q_n => nc(261), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(18), i7 => alu(17), i6 => alu(17), i5 => alu(19), i4 => alu(19));
--  mo1_2d18 : sn74s151 port map(i3 => alu(17), i2 => alu(17), i1 => r(17), i0 => a17, q => ob(17), q_n => nc(260), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(17), i7 => alu(16), i6 => alu(16), i5 => alu(18), i4 => alu(18));
--  mo1_2d19 : sn74s151 port map(i3 => alu(16), i2 => alu(16), i1 => r(16), i0 => a16, q => ob(16), q_n => nc(259), ce_n => gnd, sel2 => osel1a, sel1 => osel0a, sel0 => msk(16), i7 => alu(15), i6 => alu(15), i5 => alu(17), i4 => alu(17));

--  bcterm_1b15 : sip220_330_8 port map(r2 => mem(0), r3 => mem(1), r4 => mem(2), r5 => mem(3), r6 => mem(4), r7 => mem(5));
--  bcterm_1b20 : sip220_330_8 port map(r2 => mem(12), r3 => mem(13), r4 => mem(14), r5 => mem(15), r6 => mem(16), r7 => mem(17));
--  bcterm_1b25 : sip220_330_8 port map(r2 => mem(24), r3 => mem(25), r4 => mem(26), r5 => mem(27), r6 => mem(28), r7 => mem(29));
--  bcterm_2c25 : sip330_470_8 port map(r2 => \-memgrant\, r3 => int, r4 => \-loadmd\, r5 => \-ignpar\, r6 => \-memack\, r7 => nc(431));

--  ipar_3e02 : am93s48 port map(i6 => ir(41), i5 => ir(42), i4 => ir(43), i3 => ir(44), i2 => ir(45), i1 => ir(46), i0 => ir(47), po => ipar3, pe => nc(381), i11 => ir(36), i10 => ir(37), i9 => ir(38), i8 => ir(39), i7 => ir(40));
--  ipar_3e04 : am93s48 port map(i6 => ir(5), i5 => ir(6), i4 => ir(7), i3 => ir(8), i2 => ir(9), i1 => ir(10), i0 => ir(11), po => ipar0, pe => nc(384), i11 => ir(0), i10 => ir(1), i9 => ir(2), i8 => ir(3), i7 => ir(4));
--  ipar_3e21 : am93s48 port map(i6 => ir(29), i5 => ir(30), i4 => ir(31), i3 => ir(32), i2 => ir(33), i1 => ir(34), i0 => ir(35), po => ipar2, pe => nc(382), i11 => ir(24), i10 => ir(25), i9 => ir(26), i8 => ir(27), i7 => ir(28));
--  ipar_3f22 : am93s48 port map(i6 => gnd, i5 => gnd, i4 => gnd, i3 => gnd, i2 => gnd, i1 => gnd, i0 => gnd, po => iparity, pe => nc(380), i11 => ipar0, i10 => ipar1, i9 => ipar2, i8 => ipar3, i7 => ir(48));
--  ipar_3f24 : am93s48 port map(i6 => ir(17), i5 => ir(18), i4 => ir(19), i3 => ir(20), i2 => ir(21), i1 => ir(22), i0 => ir(23), po => ipar1, pe => nc(383), i11 => ir(12), i10 => ir(13), i9 => ir(14), i8 => ir(15), i7 => ir(16));
--  ipar_4e03 : sn74s32 port map(g2a => imodd, g2b => iparity, g2y => iparok, g1a => '0', g1b => '0', g3a => '0', g3b => '0', g4a => '0', g4b => '0');

  vcc <= '1';
  gnd <= '0';

  -- Manual Overlord.

  speed0   <= '0';
  speed1   <= '0';
  \-ilong\ <= not '0';
  
  process
  begin
    \-hang\          <= not '0';
    \-clock_reset_b\ <= not '0';
    wait for 20 ns;
    \-clock_reset_b\ <= not '1';
    wait;
  end process;
  
  -- Poor substitute for the 5 octal display that was on the lower
  -- left-hand corner of the front door on the CADR.  See the PCTL
  -- prints.
  process (cyclecompleted)
    variable cycles : integer := 0;
  begin
    if rising_edge(cyclecompleted) then
      cycles := cycles + 1;
      
      report integer'image(cycles) & ": PC:" & to_hstring(pc);
      if tilt1 then report "TILT1"; end if;
      if tilt0 then report "TILT0"; end if;
      if dpe then report "DPE"; end if;
      if ipe then report "IPE"; end if;
      if promenable then report "PROMENABLE"; end if;
    end if;
    
    if cycles >= 1000 then
      finish;
    end if;
    
  end process;

end;
