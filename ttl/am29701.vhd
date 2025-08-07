library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am29701 is
  port (
    i1      : in  std_logic;
    i2      : in  std_logic;
    i3      : in  std_logic;
    i4      : in  std_logic;
    o1      : out std_logic;
    o2      : out std_logic;
    o3      : out std_logic;
    o4      : out std_logic;
    a0      : in  std_logic;
    a1      : in  std_logic;
    a2      : in  std_logic;
    a3      : in  std_logic;
    write_n : in  std_logic;
    ce_n    : in  std_logic
  );
end entity;

architecture rtl of am29701 is
  type ram_array is array (0 to 15) of std_logic_vector(3 downto 0);
  signal ram : ram_array := (others => (others => '0'));
  signal address : integer range 0 to 15;
  signal data_in : std_logic_vector(3 downto 0);
begin

  address <= to_integer(unsigned(std_logic_vector'(a3 & a2 & a1 & a0)));
  data_in <= i4 & i3 & i2 & i1;
  
  process(write_n, ce_n, address, data_in)
  begin
    if ce_n = '0' and write_n = '0' then
      ram(address) <= data_in;
    end if;
  end process;
  
  process(ce_n, address, ram)
  begin
    if ce_n = '0' then
      o1 <= ram(address)(0);
      o2 <= ram(address)(1);
      o3 <= ram(address)(2);
      o4 <= ram(address)(3);
    else
      o1 <= 'Z';
      o2 <= 'Z';
      o3 <= 'Z';
      o4 <= 'Z';
    end if;
  end process;

end architecture;
