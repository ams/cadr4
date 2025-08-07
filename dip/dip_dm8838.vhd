library ieee;
use ieee.std_logic_1164.all;

entity dip_dm8838 is 
  port (
    p5 : in std_logic; -- in 4
    p2 : in std_logic; -- in 3
    p11 : in std_logic; -- in 2
    p14 : in std_logic; -- in 1

    p6 : out std_logic; -- out 4
    p3 : out std_logic; -- out 3
    p10 : out std_logic; -- out 2
    p13 : out std_logic; -- out 1

    p4 : inout std_logic; -- bus 4
    p1 : inout std_logic; -- bus 3
    p12 : inout std_logic; -- bus 2
    p15 : inout std_logic; -- bus 1

    p9 : in std_logic; -- disable_a / -ena
    p7 : in std_logic -- disable_b / -enb
  );
end entity;

architecture dip of dip_dm8838 is
  component dm8838 is port (
    in1 : in    std_logic;
    in2 : in    std_logic;
    in3 : in    std_logic;
    in4 : in    std_logic;
    out1 : out  std_logic;
    out2 : out  std_logic;
    out3 : out  std_logic;
    out4 : out  std_logic;
    bus1 : inout std_logic;
    bus2 : inout std_logic;
    bus3 : inout std_logic;
    bus4 : inout std_logic;
    disable_a : in std_logic;
    disable_b : in std_logic
    );
  end component;
begin
  u0: dm8838 port map (
    in1 => p14,        -- in 1
    in2 => p11,        -- in 2  
    in3 => p2,         -- in 3
    in4 => p5,         -- in 4
    out1 => p13,       -- out 1
    out2 => p10,       -- out 2
    out3 => p3,        -- out 3
    out4 => p6,        -- out 4
    bus1 => p15,       -- bus 1
    bus2 => p12,       -- bus 2
    bus3 => p1,        -- bus 3
    bus4 => p4,        -- bus 4
    disable_a => p9,   -- disable_a / -ena
    disable_b => p7    -- disable_b / -enb
    );
end architecture;