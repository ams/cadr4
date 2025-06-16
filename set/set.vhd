library ieee;
use ieee.std_logic_1164.all;

package set is

  component clock is
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
      \-tpr0\          : out std_logic;
      \-tpr10\         : out std_logic;
      \-tpr100\        : out std_logic;
      \-tpr105\        : out std_logic;
      \-tpr110\        : out std_logic;
      \-tpr115\        : out std_logic;
      \-tpr120\        : out std_logic;
      \-tpr120a\       : out std_logic;
      \-tpr125\        : out std_logic;
      \-tpr140\        : out std_logic;
      \-tpr15\         : out std_logic;
      \-tpr160\        : out std_logic;
      \-tpr180\        : out std_logic;
      \-tpr20\         : out std_logic;
      \-tpr200\        : out std_logic;
      \-tpr20a\        : out std_logic;
      \-tpr25\         : out std_logic;
      \-tpr40\         : out std_logic;
      \-tpr5\          : out std_logic;
      \-tpr60\         : out std_logic;
      \-tpr65\         : out std_logic;
      \-tpr70\         : out std_logic;
      \-tpr75\         : out std_logic;
      \-tpr80\         : out std_logic;
      \-tpr80a\        : out std_logic;
      \-tpr85\         : out std_logic;
      \-tprend\        : out std_logic;
      tprend           : out std_logic;
      \-tpw10\         : out std_logic;
      \-tpw20\         : out std_logic;
      \-tpw25\         : out std_logic;
      \-tpw30\         : out std_logic;
      \-tpw30a\        : out std_logic;
      \-tpw35\         : out std_logic;
      \-tpw40\         : out std_logic;
      \-tpw40a\        : out std_logic;
      \-tpw45\         : out std_logic;
      \-tpw50\         : out std_logic;
      \-tpw55\         : out std_logic;
      \-tpw60\         : out std_logic;
      \-tpw65\         : out std_logic;
      \-tpw70\         : out std_logic;
      \-tpw75\         : out std_logic;
      
      -- Output signals from cadr_clock2
      \-clk0\          : out std_logic;
      clk1             : out std_logic;
      clk2             : out std_logic;
      clk3             : out std_logic;
      clk4             : out std_logic;
      clk5             : out std_logic;
      \-mclk0\         : out std_logic;
      mclk1            : out std_logic;
      mclk5            : out std_logic;
      mclk7            : out std_logic;
      tpclk            : out std_logic;
      \-tpclk\         : out std_logic;
      \-tptse\         : out std_logic;
      tptse            : out std_logic;
      tpwp             : out std_logic;
      tpwpiram         : out std_logic;
      \-tse1\          : out std_logic;
      \-tse2\          : out std_logic;
      \-tse3\          : out std_logic;
      \-tse4\          : out std_logic;
      \-wp1\           : out std_logic;
      \-wp2\           : out std_logic;
      \-wp3\           : out std_logic;
      \-wp4\           : out std_logic;
      \-wp5\           : out std_logic;
      
      -- Output signals from cadr_clockd
      \-clk1\          : out std_logic;
      clk1a            : out std_logic;
      \-clk2a\         : out std_logic;
      clk2a            : out std_logic;
      clk2b            : out std_logic;
      \-clk2c\         : out std_logic;
      clk2c            : out std_logic;
      \-clk3a\         : out std_logic;
      clk3a            : out std_logic;
      clk3b            : out std_logic;
      clk3c            : out std_logic;
      \-clk3d\         : out std_logic;
      clk3d            : out std_logic;
      clk3e            : out std_logic;
      clk3f            : out std_logic;
      \-clk3g\         : out std_logic;
      \-clk4a\         : out std_logic;
      clk4a            : out std_logic;
      clk4b            : out std_logic;
      clk4c            : out std_logic;
      \-clk4d\         : out std_logic;
      clk4d            : out std_logic;
      \-clk4e\         : out std_logic;
      clk4e            : out std_logic;
      clk4f            : out std_logic;
      \-lcry3\         : out std_logic;
      \-mclk1\         : out std_logic;
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
      wp2              : out std_logic;
      wp3a             : out std_logic;
      wp4a             : out std_logic;
      wp4b             : out std_logic;
      wp4c             : out std_logic
    );
  end component;

  component amem is
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
      AADR            : out std_logic_vector(9 downto 0);
      AMEM            : out std_logic_vector(31 downto 0);
      WADR            : out std_logic_vector(9 downto 0);
      
      -- Individual output signals
      lparity         : in  std_logic;
      amemparity      : out std_logic;
      aparity         : out std_logic;
      a31a            : out std_logic;
      a31b            : out std_logic;
      \-apass\        : out std_logic;
      apass1          : out std_logic;
      apass2          : out std_logic;
      \-awpa\         : out std_logic;
      \-awpb\         : out std_logic;
      \-awpc\         : out std_logic;
      destd           : out std_logic;
      destmd          : out std_logic
    );
  end component;

  component mmem is
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
      MMEM            : out std_logic_vector(31 downto 0);
      
      -- Individual output signals
      mmemparity      : out std_logic;
      mparity         : out std_logic;
      mpass           : out std_logic;
      \-mpass_out\    : out std_logic;
      mpassl          : out std_logic;
      \-mpassl\       : out std_logic;
      \-mpassm\       : out std_logic;
      \-mwpa\         : out std_logic;
      \-mwpb\         : out std_logic;
      srcm            : out std_logic
    );
  end component;

  component alu is
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
      lcry3           : out std_logic;
      lcry11          : out std_logic;
      lcry19          : out std_logic;
      lcry27          : out std_logic
    );
  end component;

  component spc is
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
      SPCO            : out std_logic_vector(31 downto 0);
      SPCW            : out std_logic_vector(31 downto 0);
      SPCPTR          : out std_logic_vector(4 downto 0);
      
      -- Individual signals
      lparity         : in  std_logic;
      lpc13           : in  std_logic;
      spcparity       : out std_logic;
      spcwparity      : out std_logic;
      spcparok        : out std_logic;
      spcwparok       : out std_logic
    );
  end component;

  component dmem is
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
      \-dmapbenb\ : out std_logic;
      
      -- DRAM control outputs
      \-dwea\     : out std_logic;
      \-dweb\     : out std_logic;
      \-dwec\     : out std_logic;
      
      -- Display address outputs
      DADR        : out std_logic_vector(10 downto 0);
      \-DADR\     : out std_logic_vector(10 downto 0);
      
      -- Display data control
      dpar        : out std_logic;
      dn          : out std_logic;
      dp          : out std_logic;
      dr          : out std_logic;
      
      -- Display parity control
      dpareven    : out std_logic;
      dparok      : out std_logic;
      \-dparh\    : out std_logic;
      dparl       : out std_logic;
      
      -- Display PC outputs
      DPC         : out std_logic_vector(13 downto 0);
      
      -- Video memory outputs
      vmo18       : out std_logic;
      vmo19       : out std_logic;
      \-vmo18\    : out std_logic;
      \-vmo19\    : out std_logic;
      
      -- Display mask outputs
      DMASK       : out std_logic_vector(6 downto 0)
    );
  end component;

  component shifter_masker is
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
      \a=m\ : out std_logic;
      \-mr\ : out std_logic;
      \-sr\ : out std_logic
    );
  end component;

  component pdl is
    port (
      -- Bus signals
      L : in std_logic_vector(31 downto 0);
      M : out std_logic_vector(31 downto 0);
      OB : in std_logic_vector(9 downto 0);
      PDL : out std_logic_vector(31 downto 0);
      PDLIDX : out std_logic_vector(9 downto 0);
      PDLPTR : out std_logic_vector(9 downto 0);
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
      \-imodd\ : out std_logic;
      \-pdlcry3\ : out std_logic;
      \-pdlcry7\ : out std_logic;
      \-pdldrive\ : out std_logic;
      pdlenb : out std_logic;
      pdlparity : out std_logic;
      pidrive : out std_logic;
      \-ppdrive\ : out std_logic;
      pdlwrite : out std_logic;
      \-pdlwrited\ : out std_logic;
      pdlwrited : out std_logic;
      pwidx : out std_logic;
      \-pwidx\ : out std_logic
    );
  end component;

  component imem is
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
      iwriteda : out std_logic;
      \-promdisabled\ : out std_logic;
      ramdisable : out std_logic;
      wp5a : out std_logic;
      wp5b : out std_logic;
      wp5c : out std_logic
    );
  end component;

  component prom is
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
  end component;

  component qreg is
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
      \-alu31\ : out std_logic;
      \-qdrive\ : out std_logic;
      qdrive : out std_logic;
      qs0 : out std_logic;
      qs1 : out std_logic;
      srcq : out std_logic
    );
  end component;

  component spy is
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
      \-spy.al\ : out std_logic;
      \-spy.flag1\ : out std_logic;
      \-spy.sth\ : out std_logic;
      \-spy.stl\ : out std_logic
    );
  end component;

  component lcreg is
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
      \-lcinc\ : out std_logic;
      lcinc : out std_logic;
      lcry3 : out std_logic;
      \-lcry3\ : out std_logic;
      \-lcry7\ : out std_logic;
      \-lcry11\ : out std_logic;
      \-lcry15\ : out std_logic;
      \-lcry19\ : out std_logic;
      \-lcry23\ : out std_logic;
      \-lcdrive\ : out std_logic;
      lcdrive : out std_logic;
      srclc : out std_logic;
      \-sh4\ : out std_logic;
      \-sh3\ : out std_logic;
      \inst in left half\ : out std_logic;
      \inst in 2nd or 4th quarter\ : out std_logic;
      \-lc modifies mrot\ : out std_logic;
      \-ifetch\ : out std_logic;
      \have wrong word\ : out std_logic;
      \last byte in word\ : out std_logic;
      \-newlc\ : out std_logic;
      \-newlc.in\ : out std_logic;
      newlc : out std_logic
    );
  end component;

  component vma is
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
      \-vmadrive\ : out std_logic;
      srcvma : out std_logic
    );
  end component;

  component md is
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
      MEM : out std_logic_vector(31 downto 0);
      
      -- Other outputs
      \-mddrive\ : out std_logic;
      srcmd : out std_logic;
      destmdr : out std_logic;
      loadmd : out std_logic;
      mdclk : out std_logic;
      mdgetspar : out std_logic;
      mdhaspar : out std_logic;
      mdpar : out std_logic
    );
  end component;

  component vmaps is
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
      VMAP_OUT : out std_logic_vector(4 downto 0);
      VMO_OUT : out std_logic_vector(23 downto 0);
      
      -- Other outputs
      \-mapdrive\ : out std_logic;
      \-mapi23\ : out std_logic;
      \-use.map\ : out std_logic;
      v0parok : out std_logic;
      vm0pari : out std_logic;
      vmoparok : out std_logic;
      vpari : out std_logic;
      vm1mpar : out std_logic;
      vm1pari : out std_logic;
      \-vm1lpar\ : out std_logic;
      vmoparm : out std_logic;
      vmopar : out std_logic;
      vmoparl : out std_logic;
      vmoparck : out std_logic;
      \-lvmo22\ : out std_logic;
      \-lvmo23\ : out std_logic;
      \-adrpar\ : out std_logic
    );
  end component;

  component vctl is
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
      wrcyc_out : out std_logic;
      \-wmapd\ : out std_logic;
      wmapd : out std_logic;
      memprepare : out std_logic;
      \-pfw\ : out std_logic;
      \-vmaok\ : out std_logic;
      \-mfinishd\ : out std_logic;
      memrq_out : out std_logic;
      mbusy : out std_logic;
      \rd.in.progress\ : out std_logic;
      \set.rd.in.progress\ : out std_logic;
      \-rdfinish\ : out std_logic;
      \-mfinish\ : out std_logic;
      \-memop\ : out std_logic;
      memstart : out std_logic;
      \-memstart\ : out std_logic;
      \-mbusy.sync\ : out std_logic;
      \mbusy.sync\ : out std_logic;
      \-wait\ : out std_logic;
      \-hang\ : out std_logic;
      mapwr0d : out std_logic;
      mapwr1d : out std_logic;
      mdsela : out std_logic;
      mdselb : out std_logic;
      \-memdrive.a\ : out std_logic;
      \-memdrive.b\ : out std_logic;
      \-memprepare_out\ : out std_logic;
      \-memrd_out\ : out std_logic;
      \-memrq_out\ : out std_logic;
      \-memwr_out\ : out std_logic;
      nopa : out std_logic;
      \-pfr_out\ : out std_logic;
      \use.md_out\ : out std_logic;
      \-vm0wpa\ : out std_logic;
      \-vm0wpb\ : out std_logic;
      \-vm1wpa\ : out std_logic;
      \-vm1wpb\ : out std_logic;
      \-vmaenb\ : out std_logic;
      vmasela : out std_logic;
      vmaselb : out std_logic;
      \-wmap\ : out std_logic;
      wmap_out : out std_logic;
      \-wmapd_out\ : out std_logic
    );
  end component;

  component olord is
    port (
      -- Clock and reset signals
      \-clock reset a\ : in  std_logic;
      \-reset\         : in  std_logic;
      \-ldclk\         : in  std_logic;
      mclk5a           : in  std_logic;
      mclk5            : in  std_logic;
      clk5             : in  std_logic;
      \-mclk5\         : out std_logic;
      clk5a            : out std_logic;
      \-clk5\          : out std_logic;
      reset            : out std_logic;
      \bus.power.reset l\ : out std_logic;
      \power reset a\  : out std_logic;
      \-upperhighok\   : in  std_logic;
      \-lowerhighok\   : out std_logic;
      \-boot\          : in  std_logic;
      \-boot1\         : in  std_logic;
      \prog.bus.reset\ : out std_logic;
      \-bus.reset\     : out std_logic;
      \-clock reset b\ : out std_logic;
      \-clock reset a out\ : out std_logic;
      \-power reset\   : out std_logic;
      \boot.trap\      : out std_logic;
      \-boot2\         : out std_logic;
      \-ldmode\        : in  std_logic;
      ldmode           : out std_logic;
      \-busint.lm.reset\ : in  std_logic;
      \-prog.reset\    : out std_logic;
      \prog.boot\      : out std_logic;
      
      -- Speed control signals
      speed1a          : out std_logic;
      sspeed1          : out std_logic;
      speedclk         : out std_logic;
      sspeed0          : out std_logic;
      speed0a          : out std_logic;
      speed1           : out std_logic;
      speed0           : out std_logic;
      
      -- Spy signals
      SPY : in std_logic_vector(7 downto 0);
      
      -- Control signals
      errstop          : out std_logic;
      stathenb         : out std_logic;
      trapenb          : out std_logic;
      promdisable      : out std_logic;
      \-opcinh\        : out std_logic;
      opcinh           : out std_logic;
      \-ldopc\         : in  std_logic;
      opcclk           : out std_logic;
      \-opcclk\        : out std_logic;
      \-lpc.hold\      : out std_logic;
      \lpc.hold\       : out std_logic;
      ldstat           : out std_logic;
      \-ldstat\        : out std_logic;
      \-idebug\        : out std_logic;
      idebug           : out std_logic;
      nop11            : out std_logic;
      \-nop11\         : out std_logic;
      \-step\          : out std_logic;
      step             : out std_logic;
      promdisabled     : out std_logic;
      sstep            : out std_logic;
      ssdone           : out std_logic;
      srun             : out std_logic;
      run              : out std_logic;
      \-run\           : out std_logic;
      \-ssdone\        : out std_logic;
      \-errhalt\       : in  std_logic;
      \-wait\          : in  std_logic;
      \-stathalt\      : out std_logic;
      \stat.ovf\       : out std_logic;
      \-stc32\         : in  std_logic;
      \-tpr60\         : in  std_logic;
      statstop         : in  std_logic;
      \-machruna\      : out std_logic;
      \-machrun\       : out std_logic;
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
      \-halted\        : out std_logic;
      aparok           : in  std_logic;
      mmemparok        : in  std_logic;
      pdlparok         : in  std_logic;
      dparok           : in  std_logic;
      iparok           : in  std_logic;
      spcparok         : in  std_logic;
      highok           : out std_logic;
      memparok         : in  std_logic;
      v0parok          : in  std_logic;
      vmoparok         : in  std_logic;
      statstop_out     : out std_logic;
      \-halt\          : in  std_logic;
      \-ldmode_out\    : out std_logic;
      errstop_in       : in  std_logic;
      \-errhalt_out\   : out std_logic
    );
  end component;

  component ireg is
    port (
      -- Clock signals
      clk3a : in std_logic;
      clk3b : in std_logic;
      
      -- Control signals
      \-destimod0\ : in std_logic;
      \-destimod1\ : in std_logic;
      
      -- Input bus (48-bit)
      I : in std_logic_vector(48 downto 0);
      
      -- Output bus (48-bit)  
      OB : in std_logic_vector(47 downto 0);
      
      -- Input/Output bus (48-bit)
      IOB : out std_logic_vector(47 downto 0);
      
      -- Instruction register output (48-bit)
      IR : out std_logic_vector(48 downto 0)
    );
  end component;

  component npc is
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
      IPC    : out std_logic_vector(13 downto 0);
      NPC    : out std_logic_vector(13 downto 0);
      PC     : out std_logic_vector(13 downto 0);
      SPC    : out std_logic_vector(13 downto 0);
      SPCO   : out std_logic_vector(13 downto 0);
      
      -- Individual outputs
      pccry3  : out std_logic;
      pccry7  : out std_logic;
      pccry11 : out std_logic
    );
  end component;

  component fetch is
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
      IWR : out std_logic_vector(47 downto 0)
    );
  end component;

  component decode is
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
      iralu         : out std_logic;
      irdisp        : out std_logic;
      irjump        : out std_logic;
      
      -- Function outputs  
      \-funct0\     : out std_logic;
      \-funct1\     : out std_logic;
      \-funct2\     : out std_logic;
      \-funct3\     : out std_logic;
      
      -- Destination outputs
      \-destimod0\  : out std_logic;
      \-destimod1\  : out std_logic;
      \-destintctl\ : out std_logic;
      \-destlc\     : out std_logic;
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
      \-srcopc\     : out std_logic;
      \-srcpdlidx\  : out std_logic;
      \-srcpdlpop\  : out std_logic;
      \-srcpdlptr\  : out std_logic;
      \-srcpdltop\  : out std_logic;
      \-srcq\       : out std_logic;
      \-srcspc\     : out std_logic;
      \-srcspcpop\  : out std_logic;
      \-srcvma\     : out std_logic;
      
      -- ALU function outputs
      \-div\        : out std_logic;
      \-iralu\      : out std_logic;
      \-irbyte\     : out std_logic;
      \-irdisp\     : out std_logic;
      \-irjump\     : out std_logic;
      \-ir22\       : out std_logic;
      \-ir25\       : out std_logic;
      \-mul\        : out std_logic;
      \-specalu\    : out std_logic
    );
  end component;

  component lreg is
    port (
      -- Clock signal
      clk3f : in std_logic;
      
      -- Bus signals
      OB : in std_logic_vector(31 downto 0);
      
      -- Output bus signals
      L : out std_logic_vector(31 downto 0);
      
      -- Parity outputs
      lparl      : out std_logic;
      \-lparm\   : out std_logic;
      lparity    : out std_logic;
      \-lparity\ : out std_logic
    );
  end component;

  component jumpc is
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
      aluneg              : out std_logic;
      conds0              : out std_logic;
      conds1              : out std_logic;
      conds2              : out std_logic;
      \-ilong\            : out std_logic;
      \int.enable\        : out std_logic;
      jcond               : out std_logic;
      \-jcond\            : out std_logic;
      \lc byte mode\      : out std_logic;
      \pgf.or.int\        : out std_logic;
      \pgf.or.int.or.sb\  : out std_logic;
      \prog.unibus.reset\ : out std_logic;
      \sequence.break\    : out std_logic;
      sint                : out std_logic;
      \-statbit\          : out std_logic
    );
  end component;

  component flowc is
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
      dispenb          : out std_logic;
      dn               : out std_logic;
      dp               : out std_logic;
      dr               : out std_logic;
      \-ignpopj\       : out std_logic;
      \-inop\          : out std_logic;
      inop             : out std_logic;
      \-ipopj\         : out std_logic;
      \-iwrited\       : out std_logic;
      iwrite           : out std_logic;
      iwrited          : out std_logic;
      jcalf            : out std_logic;
      jfalse           : out std_logic;
      jret             : out std_logic;
      jretf            : out std_logic;
      n                : out std_logic;
      \-nop\           : out std_logic;
      nop              : out std_logic;
      \-nopa\          : out std_logic;
      \-popj\          : out std_logic;
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

end package;
