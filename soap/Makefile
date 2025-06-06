#
#
#

CFLAGS = -std=gnu99 -Wall -Wextra -O0 -ggdb3

all: soap

soap: soap.c unpack.c
	cc -o soap -g soap.c unpack.c

clean:
	rm -rf *.o soap
