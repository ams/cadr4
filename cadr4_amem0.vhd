library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_amem0 is
  port (
    gnd        : in  std_logic;
    \-aadr0b\  : in  std_logic;
    \-aadr1b\  : in  std_logic;
    \-aadr2b\  : in  std_logic;
    \-aadr3b\  : in  std_logic;
    \-aadr4b\  : in  std_logic;
    amem22     : out std_logic;
    \-aadr5b\  : in  std_logic;
    \-aadr6b\  : in  std_logic;
    \-aadr7b\  : in  std_logic;
    \-aadr8b\  : in  std_logic;
    \-aadr9b\  : in  std_logic;
    \-awpa\    : in  std_logic;
    l22        : in  std_logic;
    amem20     : out std_logic;
    l20        : in  std_logic;
    amem18     : out std_logic;
    l18        : in  std_logic;
    amem16     : out std_logic;
    l16        : in  std_logic;
    amem23     : out std_logic;
    l23        : in  std_logic;
    amem21     : out std_logic;
    l21        : in  std_logic;
    amem19     : out std_logic;
    l19        : in  std_logic;
    amem17     : out std_logic;
    l17        : in  std_logic;
    amemparity : out std_logic;
    lparity    : in  std_logic;
    amem30     : out std_logic;
    l30        : in  std_logic;
    amem28     : out std_logic;
    l28        : in  std_logic;
    amem26     : out std_logic;
    l26        : in  std_logic;
    amem24     : out std_logic;
    l24        : in  std_logic;
    amem31     : out std_logic;
    l31        : in  std_logic;
    amem29     : out std_logic;
    l29        : in  std_logic;
    amem27     : out std_logic;
    l27        : in  std_logic;
    amem25     : out std_logic;
    l25        : in  std_logic);
end;

architecture ttl of cadr4_amem0 is
begin
  amem0_3a07 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem22, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l22);
  amem0_3a08 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem20, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l20);
  amem0_3a09 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem18, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l18);
  amem0_3a10 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem16, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l16);
  amem0_3a11 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem23, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l23);
  amem0_3a13 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem21, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l21);
  amem0_3a14 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem19, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l19);
  amem0_3a15 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem17, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l17);
  amem0_3b06 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amemparity, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => lparity);
  amem0_3b07 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem30, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l30);
  amem0_3b08 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem28, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l28);
  amem0_3b09 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem26, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l26);
  amem0_3b10 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem24, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l24);
  amem0_3b11 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem31, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l31);
  amem0_3b12 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem29, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l29);
  amem0_3b13 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem27, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l27);
  amem0_3b14 : am93425a port map(ce_n => gnd, a0 => \-aadr0b\, a1 => \-aadr1b\, a2 => \-aadr2b\, a3 => \-aadr3b\, a4 => \-aadr4b\, do => amem25, a5 => \-aadr5b\, a6 => \-aadr6b\, a7 => \-aadr7b\, a8 => \-aadr8b\, a9 => \-aadr9b\, we_n => \-awpa\, di => l25);
end architecture;
