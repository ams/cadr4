library ieee;
use ieee.std_logic_1164.all;

-- this is a SR latch like entity
-- the reason for this is to eliminate unknown outputs at beginning by initializing them
-- and unknown outputs due to unknown SR inputs by only checking the falling edges of these

entity dip_sr is
  port (
    s1_n  : in  std_logic;
    s2_n  : in  std_logic;
    s3_n  : in  std_logic;
    r1_n  : in  std_logic;
    r2_n  : in  std_logic;
    r3_n  : in  std_logic;
    q     : out std_logic := '0';
    q_n   : out std_logic := '1'
    );
end entity;

architecture dip of dip_sr is
begin
    process (s1_n, s2_n, s3_n, r1_n, r2_n, r3_n)
    begin
        if (falling_edge(s1_n) or falling_edge(s2_n) or falling_edge(s3_n)) then
            q <= '1';
            q_n <= '0';
        elsif (falling_edge(r1_n) or falling_edge(r2_n) or falling_edge(r3_n)) then
            q <= '0';
            q_n <= '1';
        end if;
    end process;
end architecture; 