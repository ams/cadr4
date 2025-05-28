-- Octal Buffers And Line Drivers With 3-State Outputs
-- SN74241 Octal Buffer and Line Driver with 3-State Outputs

library ieee;
use ieee.std_logic_1164.all;

-- This is an Octal Buffer and Line Driver with 3-State Outputs
entity sn74241 is
  port (
    aenb_n   : in  std_logic; -- Pin 19 (Enable A Input Active Low)
    ain0     : in  std_logic; -- Pin 2 (A Input 0)
    ain1     : in  std_logic; -- Pin 4 (A Input 1)
    ain2     : in  std_logic; -- Pin 6 (A Input 2)
    ain3     : in  std_logic; -- Pin 8 (A Input 3)
    aout0    : out std_logic; -- Pin 18 (A Output 0)
    aout1    : out std_logic; -- Pin 16 (A Output 1)
    aout2    : out std_logic; -- Pin 14 (A Output 2)
    aout3    : out std_logic; -- Pin 12 (A Output 3)

    -- in the TI datasheet of SN74241, BENB is also active low
    -- however in CADR schematics it is active high
    -- so this is implemented as active high
    benb     : in  std_logic; -- Pin 1 (Enable B Input Active High - CADR specific)
    bin0     : in  std_logic; -- Pin 11 (B Input 0)
    bin1     : in  std_logic; -- Pin 13 (B Input 1)
    bin2     : in  std_logic; -- Pin 15 (B Input 2)
    bin3     : in  std_logic; -- Pin 17 (B Input 3)
    bout0    : out std_logic; -- Pin 9 (B Output 0)
    bout1    : out std_logic; -- Pin 7 (B Output 1)
    bout2    : out std_logic; -- Pin 5 (B Output 2)
    bout3    : out std_logic  -- Pin 3 (B Output 3)
    );
end;

architecture ttl of sn74241 is
begin

  process (aenb_n)
  begin
    if aenb_n = '1' then
      aout0 <= 'Z'; aout1 <= 'Z'; aout2 <= 'Z'; aout3 <= 'Z';
    else
      aout0 <= ain0; aout1 <= ain1; aout2 <= ain2; aout3 <= ain3;
    end if;
  end process;

  process (benb)
  begin
    if benb = '0' then
      bout0 <= 'Z'; bout1 <= 'Z'; bout2 <= 'Z'; bout3 <= 'Z';
    else
      bout0 <= bin0; bout1 <= bin1; bout2 <= bin2; bout3 <= bin3;
    end if;
  end process;

end;
