-------------------------------------------------------------------------------
-- Title : Testbench for design "ghdl_uart"
-- Project : GHDL UART
-------------------------------------------------------------------------------
-- File : ghdl_uart_tb.vhd
-- Author : wzab
-- Company :
-- Created : 2006-12-02
-- Last update: 2025-06-14
-- Platform :
-- Standard : VHDL'87
-------------------------------------------------------------------------------
-- Description: This is a testbench, demonstrating
-------------------------------------------------------------------------------
-- Copyright (c) 2006
-- Published as PUBLIC DOMAIN
-------------------------------------------------------------------------------
-- Revisions :
-- Date Version Author Description
-- 2006-12-02 1.0 wzab Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
library work;
-------------------------------------------------------------------------------

entity ghdl_uart_tb is

end ghdl_uart_tb;

-------------------------------------------------------------------------------

architecture symul2 of ghdl_uart_tb is
  --constant rdp_name : string := "/tmp/wrpipe";
  --ODconstant wrp_name : string := "/tmp/rdpipe";

  component ghdl_uart
    port (
      data_out : out std_logic_vector(7 downto 0);
      data_in  : in  std_logic_vector(7 downto 0);
      dav      : out std_logic;         -- received data available
      ready    : out std_logic;  -- there is free space in transmit buffer
      empty    : out std_logic;         -- the transmit buffer is empty
      rd       : in  std_logic;         -- asynchronous read strobe
      wr       : in  std_logic          -- asynchronous write strobe
      );
  end component;

  signal data_out : std_logic_vector(7 downto 0);
  signal data_in  : std_logic_vector(7 downto 0);
  signal dav      : std_logic;
  signal ready    : std_logic;
  signal rd       : std_logic;
  signal wr       : std_logic;
  signal rst      : std_logic := '0';

  -- clock
  signal Clk : std_logic := '1';

begin  -- symul2

  ghdl_uart_1 : ghdl_uart
    port map (
      data_out => data_out,
      data_in  => data_in,
      dav      => dav,
      ready    => ready,
      empty    => open,
      rd       => rd,
      wr       => wr);

  data_in <= data_out xor x"20";        -- We send back received data with
  -- toggled 5th bit

  process (clk, rst)
  -- The ghdl_uart block is asynchronous, however to show how it may be used
  -- in a synchronous block, I have created a simple synchronous process
  begin  -- process
    if rst = '0' then                   -- asynchronous reset (active low)
      rd <= '0';
      wr <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge
      rd <= '0';
      wr <= '0';
      if (dav = '1') and (rd = '0') and (ready = '1') then
        -- 1st cycle: Received data is available, raise rd signal to read it
        rd <= '1';
      elsif rd = '1' then
        -- 2nd cycle: Read data is available on data_out and with toggled 5th
        -- bit on data_in, we start writing the converted data
        wr <= '1';
      elsif wr = '1' then
        -- 3rd cycle: deactivate both rd and wr signals and wait until dav goes
        -- high again
        rd <= '0';
        wr <= '0';
      end if;
    end if;
  end process;

  Clk <= not Clk after 100 ns;
  Rst <= '1'     after 25 ns;
end symul2;

-------------------------------------------------------------------------------

configuration ghdl_uart_tb_symul2_cfg of ghdl_uart_tb is
  for symul2
  end for;
end ghdl_uart_tb_symul2_cfg;

-------------------------------------------------------------------------------
