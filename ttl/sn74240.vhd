-- Octal Buffers and Line Drivers With 3-State Outputs

library ieee;
use ieee.std_logic_1164.all;

entity sn74240 is
  port (
    aenb_n : in  std_logic; -- Pin 1
    ain0   : in  std_logic; -- Pin 2
    ain1   : in  std_logic; -- Pin 4
    ain2   : in  std_logic; -- Pin 6
    ain3   : in  std_logic; -- Pin 8
    aout0  : out std_logic; -- Pin 18
    aout1  : out std_logic; -- Pin 16
    aout2  : out std_logic; -- Pin 14
    aout3  : out std_logic; -- Pin 12

    benb_n : in  std_logic; -- Pin 19
    bin0   : in  std_logic; -- Pin 11
    bin1   : in  std_logic; -- Pin 13
    bin2   : in  std_logic; -- Pin 15
    bin3   : in  std_logic; -- Pin 17
    bout0  : out std_logic; -- Pin 9
    bout1  : out std_logic; -- Pin 7
    bout2  : out std_logic; -- Pin 5
    bout3  : out std_logic  -- Pin 3
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
