library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr4;
use cadr4.utilities.all;

entity cadr4_pdl1 is
  port (
    gnd       : out std_logic;
    \-pdla0a\ : in  std_logic;
    \-pdla1a\ : in  std_logic;
    \-pdla2a\ : in  std_logic;
    \-pdla3a\ : in  std_logic;
    \-pdla4a\ : in  std_logic;
    pdl13     : out std_logic;
    \-pdla5a\ : in  std_logic;
    \-pdla6a\ : in  std_logic;
    \-pdla7a\ : in  std_logic;
    \-pdla8a\ : in  std_logic;
    \-pdla9a\ : in  std_logic;
    \-pwpb\   : in  std_logic;
    l13       : in  std_logic;
    pdl12     : out std_logic;
    l12       : in  std_logic;
    pdl11     : out std_logic;
    l11       : in  std_logic;
    pdl10     : out std_logic;
    \-pwpc\   : in  std_logic;
    l10       : in  std_logic;
    pdl4      : out std_logic;
    l4        : in  std_logic;
    pdl3      : out std_logic;
    l3        : in  std_logic;
    pdl2      : out std_logic;
    l2        : in  std_logic;
    pdl1      : out std_logic;
    l1        : in  std_logic;
    pdl0      : out std_logic;
    l0        : in  std_logic;
    pdl15     : out std_logic;
    l15       : in  std_logic;
    pdl14     : out std_logic;
    l14       : in  std_logic;
    pdl9      : out std_logic;
    l9        : in  std_logic;
    pdl8      : out std_logic;
    l8        : in  std_logic;
    pdl7      : out std_logic;
    l7        : in  std_logic;
    pdl6      : out std_logic;
    l6        : in  std_logic;
    pdl5      : out std_logic;
    l5        : in  std_logic);
end;

architecture ttl of cadr4_pdl1 is
begin
  pdl1_4c21 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl13, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\, di => l13);
  pdl1_4c23 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl12, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\, di => l12);
  pdl1_4c24 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl11, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\, di => l11);
  pdl1_4c25 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl10, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l10);
  pdl1_4c26 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl4, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l4);
  pdl1_4c27 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl3, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l3);
  pdl1_4c28 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl2, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l2);
  pdl1_4c29 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl1, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l1);
  pdl1_4c30 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl0, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l0);
  pdl1_4d23 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl15, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\, di => l15);
  pdl1_4d25 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl14, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpb\, di => l14);
  pdl1_4d26 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl9, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l9);
  pdl1_4d27 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl8, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l8);
  pdl1_4d28 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl7, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l7);
  pdl1_4d29 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl6, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l6);
  pdl1_4d30 : am93425a port map(ce_n => gnd, a0 => \-pdla0a\, a1 => \-pdla1a\, a2 => \-pdla2a\, a3 => \-pdla3a\, a4 => \-pdla4a\, do => pdl5, a5 => \-pdla5a\, a6 => \-pdla6a\, a7 => \-pdla7a\, a8 => \-pdla8a\, a9 => \-pdla9a\, we_n => \-pwpc\, di => l5);
end architecture;
