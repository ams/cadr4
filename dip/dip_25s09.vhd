library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity dip_25s09 is
  port(
    p1  : in    std_logic;
    p2  : out   std_logic;
    p3  : in    std_logic;
    p4  : in    std_logic;
    p5  : in    std_logic;
    p6  : in    std_logic;
    p7  : out   std_logic;
    p9  : in    std_logic;
    p10 : out   std_logic;
    p11 : in    std_logic;
    p12 : in    std_logic;
    p13 : in    std_logic;
    p14 : in    std_logic;
    p15 : out   std_logic
    );
end dip_25s09;

architecture behavioral of dip_25s09 is

  component am2509 is
    port(
      clk : in  std_logic;
      sel : in  std_logic;
      a0  : in  std_logic;
      a1  : in  std_logic;
      aq  : out std_logic;
      b0  : in  std_logic;
      b1  : in  std_logic;
      bq  : out std_logic;
      c0  : in  std_logic;
      c1  : in  std_logic;
      cq  : out std_logic;
      d0  : in  std_logic;
      d1  : in  std_logic;
      dq  : out std_logic
      );
  end component;

begin

  u_am2509 : am2509
    port map(
      sel => p1,
      aq  => p2,
      a0  => p3,
      a1  => p4,
      b1  => p5,
      b0  => p6,
      bq  => p7,
      clk => p9,
      cq  => p10,
      c0  => p11,
      c1  => p12,
      d1  => p13,
      d0  => p14,
      dq  => p15
      );

end behavioral; 