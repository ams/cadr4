library ieee;
use ieee.std_logic_1164.all;
entity cadr_alu0 is
  port (
    \-cin0\  : in  std_logic;
    \-cin4\  : in  std_logic;
    \-cin8\  : in  std_logic;
    \-cin12\ : in  std_logic;
    a0       : in  std_logic;
    a1       : in  std_logic;
    a2       : in  std_logic;
    a3       : in  std_logic;
    a4       : in  std_logic;
    a5       : in  std_logic;
    a6       : in  std_logic;
    a7       : in  std_logic;
    a8       : in  std_logic;
    a9       : in  std_logic;
    a10      : in  std_logic;
    a11      : in  std_logic;
    a12      : in  std_logic;
    a13      : in  std_logic;
    a14      : in  std_logic;
    a15      : in  std_logic;
    \a=m\    : out std_logic;
    alu0     : out std_logic;
    alu1     : out std_logic;
    alu2     : out std_logic;
    alu3     : out std_logic;
    alu4     : out std_logic;
    alu5     : out std_logic;
    alu6     : out std_logic;
    alu7     : out std_logic;
    alu8     : out std_logic;
    alu9     : out std_logic;
    alu10    : out std_logic;
    alu11    : out std_logic;
    alu12    : out std_logic;
    alu13    : out std_logic;
    alu14    : out std_logic;
    alu15    : out std_logic;
    aluf0b   : in  std_logic;
    aluf1b   : in  std_logic;
    aluf2b   : in  std_logic;
    aluf3b   : in  std_logic;
    alumode  : in  std_logic;
    m0       : in  std_logic;
    m1       : in  std_logic;
    m2       : in  std_logic;
    m3       : in  std_logic;
    m4       : in  std_logic;
    m5       : in  std_logic;
    m6       : in  std_logic;
    m7       : in  std_logic;
    m8       : in  std_logic;
    m9       : in  std_logic;
    m10      : in  std_logic;
    m11      : in  std_logic;
    m12      : in  std_logic;
    m13      : in  std_logic;
    m14      : in  std_logic;
    m15      : in  std_logic;
    xout3    : out std_logic;
    xout7    : out std_logic;
    xout11   : out std_logic;
    xout15   : out std_logic;
    yout3    : out std_logic;
    yout7    : out std_logic;
    yout11   : out std_logic;
    yout15   : out std_logic
  );
end;
