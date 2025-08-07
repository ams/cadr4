library ieee;
use ieee.std_logic_1164.all;

use work.sn74.sn74163;

entity dip_74ls163 is 
  port (
    p15 : out std_logic;   -- TC

    p6 : in std_logic;    -- I3
    p5 : in std_logic;    -- I2
    p4 : in std_logic;    -- I1
    p3 : in std_logic;    -- I0

    p11 : out std_logic;   -- D3
    p12 : out std_logic;   -- D2
    p13 : out std_logic;   -- D1
    p14 : out std_logic;   -- D0

    p10 : in std_logic;   -- ENB T
    p7 : in std_logic;    -- ENB P

    p9 : in std_logic;    -- PE_n
    p1 : in std_logic;    -- -SYNC CLR
    p2 : in std_logic     -- CLK
  );
end entity;

architecture dip of dip_74ls163 is
begin
  
  u1 : sn74163 port map(
    -- Control and status
    tc    => p15,    -- Pin 15: Terminal count
    clk   => p2,     -- Pin 2: Clock
    clr_n => p1,     -- Pin 1: Synchronous clear (active low)
    pe_n  => p9,     -- Pin 9: Parallel enable (active low)
    enb_p => p7,     -- Pin 7: Count enable parallel
    enb_t => p10,    -- Pin 10: Count enable trickle
    
    -- Data inputs (parallel load)
    i3 => p6,        -- Pin 6: Input 3
    i2 => p5,        -- Pin 5: Input 2
    i1 => p4,        -- Pin 4: Input 1
    i0 => p3,        -- Pin 3: Input 0
    
    -- Data outputs
    d3 => p11,       -- Pin 11: Output 3
    d2 => p12,       -- Pin 12: Output 2
    d1 => p13,       -- Pin 13: Output 1
    d0 => p14        -- Pin 14: Output 0
    );

end architecture;