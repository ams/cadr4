-- CADR1_CLM
-- Generated entity from suds architecture

library ieee;
use ieee.std_logic_1164.all;

entity cadr1_clm is
  port (
    \-clk\ : out std_logic;
    \-mclk7\ : inout std_logic;
    \-memrq\ : inout std_logic;
    \-xbus power reset\ : inout std_logic;
    \hi 15-30\ : in std_logic;
    clk0 : inout std_logic;
    wrcyc : inout std_logic
  );
end entity;
