library ieee;
use ieee.std_logic_1164.all;

-- this is a SR latch like entity
-- the reason for this is to eliminate unknown outputs at beginning by initializing them
-- and unknown outputs due to unknown SR inputs by checking their values explicitly without another gate

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
        if s1_n = '0' or s2_n = '0' or s3_n = '0' then
            q <= '1';
            q_n <= '0';
        elsif r1_n = '0' or r2_n = '0' or r3_n = '0' then
            q <= '0';
            q_n <= '1';
        end if;
    end process;
end architecture; 