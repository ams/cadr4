CC = cc
CFLAGS = -O -Wno-implicit-int -Wno-format -Wno-implicit-function-declaration

dumpwords: dumpwords.c unpack.c
	$(CC) $(CFLAGS) -o $@ dumpwords.c unpack.c

clean:
	/bin/rm -f dumpwords
	/bin/rm -rf __pycache__
