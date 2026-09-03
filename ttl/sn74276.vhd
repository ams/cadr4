-- Quadruple J-K̄ Flip-Flops with Negative-Edge Triggering

library ieee;
use ieee.std_logic_1164.all;
use work.misc.all;

entity sn74276 is
  port (
    clr_n  : in  std_logic; -- Pin 1 (CLR): common clear (active low)
    set_n  : in  std_logic; -- Pin 11 (PRE): common preset (active low)
    
    -- Flip-flop 1
    j1     : in  std_logic; -- Pin 2 (1J)
    k1_n   : in  std_logic; -- Pin 4 (1K_n): K input (active low)
    clk1_n : in  std_logic; -- Pin 3 (1CLK): clock 1 (negative edge)
    q1     : out std_logic; -- Pin 5 (1Q)
    q1_n   : out std_logic; -- no pin (Q_n is not brought out)
    
    -- Flip-flop 2
    j2     : in  std_logic; -- Pin 9 (2J)
    k2_n   : in  std_logic; -- Pin 7 (2K_n): K input (active low)
    clk2_n : in  std_logic; -- Pin 8 (2CLK): clock 2 (negative edge)
    q2     : out std_logic; -- Pin 6 (2Q)
    q2_n   : out std_logic; -- no pin (Q_n is not brought out)
    
    -- Flip-flop 3
    j3     : in  std_logic; -- Pin 12 (3J)
    k3_n   : in  std_logic; -- Pin 14 (3K_n): K input (active low)
    clk3_n : in  std_logic; -- Pin 13 (3CLK): clock 3 (negative edge)
    q3     : out std_logic; -- Pin 15 (3Q)
    q3_n   : out std_logic; -- no pin (Q_n is not brought out)
    
    -- Flip-flop 4
    j4     : in  std_logic; -- Pin 19 (4J)
    k4_n   : in  std_logic; -- Pin 17 (4K_n): K input (active low)
    clk4_n : in  std_logic; -- Pin 18 (4CLK): clock 4 (negative edge)
    q4     : out std_logic; -- Pin 16 (4Q)
    q4_n   : out std_logic  -- no pin (Q_n is not brought out)
    );
end entity;

architecture structural of sn74276 is
  signal clr_n_i, set_n_i : std_logic;
  signal j1_i, k1_n_i, clk1_n_i : std_logic;
  signal j2_i, k2_n_i, clk2_n_i : std_logic;
  signal j3_i, k3_n_i, clk3_n_i : std_logic;
  signal j4_i, k4_n_i, clk4_n_i : std_logic;
begin

  -- TTL input conditioning
  clr_n_i <= ttl_input(clr_n);
  set_n_i <= ttl_input(set_n);
  
  j1_i <= ttl_input(j1);
  k1_n_i <= ttl_input(k1_n);
  clk1_n_i <= ttl_input(clk1_n);
  
  j2_i <= ttl_input(j2);
  k2_n_i <= ttl_input(k2_n);
  clk2_n_i <= ttl_input(clk2_n);
  
  j3_i <= ttl_input(j3);
  k3_n_i <= ttl_input(k3_n);
  clk3_n_i <= ttl_input(clk3_n);
  
  j4_i <= ttl_input(j4);
  k4_n_i <= ttl_input(k4_n);
  clk4_n_i <= ttl_input(clk4_n);

  -- First J-K̄ flip-flop (negative edge triggered)
  u1 : entity work.ff_jkpc 
    port map (
      clk => not clk1_n_i,  -- Invert for negative edge triggering
      pre => set_n_i,
      clr => clr_n_i, 
      j => j1_i, 
      k => not k1_n_i,      -- Invert K̄ input to get K
      q => q1, 
      q_n => q1_n
    );
  
  -- Second J-K̄ flip-flop (negative edge triggered)
  u2 : entity work.ff_jkpc 
    port map (
      clk => not clk2_n_i,  -- Invert for negative edge triggering
      pre => set_n_i,
      clr => clr_n_i, 
      j => j2_i, 
      k => not k2_n_i,      -- Invert K̄ input to get K
      q => q2, 
      q_n => q2_n
    );
  
  -- Third J-K̄ flip-flop (negative edge triggered)
  u3 : entity work.ff_jkpc 
    port map (
      clk => not clk3_n_i,  -- Invert for negative edge triggering
      pre => set_n_i,
      clr => clr_n_i, 
      j => j3_i, 
      k => not k3_n_i,      -- Invert K̄ input to get K
      q => q3, 
      q_n => q3_n
    );
  
  -- Fourth J-K̄ flip-flop (negative edge triggered)
  u4 : entity work.ff_jkpc 
    port map (
      clk => not clk4_n_i,  -- Invert for negative edge triggering
      pre => set_n_i,
      clr => clr_n_i, 
      j => j4_i, 
      k => not k4_n_i,      -- Invert K̄ input to get K
      q => q4, 
      q_n => q4_n
    );

end architecture;
