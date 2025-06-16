library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity alu is
  port (
    -- Bus signals
    A               : in  std_logic_vector(31 downto 0);
    M               : in  std_logic_vector(31 downto 0);
    IR              : in  std_logic_vector(47 downto 0);
    
    -- Control signals
    aluc0           : in  std_logic;
    aluc1           : in  std_logic;
    aluc2           : in  std_logic;
    aluc3           : in  std_logic;
    q0              : in  std_logic;
    irjump          : in  std_logic;
    irjumpb         : in  std_logic;
    div             : in  std_logic;
    divb            : in  std_logic;
    mul             : in  std_logic;
    mulb            : in  std_logic;
    iralu           : in  std_logic;
    iralab          : in  std_logic;
    
    -- Output bus signals
    ALU             : out std_logic_vector(31 downto 0);
    
    -- Output control signals
    lcry3           : out std_logic;
    lcry11          : out std_logic;
    lcry19          : out std_logic;
    lcry27          : out std_logic;
    aequalmout      : out std_logic;
    a12out          : out std_logic;
    a31out          : out std_logic;
    m31bout         : out std_logic;
    alu32           : out std_logic;
    alumode         : out std_logic;
    alumodeb        : out std_logic;
    alusub          : out std_logic;
    aluadd          : out std_logic;
    ir0out          : out std_logic;
    ir1out          : out std_logic;
    ir2out          : out std_logic;
    ir3out          : out std_logic;
    ir4out          : out std_logic;
    ir0outb         : out std_logic;
    ir1outb         : out std_logic;
    ir2outb         : out std_logic;
    ir3outb         : out std_logic;
    ir4outb         : out std_logic;
    divsubcond      : out std_logic;
    divaddcond      : out std_logic;
    divposlasttime  : out std_logic;
    divposlasttimeb : out std_logic;
    mulnop          : out std_logic;
    mulnopb         : out std_logic;
    osel0a          : out std_logic;
    osel0b          : out std_logic;
    osel1a          : out std_logic;
    osel1b          : out std_logic
  );
end entity;

architecture rtl of alu is

  -- Internal control signals
  signal aluf0a, aluf1a, aluf2a, aluf3a : std_logic;
  signal aluf0b, aluf1b, aluf2b, aluf3b : std_logic;
  signal aluf0ab, aluf1ab, aluf2ab, aluf3ab : std_logic;
  signal cin0b, cin4b, cin8b, cin12b : std_logic;
  signal cin16b, cin20b, cin24b, cin28b, cin32b : std_logic;
  signal alumode_int, alumodeb_int : std_logic;
  signal aequalm0, aequalm1 : std_logic;
  signal a31ab : std_logic;
  
  -- Internal xout/yout signals for ALU slice interconnection
  signal xout3, yout3, xout7, yout7 : std_logic;
  signal xout11, yout11, xout15, yout15 : std_logic;
  signal xout19, yout19, xout23, yout23 : std_logic;
  signal xout27, yout27, xout31, yout31 : std_logic;

begin

  -- Map outputs
  alumode <= alumode_int;
  alumodeb <= alumodeb_int;
  aequalmout <= aequalm0 and aequalm1;

  alu0_inst: cadr_alu0 port map (
    a0              => A(0),
    a1              => A(1),
    a2              => A(2),
    a3              => A(3),
    a4              => A(4),
    a5              => A(5),
    a6              => A(6),
    a7              => A(7),
    a8              => A(8),
    a9              => A(9),
    a10             => A(10),
    a11             => A(11),
    a12             => a12out,
    a13             => A(13),
    a14             => A(14),
    a15             => A(15),
    m0              => M(0),
    m1              => M(1),
    m2              => M(2),
    m3              => M(3),
    m4              => M(4),
    m5              => M(5),
    m6              => M(6),
    m7              => M(7),
    m8              => M(8),
    m9              => M(9),
    m10             => M(10),
    m11             => M(11),
    m12             => M(12),
    m13             => M(13),
    m14             => M(14),
    m15             => M(15),
    aluf0b          => aluf0b,
    aluf1b          => aluf1b,
    aluf2b          => aluf2b,
    aluf3b          => aluf3b,
    \-cin0\         => cin0b,
    \-cin4\         => cin4b,
    \-cin8\         => cin8b,
    \-cin12\        => cin12b,
    alumode         => alumode_int,
    alu0            => ALU(0),
    alu1            => ALU(1),
    alu2            => ALU(2),
    alu3            => ALU(3),
    alu4            => ALU(4),
    alu5            => ALU(5),
    alu6            => ALU(6),
    alu7            => ALU(7),
    alu8            => ALU(8),
    alu9            => ALU(9),
    alu10           => ALU(10),
    alu11           => ALU(11),
    alu12           => ALU(12),
    alu13           => ALU(13),
    alu14           => ALU(14),
    alu15           => ALU(15),
    \a=m\           => aequalm0,
    xout3           => xout3,
    yout3           => lcry3,      -- Carry out from bits 0-3 
    xout7           => xout7,
    yout7           => yout7,
    xout11          => xout11,
    yout11          => lcry11,     -- Carry out from bits 8-11
    xout15          => xout15,
    yout15          => yout15
  );

  alu1_inst: cadr_alu1 port map (
    a16             => A(16),
    a17             => A(17),
    a18             => A(18),
    a19             => A(19),
    a20             => A(20),
    a21             => A(21),
    a22             => A(22),
    a23             => A(23),
    a24             => A(24),
    a25             => A(25),
    a26             => A(26),
    a27             => A(27),
    a28             => A(28),
    a29             => A(29),
    a30             => A(30),
    a31a            => a31ab,
    a31b            => A(31),
    m16             => M(16),
    m17             => M(17),
    m18             => M(18),
    m19             => M(19),
    m20             => M(20),
    m21             => M(21),
    m22             => M(22),
    m23             => M(23),
    m24             => M(24),
    m25             => M(25),
    m26             => M(26),
    m27             => M(27),
    m28             => M(28),
    m29             => M(29),
    m30             => M(30),
    m31             => M(31),
    aluf0a          => aluf0a,
    aluf1a          => aluf1a,
    aluf2a          => aluf2a,
    aluf3a          => aluf3a,
    \-cin16\        => cin16b,
    \-cin20\        => cin20b,
    \-cin24\        => cin24b,
    \-cin28\        => cin28b,
    \-cin32\        => cin32b,
    alumode         => alumode_int,
    alu16           => ALU(16),
    alu17           => ALU(17),
    alu18           => ALU(18),
    alu19           => ALU(19),
    alu20           => ALU(20),
    alu21           => ALU(21),
    alu22           => ALU(22),
    alu23           => ALU(23),
    alu24           => ALU(24),
    alu25           => ALU(25),
    alu26           => ALU(26),
    alu27           => ALU(27),
    alu28           => ALU(28),
    alu29           => ALU(29),
    alu30           => ALU(30),
    alu31           => ALU(31),
    alu32           => alu32,
    m31b            => m31bout,
    \a=m\           => aequalm1,
    xout19          => xout19,
    yout19          => lcry19,     -- Carry out from bits 16-19
    xout23          => xout23,
    yout23          => yout23,
    xout27          => xout27,
    yout27          => lcry27,     -- Carry out from bits 24-27
    xout31          => xout31,
    yout31          => yout31
  );

  aluc4_inst: cadr_aluc4 port map (
    ir0             => IR(0),
    ir1             => IR(1),
    ir2             => IR(2),
    ir3             => IR(3),
    ir4             => IR(4),
    ir5             => IR(5),
    ir6             => IR(6),
    ir7             => IR(7),
    \-ir12\         => IR(12),
    \-ir13\         => IR(13),
    irjump          => irjump,
    \-irjump\       => irjumpb,
    \-div\          => divb,
    \-mul\          => mulb,
    \-iralu\        => iralab,
    q0              => q0,
    a31a            => a31ab,
    a31b            => A(31),
    xout3           => xout3,
    yout3           => lcry3,
    xout7           => xout7,
    yout7           => yout7,
    xout11          => xout11,
    yout11          => lcry11,
    xout19          => xout19,
    yout19          => lcry19,
    xout23          => xout23,
    yout23          => yout23,
    xout27          => xout27,
    yout27          => lcry27,
    \-aluf0\        => aluf0ab,
    aluf0a          => aluf0a,
    aluf0b          => aluf0b,
    \-aluf1\        => aluf1ab,
    aluf1a          => aluf1a,
    aluf1b          => aluf1b,
    \-aluf2\        => aluf2ab,
    aluf2a          => aluf2a,
    aluf2b          => aluf2b,
    \-aluf3\        => aluf3ab,
    aluf3a          => aluf3a,
    aluf3b          => aluf3b,
    \-alumode\      => alumodeb_int,
    alumode         => alumode_int,
    \-cin0\         => cin0b,
    \-cin4\         => cin4b,
    \-cin8\         => cin8b,
    \-cin12\        => cin12b,
    \-cin16\        => cin16b,
    \-cin20\        => cin20b,
    \-cin24\        => cin24b,
    \-cin28\        => cin28b,
    \-cin32\        => cin32b,
    xout15          => xout15,
    yout15          => yout15,
    xout31          => xout31,
    yout31          => yout31,
    \-a31\          => a31out,
    alusub          => alusub,
    aluadd          => aluadd,
    \-ir0\          => ir0outb,
    \-ir1\          => ir1outb,
    \-ir2\          => ir2outb,
    \-ir3\          => ir3outb,
    \-ir4\          => ir4outb,
    divsubcond      => divsubcond,
    divaddcond      => divaddcond,
    \-divposlasttime\ => divposlasttimeb,
    \-mulnop\       => mulnopb,
    osel0a          => osel0a,
    osel0b          => osel0b,
    osel1a          => osel1a,
    osel1b          => osel1b,
    xx0             => open,
    xx1             => open,
    yy0             => open,
    yy1             => open
  );

  -- Generate non-inverted outputs from inverted ones
  ir0out <= not ir0outb;
  ir1out <= not ir1outb;
  ir2out <= not ir2outb;
  ir3out <= not ir3outb;
  ir4out <= not ir4outb;
  divposlasttime <= not divposlasttimeb;
  mulnop <= not mulnopb;

end architecture; 