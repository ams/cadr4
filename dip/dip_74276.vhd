library ieee;
use ieee.std_logic_1164.all;

entity dip_74276 is port (
  p2 : in std_logic;    -- 1J
  p3 : in std_logic;    -- 1CLK_n
  p4 : in std_logic;    -- 1K_n
  p5 : out std_logic;    -- 1Q

  p9 : in std_logic;    -- 2J
  p8 : in std_logic;    -- 2CLK_n
  p7 : in std_logic;    -- 2K_n
  p6 : out std_logic;    -- 2Q
  
  p12 : in std_logic;   -- 3J
  p13 : in std_logic;   -- 3CLK_n
  p14 : in std_logic;   -- 3K_n
  p15 : out std_logic;   -- 3Q

  p19 : in std_logic;   -- 4J
  p18 : in std_logic;   -- 4CLK_n
  p17 : in std_logic;   -- 4K_n
  p16 : out std_logic;   -- 4Q

  p11 : in std_logic;   -- SET_n
  p1 : in std_logic     -- CLR_n
  );
end entity;

architecture dip of dip_74276 is
begin
  u1 : entity work.sn74276
    port map (
      clr_n => p1,     -- CLR_n
      set_n => p11,    -- SET_n
      
      j1 => p2,        -- 1J
      k1_n => p4,      -- 1K_n
      clk1_n => p3,    -- 1CLK_n
      q1 => p5,        -- 1Q
      q1_n => open,    -- Not connected in DIP
      
      j2 => p9,        -- 2J
      k2_n => p7,      -- 2K_n
      clk2_n => p8,    -- 2CLK_n
      q2 => p6,        -- 2Q
      q2_n => open,    -- Not connected in DIP
      
      j3 => p12,       -- 3J
      k3_n => p14,     -- 3K_n
      clk3_n => p13,   -- 3CLK_n
      q3 => p15,       -- 3Q
      q3_n => open,    -- Not connected in DIP
      
      j4 => p19,       -- 4J
      k4_n => p17,     -- 4K_n
      clk4_n => p18,   -- 4CLK_n
      q4 => p16,       -- 4Q
      q4_n => open     -- Not connected in DIP
    );
end architecture;