library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ic_16dummy is
  port (
    vcc            : in  std_logic; -- 1,2,3,4,5
    hi1            : out std_logic; -- 16
    hi2            : out std_logic; -- 15
    \-boot1\       : out std_logic; -- 14
    \-boot2\       : out std_logic; -- 13
    p12            : out std_logic  -- 12
    );
end;

architecture ttl of ic_16dummy is
  signal p12_internal : std_logic := '0';
begin
  hi1 <= vcc;
  hi2 <= vcc;
  \-boot1\ <= vcc;
  \-boot2\ <= vcc;
  p12 <= p12_internal;
  
  -- Power-on reset behavior for p12
  process(vcc)
  begin
    if vcc = '1' then
      p12_internal <= '0';
      p12_internal <= '1' after 20 ns;  -- Short delay then go high
    else
      p12_internal <= '0';
    end if;
  end process;
end;
