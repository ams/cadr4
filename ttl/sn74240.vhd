-- Octal Buffers and Line Drivers With 3-State Outputs

library ieee;
use ieee.std_logic_1164.all;

entity sn74240 is
  port (
    aenb_n : in  std_logic;
    ain0   : in  std_logic;
    ain1   : in  std_logic;
    ain2   : in  std_logic;
    ain3   : in  std_logic;
    aout0  : out std_logic;
    aout1  : out std_logic;
    aout2  : out std_logic;
    aout3  : out std_logic;

    benb_n : in  std_logic;
    bin0   : in  std_logic;
    bin1   : in  std_logic;
    bin2   : in  std_logic;
    bin3   : in  std_logic;
    bout0  : out std_logic;
    bout1  : out std_logic;
    bout2  : out std_logic;
    bout3  : out std_logic
    );
end;

architecture ttl of sn74240 is
begin

  process (aenb_n)
  begin
    if aenb_n = '1' then
      aout0 <= 'Z'; aout1 <= 'Z'; aout2 <= 'Z'; aout3 <= 'Z';
    else
      aout0 <= not ain0; aout1 <= not ain1; aout2 <= not ain2; aout3 <= not ain3;
    end if;
  end process;

  process (benb_n)
  begin
    if benb_n = '1' then
      bout0 <= 'Z'; bout1 <= 'Z'; bout2 <= 'Z'; bout3 <= 'Z';
    else
      bout0 <= not bin0; bout1 <= not bin1; bout2 <= not bin2; bout3 <= not bin3;
    end if;
  end process;

end;
