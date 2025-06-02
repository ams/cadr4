library ieee;
use ieee.std_logic_1164.all;

library ttl;
use ttl.sn74.all;
use ttl.other.all;

library cadr;
use cadr.utilities.all;

entity cadr_amem0 is
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

architecture ttl of cadr_amem0 is
begin
  amem0_3a07 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem22,     -- p7 (AMEM22)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l22         -- p15 (L22)
  );
  amem0_3a08 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem20,     -- p7 (AMEM20)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l20         -- p15 (L20)
  );
  amem0_3a09 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem18,     -- p7 (AMEM18)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l18         -- p15 (L18)
  );
  amem0_3a10 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem16,     -- p7 (AMEM16)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l16         -- p15 (L16)
  );
  amem0_3a11 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem23,     -- p7 (AMEM23)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l23         -- p15 (L23)
  );
  amem0_3a13 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem21,     -- p7 (AMEM21)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l21         -- p15 (L21)
  );
  amem0_3a14 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem19,     -- p7 (AMEM19)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l19         -- p15 (L19)
  );
  amem0_3a15 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem17,     -- p7 (AMEM17)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l17         -- p15 (L17)
  );
  amem0_3b06 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amemparity, -- p7 (AMEMPARITY)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => lparity     -- p15 (LPARITY)
  );
  amem0_3b07 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem30,     -- p7 (AMEM30)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l30         -- p15 (L30)
  );
  amem0_3b08 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem28,     -- p7 (AMEM28)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l28         -- p15 (L28)
  );
  amem0_3b09 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem26,     -- p7 (AMEM26)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l26         -- p15 (L26)
  );
  amem0_3b10 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem24,     -- p7 (AMEM24)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l24         -- p15 (L24)
  );
  amem0_3b11 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3b)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem31,     -- p7 (AMEM31)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l31         -- p15 (L31)
  );
  amem0_3b12 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem29,     -- p7 (AMEM29)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l29         -- p15 (L29)
  );
  amem0_3b13 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem27,     -- p7 (AMEM27)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l27         -- p15 (L27)
  );
  amem0_3b14 : am93425a port map(
    ce_n => gnd,        -- p1 (GND) - VHDL port ce_n connected to GND
    a0   => \-aadr0b\,  -- p2 (-AADR0B)
    a1   => \-aadr1b\,  -- p3 (-AADR1B)
    a2   => \-aadr2b\,  -- p4 (-AADR2B)
    a3   => \-aadr3b\,  -- p5 (-AADR3B)
    a4   => \-aadr4b\,  -- p6 (-AADR4B)
    do   => amem25,     -- p7 (AMEM25)
    a5   => \-aadr5b\,  -- p9 (-AADR5B)
    a6   => \-aadr6b\,  -- p10 (-AADR6B)
    a7   => \-aadr7b\,  -- p11 (-AADR7B)
    a8   => \-aadr8b\,  -- p12 (-AADR8B)
    a9   => \-aadr9b\,  -- p13 (-AADR9B)
    we_n => \-awpa\,    -- p14 (-AWPA)
    di   => l25         -- p15 (L25)
  );
end architecture;
