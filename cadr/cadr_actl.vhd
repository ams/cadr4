library ieee;
use ieee.std_logic_1164.all;

entity cadr_actl is
  port (
    -- Clock and Control signals
    clk3e       : in  std_logic;
    clk3d       : in  std_logic;
    gnd         : in  std_logic;
    hi3         : in  std_logic;
    \-reset\    : in  std_logic;
    
    -- Test signals
    tse3a       : in  std_logic;
    tse4a       : in  std_logic;
    
    -- Instruction Register signals (IR14-IR23)
    ir14        : in  std_logic;
    ir15        : in  std_logic;
    ir16        : in  std_logic;
    ir17        : in  std_logic;
    ir18        : in  std_logic;
    ir19        : in  std_logic;
    ir20        : in  std_logic;
    ir21        : in  std_logic;
    ir22        : in  std_logic;
    ir23        : in  std_logic;
    
    -- Instruction Register signals (IR32-IR41)
    ir32        : in  std_logic;
    ir33        : in  std_logic;
    ir34        : in  std_logic;
    ir35        : in  std_logic;
    ir36        : in  std_logic;
    ir37        : in  std_logic;
    ir38        : in  std_logic;
    ir39        : in  std_logic;
    ir40        : in  std_logic;
    ir41        : in  std_logic;
    
    -- Write Address signals
    wadr0       : out std_logic;
    wadr1       : out std_logic;
    wadr2       : out std_logic;
    wadr3       : out std_logic;
    wadr4       : out std_logic;
    wadr5       : out std_logic;
    wadr6       : out std_logic;
    wadr7       : out std_logic;
    wadr8       : out std_logic;
    wadr9       : out std_logic;
    
    -- A Address signals (A outputs)
    \-aadr0a\   : out std_logic;
    \-aadr1a\   : out std_logic;
    \-aadr2a\   : out std_logic;
    \-aadr3a\   : out std_logic;
    \-aadr4a\   : out std_logic;
    \-aadr5a\   : out std_logic;
    \-aadr6a\   : out std_logic;
    \-aadr7a\   : out std_logic;
    \-aadr8a\   : out std_logic;
    \-aadr9a\   : out std_logic;
    
    -- A Address signals (B outputs)
    \-aadr0b\   : out std_logic;
    \-aadr1b\   : out std_logic;
    \-aadr2b\   : out std_logic;
    \-aadr3b\   : out std_logic;
    \-aadr4b\   : out std_logic;
    \-aadr5b\   : out std_logic;
    \-aadr6b\   : out std_logic;
    \-aadr7b\   : out std_logic;
    \-aadr8b\   : out std_logic;
    \-aadr9b\   : out std_logic;
    
    -- Pass signals
    apass1      : out std_logic;
    apass2      : out std_logic;
    \-apass\    : out std_logic;
    apassenb    : out std_logic;
    \-apassenb\ : out std_logic;
    
    -- Memory and Destination signals
    \-amemenb\  : out std_logic;
    destm       : in  std_logic;
    dest        : in  std_logic;
    destmd      : out std_logic;
    destd       : out std_logic;
    
    -- Write Protect signals
    wp3a        : in  std_logic;
    \-awpa\     : out std_logic;
    \-awpb\     : out std_logic;
    \-awpc\     : out std_logic
    );
end;
