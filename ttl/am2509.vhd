-- Quad Two-Input, High-Speed Register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am2509 is
  port (
    clk    : in  std_logic;
    sel    : in  std_logic;
    a0, a1 : in  std_logic;
    aq     : out std_logic;
    b0, b1 : in  std_logic;
    bq     : out std_logic;
    c0, c1 : in  std_logic;
    cq     : out std_logic;
    d0, d1 : in  std_logic;
    dq     : out std_logic
    );
end am2509;

architecture ttl of am2509 is
begin

end ttl;
