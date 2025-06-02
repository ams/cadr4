#
#
#

LIBS = -lSDL -lSDL_ttf -lpthread

all: soap

soap: soap.c unpack.c
	cc -o soap -g soap.c unpack.c

clean:
	rm -rf *.o soap
