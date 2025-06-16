library ieee;
use ieee.std_logic_1164.all;
use work.cadr.all;

entity ampar is
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
    aparm     : out std_logic;
    aparok    : out std_logic;
    mmemparok : out std_logic;
    mpareven  : out std_logic;
    mparl     : out std_logic;
    mparm     : out std_logic;
    mparodd   : out std_logic;
    pdlparok  : out std_logic
  );
end entity;

architecture structure of ampar is
begin

  u_cadr_apar : cadr_apar
    port map (
      -- A bus connections (0-31)
      a0        => A(0),
      a1        => A(1),
      a2        => A(2),
      a3        => A(3),
      a4        => A(4),
      a5        => A(5),
      a6        => A(6),
      a7        => A(7),
      a8        => A(8),
      a9        => A(9),
      a10       => A(10),
      a11       => A(11),
      a12       => A(12),
      a13       => A(13),
      a14       => A(14),
      a15       => A(15),
      a16       => A(16),
      a17       => A(17),
      a18       => A(18),
      a19       => A(19),
      a20       => A(20),
      a21       => A(21),
      a22       => A(22),
      a23       => A(23),
      a24       => A(24),
      a25       => A(25),
      a26       => A(26),
      a27       => A(27),
      a28       => A(28),
      a29       => A(29),
      a30       => A(30),
      a31b      => a31b,
      
      -- M bus connections (0-31)
      m0        => M(0),
      m1        => M(1),
      m2        => M(2),
      m3        => M(3),
      m4        => M(4),
      m5        => M(5),
      m6        => M(6),
      m7        => M(7),
      m8        => M(8),
      m9        => M(9),
      m10       => M(10),
      m11       => M(11),
      m12       => M(12),
      m13       => M(13),
      m14       => M(14),
      m15       => M(15),
      m16       => M(16),
      m17       => M(17),
      m18       => M(18),
      m19       => M(19),
      m20       => M(20),
      m21       => M(21),
      m22       => M(22),
      m23       => M(23),
      m24       => M(24),
      m25       => M(25),
      m26       => M(26),
      m27       => M(27),
      m28       => M(28),
      m29       => M(29),
      m30       => M(30),
      m31       => M(31),
      
      -- Additional inputs
      aparity   => aparity,
      mparity   => mparity,
      srcm      => srcm,
      pdlenb    => pdlenb,
      
      -- Outputs
      aparl     => aparl,
      aparm     => aparm,
      aparok    => aparok,
      mmemparok => mmemparok,
      mpareven  => mpareven,
      mparl     => mparl,
      mparm     => mparm,
      mparodd   => mparodd,
      pdlparok  => pdlparok
    );

end structure; 