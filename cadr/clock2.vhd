library ieee;
use ieee.std_logic_1164.all;

entity clock2 is
  port (
    clk4             : out std_logic;
    \-clk0\          : out std_logic;
    gnd              : in  std_logic;
    mclk7            : out std_logic;
    \-mclk0\         : out std_logic;
    \-wp1\           : out std_logic;
    tpwp             : out std_logic;
    \-wp2\           : out std_logic;
    \-wp3\           : out std_logic;
    \-wp4\           : out std_logic;
    \-tprend\        : in  std_logic;
