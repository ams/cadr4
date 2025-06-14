-------------------------------------------------------------------------------
-- Title : GHDL UART
-- Project : GHDL UART
-------------------------------------------------------------------------------
-- File : ghdl_uart.vhd
-- Author : Wojciech M. Zabolotny ( wz...@ise.pw.edu.pl )
-- Created : 2011-06-02
-- Last update: 2025-06-14
-- Platform :
-- Standard : VHDL'93
-------------------------------------------------------------------------------
-- Description: GHDL UART allows you to communicate with IP core simulated in
-- GHDL simulator via pseudoterminal in Linux or similar system
-- You may use minicom, or your own program to connect to pseudoterminal
-- allocated by GHDL UART and work with simulated IP core like with real
-- hardware via hardware UART.
-------------------------------------------------------------------------------
-- Copyright (c) 2011
-- Published as PUBLIC DOMAIN
-------------------------------------------------------------------------------
-- Revisions :
-- Date Version Author Description
-- 2011-06-02 1.0 wzab Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
library work;
use work.ghdl_uart_pkg.all;

entity ghdl_uart is

  port (
    data_out : out std_logic_vector(7 downto 0);
    data_in  : in  std_logic_vector(7 downto 0);
    dav      : out std_logic;           -- received data available
    ready    : out std_logic;  -- there is free space in transmit buffer
    empty    : out std_logic;           -- the transmit buffer is empty
    rd       : in  std_logic;           -- asynchronous read strobe
    wr       : in  std_logic            -- asynchronous write strobe
    );

end ghdl_uart;

architecture simul of ghdl_uart is
  constant UART_FIFO_LENGTH                             : integer := 1000;
  type T_UART_FIFO is array (0 to UART_FIFO_LENGTH) of integer;
  signal wr_fifo, rd_fifo                               : T_UART_FIFO;
-- FIFO pointers
  signal wr_fifo_rp, wr_fifo_wp, rd_fifo_rp, rd_fifo_wp : integer := 0;

begin  -- simul

-- Processes controlling flags informing about status of UART
  dav <= '1' when rd_fifo_wp /= rd_fifo_rp else '0';

  check_ready : process (wr_fifo_rp, wr_fifo_wp)
    variable new_wp : integer;
  begin  -- process
    ready  <= '1';
    new_wp := wr_fifo_wp + 1;
    if new_wp = UART_FIFO_LENGTH then
      new_wp := 0;
    end if;
    if new_wp = wr_fifo_rp then
      ready <= '0';
    end if;
  end process check_ready;

  empty <= '0' when wr_fifo_wp /= wr_fifo_rp else '1';

  -- Process reading the data from the output FIFO
  -- and transmitting it to the PTY via VPI routine

  pipe_wr : process (wr_fifo, wr_fifo_rp, wr_fifo_wp)
    variable char_out : integer;
    variable new_rp   : integer;
    variable res      : integer;
  begin
    if wr_fifo_rp /= wr_fifo_wp then
      char_out := wr_fifo(wr_fifo_rp);
      res      := ghdl_pty_write(char_out);
      -- Update pointer
      new_rp   := wr_fifo_rp+1;
      if new_rp = UART_FIFO_LENGTH then
        new_rp := 0;
      end if;
      wr_fifo_rp <= new_rp;
    end if;
  end process pipe_wr;

  -- Process reading data from PTY (via VPI routine)
  -- and putting it into the read FIFO
  pipe_rd : process
    variable char_in : integer;
    variable new_wp  : integer;
    variable res     : integer;
  begin  -- process reading from socket
    res := ghdl_pty_open;
    while true loop
      char_in := ghdl_pty_read;
      if char_in = -2 then
        assert false report "Pseudoterminal disconnected?" severity failure;
      end if;
      if char_in >= 0 then
        new_wp := rd_fifo_wp+1;
        if new_wp = UART_FIFO_LENGTH then
          new_wp := 0;
        end if;
        if new_wp = rd_fifo_rp then
          -- FIFO overflow!
          assert false report "FIFO overflow!" severity failure;
        else
          rd_fifo(rd_fifo_wp) <= char_in;
          rd_fifo_wp          <= new_wp;
        end if;
      end if;
      -- You may customize the value below to change responsivness of
      -- the simulation
      wait for 1000 ns;
    end loop;
  end process pipe_rd;

  -- Read process (asynchronous version)
  RD1 : process (rd)
    variable rline  : line;
    variable new_rp : integer;
  begin  -- process
    if rd'event and rd = '1' then
      data_out <= (others => 'U');
      if rd_fifo_rp /= rd_fifo_wp then
        data_out <= std_logic_vector(to_unsigned(rd_fifo(rd_fifo_rp), 8));
        new_rp   := rd_fifo_rp + 1;
        if new_rp = UART_FIFO_LENGTH then
          new_rp := 0;
        end if;
        rd_fifo_rp <= new_rp;
      end if;
    end if;
  end process RD1;


  -- Write process (asynchronous version)
  WR1 : process (wr)
    --variable rline : line;
    variable new_wp : integer;
  begin  -- process
    if wr'event and wr = '1' then
      new_wp := wr_fifo_wp + 1;
      if new_wp = UART_FIFO_LENGTH then
        new_wp := 0;
      end if;
      if new_wp /= wr_fifo_rp then
        wr_fifo(wr_fifo_wp) <= to_integer(unsigned(data_in));
        wr_fifo_wp          <= new_wp;
      end if;
    end if;
  end process WR1;

end simul;
