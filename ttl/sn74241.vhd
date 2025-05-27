-- Octal Buffers And Line Drivers With 3-State Outputs

library ieee;
use ieee.std_logic_1164.all;

entity sn74241 is
  port (
    aenb_n                     : in  std_logic;
    ain0, ain1, ain2, ain3     : in  std_logic;
    aout0, aout1, aout2, aout3 : out std_logic;

    -- in the TI datasheet of SN74241, BENB is also active low
    -- however in CADR schematics it is active high
    -- so this is implemented as active high
    benb                       : in  std_logic;
    bin0, bin1, bin2, bin3     : in  std_logic;
    bout0, bout1, bout2, bout3 : out std_logic
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
