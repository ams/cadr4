library ieee;
use ieee.std_logic_1164.all;

entity cadr_smctl is
  port (
    \-ir0\          : in     std_logic;
    \-ir1\          : in     std_logic;
    \-ir2\          : in     std_logic;
    \-irbyte\       : in     std_logic;
    \-sh3\          : in     std_logic;
    \-sh4\          : in     std_logic;
    ir12            : in     std_logic;
    ir13            : in     std_logic;
    ir5             : in     std_logic;
    ir6             : in     std_logic;
    ir7             : in     std_logic;
    ir8             : in     std_logic;
    ir9             : in     std_logic;
    \-mr\           : out    std_logic;
    \-s4\           : out    std_logic;
    \-sr\           : out    std_logic;
    mskl0           : out    std_logic;
    mskl1           : out    std_logic;
    mskl2           : out    std_logic;
    mskl3           : out    std_logic;
    mskl3cry        : out    std_logic;
    mskl4           : out    std_logic;
    mskr0           : out    std_logic;
    mskr1           : out    std_logic;
    mskr2           : out    std_logic;
    mskr3           : out    std_logic;
    mskr4           : out    std_logic;
    s0              : out    std_logic;
    s1              : out    std_logic;
    s2a             : out    std_logic;
    s2b             : out    std_logic;
    s3a             : out    std_logic;
    s3b             : out    std_logic;
    s4              : out    std_logic
  );
end entity cadr_smctl;
