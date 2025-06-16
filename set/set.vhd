library ieee;
use ieee.std_logic_1164.all;

package set is

  component clock_set is
    port (
      -- Input signals
      \-clock_reset_b\ : in  std_logic;
      \-hang\          : in  std_logic;
      \-ilong\         : in  std_logic;
      sspeed0          : in  std_logic;
      sspeed1          : in  std_logic;
      machrun          : in  std_logic;
      \-machruna\      : in  std_logic;
      lcry3            : in  std_logic;
      reset            : in  std_logic;
      \-srcpdlidx\     : in  std_logic;
      \-srcpdlptr\     : in  std_logic;
      
      -- Output signals from cadr_clock1
      cyclecompleted   : out std_logic;
      \-tpr60\         : out std_logic;
      
      -- Output signals from cadr_clock2
      \-clk0\          : out std_logic;
      clk5             : out std_logic;
      mclk5            : out std_logic;
      \-wp5\           : out std_logic;
      
      -- Output signals from cadr_clockd
      \-clk1\          : out std_logic;
      clk2a            : out std_logic;
      clk2c            : out std_logic;
      clk3b            : out std_logic;
      clk3c            : out std_logic;
      clk3e            : out std_logic;
      \-clk3g\         : out std_logic;
      clk4a            : out std_logic;
      clk4b            : out std_logic;
      clk4c            : out std_logic;
      \-clk4e\         : out std_logic;
      clk4e            : out std_logic;
      clk4f            : out std_logic;
      mclk1a           : out std_logic;
      \-reset\         : out std_logic;
      srcpdlidx        : out std_logic;
      srcpdlptr        : out std_logic;
      tse1a            : out std_logic;
      tse1b            : out std_logic;
      tse2             : out std_logic;
      tse3a            : out std_logic;
      tse4a            : out std_logic;
      tse4b            : out std_logic;
      \-upperhighok\   : out std_logic;
      wp1a             : out std_logic;
      wp1b             : out std_logic;
      wp3a             : out std_logic;
      wp4a             : out std_logic;
      wp4b             : out std_logic
    );
  end component;

  component amem_set is
    port (
      -- Clock and control signals
      clk3d           : in  std_logic;
      clk3e           : in  std_logic;
      dest            : in  std_logic;
      destm           : in  std_logic;
      \-reset\        : in  std_logic;
      tse3a           : in  std_logic;
      tse4a           : in  std_logic;
      wp3a            : in  std_logic;
      \-amemenb\      : in  std_logic;
      apassenb        : in  std_logic;
      \-apassenb\     : in  std_logic;
      
      -- Bus signals
      IR              : in  std_logic_vector(41 downto 14);
      L               : in  std_logic_vector(31 downto 0);
      
      -- Output bus signals
      A               : out std_logic_vector(31 downto 0);
      WADR            : out std_logic_vector(9 downto 0);
      
      -- Individual output signals
      lparity         : in  std_logic;
      aparity         : out std_logic;
      destmd          : out std_logic
    );
  end component;

  component mmem_set is
    port (
      -- Clock and control signals
      clk4a           : in  std_logic;
      clk4e           : in  std_logic;
      destmd          : in  std_logic;
      \-ir31\         : in  std_logic;
      tse4a           : in  std_logic;
      wp4b            : in  std_logic;
      \-mpass\        : in  std_logic;
      pdlenb          : in  std_logic;
      spcenb          : in  std_logic;
      tse1a           : in  std_logic;
      
      -- Bus signals
      IR              : in  std_logic_vector(30 downto 26);
      L               : in  std_logic_vector(31 downto 0);
      MF              : in  std_logic_vector(31 downto 0);
      WADR            : in  std_logic_vector(4 downto 0);
      
      -- Individual input signals  
      lparity         : in  std_logic;
      
      -- Output bus signals
      M               : out std_logic_vector(31 downto 0);
      
      -- Individual output signals
      mmemparity      : out std_logic;
      mparity         : out std_logic;
      srcm            : out std_logic
    );
  end component;

  component alu_set is
    port (
      -- Bus signals
      A               : in  std_logic_vector(31 downto 0);
      M               : in  std_logic_vector(31 downto 0);
      
      -- Control signals
      aluc0           : in  std_logic;
      aluc1           : in  std_logic;
      aluc2           : in  std_logic;
      aluc3           : in  std_logic;
      
      -- Output bus signals
      ALU             : out std_logic_vector(31 downto 0);
      
      -- Output control signals
      lcry3           : out std_logic
    );
  end component;

  component spc_set is
    port (
      -- Clock and control signals
      clk4a           : in  std_logic;
      clk4b           : in  std_logic;
      clk4c           : in  std_logic;
      \-destspc\      : in  std_logic;
      destspc         : in  std_logic;
      \-destspcd\     : in  std_logic;
      destspcd        : in  std_logic;
      \-ignpopj\      : in  std_logic;
      jcalf           : in  std_logic;
      jret            : in  std_logic;
      jretf           : in  std_logic;
      popj            : in  std_logic;
      spcdrive        : in  std_logic;
      \-spcdrive\     : in  std_logic;
      spcenb          : in  std_logic;
      \-spcpass\      : in  std_logic;
      spcwpass        : in  std_logic;
      \-spcwpass\     : in  std_logic;
      spush           : in  std_logic;
      \-spush\        : in  std_logic;
      spushd          : in  std_logic;
      \-spushd\       : in  std_logic;
      tse2            : in  std_logic;
      tse3a           : in  std_logic;
      wp4a            : in  std_logic;
      wp4b            : in  std_logic;
      
      -- Bus signals
      L               : in  std_logic_vector(31 downto 0);
      LPC             : in  std_logic_vector(13 downto 0);
      
      -- Output bus signals
      SPC             : out std_logic_vector(31 downto 0);
      
      -- Individual signals
      lparity         : in  std_logic;
      lpc13           : in  std_logic;
      spcparok        : out std_logic
    );
  end component;

  component dmem_set is
    port (
      -- Clock
      clk3e       : in  std_logic;
      
      -- Instruction register bus
      IR          : in  std_logic_vector(41 downto 5);
      
      -- Address bus from A register
      A           : in  std_logic_vector(17 downto 0);
      
      -- Address bus to memory
      AA          : out std_logic_vector(17 downto 0);
      
      -- Display control signals
      dispenb     : in  std_logic;
      \-irdisp\   : in  std_logic;
      \-funct2\   : in  std_logic;
      
      -- Write control
      wp2         : in  std_logic;
      
      -- R register bus (for DRAM data)
      R           : in  std_logic_vector(6 downto 0);
      
      -- Display memory control outputs
      dispwr      : out std_logic;
      
      -- DRAM control outputs
      \-dwea\     : out std_logic;
      
      -- Display address outputs
      DADR        : out std_logic_vector(10 downto 0);
      
      -- Display data control
      dpar        : out std_logic;
      
      -- Display parity control
      dpareven    : out std_logic;
      dparok      : out std_logic;
      
      -- Display PC outputs
      DPC         : out std_logic_vector(13 downto 0);
      
      -- Video memory outputs
      vmo18       : out std_logic;
      
      -- Display mask outputs
      DMASK       : out std_logic_vector(6 downto 0)
    );
  end component;

  component sm_set is
    port (
      -- Bus signals
      IR : in std_logic_vector(13 downto 0);
      M : in std_logic_vector(31 downto 0);
      MSK : out std_logic_vector(31 downto 0);
      R : out std_logic_vector(31 downto 0);
      SA : in std_logic_vector(31 downto 0);
      
      -- Individual signals
      \-irbyte\ : in std_logic;
      \-sh3\ : in std_logic;
      \-sh4\ : in std_logic;
      ir31 : in std_logic;
      
      -- Output signals
      \a=m\ : out std_logic
    );
  end component;

  component pdl_set is
    port (
      -- Bus signals
      L : in std_logic_vector(31 downto 0);
      M : out std_logic_vector(31 downto 0);
      OB : in std_logic_vector(9 downto 0);
      MF : out std_logic_vector(11 downto 0);
      
      -- Individual signals
      clk3f : in std_logic;
      clk4a : in std_logic;
      clk4b : in std_logic;
      \-clk4e\ : in std_logic;
      clk4f : in std_logic;
      \-destpdl(p)\ : in std_logic;
      \-destpdl(x)\ : in std_logic;
      \-destpdlp\ : in std_logic;
      \-destpdltop\ : in std_logic;
      \-destpdlx\ : in std_logic;
      \-destspc\ : in std_logic;
      imod : in std_logic;
      ir30 : in std_logic;
      lparity : in std_logic;
      nop : in std_logic;
      \-pdlcnt\ : in std_logic;
      \-reset\ : in std_logic;
      srcpdlidx : in std_logic;
      \-srcpdlpop\ : in std_logic;
      srcpdlptr : in std_logic;
      \-srcpdltop\ : in std_logic;
      tse4b : in std_logic;
      wp4a : in std_logic;
      
      -- Output signals
      \-destspcd\ : out std_logic;
      imodd : out std_logic;
      pdlenb : out std_logic;
      pdlwrited : out std_logic
    );
  end component;

  component imem_set is
    port (
      -- PC bus input
      PC : in std_logic_vector(13 downto 0);
      
      -- Control inputs for ICTL
      idebug : in std_logic;
      \-iwrited\ : in std_logic;
      promdisabled : in std_logic;
      \-wp5\ : in std_logic;
      
      -- Instruction write bus
      IWR : in std_logic_vector(48 downto 0);
      
      -- Instruction bus output
      I : out std_logic_vector(48 downto 0);
      
      -- ICTL outputs
      \-iwriteda\ : out std_logic;
      \-promdisabled\ : out std_logic
    );
  end component;

  component prom_set is
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
      \bottom.1k\ : out std_logic
    );
  end component;

  component qreg_set is
    port (
      -- Clock
      clk2b : in std_logic;
      
      -- ALU bus input  
      ALU : in std_logic_vector(31 downto 0);
      
      -- Control inputs for QCTL
      \-ir0\ : in std_logic;
      \-ir1\ : in std_logic;
      \-iralu\ : in std_logic;
      \-srcq\ : in std_logic;
      tse2 : in std_logic;
      
      -- Q register bus output
      Q : out std_logic_vector(31 downto 0);
      
      -- M bus output (from QCTL)
      MF : out std_logic_vector(31 downto 0);
      
      -- Control outputs from QCTL
      \-alu31\ : out std_logic
    );
  end component;

  component spy_set is
    port (
      -- SPY0 inputs
      \-dbread\ : in std_logic;
      \-dbwrite\ : in std_logic;
      EADR : in std_logic_vector(3 downto 0);
      
      -- SPY1 inputs  
      IR : in std_logic_vector(47 downto 0);
      OB : in std_logic_vector(31 downto 0);
      \-spy.irh\ : in std_logic;
      \-spy.irl\ : in std_logic;
      \-spy.irm\ : in std_logic;
      \-spy.obh\ : in std_logic;
      
      -- SPY2 inputs
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
      
      -- SPY4 inputs
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
      
      -- SPY bus output
      SPY : out std_logic_vector(15 downto 0);
      
      -- Outputs
      \-ldclk\ : out std_logic;
      \-lddbirh\ : out std_logic;
      \-lddbirl\ : out std_logic;
      \-lddbirm\ : out std_logic;
      \-ldmode\ : out std_logic;
      \-ldopc\ : out std_logic;
      \-spy.sth\ : out std_logic;
      \-spy.stl\ : out std_logic
    );
  end component;

  component lcreg_set is
    port (
      -- Clock signals
      clk1a : in std_logic;
      clk2a : in std_logic;
      clk2c : in std_logic;
      clk3c : in std_logic;
      
      -- Bus inputs
      OB : in std_logic_vector(31 downto 0);
      IR : in std_logic_vector(48 downto 0);
      SPC : in std_logic_vector(18 downto 0);
      
      -- Other inputs
      \-destlc\ : in std_logic;
      \-reset\ : in std_logic;
      \-srcspcpopreal\ : in std_logic;
      \-srclc\ : in std_logic;
      needfetch : in std_logic;
      \prog.unibus.reset\ : in std_logic;
      \int.enable\ : in std_logic;
      \sequence.break\ : in std_logic;
      tse1a : in std_logic;
      int : in std_logic;
      irdisp : in std_logic;
      \-spop\ : in std_logic;
      
      -- Bus outputs
      LC : out std_logic_vector(31 downto 0);
      MF : out std_logic_vector(31 downto 0);
      
      -- Other outputs
      \lc byte mode\ : out std_logic;
      lcinc : out std_logic;
      lcry3 : out std_logic;
      \-sh4\ : out std_logic;
      \-sh3\ : out std_logic;
      \-ifetch\ : out std_logic
    );
  end component;

  component vma_set is
    port (
      -- Clock signals
      clk1a : in std_logic;
      clk2a : in std_logic;
      clk2c : in std_logic;
      
      -- Bus inputs
      OB : in std_logic_vector(31 downto 0);
      LC : in std_logic_vector(31 downto 0);
      MD : in std_logic_vector(31 downto 0);
      VMAS : in std_logic_vector(31 downto 0);
      
      -- Other inputs
      \-srcvma\ : in std_logic;
      tse2 : in std_logic;
      \-vmaenb\ : in std_logic;
      vmasela : in std_logic;
      vmaselb : in std_logic;
      \-memstart\ : in std_logic;
      
      -- Bus outputs
      VMA : out std_logic_vector(31 downto 0);
      MF : out std_logic_vector(31 downto 0);
      MAPI : out std_logic_vector(23 downto 12);
      
      -- Other outputs
      \-vmadrive\ : out std_logic
    );
  end component;

  component md_set is
    port (
      -- Clock signals
      \-clk2c\ : in std_logic;
      tse2 : in std_logic;
      
      -- Bus inputs
      OB : in std_logic_vector(31 downto 0);
      MDS : in std_logic_vector(31 downto 0);
      
      -- Other inputs
      \-destmdr\ : in std_logic;
      \-ignpar\ : in std_logic;
      \-loadmd\ : in std_logic;
      \mempar in\ : in std_logic;
      \-srcmd\ : in std_logic;
      mdparodd : in std_logic;
      mdsela : in std_logic;
      mdselb : in std_logic;
      \-memdrive.a\ : in std_logic;
      \-memdrive.b\ : in std_logic;
      
      -- Bus outputs
      MD : out std_logic_vector(31 downto 0);
      MF : out std_logic_vector(31 downto 0);
      
      -- Other outputs
      \-mddrive\ : out std_logic;
      mdhaspar : out std_logic;
      mdpar : out std_logic
    );
  end component;

  component vmaps_set is
    port (
      -- Clock signals
      tse1a : in std_logic;
      
      -- Bus inputs
      VMA : in std_logic_vector(31 downto 0);
      MAPI : in std_logic_vector(23 downto 8);
      VMAP : in std_logic_vector(4 downto 0);
      VMO : in std_logic_vector(23 downto 0);
      
      -- Other inputs
      memstart : in std_logic;
      \-pfr\ : in std_logic;
      \-pfw\ : in std_logic;
      \-srcmap\ : in std_logic;
      srcmap : in std_logic;
      \-vm0wpa\ : in std_logic;
      \-vm0wpb\ : in std_logic;
      \-vm1wpa\ : in std_logic;
      \-vm1wpb\ : in std_logic;
      vmoparodd : in std_logic;
      
      -- Bus outputs
      MF : out std_logic_vector(31 downto 0);
      
      -- Other outputs
      \-mapdrive\ : out std_logic;
      v0parok : out std_logic;
      vmoparok : out std_logic;
      \-lvmo22\ : out std_logic;
      \-lvmo23\ : out std_logic
    );
  end component;

  component vctl_set is
    port (
      -- Clock signals
      clk2a : in std_logic;
      clk2c : in std_logic;
      mclk1a : in std_logic;
      \-clk3g\ : in std_logic;
      
      -- Bus inputs
      IR : in std_logic_vector(25 downto 19);
      VMA : in std_logic_vector(26 downto 25);
      
      -- Other inputs
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
      
      -- Other outputs
      rdcyc : out std_logic;
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
  end component;

  component olord_set is
    port (
      -- Clock and reset signals
      \-clock reset a\ : in  std_logic;
      \-reset\         : in  std_logic;
      \-ldclk\         : in  std_logic;
      mclk5a           : in  std_logic;
      mclk5            : in  std_logic;
      clk5             : in  std_logic;
      reset            : out std_logic;
      \bus.power.reset l\ : out std_logic;
      \-upperhighok\   : in  std_logic;
      \-boot\          : in  std_logic;
      \-boot1\         : in  std_logic;
      \-ldmode\        : in  std_logic;
      \-busint.lm.reset\ : in  std_logic;
      
      -- Speed control signals
      speed1a          : out std_logic;
      sspeed1          : out std_logic;
      sspeed0          : out std_logic;
      
      -- Spy signals
      SPY : in std_logic_vector(7 downto 0);
      
      -- Control signals
      errstop          : out std_logic;
      trapenb          : out std_logic;
      promdisable      : out std_logic;
      \-opcinh\        : out std_logic;
      \-ldopc\         : in  std_logic;
      opcclk           : out std_logic;
      \-idebug\        : out std_logic;
      \-nop11\         : out std_logic;
      promdisabled     : out std_logic;
      ssdone           : out std_logic;
      srun             : out std_logic;
      \-errhalt\       : in  std_logic;
      \-wait\          : in  std_logic;
      \-stathalt\      : out std_logic;
      \-stc32\         : in  std_logic;
      \-tpr60\         : in  std_logic;
      statstop         : in  std_logic;
      \-machruna\      : out std_logic;
      machrun          : out std_logic;
      
      -- Error/parity signals
      \-ape\           : out std_logic;
      \-mpe\           : out std_logic;
      \-pdlpe\         : out std_logic;
      \-dpe\           : out std_logic;
      \-ipe\           : out std_logic;
      \-spe\           : out std_logic;
      \-higherr\       : out std_logic;
      err              : out std_logic;
      \-mempe\         : out std_logic;
      \-v0pe\          : out std_logic;
      \-v1pe\          : out std_logic;
      aparok           : in  std_logic;
      mmemparok        : in  std_logic;
      pdlparok         : in  std_logic;
      dparok           : in  std_logic;
      iparok           : in  std_logic;
      spcparok         : in  std_logic;
      memparok         : in  std_logic;
      v0parok          : in  std_logic;
      vmoparok         : in  std_logic;
      \-halt\          : in  std_logic;
      errstop_in       : in  std_logic
    );
  end component;

  component ireg_set is
    port (
      -- Clock signals
      clk3a : in std_logic;
      clk3b : in std_logic;
      
      -- Control signals
      \-destimod0\ : in std_logic;
      \-destimod1\ : in std_logic;
      
      -- Input signal for parity calculation
      imodd : in std_logic;
      
      -- Input bus (48-bit)
      I : in std_logic_vector(48 downto 0);
      
      -- Output bus (48-bit)  
      OB : in std_logic_vector(47 downto 0);
      
      -- Input/Output bus (48-bit)
      IOB : out std_logic_vector(47 downto 0);
      
      -- Instruction register output (48-bit)
      IR : out std_logic_vector(48 downto 0);
      
      -- Parity outputs
      ipar0 : out std_logic;
      iparok : out std_logic
    );
  end component;

  component npc_set is
    port (
      -- Clock signal
      clk4b  : in  std_logic;
      
      -- Input signals
      dpc4   : in  std_logic;
      pcs0   : in  std_logic;
      pcs1   : in  std_logic;
      spc1a  : in  std_logic;
      trapa  : in  std_logic;
      trapb  : in  std_logic;
      
      -- Bus signals
      IR     : in  std_logic_vector(25 downto 12);
      
      -- Output bus signals
      DPC    : out std_logic_vector(13 downto 0);
      PC     : out std_logic_vector(13 downto 0);
      SPC    : out std_logic_vector(13 downto 0);
      
      -- Individual outputs
      pccry3  : out std_logic
    );
  end component;

  component fetch_set is
    port (
      -- Clock signals
      clk2c : in std_logic;
      clk4c : in std_logic;
      
      -- Debug control
      \-idebug\   : in std_logic;
      \-lddbirh\  : in std_logic;
      \-lddbirm\  : in std_logic;
      \-lddbirl\  : in std_logic;
      
      -- Bus signals
      AA  : in  std_logic_vector(15 downto 0);
      M   : in  std_logic_vector(31 downto 0);
      SPY : in  std_logic_vector(15 downto 0);
      
      -- Output bus signals
      I   : out std_logic_vector(48 downto 0);
      
      -- Parity outputs
      iwrp1 : out std_logic
    );
  end component;

  component decode_set is
    port (
      -- Input control signals
      \destimod0 l\ : in std_logic;
      \-idebug\     : in std_logic;
      \-ir31\       : in std_logic;
      \iwrited l\   : in std_logic;
      nop           : in std_logic;
      
      -- Bus signals
      IR : in std_logic_vector(44 downto 3);
      
      -- Output control signals
      dest          : out std_logic;
      destm         : out std_logic;
      imod          : out std_logic;
      irdisp        : out std_logic;
      irjump        : out std_logic;
      
      -- Function outputs  
      \-funct0\     : out std_logic;
      \-funct2\     : out std_logic;
      
      -- Destination outputs
      \-destimod0\  : out std_logic;
      \-destimod1\  : out std_logic;
      \-destintctl\ : out std_logic;
      \-destmdr\    : out std_logic;
      \-destmem\    : out std_logic;
      \-destpdl(p)\ : out std_logic;
      \-destpdl(x)\ : out std_logic;
      \-destpdlp\   : out std_logic;
      \-destpdltop\ : out std_logic;
      \-destpdlx\   : out std_logic;
      \-destspc\    : out std_logic;
      \-destvma\    : out std_logic;
      
      -- Source outputs
      \-srcdc\      : out std_logic;
      \-srclc\      : out std_logic;
      \-srcmap\     : out std_logic;
      \-srcmd\      : out std_logic;
      \-srcpdlidx\  : out std_logic;
      \-srcpdlpop\  : out std_logic;
      \-srcpdlptr\  : out std_logic;
      \-srcpdltop\  : out std_logic;
      \-srcq\       : out std_logic;
      \-srcspc\     : out std_logic;
      \-srcspcpop\  : out std_logic;
      
      -- ALU function outputs
      \-div\        : out std_logic;
      \-iralu\      : out std_logic;
      \-irdisp\     : out std_logic
    );
  end component;

  component lreg_set is
    port (
      -- Clock signal
      clk3f : in std_logic;
      
      -- Bus signals
      OB : in std_logic_vector(31 downto 0);
      
      -- Output bus signals
      L : out std_logic_vector(31 downto 0);
      
      -- Parity outputs
      lparl      : out std_logic;
      lparity    : out std_logic
    );
  end component;

  component jumpc_set is
    port (
      -- Clock and reset signals
      clk3c         : in  std_logic;
      \-reset\      : in  std_logic;
      
      -- Input control signals
      \a=m\         : in  std_logic;
      alu32         : in  std_logic;
      \-destintctl\ : in  std_logic;
      \-nopa\       : in  std_logic;
      r0            : in  std_logic;
      sintr         : in  std_logic;
      \-vmaok\      : in  std_logic;
      
      -- Bus signals
      IR : in std_logic_vector(46 downto 0);
      OB : in std_logic_vector(29 downto 26);
      
      -- Output control signals
      \-alu32\            : out std_logic;
      \-ilong\            : out std_logic;
      \int.enable\        : out std_logic;
      jcond               : out std_logic;
      \-jcond\            : out std_logic;
      \prog.unibus.reset\ : out std_logic;
      \sequence.break\    : out std_logic;
      \-statbit\          : out std_logic
    );
  end component;

  component flowc_set is
    port (
      -- Clock and reset signals
      clk3c    : in  std_logic;
      \-reset\ : in  std_logic;
      tse3a    : in  std_logic;
      
      -- Input control signals
      \-funct2\    : in  std_logic;
      \-irdisp\    : in  std_logic;
      irdisp       : in  std_logic;
      irjump       : in  std_logic;
      \-jcond\     : in  std_logic;
      jcond        : in  std_logic;
      \-nop11\     : in  std_logic;
      \-srcspc\    : in  std_logic;
      \-srcspcpop\ : in  std_logic;
      \-trap\      : in  std_logic;
      
      -- Bus signals
      IR : in std_logic_vector(42 downto 6);
      
      -- Output control signals
      \-dfall\         : out std_logic;
      \-destspc\       : out std_logic;
      destspc          : out std_logic;
      \-ignpopj\       : out std_logic;
      \-iwrited\       : out std_logic;
      iwrited          : out std_logic;
      jcalf            : out std_logic;
      jret             : out std_logic;
      jretf            : out std_logic;
      nop              : out std_logic;
      \-nopa\          : out std_logic;
      \-spcdrive\      : out std_logic;
      spcdrive         : out std_logic;
      spcenb           : out std_logic;
      \-spcpass\       : out std_logic;
      \-spcwpass\      : out std_logic;
      spcwpass         : out std_logic;
      \-spushd\        : out std_logic;
      spush            : out std_logic;
      spushd           : out std_logic;
      \-srcspcpopreal\ : out std_logic
    );
  end component;

  component stat_set is
    port (
      -- Clock signal
      clk5a     : in  std_logic;
      
      -- Control signals
      \-ldstat\ : in  std_logic;
      \-statbit\ : in  std_logic;
      \-spy.sth\ : in  std_logic;
      \-spy.stl\ : in  std_logic;
      
      -- Bus signals
      IWR : in  std_logic_vector(31 downto 0);
      
      -- Output bus signals
      SPY : out std_logic_vector(15 downto 0);
      
      -- Carry outputs
      \-stc4\  : out std_logic;
      \-stc32\ : out std_logic
    );
  end component;

  component trap_set is
    port (
      -- Input control signals
      \boot.trap\ : in  std_logic;
      mdhaspar    : in  std_logic;
      mdpar       : in  std_logic;
      trapenb     : in  std_logic;
      \use.md\    : in  std_logic;
      \-wait\     : in  std_logic;
      
      -- Bus signals  
      MD : in std_logic_vector(31 downto 0);
      
      -- Output control signals
      mdparerr   : out std_logic;
      mdparodd   : out std_logic;
      memparok   : out std_logic;
      \-trap\    : out std_logic;
      trapa      : out std_logic;
      trapb      : out std_logic
    );
  end component;

  component opc_set is
    port (
      -- Clock and control signals
      \-clk5\         : in  std_logic;
      opcclk          : in  std_logic;
      \-opcinh\       : in  std_logic;
      tse1b           : in  std_logic;
      
      -- Control signals for opcd
      \-srcopc\       : in  std_logic;
      \-srcdc\        : in  std_logic;
      \-srcpdlidx\    : in  std_logic;
      \-srcpdlptr\    : in  std_logic;
      
      -- Bus signals
      PC              : in  std_logic_vector(13 downto 0);
      DC              : in  std_logic_vector(9 downto 0);
      
      -- Output bus signals
      OPC             : out std_logic_vector(13 downto 0);
      MF              : out std_logic_vector(31 downto 0);
      
      -- Individual control output signals
      opcclka         : out std_logic
    );
  end component;

  component ampar_set is
    port (
      -- A bus inputs (32-bit)
      A : in std_logic_vector(31 downto 0);
      
      -- M bus inputs (32-bit)  
      M : in std_logic_vector(31 downto 0);
      
      -- Additional individual inputs
      a31b      : in  std_logic;
      aparity   : in  std_logic;
      mparity   : in  std_logic;
      srcm      : in  std_logic;
      pdlenb    : in  std_logic;
      
      -- Parity check outputs
      aparl     : out std_logic;
      aparok    : out std_logic;
      mmemparok : out std_logic;
      pdlparok  : out std_logic
    );
  end component;

  component mos_set is
    port (
      -- Bus signals - inputs
      ALU : in std_logic_vector(32 downto 0);
      A   : in std_logic_vector(31 downto 0);
      R   : in std_logic_vector(31 downto 0);
      MSK : in std_logic_vector(31 downto 0);
      
      -- Output bus signal
      OB  : out std_logic_vector(31 downto 0);
      
      -- Control signals
      osel0a : in std_logic;
      osel1a : in std_logic;
      osel0b : in std_logic;
      osel1b : in std_logic;
      
      -- Special signals
      a31b : in std_logic;
      q31  : in std_logic
    );
  end component;

end package;
