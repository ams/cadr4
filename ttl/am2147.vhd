-- 4096 X 1 Static RAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Datasheet: AMD AM2147
entity am2147 is
  port (
    a0   : in  std_logic;
    a1   : in  std_logic;
    a2   : in  std_logic;
    a3   : in  std_logic;
    a4   : in  std_logic;
    a5   : in  std_logic;
    a6   : in  std_logic;
    a7   : in  std_logic;
    a8   : in  std_logic;
    a9   : in  std_logic;
    a10  : in  std_logic;
    a11  : in  std_logic;
    ce_n : in  std_logic;
    di   : in  std_logic;
    we_n : in  std_logic;
    do   : out std_logic
    );
end am2147;

architecture ttl of am2147 is
  type ram_t is array (0 to 4095) of std_logic;
  signal ram : ram_t := (others => '0');
  signal addr_slv : std_logic_vector(11 downto 0);
begin
  addr_slv <= (a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0);

  process (ce_n, we_n, addr_slv, di)
  begin
    if ce_n = '0' and we_n = '0' then
      -- Write
      ram(to_integer(unsigned(addr_slv))) <= di;
    end if;
  end process;

  process (ce_n, we_n, addr_slv, ram)
  begin
    if ce_n = '0' and we_n = '1' then
      -- Read
      do <= ram(to_integer(unsigned(addr_slv)));
    else
      -- Disabled or writing
      do <= 'Z';
    end if;
  end process;
end ttl;
