-- Octal Buffers and Line Drivers With 3-State Outputs
-- SN74244 Octal Buffer and Line Driver with 3-State Outputs

library ieee;
use ieee.std_logic_1164.all;

-- This is an Octal Buffer and Line Driver with 3-State Outputs
entity sn74244 is
  port (
    aenb_n   : in  std_logic; -- Pin 1 (Enable A Input Active Low)
    ain0     : in  std_logic; -- Pin 2 (A Input 1)
    ain1     : in  std_logic; -- Pin 4 (A Input 2)
    ain2     : in  std_logic; -- Pin 6 (A Input 3)
    ain3     : in  std_logic; -- Pin 8 (A Input 4)
    aout0    : out std_logic; -- Pin 18 (Y Output 1)
    aout1    : out std_logic; -- Pin 16 (Y Output 2)
    aout2    : out std_logic; -- Pin 14 (Y Output 3)
    aout3    : out std_logic; -- Pin 12 (Y Output 4)

    benb_n   : in  std_logic; -- Pin 19 (Enable B Input Active Low)
    bin0     : in  std_logic; -- Pin 11 (A Input 5)
    bin1     : in  std_logic; -- Pin 13 (A Input 6)
    bin2     : in  std_logic; -- Pin 15 (A Input 7)
    bin3     : in  std_logic; -- Pin 17 (A Input 8)
    bout0    : out std_logic; -- Pin 9 (Y Output 5)
    bout1    : out std_logic; -- Pin 7 (Y Output 6)
    bout2    : out std_logic; -- Pin 5 (Y Output 7)
    bout3    : out std_logic  -- Pin 3 (Y Output 8)
    );
end;

architecture ttl of sn74244 is
begin

  process (aenb_n)
  begin
    if aenb_n = '1' then
      aout0 <= 'Z'; aout1 <= 'Z'; aout2 <= 'Z'; aout3 <= 'Z';
    else
      aout0 <= ain0; aout1 <= ain1; aout2 <= ain2; aout3 <= ain3;
    end if;
  end process;

  process (benb_n)
  begin
    if benb_n = '1' then
      bout0 <= 'Z'; bout1 <= 'Z'; bout2 <= 'Z'; bout3 <= 'Z';
    else
      bout0 <= bin0; bout1 <= bin1; bout2 <= bin2; bout3 <= bin3;
    end if;
  end process;

end;
