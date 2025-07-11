library ieee;
use ieee.std_logic_1164.all;

entity cadr_mmem is
  port (
    \-mwpa\    : in  std_logic;
    l16        : in  std_logic;
    \-madr4a\  : in  std_logic;
    hi3        : in  std_logic;
    mmem16     : out std_logic;
    mmem17     : out std_logic;
    \-madr3a\  : in  std_logic;
    \-madr2a\  : in  std_logic;
    \-madr1a\  : in  std_logic;
    \-madr0a\  : in  std_logic;
    l17        : in  std_logic;
    \-mwpb\    : in  std_logic;
    l12        : in  std_logic;
    \-madr4b\  : in  std_logic;
    hi2        : in  std_logic;
    mmem12     : out std_logic;
    mmem13     : out std_logic;
    \-madr3b\  : in  std_logic;
    \-madr2b\  : in  std_logic;
    \-madr1b\  : in  std_logic;
    \-madr0b\  : in  std_logic;
    l13        : in  std_logic;
    l8         : in  std_logic;
    mmem8      : out std_logic;
    mmem9      : out std_logic;
    l9         : in  std_logic;
    l4         : in  std_logic;
    mmem4      : out std_logic;
    mmem5      : out std_logic;
    l5         : in  std_logic;
    l0         : in  std_logic;
    mmem0      : out std_logic;
    mmem1      : out std_logic;
    l1         : in  std_logic;
    l18        : in  std_logic;
    mmem18     : out std_logic;
    mmem19     : out std_logic;
    l19        : in  std_logic;
    l14        : in  std_logic;
    mmem14     : out std_logic;
    mmem15     : out std_logic;
    l15        : in  std_logic;
    l10        : in  std_logic;
    mmem10     : out std_logic;
    mmem11     : out std_logic;
    l11        : in  std_logic;
    l6         : in  std_logic;
    mmem6      : out std_logic;
    mmem7      : out std_logic;
    l7         : in  std_logic;
    l2         : in  std_logic;
    mmem2      : out std_logic;
    mmem3      : out std_logic;
    l3         : in  std_logic;
    l28        : in  std_logic;
    mmem28     : out std_logic;
    mmem29     : out std_logic;
    l29        : in  std_logic;
    l24        : in  std_logic;
    mmem24     : out std_logic;
    mmem25     : out std_logic;
    l25        : in  std_logic;
    l20        : in  std_logic;
    mmem20     : out std_logic;
    mmem21     : out std_logic;
    l21        : in  std_logic;
    lparity    : in  std_logic;
    mmemparity : out std_logic;
    l30        : in  std_logic;
    mmem30     : out std_logic;
    mmem31     : out std_logic;
    l31        : in  std_logic;
    l26        : in  std_logic;
    mmem26     : out std_logic;
    mmem27     : out std_logic;
    l27        : in  std_logic;
    l22        : in  std_logic;
    mmem22     : out std_logic;
    mmem23     : out std_logic;
    l23        : in  std_logic
    );
end;
