-- The MIT CADR

library ieee;
use ieee.std_logic_1164.all;

use std.env.finish;

library work;
use work.cadr_book.all;
use work.icmem_book.all;

entity cadr_tb is
end;

architecture structural of cadr_tb is

  -- Clock and reset signals
  signal \-boot1\          : std_logic := '1';
  signal \-clock_reset_b\  : std_logic := '0';
  signal \-hang\           : std_logic := '1';
  signal \-ilong\          : std_logic := '1';
  signal sspeed0           : std_logic := '0';
  signal sspeed1           : std_logic := '0';
  signal machrun           : std_logic := '0';
  signal \-machruna\       : std_logic := '1';
  signal lcry3             : std_logic := '0';
  signal reset             : std_logic := '0';
  signal \-srcpdlidx\      : std_logic := '1';
  signal \-srcpdlptr\      : std_logic := '1';

  -- Bus signals (defined as vectors as per cursor rules)
  signal IR    : std_logic_vector(48 downto 0);
  signal M     : std_logic_vector(31 downto 0);
  signal MF    : std_logic_vector(31 downto 0);
  signal A     : std_logic_vector(31 downto 0);
  signal AA    : std_logic_vector(31 downto 0);
  signal AMEM  : std_logic_vector(31 downto 0);
  signal AADR  : std_logic_vector(9 downto 0);
  signal L     : std_logic_vector(31 downto 0);
  signal LC    : std_logic_vector(31 downto 0);
  signal WPC   : std_logic_vector(13 downto 0);
  signal LPC   : std_logic_vector(13 downto 0);
  signal ALU   : std_logic_vector(32 downto 0);
  signal XOUT  : std_logic_vector(31 downto 0);
  signal YOUT  : std_logic_vector(31 downto 0);
  signal I     : std_logic_vector(48 downto 0);
  signal SPY   : std_logic_vector(15 downto 0);
  signal DADR  : std_logic_vector(10 downto 0);
  signal DPC   : std_logic_vector(13 downto 0);
  signal MDS   : std_logic_vector(31 downto 0);
  signal MD    : std_logic_vector(31 downto 0);
  signal OB    : std_logic_vector(31 downto 0);
  signal IOB   : std_logic_vector(47 downto 0);
  signal IWR   : std_logic_vector(48 downto 0);
  signal MEM   : std_logic_vector(31 downto 0);
  signal MMEM  : std_logic_vector(31 downto 0);
  signal MSK   : std_logic_vector(31 downto 0);
  signal NPC   : std_logic_vector(13 downto 0);
  signal PC    : std_logic_vector(13 downto 0);
  signal IPC   : std_logic_vector(13 downto 0);
  signal SPC   : std_logic_vector(31 downto 0);
  signal SPCO  : std_logic_vector(31 downto 0);
  signal SPCW  : std_logic_vector(31 downto 0);
  signal SPCPTR: std_logic_vector(4 downto 0);
  signal DC    : std_logic_vector(31 downto 0);
  signal OPC   : std_logic_vector(13 downto 0);
  signal PDL   : std_logic_vector(31 downto 0);
  signal PDLIDX: std_logic_vector(9 downto 0);
  signal PDLPTR: std_logic_vector(9 downto 0);
  signal Q     : std_logic_vector(31 downto 0);
  signal SA    : std_logic_vector(31 downto 0);
  signal R     : std_logic_vector(31 downto 0);
  signal RETA  : std_logic_vector(31 downto 0);
  signal ST    : std_logic_vector(31 downto 0);
  signal VMA   : std_logic_vector(31 downto 0);
  signal VMAS  : std_logic_vector(31 downto 0);
  signal MAPI  : std_logic_vector(23 downto 0);
  signal VMAP  : std_logic_vector(4 downto 0);
  signal VMO   : std_logic_vector(23 downto 0);
  signal PMA   : std_logic_vector(31 downto 0);
  signal WADR  : std_logic_vector(9 downto 0);

  -- AA bus (fetch component input) - removed duplicate declaration

  -- IWR parity outputs from fetch
  signal iwrp1, iwrp2, iwrp3, iwrp4, iwr48 : std_logic;

  -- Clock signals from clock component
  signal cyclecompleted    : std_logic;
  signal \-tpr0\          : std_logic;
  signal \-tpr10\         : std_logic;
  signal \-tpr100\        : std_logic;
  signal \-tpr105\        : std_logic;
  signal \-tpr110\        : std_logic;
  signal \-tpr115\        : std_logic;
  signal \-tpr120\        : std_logic;
  signal \-tpr120a\       : std_logic;
  signal \-tpr125\        : std_logic;
  signal \-tpr140\        : std_logic;
  signal \-tpr15\         : std_logic;
  signal \-tpr160\        : std_logic;
  signal \-tpr180\        : std_logic;
  signal \-tpr20\         : std_logic;
  signal \-tpr200\        : std_logic;
  signal \-tpr20a\        : std_logic;
  signal \-tpr25\         : std_logic;
  signal \-tpr40\         : std_logic;
  signal \-tpr5\          : std_logic;
  signal \-tpr60\         : std_logic;
  signal \-tpr65\         : std_logic;
  signal \-tpr70\         : std_logic;
  signal \-tpr75\         : std_logic;
  signal \-tpr80\         : std_logic;
  signal \-tpr80a\        : std_logic;
  signal \-tpr85\         : std_logic;
  signal \-tprend\        : std_logic;
  signal tprend           : std_logic;
  signal \-tpw10\         : std_logic;
  signal \-tpw20\         : std_logic;
  signal \-tpw25\         : std_logic;
  signal \-tpw30\         : std_logic;
  signal \-tpw30a\        : std_logic;
  signal \-tpw35\         : std_logic;
  signal \-tpw40\         : std_logic;
  signal \-tpw40a\        : std_logic;
  signal \-tpw45\         : std_logic;
  signal \-tpw50\         : std_logic;
  signal \-tpw55\         : std_logic;
  signal \-tpw60\         : std_logic;
  signal \-tpw65\         : std_logic;
  signal \-tpw70\         : std_logic;
  signal \-tpw75\         : std_logic;
  signal \-clk0\          : std_logic;
  signal clk1             : std_logic;
  signal clk2             : std_logic;
  signal clk3             : std_logic;
  signal clk4             : std_logic;
  signal clk5             : std_logic;
  signal \-mclk0\         : std_logic;
  signal mclk1            : std_logic;
  signal mclk5            : std_logic;
  signal mclk7            : std_logic;
  signal tpclk            : std_logic;
  signal \-tpclk\         : std_logic;
  signal \-tptse\         : std_logic;
  signal tptse            : std_logic;
  signal tpwp             : std_logic;
  signal tpwpiram         : std_logic;
  signal \-tse1\          : std_logic;
  signal \-tse2\          : std_logic;
  signal \-tse3\          : std_logic;
  signal \-tse4\          : std_logic;
  signal \-wp1\           : std_logic;
  signal \-wp2\           : std_logic;
  signal \-wp3\           : std_logic;
  signal \-wp4\           : std_logic;
  signal \-wp5\           : std_logic;
  signal \-clk1\          : std_logic;
  signal clk1a            : std_logic;
  signal \-clk2a\         : std_logic;
  signal clk2a            : std_logic;
  signal clk2b            : std_logic;
  signal \-clk2c\         : std_logic;
  signal clk2c            : std_logic;
  signal \-clk3a\         : std_logic;
  signal clk3a            : std_logic;
  signal clk3b            : std_logic;
  signal clk3c            : std_logic;
  signal \-clk3d\         : std_logic;
  signal clk3d            : std_logic;
  signal clk3e            : std_logic;
  signal clk3f            : std_logic;
  signal \-clk3g\         : std_logic;
  signal \-clk4a\         : std_logic;
  signal clk4a            : std_logic;
  signal clk4b            : std_logic;
  signal clk4c            : std_logic;
  signal \-clk4d\         : std_logic;
  signal clk4d            : std_logic;
  signal \-clk4e\         : std_logic;
  signal clk4e            : std_logic;
  signal clk4f            : std_logic;
  signal \-lcry3\         : std_logic;
  signal \-mclk1\         : std_logic;
  signal mclk1a           : std_logic;
  signal \-reset\         : std_logic;
  signal srcpdlidx        : std_logic;
  signal srcpdlptr        : std_logic;
  signal tse1a            : std_logic;
  signal tse1b            : std_logic;
  signal tse2             : std_logic;
  signal tse3a            : std_logic;
  signal tse4a            : std_logic;
  signal tse4b            : std_logic;
  signal \-upperhighok\   : std_logic;
  signal wp1a             : std_logic;
  signal wp1b             : std_logic;
  signal wp2              : std_logic;
  signal wp3a             : std_logic;
  signal wp4a             : std_logic;
  signal wp4b             : std_logic;
  signal wp4c             : std_logic;

  -- Additional control signals
  signal idebug           : std_logic;
  signal \-iwrited\       : std_logic;
  signal promdisabled     : std_logic;
  signal \-ape\           : std_logic;
  signal \-dpe\           : std_logic;
  signal \-idebug\        : std_logic;
  signal \-ipe\           : std_logic;
  signal \-iwriteda\      : std_logic;
  signal \-mempe\         : std_logic;
  signal \-mpe\           : std_logic;
  signal \-pdlpe\         : std_logic;
  signal \-promdisabled\  : std_logic;
  signal \-spe\           : std_logic;
  signal \-v0pe\          : std_logic;
  signal \-v1pe\          : std_logic;
  signal \bottom.1k\      : std_logic;
  signal dpe              : std_logic;
  signal i46              : std_logic;
  signal ipe              : std_logic;
  signal \-promenable\    : std_logic;
  signal promenable       : std_logic;
  signal tilt0            : std_logic;
  signal tilt1            : std_logic;

  -- Additional missing signals for component interconnection
  -- Source decode outputs
  signal dest             : std_logic;
  signal destm            : std_logic;
  signal destmd           : std_logic;
  signal \-ir31\          : std_logic;
  signal \-srcdc\         : std_logic;
  signal \-srcimod\       : std_logic;
  signal \-srclc\         : std_logic;
  signal \-srcmd\         : std_logic;
  signal \-srcpdlpop\     : std_logic;
  signal \-srcpdltop\     : std_logic;
  signal \-srcq\          : std_logic;
  signal \-srcspc\        : std_logic;
  signal \-srcvma\        : std_logic;
  signal srcq             : std_logic;
  signal srclc            : std_logic;
  signal srcmd            : std_logic;
  signal srcvma           : std_logic;
  signal srcspc           : std_logic;
  signal srcmap           : std_logic;
  signal \-srcmap\        : std_logic;

  -- Destination decode outputs
  signal \-destimod0\     : std_logic;
  signal \-destimod1\     : std_logic;
  signal \-destintctl\    : std_logic;
  signal \-destlc\        : std_logic;
  signal \-destmdr\       : std_logic;
  signal \-destmem\       : std_logic;
  signal \-destpdl(p)\    : std_logic;
  signal \-destpdl(x)\    : std_logic;
  signal \-destpdlp\      : std_logic;
  signal \-destpdltop\    : std_logic;
  signal \-destpdlx\      : std_logic;
  signal \-destspc\       : std_logic;
  signal \-destvma\       : std_logic;
  signal destmem          : std_logic;
  signal destvma          : std_logic;
  signal destlc           : std_logic;
  signal destmdr          : std_logic;
  signal destspc          : std_logic;
  signal destspcd         : std_logic;
  signal \-destspcd\      : std_logic;

  -- Function decode outputs
  signal \-div\           : std_logic;
  signal \-mult\          : std_logic;
  signal \-funct0\        : std_logic;
  signal \-funct1\        : std_logic;
  signal \-funct2\        : std_logic;
  signal \-funct3\        : std_logic;
  signal imod             : std_logic;
  signal imodd            : std_logic;
  signal \-imodd\         : std_logic;

  -- IR decode outputs  
  signal \-ir0\           : std_logic;
  signal \-ir1\           : std_logic;
  signal \-ir2\           : std_logic;
  signal \-ir22\          : std_logic;
  signal \-ir25\          : std_logic;
  signal \-iralu\         : std_logic;
  signal iralu            : std_logic;
  signal \-irbyte\        : std_logic;
  signal irdisp           : std_logic;
  signal \-irdisp\        : std_logic;
  signal \-irjump\        : std_logic;
  signal irjump           : std_logic;
  signal \-irlp\          : std_logic;
  signal \-irshc\         : std_logic;
  signal \-iwritec\       : std_logic;
  signal iwrited          : std_logic;

  -- Jump condition outputs
  signal jcalf            : std_logic;
  signal jcond            : std_logic;
  signal jret             : std_logic;
  signal jretf            : std_logic;
  signal popj             : std_logic;

  -- NOP and misc control
  signal nop              : std_logic;
  signal nop11            : std_logic;
  signal \-nop11\         : std_logic;

  -- Status bits
  signal \-stat0\         : std_logic;
  signal \-stat1\         : std_logic;
  signal \-stat2\         : std_logic;
  signal \-stat3\         : std_logic;
  signal \-stat4\         : std_logic;
  signal \-stat5\         : std_logic;
  signal \-stat6\         : std_logic;
  signal \-stat7\         : std_logic;

  -- LC control signals
  signal \lc byte mode\   : std_logic;
  signal \-loadmd\        : std_logic;
  signal loadmd           : std_logic;
  signal \lpc.hold\       : std_logic;
  signal \-lcinc\         : std_logic;
  signal lcinc            : std_logic;
  signal \-lcry7\         : std_logic;
  signal \-lcry11\        : std_logic;
  signal \-lcry15\        : std_logic;
  signal \-lcry19\        : std_logic;
  signal \-lcry23\        : std_logic;
  signal \-lcry27\        : std_logic;
  signal \-lcdrive\       : std_logic;
  signal lcdrive          : std_logic;
  signal \-sh3\           : std_logic;
  signal \-sh4\           : std_logic;
  signal \inst in left half\ : std_logic;
  signal \inst in 2nd or 4th quarter\ : std_logic;
  signal \-lc modifies mrot\ : std_logic;
  signal \-ifetch\        : std_logic;
  signal \have wrong word\ : std_logic;
  signal \last byte in word\ : std_logic;
  signal \-newlc\         : std_logic;
  signal \-newlc.in\      : std_logic;
  signal newlc            : std_logic;
  signal needfetch        : std_logic;

  -- Parity signals
  signal lparity          : std_logic;
  signal amemparity       : std_logic;
  signal aparity          : std_logic;
  signal mmemparity       : std_logic;
  signal mparity          : std_logic;
  signal pdlparity        : std_logic;
  signal spcparity        : std_logic;
  signal spcwparity       : std_logic;
  signal spcparok         : std_logic;
  signal spcwparok        : std_logic;
  signal aparok           : std_logic;
  signal mmemparok        : std_logic;
  signal pdlparok         : std_logic;
  signal dparok           : std_logic;
  signal iparok           : std_logic;
  signal memparok         : std_logic;
  signal v0parok          : std_logic;
  signal vmoparok         : std_logic;
  signal iparity          : std_logic;
  signal iwrparity        : std_logic;
  signal iwrparok         : std_logic;

  -- Memory and enable signals
  signal \-amemenb\       : std_logic;
  signal apassenb         : std_logic;
  signal \-apassenb\      : std_logic;
  signal \-mpass\         : std_logic;
  signal mpass            : std_logic;
  signal \-mpass_out\     : std_logic;
  signal mpassl           : std_logic;
  signal \-mpassl\        : std_logic;
  signal \-mpassm\        : std_logic;
  signal pdlenb           : std_logic;
  signal spcenb           : std_logic;
  signal \-vmaenb\        : std_logic;
  signal vmasela          : std_logic;
  signal vmaselb          : std_logic;
  signal mdsela           : std_logic;
  signal mdselb           : std_logic;

  -- A/M memory address connections
  signal wadr0, wadr1, wadr2, wadr3, wadr4 : std_logic;
  signal wadr5, wadr6, wadr7, wadr8, wadr9 : std_logic;
  signal a31a, a31b       : std_logic;
  signal \-apass\         : std_logic;
  signal apass1, apass2   : std_logic;
  signal \-awpa\, \-awpb\, \-awpc\ : std_logic;
  signal destd            : std_logic;
  signal \-mwpa\, \-mwpb\ : std_logic;
  signal srcm             : std_logic;

  -- PDL control signals
  signal \-pdlcnt\        : std_logic;
  signal \-pdlcry3\       : std_logic;
  signal \-pdlcry7\       : std_logic;
  signal \-pdldrive\      : std_logic;
  signal pidrive          : std_logic;
  signal \-ppdrive\       : std_logic;
  signal pdlwrite         : std_logic;
  signal \-pdlwrited\     : std_logic;
  signal pdlwrited        : std_logic;
  signal pwidx            : std_logic;
  signal \-pwidx\         : std_logic;

  -- SPC control signals
  signal spcdrive         : std_logic;
  signal \-spcdrive\      : std_logic;
  signal \-spcpass\       : std_logic;
  signal spcwpass         : std_logic;
  signal \-spcwpass\      : std_logic;
  signal spush            : std_logic;
  signal \-spush\         : std_logic;
  signal spushd           : std_logic;
  signal \-spushd\        : std_logic;
  signal lpc13            : std_logic;
  signal \-ignpopj\       : std_logic;

  -- Q register control
  signal \-qdrive\        : std_logic;
  signal qdrive           : std_logic;
  signal qs0, qs1         : std_logic;
  signal \-alu31\         : std_logic;

  -- ALU control
  signal aluc0, aluc1, aluc2, aluc3 : std_logic;
  signal lcry11, lcry19, lcry27 : std_logic;

  -- Shifter/Masker outputs
  signal \a=m\            : std_logic;
  signal \-mr\            : std_logic;
  signal \-sr\            : std_logic;

  -- Flag condition outputs
  signal dca0, dca1       : std_logic;
  signal \-ldb\           : std_logic;
  signal ldb              : std_logic;
  signal \-n\             : std_logic;
  signal n                : std_logic;
  signal \-ope\           : std_logic;
  signal ope              : std_logic;
  signal \-pi\            : std_logic;
  signal pi               : std_logic;
  signal \-prog.unibus.reset\ : std_logic;
  signal \prog.unibus.reset\ : std_logic;
  signal \-pxct\          : std_logic;
  signal pxct             : std_logic;
  signal tpxct            : std_logic;
  signal \-tpxct\         : std_logic;
  signal \-sa0\           : std_logic;
  signal sa0              : std_logic;
  signal \sa<0>\          : std_logic;
  signal \-sa<0>\         : std_logic;
  signal \-vmo22\         : std_logic;
  signal \-vmo23\         : std_logic;
  signal vmo22            : std_logic;
  signal vmo23            : std_logic;
  signal \-wait\          : std_logic;
  signal \-spop\          : std_logic;

  -- Display memory outputs  
  signal dispenb          : std_logic;
  signal dispwr           : std_logic;
  signal \-dmapbenb\      : std_logic;
  signal \-dwea\          : std_logic;
  signal \-dweb\          : std_logic;
  signal \-dwec\          : std_logic;
  signal \-DADR\          : std_logic_vector(10 downto 0);
  signal dpar             : std_logic;
  signal dn               : std_logic;
  signal dp               : std_logic;
  signal dr               : std_logic;
  signal dpareven         : std_logic;
  signal \-dparh\         : std_logic;
  signal dparl            : std_logic;
  signal vmo18            : std_logic;
  signal vmo19            : std_logic;
  signal \-vmo18\         : std_logic;
  signal \-vmo19\         : std_logic;
  signal DMASK            : std_logic_vector(6 downto 0);

  -- NPC selector outputs
  signal dispatch         : std_logic;
  signal pcs0, pcs1       : std_logic;

  -- Virtual memory control
  signal \-pfr\           : std_logic;
  signal \-pfw\           : std_logic;
  signal \use.map\        : std_logic;
  signal \-use.map\       : std_logic;
  signal \-vm0wpa\        : std_logic;
  signal \-vm0wpb\        : std_logic;
  signal \-vm1wpa\        : std_logic;
  signal \-vm1wpb\        : std_logic;
  signal vmoparodd        : std_logic;
  signal \-mapdrive\      : std_logic;
  signal \-mapi23\        : std_logic;
  signal vm0pari          : std_logic;
  signal vm1mpar          : std_logic;
  signal vm1pari          : std_logic;
  signal \-vm1lpar\       : std_logic;
  signal vmoparm          : std_logic;
  signal vmopar           : std_logic;
  signal vmoparl          : std_logic;
  signal vmoparck         : std_logic;
  signal \-lvmo22\        : std_logic;
  signal \-lvmo23\        : std_logic;
  signal \-adrpar\        : std_logic;

  -- Memory control signals  
  signal wmap             : std_logic;
  signal \-wmap\          : std_logic;
  signal \-memwr\         : std_logic;
  signal \-memprepare\    : std_logic;
  signal memprepare       : std_logic;
  signal memrq            : std_logic;
  signal \-memack\        : std_logic;
  signal \-memrd\         : std_logic;
  signal \-memgrant\      : std_logic;
  signal \use.md\         : std_logic;
  signal wrcyc            : std_logic;
  signal \-nopa\          : std_logic;
  signal nopa             : std_logic;
  signal rdcyc            : std_logic;
  signal wrcyc_out        : std_logic;
  signal \-wmapd\         : std_logic;
  signal wmapd            : std_logic;
  signal \-vmaok\         : std_logic;
  signal \-mfinishd\      : std_logic;
  signal memrq_out        : std_logic;
  signal mbusy            : std_logic;
  signal \rd.in.progress\ : std_logic;
  signal \set.rd.in.progress\ : std_logic;
  signal \-rdfinish\      : std_logic;
  signal \-mfinish\       : std_logic;
  signal \-memop\         : std_logic;
  signal memstart         : std_logic;
  signal \-memstart\      : std_logic;
  signal \-mbusy.sync\    : std_logic;
  signal \mbusy.sync\     : std_logic;
  signal mapwr0d          : std_logic;
  signal mapwr1d          : std_logic;
  signal \-memdrive.a\    : std_logic;
  signal \-memdrive.b\    : std_logic;
  signal \-memprepare_out\ : std_logic;
  signal \-memrd_out\     : std_logic;
  signal \-memrq_out\     : std_logic;
  signal \-memwr_out\     : std_logic;
  signal \-pfr_out\       : std_logic;
  signal \use.md_out\     : std_logic;
  signal wmap_out         : std_logic;
  signal \-wmapd_out\     : std_logic;

  -- MD control signals
  signal \-ignpar\        : std_logic;
  signal mdparodd         : std_logic;
  signal \mempar in\      : std_logic;
  signal \-mddrive\       : std_logic;
  signal mdclk            : std_logic;
  signal mdgetspar        : std_logic;
  signal mdhaspar         : std_logic;
  signal mdpar            : std_logic;

  -- Overlord control signals
  signal \-clock reset a\ : std_logic;
  signal \-ldclk\         : std_logic;
  signal mclk5a           : std_logic;
  signal \-mclk5\         : std_logic;
  signal clk5a            : std_logic;
  signal \-clk5\          : std_logic;
  signal \bus.power.reset l\ : std_logic;
  signal \power reset a\  : std_logic;
  signal \-lowerhighok\   : std_logic;
  signal \-boot\          : std_logic;
  signal \prog.bus.reset\ : std_logic;
  signal \-bus.reset\     : std_logic;
  signal \-clock reset b\ : std_logic;
  signal \-clock reset a out\ : std_logic;
  signal \-power reset\   : std_logic;
  signal \boot.trap\      : std_logic;
  signal \-boot2\         : std_logic;
  signal \-ldmode\        : std_logic;
  signal ldmode           : std_logic;
  signal \-busint.lm.reset\ : std_logic;
  signal \-prog.reset\    : std_logic;
  signal \prog.boot\      : std_logic;
  signal speed1a          : std_logic;
  signal speedclk         : std_logic;
  signal speed1           : std_logic;
  signal speed0           : std_logic;
  signal errstop          : std_logic;
  signal stathenb         : std_logic;
  signal trapenb          : std_logic;
  signal promdisable      : std_logic;
  signal \-opcinh\        : std_logic;
  signal opcinh           : std_logic;
  signal \-ldopc\         : std_logic;
  signal opcclk           : std_logic;
  signal \-opcclk\        : std_logic;
  signal \-lpc.hold\      : std_logic;
  signal ldstat           : std_logic;
  signal \-ldstat\        : std_logic;
  signal \-step\          : std_logic;
  signal step             : std_logic;
  signal sstep            : std_logic;
  signal ssdone           : std_logic;
  signal srun             : std_logic;
  signal run              : std_logic;
  signal \-run\           : std_logic;
  signal \-ssdone\        : std_logic;
  signal \-errhalt\       : std_logic;
  signal \-stathalt\      : std_logic;
  signal \stat.ovf\       : std_logic;
  signal statstop         : std_logic;
  signal \-machrun\       : std_logic;
  signal \-higherr\       : std_logic;
  signal err              : std_logic;
  signal \-halted\        : std_logic;
  signal highok           : std_logic;
  signal statstop_out     : std_logic;
  signal \-halt\          : std_logic;
  signal \-ldmode_out\    : std_logic;
  signal errstop_in       : std_logic;
  signal \-errhalt_out\   : std_logic;

  -- Spy interface signals
  signal \-dbread\        : std_logic;
  signal \-dbwrite\       : std_logic;
  signal EADR             : std_logic_vector(4 downto 0);
  signal \-spy.irh\       : std_logic;
  signal \-spy.irl\       : std_logic;
  signal \-spy.irm\       : std_logic;
  signal \-spy.obh\       : std_logic;
  signal \-spy.ah\        : std_logic;
  signal \-spy.flag2\     : std_logic;
  signal \-spy.mh\        : std_logic;
  signal \-spy.ml\        : std_logic;
  signal \-spy.opc\       : std_logic;
  signal \-spy.pc\        : std_logic;
  signal \-lddbirh\       : std_logic;
  signal \-lddbirl\       : std_logic;
  signal \-lddbirm\       : std_logic;
  signal \-spy.al\        : std_logic;
  signal \-spy.flag1\     : std_logic;
  signal \-spy.sth\       : std_logic;
  signal \-spy.stl\       : std_logic;

  -- Statistics counter outputs
  signal st0, st1, st2, st3, st4, st5, st6, st7 : std_logic;
  signal st8, st9, st10, st11, st12, st13, st14, st15 : std_logic;
  signal st16, st17, st18, st19, st20, st21, st22, st23 : std_logic;
  signal st24, st25, st26, st27, st28, st29, st30, st31 : std_logic;

  -- Statistics counter carry outputs
  signal \-stc4\, \-stc8\, \-stc12\, \-stc16\, \-stc20\, \-stc24\, \-stc28\, \-stc32\ : std_logic;

  -- MOS control signals
  signal osel0a, osel1a, osel0b, osel1b : std_logic;

  -- Q register output for mo0
  signal q31 : std_logic;

  -- OPC counter signals
  signal opcclka, opcclkb, opcclkc : std_logic;
  signal opcinha, opcinhb : std_logic;

  -- Additional OPC and data counter signals
  signal \-opcdrive\, dcdrive, \-zero16.drive\, zero16, \zero16.drive\, \zero12.drive\ : std_logic;

  -- Additional trap control signals 
  signal mdparerr, mdpareven, mdparl, mdparm : std_logic;
  signal \-memparok\, \-parerr\ : std_logic;
  signal trapa, trapb : std_logic;

  -- Additional parity signals
  signal aparl, aparm, mpareven, mparl, mparm, mparodd : std_logic;

begin
  
  --- Clock Generation (clock1, clock2, clockd)
  i_clock : clock_set port map (
    \-clock_reset_b\ => \-clock_reset_b\,
    \-hang\          => \-hang\,
    \-ilong\         => \-ilong\,
    sspeed0          => sspeed0,
    sspeed1          => sspeed1,
    machrun          => machrun,
    \-machruna\      => \-machruna\,
    lcry3            => lcry3,
    reset            => reset,
    \-srcpdlidx\     => \-srcpdlidx\,
    \-srcpdlptr\     => \-srcpdlptr\,
    cyclecompleted   => cyclecompleted,
    \-tpr0\          => \-tpr0\,
    \-tpr10\         => \-tpr10\,
    \-tpr100\        => \-tpr100\,
    \-tpr105\        => \-tpr105\,
    \-tpr110\        => \-tpr110\,
    \-tpr115\        => \-tpr115\,
    \-tpr120\        => \-tpr120\,
    \-tpr120a\       => \-tpr120a\,
    \-tpr125\        => \-tpr125\,
    \-tpr140\        => \-tpr140\,
    \-tpr15\         => \-tpr15\,
    \-tpr160\        => \-tpr160\,
    \-tpr180\        => \-tpr180\,
    \-tpr20\         => \-tpr20\,
    \-tpr200\        => \-tpr200\,
    \-tpr20a\        => \-tpr20a\,
    \-tpr25\         => \-tpr25\,
    \-tpr40\         => \-tpr40\,
    \-tpr5\          => \-tpr5\,
    \-tpr60\         => \-tpr60\,
    \-tpr65\         => \-tpr65\,
    \-tpr70\         => \-tpr70\,
    \-tpr75\         => \-tpr75\,
    \-tpr80\         => \-tpr80\,
    \-tpr80a\        => \-tpr80a\,
    \-tpr85\         => \-tpr85\,
    \-tprend\        => \-tprend\,
    tprend           => tprend,
    \-tpw10\         => \-tpw10\,
    \-tpw20\         => \-tpw20\,
    \-tpw25\         => \-tpw25\,
    \-tpw30\         => \-tpw30\,
    \-tpw30a\        => \-tpw30a\,
    \-tpw35\         => \-tpw35\,
    \-tpw40\         => \-tpw40\,
    \-tpw40a\        => \-tpw40a\,
    \-tpw45\         => \-tpw45\,
    \-tpw50\         => \-tpw50\,
    \-tpw55\         => \-tpw55\,
    \-tpw60\         => \-tpw60\,
    \-tpw65\         => \-tpw65\,
    \-tpw70\         => \-tpw70\,
    \-tpw75\         => \-tpw75\,
    \-clk0\          => \-clk0\,
    clk1             => clk1,
    clk2             => clk2,
    clk3             => clk3,
    clk4             => clk4,
    clk5             => clk5,
    \-mclk0\         => \-mclk0\,
    mclk1            => mclk1,
    mclk5            => mclk5,
    mclk7            => mclk7,
    tpclk            => tpclk,
    \-tpclk\         => \-tpclk\,
    \-tptse\         => \-tptse\,
    tptse            => tptse,
    tpwp             => tpwp,
    tpwpiram         => tpwpiram,
    \-tse1\          => \-tse1\,
    \-tse2\          => \-tse2\,
    \-tse3\          => \-tse3\,
    \-tse4\          => \-tse4\,
    \-wp1\           => \-wp1\,
    \-wp2\           => \-wp2\,
    \-wp3\           => \-wp3\,
    \-wp4\           => \-wp4\,
    \-wp5\           => \-wp5\,
    \-clk1\          => \-clk1\,
    clk1a            => clk1a,
    \-clk2a\         => \-clk2a\,
    clk2a            => clk2a,
    clk2b            => clk2b,
    \-clk2c\         => \-clk2c\,
    clk2c            => clk2c,
    \-clk3a\         => \-clk3a\,
    clk3a            => clk3a,
    clk3b            => clk3b,
    clk3c            => clk3c,
    \-clk3d\         => \-clk3d\,
    clk3d            => clk3d,
    clk3e            => clk3e,
    clk3f            => clk3f,
    \-clk3g\         => \-clk3g\,
    \-clk4a\         => \-clk4a\,
    clk4a            => clk4a,
    clk4b            => clk4b,
    clk4c            => clk4c,
    \-clk4d\         => \-clk4d\,
    clk4d            => clk4d,
    \-clk4e\         => \-clk4e\,
    clk4e            => clk4e,
    clk4f            => clk4f,
    \-lcry3\         => \-lcry3\,
    \-mclk1\         => \-mclk1\,
    mclk1a           => mclk1a,
    \-reset\         => \-reset\,
    srcpdlidx        => srcpdlidx,
    srcpdlptr        => srcpdlptr,
    tse1a            => tse1a,
    tse1b            => tse1b,
    tse2             => tse2,
    tse3a            => tse3a,
    tse4a            => tse4a,
    tse4b            => tse4b,
    \-upperhighok\   => \-upperhighok\,
    wp1a             => wp1a,
    wp1b             => wp1b,
    wp2              => wp2,
    wp3a             => wp3a,
    wp4a             => wp4a,
    wp4b             => wp4b,
    wp4c             => wp4c
  );
  --- Microinstruction Fetch (ictl, iramXX, pctl, promX, iwr, debug)
  i_imem  : imem_set port map (
    PC               => PC,
    idebug           => idebug,
    \-iwrited\       => \-iwrited\,
    promdisabled     => promdisabled,
    \-wp5\           => \-wp5\,
    IWR              => IWR,
    I                => I,
    \-iwriteda\      => \-iwriteda\,
    iwriteda         => open,
    \-promdisabled\  => \-promdisabled\,
    ramdisable       => open,
    wp5a             => open,
    wp5b             => open,
    wp5c             => open
  );
  i_prom  : prom_set port map (
    PC               => PC,
    \-ape\           => \-ape\,
    \-dpe\           => \-dpe\,
    \-idebug\        => \-idebug\,
    \-ipe\           => \-ipe\,
    \-iwriteda\      => \-iwriteda\,
    \-mempe\         => \-mempe\,
    \-mpe\           => \-mpe\,
    \-pdlpe\         => \-pdlpe\,
    \-promdisabled\  => \-promdisabled\,
    \-spe\           => \-spe\,
    \-v0pe\          => \-v0pe\,
    \-v1pe\          => \-v1pe\,
    I                => open, -- PROM I output (alternative to RAM)
    \bottom.1k\      => \bottom.1k\,
    dpe              => dpe,
    i46              => i46,
    ipe              => ipe,
    \-promenable\    => \-promenable\,
    promenable       => promenable,
    tilt0            => tilt0,
    tilt1            => tilt1
  );
  i_fetch : fetch_set port map (
    clk2c => clk2c,
    clk4c => clk4c,
    \-idebug\ => \-idebug\,
    \-lddbirh\ => \-lddbirh\,
    \-lddbirm\ => \-lddbirm\,
    \-lddbirl\ => \-lddbirl\,
    AA => AA,
    M => M,
    SPY => SPY,
    I => I,
    IWR => IWR(47 downto 0),
    iwrp1 => iwrp1,
    iwrp2 => iwrp2,
    iwrp3 => iwrp3,
    iwrp4 => iwrp4,
    iwr48 => iwr48
  );
  --- Microinstrction Modification and Main Instruction Register (ior, ireg)
  i_ireg   : ireg_set port map(
    clk3a => clk3a,
    clk3b => clk3b,
    \-destimod0\ => open,
    \-destimod1\ => open,
    I => I,
    OB => OB,
    IOB => open,
    IR => IR
  );
  --- IR Decoding (source)
  i_decode : decode_set port map(
    \destimod0 l\ => open,
    \-idebug\ => \-idebug\,
    \-ir31\ => \-ir31\,
    \iwrited l\ => open,
    nop => nop,
    IR => IR(44 downto 3),
    dest => dest,
    destm => destm,
    imod => imod,
    iralu => open,
    irdisp => open,
    irjump => open,
    \-funct0\ => open,
    \-funct1\ => open,
    \-funct2\ => open,
    \-funct3\ => open,
    \-destimod0\ => open,
    \-destimod1\ => open,
    \-destintctl\ => open,
    \-destlc\ => open,
    \-destmdr\ => open,
    \-destmem\ => open,
    \-destpdl(p)\ => \-destpdl(p)\,
    \-destpdl(x)\ => \-destpdl(x)\,
    \-destpdlp\ => \-destpdlp\,
    \-destpdltop\ => \-destpdltop\,
    \-destpdlx\ => \-destpdlx\,
    \-destspc\ => \-destspc\,
    \-destvma\ => open,
    \-srcdc\ => open,
    \-srclc\ => open,
    \-srcmap\ => open,
    \-srcmd\ => open,
    \-srcopc\ => open,
    \-srcpdlidx\ => open,
    \-srcpdlpop\ => \-srcpdlpop\,
    \-srcpdlptr\ => open,
    \-srcpdltop\ => \-srcpdltop\,
    \-srcq\ => open,
    \-srcspc\ => \-srcspc\,
    \-srcspcpop\ => \-srcspcpop\,
    \-srcvma\ => open,
    \-div\ => open,
    \-iralu\ => open,
    \-irbyte\ => \-irbyte\,
    \-irdisp\ => open,
    \-irjump\ => open,
    \-ir22\ => open,
    \-ir25\ => open,
    \-mul\ => open,
    \-specalu\ => open
  );
  --- A & M Memory (actl, amem0, amem1, mctrl, mmem, mlatch, mf)
  i_amem  : amem_set port map (
    clk3d        => clk3d,
    clk3e        => clk3e,
    dest         => dest,
    destm        => destm,
    \-reset\     => \-reset\,
    tse3a        => tse3a,
    tse4a        => tse4a,
    wp3a         => wp3a,
    \-amemenb\   => \-amemenb\,
    apassenb     => apassenb,
    \-apassenb\  => \-apassenb\,
    IR           => IR(41 downto 14),
    L            => L,
    A            => A,
    AADR         => AADR,
    AMEM         => AMEM,
    lparity      => lparity,
    amemparity   => amemparity,
    aparity      => aparity,
    a31a         => a31a,
    a31b         => a31b,
    \-apass\     => \-apass\,
    apass1       => apass1,
    apass2       => apass2,
    \-awpa\      => \-awpa\,
    \-awpb\      => \-awpb\,
    \-awpc\      => \-awpc\,
    destd        => destd,
    destmd       => destmd,
    wadr0        => wadr0,
    wadr1        => wadr1,
    wadr2        => wadr2,
    wadr3        => wadr3,
    wadr4        => wadr4,
    wadr5        => wadr5,
    wadr6        => wadr6,
    wadr7        => wadr7,
    wadr8        => wadr8,
    wadr9        => wadr9
  );
  i_mmem  : mmem_set port map (
    clk4a        => clk4a,
    clk4e        => clk4e,
    destmd       => destmd,
    \-ir31\      => \-ir31\,
    tse4a        => tse4a,
    wp4b         => wp4b,
    \-mpass\     => \-mpass\,
    pdlenb       => pdlenb,
    spcenb       => spcenb,
    tse1a        => tse1a,
    IR           => IR(30 downto 26),
    L            => L,
    MF           => MF,
    lparity      => lparity,
    wadr0        => wadr0,
    wadr1        => wadr1,
    wadr2        => wadr2,
    wadr3        => wadr3,
    wadr4        => wadr4,
    M            => M,
    MMEM         => MMEM,
    mmemparity   => mmemparity,
    mparity      => mparity,
    mpass        => mpass,
    \-mpass_out\ => \-mpass_out\,
    mpassl       => mpassl,
    \-mpassl\    => \-mpassl\,
    \-mpassm\    => \-mpassm\,
    \-mwpa\      => \-mwpa\,
    \-mwpb\      => \-mwpb\,
    srcm         => srcm
  );
  -- A & M Parity (apar)
  i_ampar : ampar_set port map(
    A => A,
    M => M,
    a31b => a31b,
    aparity => aparity,
    mparity => mparity,
    srcm => srcm,
    pdlenb => pdlenb,
    aparl => aparl,
    aparm => aparm,
    aparok => aparok,
    mmemparok => mmemparok,
    mpareven => mpareven,
    mparl => mparl,
    mparm => mparm,
    mparodd => mparodd,
    pdlparok => pdlparok
  );
  --- Stack Buffer (pdlptr, pdlctl, pdl0, pdl1, platch)
  i_pdl   : pdl_set port map (L => L, M => M, OB => OB(9 downto 0), PDL => PDL, PDLIDX => PDLIDX, PDLPTR => PDLPTR, MF => MF, clk3f => clk3f, clk4a => clk4a, clk4b => clk4b, \-clk4e\ => \-clk4e\, clk4f => clk4f, \-destpdl(p)\ => \-destpdl(p)\, \-destpdl(x)\ => \-destpdl(x)\, \-destpdlp\ => \-destpdlp\, \-destpdltop\ => \-destpdltop\, \-destpdlx\ => \-destpdlx\, \-destspc\ => \-destspc\, imod => imod, ir30 => IR(30), lparity => lparity, nop => nop, \-pdlcnt\ => \-pdlcnt\, \-reset\ => \-reset\, srcpdlidx => srcpdlidx, \-srcpdlpop\ => \-srcpdlpop\, srcpdlptr => srcpdlptr, \-srcpdltop\ => \-srcpdltop\, tse4b => tse4b, wp4a => wp4a, \-destspcd\ => \-destspcd\, imodd => imodd, \-imodd\ => \-imodd\, \-pdlcry3\ => \-pdlcry3\, \-pdlcry7\ => \-pdlcry7\, \-pdldrive\ => \-pdldrive\, pdlenb => pdlenb, pdlparity => pdlparity, pidrive => pidrive, \-ppdrive\ => \-ppdrive\, pdlwrite => pdlwrite, \-pdlwrited\ => \-pdlwrited\, pdlwrited => pdlwrited, pwidx => pwidx, \-pwidx\ => \-pwidx\);
  --- Shifter/Masker (smctl, shift0, shift1, mskg4)
  i_sm    : sm_set port map (IR => IR(13 downto 0), M => M, MSK => MSK, R => R, SA => SA, \-irbyte\ => \-irbyte\, \-sh3\ => \-sh3\, \-sh4\ => \-sh4\, ir31 => IR(31), \a=m\ => \a=m\, \-mr\ => \-mr\, \-sr\ => \-sr\);
  -- ALU (alu0, alu1, aluc4)
  i_alu   : alu_set port map (A => A, M => M, aluc0 => aluc0, aluc1 => aluc1, aluc2 => aluc2, aluc3 => aluc3, ALU => ALU, lcry3 => lcry3, lcry11 => lcry11, lcry19 => lcry19, lcry27 => lcry27, osel0a => osel0a, osel1a => osel1a, osel0b => osel0b, osel1b => osel1b);
  --- The Q Register (qctl, q)
  i_qreg  : qreg_set port map (clk2b => clk2b, ALU => ALU, \-ir0\ => \-ir0\, \-ir1\ => \-ir1\, \-iralu\ => \-iralu\, \-srcq\ => \-srcq\, tse2 => tse2, Q => Q, MF => MF, \-alu31\ => \-alu31\, \-qdrive\ => \-qdrive\, qdrive => qdrive, qs0 => qs0, qs1 => qs1, srcq => srcq, q31 => q31);
  --- The L Register (l)
  i_lreg  : lreg_set port map(
    clk3f => clk3f,
    OB => OB,
    L => L,
    lparl => open,
    \-lparm\ => open,
    lparity => lparity,
    \-lparity\ => open
  );
  --- The Dispatch Memory (dspctl, dram0, dram1, dram2)
  i_dmem  : dmem_set port map (clk3e => clk3e, IR => IR(41 downto 5), A => A(17 downto 0), AA => open, dispenb => open, \-irdisp\ => open, \-funct2\ => open, wp2 => wp2, R => R(6 downto 0), dispwr => open, \-dmapbenb\ => open, \-dwea\ => open, \-dweb\ => open, \-dwec\ => open, DADR => DADR, \-DADR\ => open, dpar => open, dn => open, dp => open, dr => open, dpareven => open, dparok => open, \-dparh\ => open, dparl => open, DPC => DPC, vmo18 => open, vmo19 => open, \-vmo18\ => open, \-vmo19\ => open, DMASK => open);
  --- Jump Conditions (flag)
  i_jumpc  : jumpc_set port map (
    clk3c => clk3c,
    \-reset\ => \-reset\,
    \a=m\ => \a=m\,
    alu32 => open,
    \-destintctl\ => open,
    \-nopa\ => open,
    r0 => open,
    sintr => open,
    \-vmaok\ => open,
    IR => IR(46 downto 0),
    OB => OB(29 downto 26),
    \-alu32\ => open,
    aluneg => open,
    conds0 => open,
    conds1 => open,
    conds2 => open,
    \-ilong\ => open,
    \int.enable\ => open,
    jcond => open,
    \-jcond\ => open,
    \lc byte mode\ => open,
    \pgf.or.int\ => open,
    \pgf.or.int.or.sb\ => open,
    \prog.unibus.reset\ => open,
    \sequence.break\ => open,
    sint => open,
    \-statbit\ => open
  );
  --- Flow of Control (contrl)
  i_flowc : flowc_set port map(
    clk3c => clk3c,
    \-reset\ => \-reset\,
    tse3a => tse3a,
    \-funct2\ => open,
    \-irdisp\ => open,
    irdisp => open,
    irjump => open,
    \-jcond\ => open,
    jcond => open,
    \-nop11\ => open,
    \-srcspc\ => \-srcspc\,
    \-srcspcpop\ => \-srcspcpop\,
    \-trap\ => open,
    IR => IR(42 downto 6),
    \-dfall\ => open,
    \-destspc\ => open,
    destspc => open,
    dispenb => open,
    dn => open,
    dp => open,
    dr => open,
    \-ignpopj\ => open,
    \-inop\ => open,
    inop => open,
    \-ipopj\ => open,
    \-iwrited\ => open,
    iwrite => open,
    iwrited => open,
    jcalf => open,
    jfalse => open,
    jret => open,
    jretf => open,
    n => open,
    \-nop\ => open,
    nop => nop,
    \-nopa\ => open,
    \-popj\ => open,
    \-spcdrive\ => open,
    spcdrive => open,
    spcenb => spcenb,
    \-spcpass\ => open,
    \-spcwpass\ => open,
    spcwpass => open,
    \-spushd\ => open,
    spush => open,
    spushd => open,
    \-srcspcpopreal\ => open
  );
  --- Microcode Subroutine Return Stack (spc, spclch, spcw, lpc)
  i_spc   : spc_set port map (clk4a => clk4a, clk4b => clk4b, clk4c => clk4c, \-destspc\ => open, destspc => open, \-destspcd\ => open, destspcd => open, \-ignpopj\ => open, jcalf => open, jret => open, jretf => open, popj => open, spcdrive => open, \-spcdrive\ => open, spcenb => open, \-spcpass\ => open, spcwpass => open, \-spcwpass\ => open, spush => open, \-spush\ => open, spushd => open, \-spushd\ => open, tse2 => tse2, tse3a => tse3a, wp4a => wp4a, wp4b => wp4b, L => L, LPC => LPC, SPC => SPC, SPCO => SPCO, SPCW => SPCW, SPCPTR => SPCPTR, lparity => open, lpc13 => LPC(13), spcparity => open, spcwparity => open, spcparok => open, spcwparok => open);
  --- Next PC Selector (npc)
  i_npc   : npc_set port map(
    clk4b => clk4b,
    dpc4 => open,
    pcs0 => open,
    pcs1 => open,
    spc1a => open,
    trapa => open,
    trapb => open,
    IR => IR(25 downto 12),
    DPC => open,
    IPC => IPC,
    NPC => open,
    PC => PC,
    SPC => open,
    SPCO => open,
    pccry3 => open,
    pccry7 => open,
    pccry11 => open
  );
  --- The LC register and Instruction Prefetch (lc, lcc)
  i_lcreg : lcreg_set port map (clk1a => clk1a, clk2a => clk2a, clk2c => clk2c, clk3c => clk3c, OB => OB, IR => IR, SPC => SPC(18 downto 0), \-destlc\ => open, \-reset\ => \-reset\, \-srcspcpopreal\ => open, \-srclc\ => open, needfetch => open, \prog.unibus.reset\ => open, \int.enable\ => open, \sequence.break\ => open, tse1a => tse1a, int => open, irdisp => open, \-spop\ => open, LC => LC, MF => open, \lc byte mode\ => open, \-lcinc\ => open, lcinc => open, lcry3 => open, \-lcry3\ => open, \-lcry7\ => open, \-lcry11\ => open, \-lcry15\ => open, \-lcry19\ => open, \-lcry23\ => open, \-lcdrive\ => open, lcdrive => open, srclc => open, \-sh4\ => open, \-sh3\ => open, \inst in left half\ => open, \inst in 2nd or 4th quarter\ => open, \-lc modifies mrot\ => open, \-ifetch\ => open, \have wrong word\ => open, \last byte in word\ => open, \-newlc\ => open, \-newlc.in\ => open, newlc => open);
  --- The VMA and VMA Selector (vma, vmas)
  i_vma   : vma_set port map (clk1a => clk1a, clk2a => clk2a, clk2c => clk2c, OB => OB, LC => LC, MD => MD, VMAS => VMAS, \-srcvma\ => open, tse2 => tse2, \-vmaenb\ => open, vmasela => open, vmaselb => open, \-memstart\ => open, VMA => VMA, MF => open, MAPI => MAPI(23 downto 12), \-vmadrive\ => open, srcvma => open);
  --- The MD and the MD Selector (md, mds)
  i_md    : md_set port map (\-clk2c\ => \-clk2c\, tse2 => tse2, OB => OB, MDS => MDS, \-destmdr\ => open, \-ignpar\ => open, \-loadmd\ => open, \mempar in\ => open, \-srcmd\ => open, mdparodd => open, mdsela => open, mdselb => open, \-memdrive.a\ => open, \-memdrive.b\ => open, MD => MD, MF => open, MEM => MEM, \-mddrive\ => open, srcmd => open, destmdr => open, loadmd => open, mdclk => open, mdgetspar => open, mdhaspar => open, mdpar => open);
  --- First and Second Level Maps (vmem0, vmem1, vmem2, vmemdr)
  i_vmaps : vmaps_set port map (tse1a => tse1a, VMA => VMA, MAPI => MAPI(23 downto 8), VMAP => VMAP, VMO => VMO(23 downto 0), memstart => open, \-pfr\ => open, \-pfw\ => open, \-srcmap\ => open, srcmap => open, \-vm0wpa\ => open, \-vm0wpb\ => open, \-vm1wpa\ => open, \-vm1wpb\ => open, vmoparodd => open, MF => open, VMAP_OUT => open, VMO_OUT => open, \-mapdrive\ => open, \-mapi23\ => open, \-use.map\ => open, v0parok => open, vm0pari => open, vmoparok => open, vpari => open, vm1mpar => open, vm1pari => open, \-vm1lpar\ => open, vmoparm => open, vmopar => open, vmoparl => open, vmoparck => open, \-lvmo22\ => open, \-lvmo23\ => open, \-adrpar\ => open);
  --- Memory Control Logic part I (vctl1, vctl2)
  i_vctrl : vctl_set port map (clk2a => clk2a, clk2c => clk2c, mclk1a => mclk1a, \-clk3g\ => \-clk3g\, IR => IR(25 downto 19), VMA => VMA(26 downto 25), \-reset\ => \-reset\, wmap => open, \-memwr\ => open, \-memprepare\ => open, \-lvmo22\ => open, \-pfr\ => open, \-lvmo23\ => open, memrq => open, \-memack\ => open, \-memrd\ => open, \-ifetch\ => open, destmem => open, \-memgrant\ => open, \use.md\ => open, needfetch => open, lcinc => open, \-destmdr\ => open, \-destmem\ => open, \-destvma\ => open, \lm drive enb\ => open, wp1a => wp1a, wp1b => wp1b, wrcyc => open, \-srcmd\ => open, \-nopa\ => open, rdcyc => open, wrcyc_out => open, \-wmapd\ => open, wmapd => open, memprepare => open, \-pfw\ => open, \-vmaok\ => open, \-mfinishd\ => open, memrq_out => open, mbusy => open, \rd.in.progress\ => open, \set.rd.in.progress\ => open, \-rdfinish\ => open, \-mfinish\ => open, \-memop\ => open, memstart => open, \-memstart\ => open, \-mbusy.sync\ => open, \mbusy.sync\ => open, \-wait\ => open, \-hang\ => open, mapwr0d => open, mapwr1d => open, mdsela => open, mdselb => open, \-memdrive.a\ => open, \-memdrive.b\ => open, \-memprepare_out\ => open, \-memrd_out\ => open, \-memrq_out\ => open, \-memwr_out\ => open, nopa => open, \-pfr_out\ => open, \use.md_out\ => open, \-vm0wpa\ => open, \-vm0wpb\ => open, \-vm1wpa\ => open, \-vm1wpb\ => open, \-vmaenb\ => open, vmasela => open, vmaselb => open, \-wmap\ => open, wmap_out => open, \-wmapd_out\ => open);
  --- Memory Control Logic part II (Overlord) (olord1, olord2)
  i_olord : olord_set port map (\-clock reset a\ => open, \-reset\ => \-reset\, \-ldclk\ => open, mclk5a => open, mclk5 => mclk5, clk5 => clk5, \-mclk5\ => open, clk5a => open, \-clk5\ => open, reset => reset, \bus.power.reset l\ => open, \power reset a\ => open, \-upperhighok\ => \-upperhighok\, \-lowerhighok\ => open, \-boot\ => open, \-boot1\ => \-boot1\, \prog.bus.reset\ => open, \-bus.reset\ => open, \-clock reset b\ => open, \-clock reset a out\ => open, \-power reset\ => open, \boot.trap\ => open, \-boot2\ => open, \-ldmode\ => open, ldmode => open, \-busint.lm.reset\ => open, \-prog.reset\ => open, \prog.boot\ => open, speed1a => open, sspeed1 => sspeed1, speedclk => open, sspeed0 => sspeed0, speed0a => open, speed1 => open, speed0 => open, SPY => SPY(7 downto 0), errstop => open, stathenb => open, trapenb => open, promdisable => open, \-opcinh\ => open, opcinh => open, \-ldopc\ => open, opcclk => open, \-opcclk\ => open, \-lpc.hold\ => open, \lpc.hold\ => open, ldstat => open, \-ldstat\ => open, \-idebug\ => \-idebug\, idebug => idebug, nop11 => open, \-nop11\ => open, \-step\ => open, step => open, promdisabled => promdisabled, sstep => open, ssdone => open, srun => open, run => open, \-run\ => open, \-ssdone\ => open, \-errhalt\ => open, \-wait\ => open, \-stathalt\ => open, \stat.ovf\ => open, \-stc32\ => open, \-tpr60\ => \-tpr60\, statstop => open, \-machruna\ => \-machruna\, \-machrun\ => open, machrun => machrun, \-ape\ => \-ape\, \-mpe\ => \-mpe\, \-pdlpe\ => \-pdlpe\, \-dpe\ => \-dpe\, \-ipe\ => \-ipe\, \-spe\ => \-spe\, \-higherr\ => open, err => open, \-mempe\ => \-mempe\, \-v0pe\ => \-v0pe\, \-v1pe\ => \-v1pe\, \-halted\ => open, aparok => open, mmemparok => open, pdlparok => open, dparok => open, iparok => open, spcparok => open, highok => open, memparok => open, v0parok => open, vmoparok => open, statstop_out => open, \-halt\ => open, \-ldmode_out\ => open, errstop_in => open, \-errhalt_out\ => open);
  --- spy (spy0,spy1,spy2,spy4)
  i_spy : spy_set port map (\-dbread\ => open, \-dbwrite\ => open, EADR => open, IR => IR(47 downto 0), OB => OB, \-spy.irh\ => open, \-spy.irl\ => open, \-spy.irm\ => open, \-spy.obh\ => open, A => A(31 downto 16), AA => open, M => M, destspcd => open, imodd => open, ir48 => IR(48), iwrited => open, jcond => open, nop => open, pcs0 => open, pcs1 => open, pdlwrited => open, spushd => open, \-spy.ah\ => open, \-spy.flag2\ => open, \-spy.mh\ => open, \-spy.ml\ => open, \-vmaok\ => open, wmapd => open, \-ape\ => \-ape\, \-dpe\ => \-dpe\, err => open, \-higherr\ => open, \-ipe\ => \-ipe\, \-mempe\ => \-mempe\, \-mpe\ => \-mpe\, OPC => OPC, PC => PC, \-pdlpe\ => \-pdlpe\, promdisable => open, \-spe\ => \-spe\, \-spy.opc\ => open, \-spy.pc\ => open, srun => open, ssdone => open, \-stathalt\ => open, \-v0pe\ => \-v0pe\, \-v1pe\ => \-v1pe\, \-wait\ => open, SPY => SPY, \-ldclk\ => open, \-lddbirh\ => open, \-lddbirl\ => open, \-lddbirm\ => open, \-ldmode\ => open, \-ldopc\ => open, \-spy.al\ => open, \-spy.flag1\ => open, \-spy.sth\ => open, \-spy.stl\ => open);
  --- stat (stat)
  i_stat  : stat_set port map(
    clk5a => clk5a,
    \-ldstat\ => \-ldstat\,
    \-statbit\ => \-statbit\,
    \-spy.sth\ => \-spy.sth\,
    \-spy.stl\ => \-spy.stl\,
    IWR => IWR(31 downto 0),
    SPY => SPY,
    ST => ST,
    \-stc4\ => \-stc4\,
    \-stc8\ => \-stc8\,
    \-stc12\ => \-stc12\,
    \-stc16\ => \-stc16\,
    \-stc20\ => \-stc20\,
    \-stc24\ => \-stc24\,
    \-stc28\ => \-stc28\,
    \-stc32\ => \-stc32\
  );
  -- trap (trap)
  i_trap  : trap_set port map(
    \boot.trap\ => \boot.trap\,
    mdhaspar => mdhaspar,
    mdpar => mdpar,
    trapenb => trapenb,
    \use.md\ => \use.md\,
    \-wait\ => \-wait\,
    MD => MD,
    mdparerr => mdparerr,
    mdpareven => mdpareven,
    mdparl => mdparl,
    mdparm => mdparm,
    mdparodd => mdparodd,
    \-memparok\ => \-memparok\,
    memparok => memparok,
    \-parerr\ => \-parerr\,
    \-trap\ => \-trap\,
    trapa => trapa,
    trapb => trapb,
    \-trapenb\ => \-trapenb\
  );
  -- Old PC (opcs,opcd)
  i_opc   : opc_set port map(
    \-clk5\ => \-clk5\,
    opcclk => opcclk,
    \-opcinh\ => \-opcinh\,
    tse1b => tse1b,
    \-srcopc\ => \-srcopc\,
    \-srcdc\ => \-srcdc\,
    \-srcpdlidx\ => \-srcpdlidx\,
    \-srcpdlptr\ => \-srcpdlptr\,
    PC => PC,
    DC => DC(9 downto 0),
    OPC => OPC,
    MF => MF,
    opcclka => opcclka,
    opcclkb => opcclkb,
    opcclkc => opcclkc,
    opcinha => opcinha,
    opcinhb => opcinhb,
    \-opcdrive\ => \-opcdrive\,
    dcdrive => dcdrive,
    \-zero16.drive\ => \-zero16.drive\,
    zero16 => zero16,
    \zero16.drive\ => \zero16.drive\,
    \zero12.drive\ => \zero12.drive\
  );
  -- Masker/Output Select (mo0,mo1)
  i_mos   : mos_set port map(
    ALU => ALU(32 downto 0),
    A => A,
    R => R,
    MSK => MSK,
    OB => OB,
    osel0a => osel0a,
    osel1a => osel1a,
    osel0b => osel0b,
    osel1b => osel1b,
    a31b => a31b,
    q31 => q31
  );

  i_bcterm : cadr_bcterm port map(
    \-ignpar\ => open, int => open, \-loadmd\ => open, mem0 => MEM(0), mem1 => MEM(1), mem10 => MEM(10), mem11 => MEM(11), mem12 => MEM(12), mem13 => MEM(13), mem14 => MEM(14), mem15 => MEM(15), mem16 => MEM(16), mem17 => MEM(17), mem18 => MEM(18), mem19 => MEM(19), mem2 => MEM(2), mem20 => MEM(20), mem21 => MEM(21), mem22 => MEM(22), mem23 => MEM(23), mem24 => MEM(24), mem25 => MEM(25), mem26 => MEM(26), mem27 => MEM(27), mem28 => MEM(28), mem29 => MEM(29), mem3 => MEM(3), mem30 => MEM(30), mem31 => MEM(31), mem4 => MEM(4), mem5 => MEM(5), mem6 => MEM(6), mem7 => MEM(7), mem8 => MEM(8), mem9 => MEM(9), \-memack\ => open, \-memgrant\ => open, \mempar in\ => open
  );
  
  process
  begin
    wait for 500 ns;
    \-boot1\ <= '0';
    wait for 10 ns;
    \-boot1\ <= '1';    
    wait for 5000 ns;
    std.env.finish;
  end process;
  
  -- Poor substitute for the 5 octal display that was on the lower
  -- left-hand corner of the front door on the CADR.  See the PCTL
  -- prints.
  --process (cyclecompleted)
  --  variable cycles : integer := 0;
  --begin
  --  if rising_edge(cyclecompleted) then
  --    cycles := cycles + 1;
      
--      report integer'image(cycles) & ": PC:" & to_hstring(pc);
  --    if tilt1 then report "TILT1"; end if;
  --    if tilt0 then report "TILT0"; end if;
  --    if dpe then report "DPE"; end if;
  --    if ipe then report "IPE"; end if;
  --    if promenable then report "PROMENABLE"; end if;
  --  end if;
    
  --  if cycles >= 1000 then
  --    finish;
  --  end if;
  --end process;
  
end architecture;
