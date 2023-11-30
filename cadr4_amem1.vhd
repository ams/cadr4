library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_amem1 is
  port (
    gnd       : out std_logic;
    \-aadr0a\ : in  std_logic;
    \-aadr1a\ : in  std_logic;
    \-aadr2a\ : in  std_logic;
    \-aadr3a\ : in  std_logic;
    \-aadr4a\ : in  std_logic;
    amem6     : out std_logic;
    \-aadr5a\ : in  std_logic;
    \-aadr6a\ : in  std_logic;
    \-aadr7a\ : in  std_logic;
    \-aadr8a\ : in  std_logic;
    \-aadr9a\ : in  std_logic;
    \-awpc\   : in  std_logic;
    l6        : in  std_logic;
    amem4     : out std_logic;
    l4        : in  std_logic;
    amem2     : out std_logic;
    l2        : in  std_logic;
    amem0     : out std_logic;
    l0        : in  std_logic;
    amem7     : out std_logic;
    l7        : in  std_logic;
    amem5     : out std_logic;
    l5        : in  std_logic;
    amem3     : out std_logic;
    l3        : in  std_logic;
    amem1     : out std_logic;
    l1        : in  std_logic;
    amem14    : out std_logic;
    \-awpb\   : in  std_logic;
    l14       : in  std_logic;
    amem12    : out std_logic;
    l12       : in  std_logic;
    amem10    : out std_logic;
    l10       : in  std_logic;
    amem8     : out std_logic;
    l8        : in  std_logic;
    amem15    : out std_logic;
    l15       : in  std_logic;
    amem13    : out std_logic;
    l13       : in  std_logic;
    amem11    : out std_logic;
    l11       : in  std_logic;
    amem9     : out std_logic;
    l9        : in  std_logic);
end;

architecture ttl of cadr4_amem1 is
begin
  amem1_3a17 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem6, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l6);
  amem1_3a18 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem4, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l4);
  amem1_3a19 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem2, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l2);
  amem1_3a20 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem0, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l0);
  amem1_3a22 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem7, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l7);
  amem1_3a23 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem5, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l5);
  amem1_3a24 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem3, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l3);
  amem1_3a25 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem1, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l1);
  amem1_3b17 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem14, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\, di => l14);
  amem1_3b18 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem12, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\, di => l12);
  amem1_3b19 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem10, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l10);
  amem1_3b20 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem8, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l8);
  amem1_3b22 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem15, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\, di => l15);
  amem1_3b23 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem13, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\, di => l13);
  amem1_3b24 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem11, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpb\, di => l11);
  amem1_3b25 : am93425a port map(ce_n => gnd, a0 => \-aadr0a\, a1 => \-aadr1a\, a2 => \-aadr2a\, a3 => \-aadr3a\, a4 => \-aadr4a\, do => amem9, a5 => \-aadr5a\, a6 => \-aadr6a\, a7 => \-aadr7a\, a8 => \-aadr8a\, a9 => \-aadr9a\, we_n => \-awpc\, di => l9);
end architecture;
