#
#
#

LIBS = -lSDL -lSDL_ttf -lpthread

all: soap soap2

soap: soap.c unpack.c
	cc -o soap -g soap.c unpack.c

soap2: soap2.c unpack.c draw.c sdl.c
	cc -o soap2 -g soap2.c unpack.c draw.c sdl.c $(LIBS)

clean:
	rm -rf *.o soap soap2
