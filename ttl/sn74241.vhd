-- Octal Buffers And Line Drivers With 3-State Outputs
-- One enable input is active low, the other is active high

library ieee;
use ieee.std_logic_1164.all;

use work.misc.all;

entity sn74241 is
  port (
    aenb_n : in  std_logic; -- Pin 1 (1G) : Channel 1 Output Enable (Active Low)
    ain0   : in  std_logic; -- Pin 2 (1A1)
    ain1   : in  std_logic; -- Pin 4 (1A2)
    ain2   : in  std_logic; -- Pin 6 (1A3)
    ain3   : in  std_logic; -- Pin 8 (1A4)
    aout0  : out std_logic; -- Pin 18 (1Y1)
    aout1  : out std_logic; -- Pin 16 (1Y2)
    aout2  : out std_logic; -- Pin 14 (1Y3)
    aout3  : out std_logic; -- Pin 12 (1Y4)

    benb  : in  std_logic; -- Pin 19 (2G) : Channel 2 Output Enable (Active High)
    bin0  : in  std_logic; -- Pin 11 (2A1)
    bin1  : in  std_logic; -- Pin 13 (2A2)
    bin2  : in  std_logic; -- Pin 15 (2A3)
    bin3  : in  std_logic; -- Pin 17 (2A4)
    bout0 : out std_logic; -- Pin 9 (2Y1)
    bout1 : out std_logic; -- Pin 7 (2Y2)
    bout2 : out std_logic; -- Pin 5 (2Y3)
    bout3 : out std_logic  -- Pin 3 (2Y4)
    );
end;

architecture behavioral of sn74241 is
  signal aenb_n_i, ain0_i, ain1_i, ain2_i, ain3_i : std_logic;
  signal benb_i, bin0_i, bin1_i, bin2_i, bin3_i : std_logic;
begin

  aenb_n_i <= ttl_input(aenb_n);
  ain0_i <= ttl_input(ain0);
  ain1_i <= ttl_input(ain1);
  ain2_i <= ttl_input(ain2);
  ain3_i <= ttl_input(ain3);
  benb_i <= ttl_input(benb);
  bin0_i <= ttl_input(bin0);
  bin1_i <= ttl_input(bin1);
  bin2_i <= ttl_input(bin2);
  bin3_i <= ttl_input(bin3);

  process (all)
  begin
    if aenb_n_i = '0' then
      -- Enabled: pass data through
      aout0 <= ain0_i;
      aout1 <= ain1_i;
      aout2 <= ain2_i;
      aout3 <= ain3_i;
    elsif aenb_n_i = '1' then
      -- Disabled: high impedance
      aout0 <= 'Z'; aout1 <= 'Z'; aout2 <= 'Z'; aout3 <= 'Z';
    else
      aout0 <= 'X'; aout1 <= 'X'; aout2 <= 'X'; aout3 <= 'X';
    end if;
  end process;

  process (all)
  begin
    if benb_i = '1' then
      -- Enabled: pass data through
      bout0 <= bin0_i;
      bout1 <= bin1_i;
      bout2 <= bin2_i;
      bout3 <= bin3_i;
    elsif benb_i = '0' then
      -- Disabled: high impedance
      bout0 <= 'Z'; bout1 <= 'Z'; bout2 <= 'Z'; bout3 <= 'Z';
    else
      bout0 <= 'X'; bout1 <= 'X'; bout2 <= 'X'; bout3 <= 'X';
    end if;
  end process;

end;
