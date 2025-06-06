library ieee;
use ieee.std_logic_1164.all;

entity clock1 is
  port (
    \-clock_reset_b\ : in  std_logic;
    \-tpdone\        : in  std_logic;
    \-hang\          : in  std_logic;
    cyclecompleted   : out std_logic;
    \-tpr0\          : out std_logic;
    \-tpr40\         : out std_logic;
    gnd              : in  std_logic;
    \-tprend\        : out std_logic;
