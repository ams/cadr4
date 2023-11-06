library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am252519 is
  port (
    o_enb_n    : in  std_logic;
    inv        : in  std_logic;
    i0         : in  std_logic;
    i1         : in  std_logic;
    i2         : in  std_logic;
    i3         : in  std_logic;
    out_enb_n  : in  std_logic;
    clk        : in  std_logic;
    clk_enb_n  : in  std_logic;
    asyn_clr_n : in  std_logic;
    q0a        : out std_logic;
    q1a        : out std_logic;
    q2a        : out std_logic;
    q3a        : out std_logic;
    q0b        : out std_logic;
    q1b        : out std_logic;
    q2b        : out std_logic;
    q3b        : out std_logic
    );
end am252519;

architecture ttl of am252519 is
begin

end ttl;
