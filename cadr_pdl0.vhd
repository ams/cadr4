library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_pdl0 is
  port (
    gnd       : in  std_logic;
    \-pdla0b\ : in  std_logic;
    \-pdla1b\ : in  std_logic;
    \-pdla2b\ : in  std_logic;
    \-pdla3b\ : in  std_logic;
    \-pdla4b\ : in  std_logic;
    pdlparity : out std_logic;
    \-pdla5b\ : in  std_logic;
    \-pdla6b\ : in  std_logic;
    \-pdla7b\ : in  std_logic;
    \-pdla8b\ : in  std_logic;
    \-pdla9b\ : in  std_logic;
    \-pwpa\   : in  std_logic;
    lparity   : in  std_logic;
    pdl28     : out std_logic;
    l28       : in  std_logic;
    pdl27     : out std_logic;
    l27       : in  std_logic;
    pdl26     : out std_logic;
    l26       : in  std_logic;
    pdl21     : out std_logic;
    \-pwpb\   : in  std_logic;
    l21       : in  std_logic;
    pdl20     : out std_logic;
    l20       : in  std_logic;
    pdl19     : out std_logic;
    l19       : in  std_logic;
    pdl18     : out std_logic;
    l18       : in  std_logic;
    pdl31     : out std_logic;
    l31       : in  std_logic;
    pdl30     : out std_logic;
    l30       : in  std_logic;
    pdl29     : out std_logic;
    l29       : in  std_logic;
    pdl25     : out std_logic;
    l25       : in  std_logic;
    pdl24     : out std_logic;
    l24       : in  std_logic;
    pdl23     : out std_logic;
    l23       : in  std_logic;
    pdl22     : out std_logic;
    l22       : in  std_logic;
    pdl17     : out std_logic;
    l17       : in  std_logic;
    pdl16     : out std_logic;
    l16       : in  std_logic);
end;

architecture ttl of cadr_pdl0 is
begin
  pdl0_4c10 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdlparity, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => lparity);
  pdl0_4c13 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl28, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l28);
  pdl0_4c14 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl27, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l27);
  pdl0_4c15 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl26, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l26);
  pdl0_4c17 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl21, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l21);
  pdl0_4c18 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl20, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l20);
  pdl0_4c19 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl19, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l19);
  pdl0_4c20 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl18, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l18);
  pdl0_4d11 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl31, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l31);
  pdl0_4d12 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl30, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l30);
  pdl0_4d13 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl29, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l29);
  pdl0_4d16 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl25, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l25);
  pdl0_4d17 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl24, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l24);
  pdl0_4d18 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl23, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l23);
  pdl0_4d19 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl22, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpa\, di => l22);
  pdl0_4d21 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl17, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l17);
  pdl0_4d22 : am93425a port map(ce_n => gnd, a0 => \-pdla0b\, a1 => \-pdla1b\, a2 => \-pdla2b\, a3 => \-pdla3b\, a4 => \-pdla4b\, do => pdl16, a5 => \-pdla5b\, a6 => \-pdla6b\, a7 => \-pdla7b\, a8 => \-pdla8b\, a9 => \-pdla9b\, we_n => \-pwpb\, di => l16);
end architecture;
