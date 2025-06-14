VHDLS = \
 ghdl_uart_pkg.vhd \
 ghdl_uart.vhd \
 ghdl_uart_tb.vhd \

STD=standard
#STD=synopsys

all: simulate

ghdl_pty.o : ghdl_pty.c
	gcc -c ghdl_pty.c

simulate: ghdl_uart_tb
	./ghdl_uart_tb
ghdl_uart_tb: ${VHDLS} ghdl_pty.o
	ghdl -a --std=02 --ieee=${STD} ${VHDLS}
	ghdl -e -Wl,ghdl_pty.o --std=02 --ieee=${STD} ghdl_uart_tb
clean:
	rm *.o *.vcd *.ghw *.cf ghdl_uart_tb

