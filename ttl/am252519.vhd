-- Quad Register With Two Independantly Controlled Three-State Outputs

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am252519 is
  port (
    clk                : in  std_logic;
    o_enb_n            : in  std_logic;
    inv                : in  std_logic;
    i0, i1, i2, i3     : in  std_logic;
    out_enb_n          : in  std_logic;
    clk_enb_n          : in  std_logic;
    asyn_clr_n         : in  std_logic;
    q0a, q1a, q2a, q3a : out std_logic;
    q0b, q1b, q2b, q3b : out std_logic
    );
end am252519;

architecture ttl of am252519 is
begin

end ttl;
