-- The MIT CADR

library ieee;
use ieee.std_logic_1164.all;

use std.env.finish;

library work;
use work.set.all;

entity cadr_tb is
end;

architecture structural of cadr_tb is
  -- Bus signals
  signal A: std_logic_vector(30 downto 0);
  signal AA: std_logic_vector(15 downto 0);
  signal ALU: std_logic_vector(32 downto 0);
  signal DC: std_logic_vector(9 downto 0);
  signal I: std_logic_vector(48 downto 0);
  signal IPC: std_logic_vector(13 downto 0);
  signal IR: std_logic_vector(48 downto 0);
  signal IWR: std_logic_vector(48 downto 0);
  signal L: std_logic_vector(31 downto 0);
  signal LC: std_logic_vector(25 downto 2);
  signal M: std_logic_vector(31 downto 0);
  signal MAPI: std_logic_vector(23 downto 8);
  signal MSK: std_logic_vector(31 downto 0);
  signal OB: std_logic_vector(31 downto 0);
  signal OPC: std_logic_vector(13 downto 0);
  signal PC: std_logic_vector(13 downto 0);
  signal Q: std_logic_vector(31 downto 0);
  signal R: std_logic_vector(31 downto 0);
  signal SPC: std_logic_vector(14 downto 1);
  signal SPY: std_logic_vector(15 downto 0);
  signal WADR: std_logic_vector(4 downto 0);

  -- Clock and timing signals
  signal clk1a, clk2a, clk2b, clk2c, clk3a, clk3b, clk3c, clk3d, clk3e, clk3f: std_logic;
  signal clk4a, clk4b, clk4c, clk4d, clk4e, clk4f, clk5, mclk5, mclk1a: std_logic;
  signal \-clk2c\, \-clk3g\, \-clk4e\, \-clk5\, clk5a: std_logic;
  signal tse1a, tse1b, tse2, tse3a, tse4a, tse4b: std_logic;
  signal wp1a, wp1b, wp2, wp3a, wp4a, wp4b, wp4c, \-wp5\: std_logic;

  -- Reset and control signals
  signal reset, \-reset\, \-clock reset b\: std_logic;
  signal \-boot1\: std_logic := '1';
  signal machrun, \-machruna\, \-hang\, \-ilong\: std_logic;
  signal sspeed0, sspeed1: std_logic;
  signal lcry3, \-lcry3\, \-srcpdlidx\, \-srcpdlptr\, \-tpr60\: std_logic;
  signal srcpdlidx, srcpdlptr: std_logic;
  signal \-upperhighok\: std_logic;

  -- Processor state signals
  signal a12, a31a, a31b, q0, q31: std_logic;
  signal \a=m\, alu32, r0: std_logic;
  signal dest, destm, destmd, destspcd: std_logic;
  signal imod, imodd, iparok: std_logic;
  signal lparity, mparity, aparity: std_logic;
  signal needfetch, lcinc, sintr, \-ifetch\: std_logic;
  signal spc1a: std_logic;

  -- IR decode signals
  signal \-destimod0\, \-destimod1\, \-destintctl\, \-destlc\: std_logic;
  signal \-destmdr\, \-destmem\, \-destpdl(p)\, \-destpdl(x)\: std_logic;
  signal \-destpdlp\, \-destpdltop\, \-destpdlx\, \-destspc\, \-destvma\: std_logic;
  signal \-div\, \-funct2\, \-iralu\, \-irbyte\: std_logic;
  signal irdisp, \-irdisp\, irjump, \-irjump\, \-mul\: std_logic;
  signal \-srcdc\, \-srclc\, \-srcmap\, \-srcmd\, \-srcopc\: std_logic;
  signal \-srcpdlpop\, \-srcpdltop\: std_logic;
  signal \-srcq\, \-srcspc\, \-srcspcpop\, \-srcvma\: std_logic;
  signal ir25, ir30, \-ir31\: std_logic;
  signal \-ir0\, \-ir1\, \-ir2\, \-ir3\, \-ir4\, \-ir12\, \-ir13\: std_logic;
  signal \-sh3\, \-sh4\, m5: std_logic;

  -- Jump and flow control
  signal jcond, \-jcond\, nop, \-nopa\, n: std_logic;
  signal pcs0, pcs1, dispenb, iwrited, \-iwrited\: std_logic;
  signal \-nop11\, \-srcspcpopreal\, \-spop\: std_logic;
  signal spcdrive, \-spcdrive\, spcenb, \-spcnt\, \-spcpass\: std_logic;
  signal spcwpass, \-spcwpass\, spush, spushd: std_logic;
  signal \-swpa\, \-swpb\: std_logic;

  -- Debug and status
  signal idebug, \-idebug\, promdisable, promdisabled, \-promdisabled\: std_logic;
  signal \-iwriteda\, \-ldclk\, \-lddbirh\, \-lddbirl\, \-lddbirm\: std_logic;
  signal \-ldopc\, \-ldstat\, opcclk, \-opcinh\: std_logic;
  signal \-spy.sth\, \-spy.stl\, \-stc32\, \-statbit\: std_logic;

  -- Memory and addressing
  signal memstart, \-memstart\: std_logic;
  signal \-vmaok\, \-wait\, wmapd: std_logic;
  signal mdsela, mdselb, \-memdrive.a\, \-memdrive.b\: std_logic;
  signal \-pfr\, \-pfw\, \use.md\: std_logic;
  signal \-vm0wpa\, \-vm0wpb\, \-vm1wpa\, \-vm1wpb\: std_logic;
  signal \-vmaenb\, vmasela, vmaselb: std_logic;
  signal \-lvmo22\, \-lvmo23\: std_logic;

  -- MD signals
  signal \-md0\, \-md1\, \-md2\, \-md3\, \-md4\, \-md5\, \-md6\, \-md7\: std_logic;
  signal \-md8\, \-md9\, \-md10\, \-md11\, \-md12\, \-md13\, \-md14\, \-md15\: std_logic;
  signal \-md16\, \-md17\, \-md18\, \-md19\, \-md20\, \-md21\, \-md22\, \-md23\: std_logic;
  signal \-md24\, \-md25\, \-md26\, \-md27\, \-md28\, \-md29\, \-md30\, \-md31\: std_logic;
  signal mdhaspar, mdpar, mdparodd: std_logic;
  signal \-loadmd\, \-ignpar\, \mempar in\: std_logic;

  -- VMA signals
  signal \-vma0\, \-vma1\, \-vma2\, \-vma3\, \-vma4\, \-vma5\, \-vma6\, \-vma7\: std_logic;
  signal \-vma8\, \-vma9\, \-vma10\, \-vma11\, \-vma12\, \-vma13\, \-vma14\, \-vma15\: std_logic;
  signal \-vma16\, \-vma17\, \-vma18\, \-vma19\, \-vma20\, \-vma21\, \-vma22\, \-vma23\: std_logic;
  signal \-vma25\, \-vma26\, \-vma27\, \-vma28\, \-vma29\, \-vma30\, \-vma31\: std_logic;

  -- Parity and error signals
  signal aparok, mmemparok, pdlparok, memparok: std_logic;
  signal v0parok, vmoparok, dparok, spcparok: std_logic;
  signal \-ape\, \-dpe\, \-ipe\, \-mempe\, \-mpe\, \-pdlpe\: std_logic;
  signal \-spe\, \-v0pe\, \-v1pe\, err, \-higherr\: std_logic;

  -- PDL signals
  signal pdlenb, pdlwrited: std_logic;

  -- Other control signals
  signal srcm, osel0a, osel0b, osel1a, osel1b: std_logic;
  signal dp, dr, dpc4: std_logic;
  signal eadr0, eadr1, eadr2, eadr3: std_logic;
  signal \-dbread\, \-dbwrite\: std_logic;
  signal trapenb, \-trap\, trapa, trapb, \boot.trap\: std_logic;
  signal \-halt\, \-busint.lm.reset\, srun, ssdone, \-stathalt\: std_logic;
  signal \lpc.hold\, \int.enable\, \lc byte mode\: std_logic;
  signal \prog.unibus.reset\, \sequence.break\: std_logic;
  signal spcwpar, int, \lm drive enb\: std_logic;
  signal \-memack\, \-memgrant\: std_logic;
  signal \destimod0 l\, \iwrited l\: std_logic;

begin

  --- Clock Generation (clock1, clock2, clockd)
  i_clock : clock_set port map (
    \-clock reset b\ => \-clock reset b\,
    \-hang\ => \-hang\,
    \-ilong\ => \-ilong\,
    sspeed0 => sspeed0,
    sspeed1 => sspeed1,
    machrun => machrun,
    \-machruna\ => \-machruna\,
    lcry3 => lcry3,
    reset => reset,
    \-srcpdlidx\ => \-srcpdlidx\,
    \-srcpdlptr\ => \-srcpdlptr\,
    \-tpr60\ => \-tpr60\,
    clk5 => clk5,
    mclk5 => mclk5,
    \-wp5\ => \-wp5\,
    clk1a => clk1a,
    clk2a => clk2a,
    clk2b => clk2b,
    clk2c => clk2c,
    \-clk2c\ => \-clk2c\,
    clk3a => clk3a,
    clk3b => clk3b,
    clk3c => clk3c,
    clk3d => clk3d,
    clk3e => clk3e,
    clk3f => clk3f,
    \-clk3g\ => \-clk3g\,
    clk4a => clk4a,
    clk4b => clk4b,
    clk4c => clk4c,
    clk4d => clk4d,
    clk4e => clk4e,
    \-clk4e\ => \-clk4e\,
    clk4f => clk4f,
    \-lcry3\ => \-lcry3\,
    mclk1a => mclk1a,
    \-reset\ => \-reset\,
    srcpdlidx => srcpdlidx,
    srcpdlptr => srcpdlptr,
    tse1a => tse1a,
    tse1b => tse1b,
    tse2 => tse2,
    tse3a => tse3a,
    tse4a => tse4a,
    tse4b => tse4b,
    \-upperhighok\ => \-upperhighok\,
    wp1a => wp1a,
    wp1b => wp1b,
    wp2 => wp2,
    wp3a => wp3a,
    wp4a => wp4a,
    wp4b => wp4b,
    wp4c => wp4c
  );
  --- Microinstruction Fetch (ictl, iramXX, pctl, promX, iwr, debug)
  i_imem  : imem_set port map (
    IWR => IWR,
    PC => PC,
    idebug => idebug,
    \-iwrited\ => \-iwrited\,
    promdisabled => promdisabled,
    \-wp5\ => \-wp5\,
    I => I,
    \-iwriteda\ => \-iwriteda\,
    \-promdisabled\ => \-promdisabled\
  );
  i_prom  : prom_set port map (
    PC => PC,
    \-ape\ => \-ape\,
    \-dpe\ => \-dpe\,
    \-idebug\ => \-idebug\,
    \-ipe\ => \-ipe\,
    \-iwriteda\ => \-iwriteda\,
    \-mempe\ => \-mempe\,
    \-mpe\ => \-mpe\,
    \-pdlpe\ => \-pdlpe\,
    \-promdisabled\ => \-promdisabled\,
    \-spe\ => \-spe\,
    \-v0pe\ => \-v0pe\,
    \-v1pe\ => \-v1pe\,
    I => I
  );
  i_fetch : fetch_set port map (
    AA => AA,
    M => M,
    SPY => SPY,
    \-idebug\ => \-idebug\,
    \-lddbirh\ => \-lddbirh\,
    \-lddbirl\ => \-lddbirl\,
    \-lddbirm\ => \-lddbirm\,
    clk2c => clk2c,
    clk4c => clk4c,
    I => I(47 downto 0),
    IWR => IWR
  );
  --- Microinstrction Modification and Main Instruction Register (ior, ireg)
  i_ireg   : ireg_set port map(
    I => I,
    OB => OB(25 downto 0),
    imodd => imodd,
    clk3a => clk3a,
    clk3b => clk3b,
    \-destimod0\ => \-destimod0\,
    \-destimod1\ => \-destimod1\,
    IR => IR,
    iparok => iparok
  );
  --- IR Decoding (source)
  i_decode : decode_set port map(
    IR => IR(44 downto 3),
    \-idebug\ => \-idebug\,
    \-ir31\ => \-ir31\,
    \iwrited l\ => \iwrited l\,
    nop => nop,
    dest => dest,
    \-destimod0\ => \-destimod0\,
    \-destimod1\ => \-destimod1\,
    \-destintctl\ => \-destintctl\,
    \-destlc\ => \-destlc\,
    destm => destm,
    \-destmdr\ => \-destmdr\,
    \-destmem\ => \-destmem\,
    \-destpdl(p)\ => \-destpdl(p)\,
    \-destpdl(x)\ => \-destpdl(x)\,
    \-destpdlp\ => \-destpdlp\,
    \-destpdltop\ => \-destpdltop\,
    \-destpdlx\ => \-destpdlx\,
    \-destspc\ => \-destspc\,
    \-destvma\ => \-destvma\,
    \-div\ => \-div\,
    \-funct2\ => \-funct2\,
    imod => imod,
    \-iralu\ => \-iralu\,
    \-irbyte\ => \-irbyte\,
    irdisp => irdisp,
    \-irdisp\ => \-irdisp\,
    irjump => irjump,
    \-irjump\ => \-irjump\,
    \-mul\ => \-mul\,
    \-srcdc\ => \-srcdc\,
    \-srclc\ => \-srclc\,
    \-srcmap\ => \-srcmap\,
    \-srcmd\ => \-srcmd\,
    \-srcopc\ => \-srcopc\,
    \-srcpdlidx\ => \-srcpdlidx\,
    \-srcpdlpop\ => \-srcpdlpop\,
    \-srcpdlptr\ => \-srcpdlptr\,
    \-srcpdltop\ => \-srcpdltop\,
    \-srcq\ => \-srcq\,
    \-srcspc\ => \-srcspc\,
    \-srcspcpop\ => \-srcspcpop\,
    \-srcvma\ => \-srcvma\
  );
  --- A & M Memory (actl, amem0, amem1, mctrl, mmem, mlatch, mf)
  i_amem  : amem_set port map (
    IR => IR(41 downto 14),
    L => L,
    clk3d => clk3d,
    clk3e => clk3e,
    dest => dest,
    destm => destm,
    \-reset\ => \-reset\,
    tse3a => tse3a,
    tse4a => tse4a,
    wp3a => wp3a,
    lparity => lparity,
    A => A,
    WADR => WADR,
    destmd => destmd,
    a31a => a31a,
    a31b => a31b,
    aparity => aparity
  );
  i_mmem  : mmem_set port map (
    IR => IR(30 downto 26),
    L => L,
    WADR => WADR,
    clk4e => clk4e,
    destmd => destmd,
    \-ir31\ => \-ir31\,
    tse4a => tse4a,
    wp4b => wp4b,
    pdlenb => pdlenb,
    spcenb => spcenb,
    tse1a => tse1a,
    clk4a => clk4a,
    lparity => lparity,
    M => M,
    srcm => srcm,
    mparity => mparity
  );
  -- A & M Parity (apar)
  i_ampar : ampar_set port map(
    A => A,
    M => M,
    a31b => a31b,
    aparity => aparity,
    mparity => mparity,
    pdlenb => pdlenb,
    srcm => srcm,
    aparok => aparok,
    mmemparok => mmemparok,
    pdlparok => pdlparok
  );
  --- Stack Buffer (pdlptr, pdlctl, pdl0, pdl1, platch)
  i_pdl   : pdl_set port map (
    L => L,
    OB => OB(9 downto 0),
    lparity => lparity,
    clk4b => clk4b,
    \-clk4e\ => \-clk4e\,
    clk4f => clk4f,
    \-destpdl(p)\ => \-destpdl(p)\,
    \-destpdl(x)\ => \-destpdl(x)\,
    \-destpdltop\ => \-destpdltop\,
    \-destspc\ => \-destspc\,
    imod => imod,
    nop => nop,
    \-reset\ => \-reset\,
    \-srcpdltop\ => \-srcpdltop\,
    wp4a => wp4a,
    clk3f => clk3f,
    \-destpdlp\ => \-destpdlp\,
    \-destpdlx\ => \-destpdlx\,
    srcpdlidx => srcpdlidx,
    \-srcpdlpop\ => \-srcpdlpop\,
    srcpdlptr => srcpdlptr,
    tse4b => tse4b,
    clk4a => clk4a,
    M => M,
    imodd => imodd,
    pdlenb => pdlenb,
    pdlwrited => pdlwrited,
    mparity => mparity
  );
  --- Shifter/Masker (smctl, shift0, shift1, mskg4)
  i_sm    : shifter_masker_set port map (
    IR => IR(31 downto 5),
    M => M,
    \-ir0\ => \-ir0\,
    \-ir1\ => \-ir1\,
    \-ir2\ => \-ir2\,
    \-irbyte\ => \-irbyte\,
    \-sh3\ => \-sh3\,
    \-sh4\ => \-sh4\,
    MSK => MSK,
    R => R,
    \a=m\ => \a=m\,
    \-ir12\ => \-ir12\,
    \-ir13\ => \-ir13\,
    \-ir31\ => \-ir31\
  );
  -- ALU (alu0, alu1, aluc4)
  i_alu   : alu_set port map (
    A => A,
    IR => IR(7 downto 0),
    M => M,
    a31a => a31a,
    a31b => a31b,
    \-div\ => \-div\,
    \-ir12\ => \-ir12\,
    \-ir13\ => \-ir13\,
    \-iralu\ => \-iralu\,
    irjump => irjump,
    \-irjump\ => \-irjump\,
    \-mul\ => \-mul\,
    ALU => ALU,
    \a=m\ => \a=m\,
    \-ir0\ => \-ir0\,
    \-ir1\ => \-ir1\,
    \-ir2\ => \-ir2\,
    \-ir3\ => \-ir3\,
    \-ir4\ => \-ir4\,
    osel0a => osel0a,
    osel0b => osel0b,
    osel1a => osel1a,
    osel1b => osel1b
  );
  --- The Q Register (qctl, q)
  i_qreg  : qreg_set port map (
    ALU => ALU(31 downto 0),
    clk2b => clk2b,
    \-ir0\ => \-ir0\,
    \-ir1\ => \-ir1\,
    \-iralu\ => \-iralu\,
    \-srcq\ => \-srcq\,
    tse2 => tse2,
    Q => Q
  );
  --- The L Register (l)
  i_lreg  : lreg_set port map(
    OB => OB,
    clk3f => clk3f,
    L => L,
    lparity => lparity
  );
  --- The Dispatch Memory (dspctl, dram0, dram1, dram2)
  i_dmem  : dmem_set port map (
    A => A(17 downto 0),
    IR => IR(41 downto 5),
    R => R(6 downto 0),
    wp2 => wp2,
    clk3e => clk3e,
    dispenb => dispenb,
    \-funct2\ => \-funct2\,
    \-irdisp\ => \-irdisp\,
    AA => AA,
    DC => DC,
    dpc4 => dpc4,
    dp => dp,
    dr => dr,
    dparok => dparok
  );
  --- Jump Conditions (flag)
  i_jumpc  : jumpc_set port map (
    IR => IR(46 downto 0),
    OB => OB(29 downto 26),
    \a=m\ => \a=m\,
    clk3c => clk3c,
    \-destintctl\ => \-destintctl\,
    \-nopa\ => \-nopa\,
    \-reset\ => \-reset\,
    sintr => sintr,
    \-vmaok\ => \-vmaok\,
    \-ilong\ => \-ilong\,
    \int.enable\ => \int.enable\,
    jcond => jcond,
    \-jcond\ => \-jcond\,
    \lc byte mode\ => \lc byte mode\,
    \prog.unibus.reset\ => \prog.unibus.reset\,
    \sequence.break\ => \sequence.break\,
    \-statbit\ => \-statbit\
  );
  --- Flow of Control (contrl)
  i_flowc : flowc_set port map(
    IR => IR(42 downto 6),
    clk3c => clk3c,
    dp => dp,
    dr => dr,
    \-funct2\ => \-funct2\,
    irdisp => irdisp,
    \-irdisp\ => \-irdisp\,
    irjump => irjump,
    jcond => jcond,
    \-jcond\ => \-jcond\,
    \-nop11\ => \-nop11\,
    \-reset\ => \-reset\,
    \-srcspc\ => \-srcspc\,
    \-srcspcpop\ => \-srcspcpop\,
    \-trap\ => \-trap\,
    tse3a => tse3a,
    wp4c => wp4c,
    \-destspc\ => \-destspc\,
    destspcd => destspcd,
    dispenb => dispenb,
    iwrited => iwrited,
    \-iwrited\ => \-iwrited\,
    n => n,
    nop => nop,
    \-nopa\ => \-nopa\,
    pcs0 => pcs0,
    pcs1 => pcs1,
    spcdrive => spcdrive,
    \-spcdrive\ => \-spcdrive\,
    spcenb => spcenb,
    \-spcnt\ => \-spcnt\,
    \-spcpass\ => \-spcpass\,
    spcwpass => spcwpass,
    \-spcwpass\ => \-spcwpass\,
    \-spop\ => \-spop\,
    spush => spush,
    spushd => spushd,
    \-srcspcpopreal\ => \-srcspcpopreal\,
    \-swpa\ => \-swpa\,
    \-swpb\ => \-swpb\
  );
  --- Microcode Subroutine Return Stack (spc, spclch, spcw, lpc)
  i_spc   : spc_set port map (
    IPC => IPC,
    L => L(18 downto 0),
    PC => PC,
    clk4b => clk4b,
    irdisp => irdisp,
    \lpc.hold\ => \lpc.hold\,
    clk4f => clk4f,
    \-spcnt\ => \-spcnt\,
    spush => spush,
    \-swpa\ => \-swpa\,
    \-swpb\ => \-swpb\,
    clk4c => clk4c,
    clk4d => clk4d,
    spcdrive => spcdrive,
    \-spcdrive\ => \-spcdrive\,
    \-spcpass\ => \-spcpass\,
    spcwpass => spcwpass,
    \-spcwpass\ => \-spcwpass\,
    destspcd => destspcd,
    n => n,
    M => M,
    SPC => SPC
  );
  --- Next PC Selector (npc)
  i_npc   : npc_set port map(
    IR => IR(25 downto 12),
    clk4b => clk4b,
    dpc4 => dpc4,
    pcs0 => pcs0,
    pcs1 => pcs1,
    spc1a => spc1a,
    trapa => trapa,
    trapb => trapb,
    IPC => IPC,
    PC => PC
  );
  --- The LC register and Instruction Prefetch (lc, lcc)
  i_lcreg : lcreg_set port map (
    IR => IR(24 downto 10),
    OB => OB(25 downto 0),
    SPC => SPC,
    clk1a => clk1a,
    clk2a => clk2a,
    clk2c => clk2c,
    \-destlc\ => \-destlc\,
    \int.enable\ => \int.enable\,
    \lc byte mode\ => \lc byte mode\,
    \-lcry3\ => \-lcry3\,
    \prog.unibus.reset\ => \prog.unibus.reset\,
    \sequence.break\ => \sequence.break\,
    \-srclc\ => \-srclc\,
    tse1a => tse1a,
    clk3c => clk3c,
    \-ir3\ => \-ir3\,
    \-ir4\ => \-ir4\,
    irdisp => irdisp,
    \-reset\ => \-reset\,
    \-spop\ => \-spop\,
    \-srcspcpopreal\ => \-srcspcpopreal\,
    LC => LC,
    \-ifetch\ => \-ifetch\,
    lcinc => lcinc,
    lcry3 => lcry3,
    needfetch => needfetch,
    \-sh3\ => \-sh3\,
    \-sh4\ => \-sh4\,
    sintr => sintr,
    spc1a => spc1a
  );
  --- The VMA and VMA Selector (vma, vmas)
  i_vma   : vma_set port map (
    LC => LC,
    OB => OB,
    clk1a => clk1a,
    clk2a => clk2a,
    clk2c => clk2c,
    \-srcvma\ => \-srcvma\,
    tse2 => tse2,
    \-vmaenb\ => \-vmaenb\,
    \-md10\ => \-md10\,
    \-md11\ => \-md11\,
    \-md12\ => \-md12\,
    \-md13\ => \-md13\,
    \-md14\ => \-md14\,
    \-md15\ => \-md15\,
    \-md16\ => \-md16\,
    \-md17\ => \-md17\,
    \-md18\ => \-md18\,
    \-md19\ => \-md19\,
    \-md20\ => \-md20\,
    \-md21\ => \-md21\,
    \-md22\ => \-md22\,
    \-md23\ => \-md23\,
    \-md8\ => \-md8\,
    \-md9\ => \-md9\,
    \-memstart\ => \-memstart\,
    vmasela => vmasela,
    vmaselb => vmaselb,
    MAPI => MAPI,
    \-vma0\ => \-vma0\,
    \-vma10\ => \-vma10\,
    \-vma11\ => \-vma11\,
    \-vma12\ => \-vma12\,
    \-vma13\ => \-vma13\,
    \-vma14\ => \-vma14\,
    \-vma15\ => \-vma15\,
    \-vma16\ => \-vma16\,
    \-vma17\ => \-vma17\,
    \-vma18\ => \-vma18\,
    \-vma19\ => \-vma19\,
    \-vma1\ => \-vma1\,
    \-vma20\ => \-vma20\,
    \-vma21\ => \-vma21\,
    \-vma22\ => \-vma22\,
    \-vma23\ => \-vma23\,
    \-vma25\ => \-vma25\,
    \-vma26\ => \-vma26\,
    \-vma27\ => \-vma27\,
    \-vma28\ => \-vma28\,
    \-vma29\ => \-vma29\,
    \-vma2\ => \-vma2\,
    \-vma30\ => \-vma30\,
    \-vma31\ => \-vma31\,
    \-vma3\ => \-vma3\,
    \-vma4\ => \-vma4\,
    \-vma5\ => \-vma5\,
    \-vma6\ => \-vma6\,
    \-vma7\ => \-vma7\,
    \-vma8\ => \-vma8\,
    \-vma9\ => \-vma9\
  );
  --- The MD and the MD Selector (md, mds)
  i_md    : md_set port map (
    OB => OB,
    \-clk2c\ => \-clk2c\,
    \-destmdr\ => \-destmdr\,
    \-ignpar\ => \-ignpar\,
    \-loadmd\ => \-loadmd\,
    \mempar in\ => \mempar in\,
    \-srcmd\ => \-srcmd\,
    tse2 => tse2,
    mdparodd => mdparodd,
    mdsela => mdsela,
    mdselb => mdselb,
    \-memdrive.a\ => \-memdrive.a\,
    \-memdrive.b\ => \-memdrive.b\,
    \-md0\ => \-md0\,
    \-md10\ => \-md10\,
    \-md11\ => \-md11\,
    \-md12\ => \-md12\,
    \-md13\ => \-md13\,
    \-md14\ => \-md14\,
    \-md15\ => \-md15\,
    \-md16\ => \-md16\,
    \-md17\ => \-md17\,
    \-md18\ => \-md18\,
    \-md19\ => \-md19\,
    \-md1\ => \-md1\,
    \-md20\ => \-md20\,
    \-md21\ => \-md21\,
    \-md22\ => \-md22\,
    \-md23\ => \-md23\,
    \-md24\ => \-md24\,
    \-md25\ => \-md25\,
    \-md26\ => \-md26\,
    \-md27\ => \-md27\,
    \-md28\ => \-md28\,
    \-md29\ => \-md29\,
    \-md2\ => \-md2\,
    \-md30\ => \-md30\,
    \-md31\ => \-md31\,
    \-md3\ => \-md3\,
    \-md4\ => \-md4\,
    \-md5\ => \-md5\,
    \-md6\ => \-md6\,
    \-md7\ => \-md7\,
    \-md8\ => \-md8\,
    \-md9\ => \-md9\,
    mdhaspar => mdhaspar,
    mdpar => mdpar
  );
  --- First and Second Level Maps (vmem0, vmem1, vmem2, vmemdr)
  i_vmaps : vmaps_set port map (
    MAPI => MAPI,
    memstart => memstart,
    \-vm0wpa\ => \-vm0wpa\,
    \-vm0wpb\ => \-vm0wpb\,
    \-vma27\ => \-vma27\,
    \-vma28\ => \-vma28\,
    \-vma29\ => \-vma29\,
    \-vma30\ => \-vma30\,
    \-vma31\ => \-vma31\,
    \-vm1wpa\ => \-vm1wpa\,
    \-vma0\ => \-vma0\,
    \-vma10\ => \-vma10\,
    \-vma11\ => \-vma11\,
    \-vma12\ => \-vma12\,
    \-vma13\ => \-vma13\,
    \-vma14\ => \-vma14\,
    \-vma15\ => \-vma15\,
    \-vma16\ => \-vma16\,
    \-vma17\ => \-vma17\,
    \-vma18\ => \-vma18\,
    \-vma19\ => \-vma19\,
    \-vma1\ => \-vma1\,
    \-vma20\ => \-vma20\,
    \-vma21\ => \-vma21\,
    \-vma22\ => \-vma22\,
    \-vma23\ => \-vma23\,
    \-vma2\ => \-vma2\,
    \-vma3\ => \-vma3\,
    \-vma4\ => \-vma4\,
    \-vma5\ => \-vma5\,
    \-vma6\ => \-vma6\,
    \-vma7\ => \-vma7\,
    \-vma8\ => \-vma8\,
    \-vma9\ => \-vma9\,
    \-vm1wpb\ => \-vm1wpb\,
    \-pfr\ => \-pfr\,
    \-pfw\ => \-pfw\,
    \-srcmap\ => \-srcmap\,
    tse1a => tse1a,
    v0parok => v0parok,
    vmoparok => vmoparok,
    \-lvmo22\ => \-lvmo22\,
    \-lvmo23\ => \-lvmo23\
  );
  --- Memory Control Logic part I (vctl1, vctl2)
  i_vctrl : vctl_set port map (
    IR => IR(20 downto 19),
    clk2a => clk2a,
    clk2c => clk2c,
    \-clk3g\ => \-clk3g\,
    \-ifetch\ => \-ifetch\,
    lcinc => lcinc,
    \-lvmo22\ => \-lvmo22\,
    mclk1a => mclk1a,
    \-memack\ => \-memack\,
    \-memgrant\ => \-memgrant\,
    needfetch => needfetch,
    \-reset\ => \-reset\,
    \-destmdr\ => \-destmdr\,
    \-destmem\ => \-destmem\,
    \-destvma\ => \-destvma\,
    \lm drive enb\ => \lm drive enb\,
    \-lvmo23\ => \-lvmo23\,
    \-nopa\ => \-nopa\,
    \-srcmd\ => \-srcmd\,
    \-vma25\ => \-vma25\,
    \-vma26\ => \-vma26\,
    wp1a => wp1a,
    wp1b => wp1b,
    \-hang\ => \-hang\,
    memstart => memstart,
    \-memstart\ => \-memstart\,
    \-pfw\ => \-pfw\,
    \-vmaok\ => \-vmaok\,
    \-wait\ => \-wait\,
    wmapd => wmapd,
    mdsela => mdsela,
    mdselb => mdselb,
    \-memdrive.a\ => \-memdrive.a\,
    \-memdrive.b\ => \-memdrive.b\,
    \-pfr\ => \-pfr\,
    \use.md\ => \use.md\,
    \-vm0wpa\ => \-vm0wpa\,
    \-vm0wpb\ => \-vm0wpb\,
    \-vm1wpa\ => \-vm1wpa\,
    \-vm1wpb\ => \-vm1wpb\,
    \-vmaenb\ => \-vmaenb\,
    vmasela => vmasela,
    vmaselb => vmaselb
  );
  --- Memory Control Logic part II (Overlord) (olord1, olord2)
  i_olord : olord_set port map (
    SPY => SPY(7 downto 0),
    \-ldclk\ => \-ldclk\,
    \-ldopc\ => \-ldopc\,
    \-stc32\ => \-stc32\,
    \-tpr60\ => \-tpr60\,
    \-wait\ => \-wait\,
    aparok => aparok,
    \-boot1\ => \-boot1\,
    \-busint.lm.reset\ => \-busint.lm.reset\,
    clk5 => clk5,
    dparok => dparok,
    \-halt\ => \-halt\,
    iparok => iparok,
    mclk5 => mclk5,
    memparok => memparok,
    mmemparok => mmemparok,
    pdlparok => pdlparok,
    spcparok => spcparok,
    \-upperhighok\ => \-upperhighok\,
    v0parok => v0parok,
    vmoparok => vmoparok,
    idebug => idebug,
    \-idebug\ => \-idebug\,
    \-ldstat\ => \-ldstat\,
    \lpc.hold\ => \lpc.hold\,
    machrun => machrun,
    \-machruna\ => \-machruna\,
    \-nop11\ => \-nop11\,
    opcclk => opcclk,
    \-opcinh\ => \-opcinh\,
    promdisable => promdisable,
    promdisabled => promdisabled,
    srun => srun,
    ssdone => ssdone,
    sspeed0 => sspeed0,
    sspeed1 => sspeed1,
    \-stathalt\ => \-stathalt\,
    trapenb => trapenb,
    \-ape\ => \-ape\,
    \boot.trap\ => \boot.trap\,
    \-clk5\ => \-clk5\,
    clk5a => clk5a,
    \-clock reset b\ => \-clock reset b\,
    \-dpe\ => \-dpe\,
    err => err,
    \-higherr\ => \-higherr\,
    \-ipe\ => \-ipe\,
    \-mempe\ => \-mempe\,
    \-mpe\ => \-mpe\,
    \-pdlpe\ => \-pdlpe\,
    reset => reset,
    \-reset\ => \-reset\,
    \-spe\ => \-spe\,
    \-v0pe\ => \-v0pe\,
    \-v1pe\ => \-v1pe\
  );
  --- spy (spy0,spy1,spy2,spy4)
  i_spy : spy_set port map (
    A => A(30 downto 16),
    AA => AA,
    IR => IR,
    M => M,
    OB => OB,
    OPC => OPC,
    PC => PC,
    \-dbread\ => \-dbread\,
    \-dbwrite\ => \-dbwrite\,
    eadr0 => eadr0,
    eadr1 => eadr1,
    eadr2 => eadr2,
    eadr3 => eadr3,
    a31a => a31a,
    destspcd => destspcd,
    imodd => imodd,
    iwrited => iwrited,
    jcond => jcond,
    nop => nop,
    pcs0 => pcs0,
    pcs1 => pcs1,
    pdlwrited => pdlwrited,
    spushd => spushd,
    \-vmaok\ => \-vmaok\,
    wmapd => wmapd,
    \-ape\ => \-ape\,
    \-dpe\ => \-dpe\,
    err => err,
    \-higherr\ => \-higherr\,
    \-ipe\ => \-ipe\,
    \-mempe\ => \-mempe\,
    \-mpe\ => \-mpe\,
    \-pdlpe\ => \-pdlpe\,
    promdisable => promdisable,
    \-spe\ => \-spe\,
    srun => srun,
    ssdone => ssdone,
    \-stathalt\ => \-stathalt\,
    \-v0pe\ => \-v0pe\,
    \-v1pe\ => \-v1pe\,
    \-wait\ => \-wait\,
    SPY => SPY,
    \-ldclk\ => \-ldclk\,
    \-lddbirh\ => \-lddbirh\,
    \-lddbirl\ => \-lddbirl\,
    \-lddbirm\ => \-lddbirm\,
    \-ldopc\ => \-ldopc\,
    \-spy.sth\ => \-spy.sth\,
    \-spy.stl\ => \-spy.stl\
  );
  --- stat (stat)
  i_stat  : stat_set port map(
    IWR => IWR(31 downto 0),
    clk5a => clk5a,
    \-ldstat\ => \-ldstat\,
    \-spy.sth\ => \-spy.sth\,
    \-spy.stl\ => \-spy.stl\,
    \-statbit\ => \-statbit\,
    SPY => SPY,
    \-stc32\ => \-stc32\
  );
  -- trap (trap)
  i_trap  : trap_set port map(
    \boot.trap\ => \boot.trap\,
    \-md0\ => \-md0\,
    \-md10\ => \-md10\,
    \-md11\ => \-md11\,
    \-md12\ => \-md12\,
    \-md13\ => \-md13\,
    \-md14\ => \-md14\,
    \-md15\ => \-md15\,
    \-md16\ => \-md16\,
    \-md17\ => \-md17\,
    \-md18\ => \-md18\,
    \-md19\ => \-md19\,
    \-md1\ => \-md1\,
    \-md20\ => \-md20\,
    \-md21\ => \-md21\,
    \-md22\ => \-md22\,
    \-md23\ => \-md23\,
    \-md24\ => \-md24\,
    \-md25\ => \-md25\,
    \-md26\ => \-md26\,
    \-md27\ => \-md27\,
    \-md28\ => \-md28\,
    \-md29\ => \-md29\,
    \-md2\ => \-md2\,
    \-md30\ => \-md30\,
    \-md31\ => \-md31\,
    \-md3\ => \-md3\,
    \-md4\ => \-md4\,
    \-md5\ => \-md5\,
    \-md6\ => \-md6\,
    \-md7\ => \-md7\,
    \-md8\ => \-md8\,
    \-md9\ => \-md9\,
    mdhaspar => mdhaspar,
    mdpar => mdpar,
    trapenb => trapenb,
    \use.md\ => \use.md\,
    \-wait\ => \-wait\,
    mdparodd => mdparodd,
    memparok => memparok,
    \-trap\ => \-trap\,
    trapa => trapa,
    trapb => trapb
  );
  -- Old PC (opcs,opcd)
  i_opc   : opc_set port map(
    DC => DC,
    PC => PC,
    \-srcdc\ => \-srcdc\,
    \-srcopc\ => \-srcopc\,
    \-srcpdlidx\ => \-srcpdlidx\,
    \-srcpdlptr\ => \-srcpdlptr\,
    tse1b => tse1b,
    \-clk5\ => \-clk5\,
    opcclk => opcclk,
    \-opcinh\ => \-opcinh\,
    OPC => OPC
  );
  -- Masker/Output Select (mo0,mo1)
  i_mos   : mos_set port map(
    A => A,
    ALU => ALU,
    MSK => MSK,
    R => R,
    osel0b => osel0b,
    osel1b => osel1b,
    a31b => a31b,
    osel0a => osel0a,
    osel1a => osel1a,
    OB => OB
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

