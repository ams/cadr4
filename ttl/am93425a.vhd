-- Copyright (c) 2023 by Mykola Grymalyuk
--
-- All rights reserved.
--
-- This file is licensed under the MIT License.
-- See the LICENSE file in the project root for full license information.
--
-- Datasheet: Am93415/Am93425 - 1024 x 1 Bit TTL Bipolar IMOX™ RAM, AMD, October 1977, Document No. 04077B

-- AM93425A 1024 X 1 Bit RAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity am93425a is
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
    ce_n : in  std_logic;
    we_n : in  std_logic;
    di   : in  std_logic;
    do   : out std_logic
    );
end am93425a;

-- ChatGPT Codex implementation
architecture ttl of am93425a is
  type ram_t is array (0 to 1023) of std_logic;
  signal ram  : ram_t                := (others => '0');
  signal addr : unsigned(9 downto 0) := (others => '0');
begin
  addr <= a9 & a8 & a7 & a6 & a5 & a4 & a3 & a2 & a1 & a0;

  process(all)
  begin
    if ce_n = '0' then
      if we_n = '0' then
        ram(to_integer(addr)) <= di;
      end if;
      do <= ram(to_integer(addr));
    else
      do <= 'Z';
    end if;
  end process;
end;
