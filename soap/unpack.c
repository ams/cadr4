/*

  Unpack an ITS file stored in a WEENIX file using Alan Bawden's evacuated file
  format.

  By John Wilson.

  04/11/1993  JMBW  Created.
  08/09/1993  JMBW  Convert dates, uncompress .Z files automatically.
  07/14/1998  JMBW  Separated from DUMP.C.

*/

#include <fcntl.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

FILE *in, *out;

//FILE *zopen();
static void flush();

extern unsigned int *up;
extern int up_size;

/* write a word */
void outword(register unsigned long l,register unsigned long r)
{
	if (0) printf("outword(%06o, %06o)\n", l, r);
	up[up_size++] = l;
	up[up_size++] = r;
}

/*
 
Message: 2881200, 91 lines
Posted: 4:07pm EDT, Thu May 14/92, imported: 4:05pm EDT, Thu May 14/92
Subject: ITS filesystems
To: John Wilson, bruce@think.com
From: alan%ai.mit.edu@life.ai.mit.edu

   Date: Wed, 13 May 92 21:56:02 EDT
   From: John_Wilson@mts.rpi.edu
   ...
   I have a question -- how are the 36-bit words packed into 8-bit bytes?
   ...

   From: Bruce Walker <bruce@think.com>
   Date: Wed, 13 May 92 18:17:20 EDT
   ...
   What is the representation of binary files?
   ...

-------

			   Storing 36-Bit Words
                              In 8-Bit Bytes

 Here are the details of the encoding used to store 36-bit PDP-10 words in
 8-bit byte file systems.  It is easiest to explain the encoding by
 describing how to reconstruct the 36-bit words from the 8-bit bytes.  Going
 the other direction is harder (you will see why). 

   Algorithm to decode a sequence of 8-bit bytes into a sequence of 36-bit
   words:

     Each 8-bit byte between 0 and 357 (octal) is decoded into one or two
     7-bit bytes (see table below).  These 7-bit bytes are then assembled
     into 36-bit words in the usual PDP-10 byte ordering.  The lowest order
     bit of each such word is always set to 0.

     Each 8-bit byte between 360 and 377 (octal) is combined with the next 4
     8-bit bytes to form a complete 36-bit word (see figure below).  It is
     an error to encounter such a byte when there is a partially assembled
     output word.

     If there is a partially assembled output word at the end of the
     sequence of 8-bit bytes, it is padded out with 7-bit bytes that contain
     the value 3 (control-C in ASCII).

     Here is the table for decoding bytes between 0 and 357 (all values are
     in octal):

               input byte   1st output   2nd output
               ----------   ----------   ----------
                 0 --  11     0 --  11   none
                12           15           12
                13 --  14    13 --  14   none
                15           12          none
                16 -- 176    16 -- 176   none
               177          177            7
               200 -- 206   177            0 --   6
               207          177          177
               210 -- 211   177           10 --  11
               212          177           15
               213 -- 214   177           13 --  14
               215          177           12
               216 -- 355   177           16 -- 155
               356           15          none
               357          177          none

     For bytes between 360 and 377 (octal) the 36-bit word is reconstructed
     as follows:

                byte: 000011111111222222 223333333344444444
                 bit: 321076543210765432 107654321076543210

     Where byte 0 is the current byte (the one between 360 and 377), byte 1
     is the next in sequence, and so forth.

 Going in the other direction, from 36-bit words to 8-bit bytes, is harder
 only because there are choices to be made.  For example, you can encode
 every 36-bit word using 5 bytes where the first is between 360 and 377 --
 but if you did this, files that were stored as ASCII packed in 36-bit words
 in the usual way wouldn't be readable.  A -good- encoder will produce a
 sequence of 8-bit bytes that can be read as an ordinary text file under
 Unix whenever the input words contain only PDP-10 ASCII.

 (You may be puzzled by all two byte sequences starting with 177 in the
 table above.  The explanation is that this is done to preserve not just
 ASCII files, but also the files written by the Lisp Machine system using
 the Lisp Machine character set.  But you don't really need to worry about
 this, as long as you have the above table, you know all you need to know
 about it.)

 I have a library of C routines that know how to encode and decode files in
 this format.  I'm not willing to make a widely public release of it, but if
 you really need to use it let me know.  (It is best to keep the number of
 different programs that understand the format small in order to minimize
 the chances of introducing incompatibilities.)

-------
*/

/* first code written for each input code from 000 to 357 */
char first[0360] = {
0000, 0001, 0002, 0003, 0004, 0005, 0006, 0007,
0010, 0011, 0015, 0013, 0014, 0012, 0016, 0017, /* '\n' => CRLF, '\r' => LF */
0020, 0021, 0022, 0023, 0024, 0025, 0026, 0027,
0030, 0031, 0032, 0033, 0034, 0035, 0036, 0037,
0040, 0041, 0042, 0043, 0044, 0045, 0046, 0047,
0050, 0051, 0052, 0053, 0054, 0055, 0056, 0057,
0060, 0061, 0062, 0063, 0064, 0065, 0066, 0067,
0070, 0071, 0072, 0073, 0074, 0075, 0076, 0077,
0100, 0101, 0102, 0103, 0104, 0105, 0106, 0107,
0110, 0111, 0112, 0113, 0114, 0115, 0116, 0117,
0120, 0121, 0122, 0123, 0124, 0125, 0126, 0127,
0130, 0131, 0132, 0133, 0134, 0135, 0136, 0137,
0140, 0141, 0142, 0143, 0144, 0145, 0146, 0147,
0150, 0151, 0152, 0153, 0154, 0155, 0156, 0157,
0160, 0161, 0162, 0163, 0164, 0165, 0166, 0167,
0170, 0171, 0172, 0173, 0174, 0175, 0176, 0177,
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 200 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 210 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 220 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 230 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 240 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 250 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 260 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 270 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 300 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 310 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 320 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 330 */
0177, 0177, 0177, 0177, 0177, 0177, 0177, 0177,	/* 340 */
0177, 0177, 0177, 0177, 0177, 0177, 0015, 0177	/* 350 */
};

/* use the sign bit for NONE, maybe cc's optimizer will catch on (yeah right) */
#define NONE 0200
/* second code written for each input code from 000 to 357, or NONE if none */
char second[0360] = {
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 000 */
NONE, NONE, 0012, NONE, NONE, NONE, NONE, NONE,	/* 010 -- '\n' => CRLF */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 020 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 030 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 040 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 050 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 060 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 070 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 100 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 110 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 120 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 130 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 140 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 150 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, NONE,	/* 160 */
NONE, NONE, NONE, NONE, NONE, NONE, NONE, 0007,	/* 170 */
0000, 0001, 0002, 0003, 0004, 0005, 0006, 0177,	/* 200 */
0010, 0011, 0015, 0013, 0014, 0012, 0016, 0017,	/* 210 */
0020, 0021, 0022, 0023, 0024, 0025, 0026, 0027,	/* 220 */
0030, 0031, 0032, 0033, 0034, 0035, 0036, 0037,	/* 230 */
0040, 0041, 0042, 0043, 0044, 0045, 0046, 0047,	/* 240 */
0050, 0051, 0052, 0053, 0054, 0055, 0056, 0057,	/* 250 */
0060, 0061, 0062, 0063, 0064, 0065, 0066, 0067,	/* 260 */
0070, 0071, 0072, 0073, 0074, 0075, 0076, 0077,	/* 270 */
0100, 0101, 0102, 0103, 0104, 0105, 0106, 0107,	/* 300 */
0110, 0111, 0112, 0113, 0114, 0115, 0116, 0117,	/* 310 */
0120, 0121, 0122, 0123, 0124, 0125, 0126, 0127,	/* 320 */
0130, 0131, 0132, 0133, 0134, 0135, 0136, 0137,	/* 330 */
0140, 0141, 0142, 0143, 0144, 0145, 0146, 0147,	/* 340 */
0150, 0151, 0152, 0153, 0154, 0155, NONE, NONE	/* 350 */
};

unpack(char *file)
{
	register int c;
	register char b;
	register int i;
	static unsigned long word[5];
	static unsigned long incnt;

	up_size = 0;

	in=fopen(file,"rb");	/* uncompress/open file */
	if(in==NULL) {
		perror(file);
		exit(1);
	}

	incnt=0L;	/* used for error msgs if file invalid */
	while((incnt++,c=getc(in))!=EOF) {
		if(c>=0360) {	/* quoted binary word */
			word[0]=(c&017);
			for(i=1;i<=4;i++) {  /* 4 more bytes */
				if((incnt++,word[i]=getc(in))==EOF) {
					fprintf(stderr,
					"?Unexpected EOF: %s\n",file);
					exit(1);
				}
			}
			/* assemble the 36-bit binary word */
			outword((word[0]<<14L)|(word[1]<<6L)|
				((word[2]>>2L)&077L),
				((word[2]&003L)<<16L)|
				(word[3]<<8L)|word[4]);
		}
		else {
			word[0]=first[c], i=1;	/* write first char */
			if(!((b=second[c])&NONE)) word[i++]=b;
			/* loop until word boundary */
			while(i) {
				/* start next sequence */
				if((incnt++,c=getc(in))==EOF) {
					/* pad with ^C's on EOF */
					while(i<5) word[i++]=003;
					flush(word);
					goto done;
				}
				/* quoted word not allowed mid-word */
				if(c>=0360) {
					fprintf(stderr,
				"?Invalid input file:  %s, char %lu\n",
					file,incnt);
					exit(1);
				}
				/* save the first char */
				word[i++]=first[c];
				if(i==5) flush(word), i=0;
				/* save 2nd char if any */
				if(!((b=second[c])&NONE)) {
					word[i++]=b;
					if(i==5) flush(word), i=0;
				}
			}
		}
	}
done:	fclose(in);
//	unlink(file);	/* delete when done - /tmp isn't big enough on */
			/* CIEUNIX.RPI.EDU */
}

/* flush 5 7-bit ASCII chars as a 36-bit word */
static void flush(unsigned long word[5])
{
	register unsigned long l, r;
	l=(word[0]<<11L)|(word[1]<<4L)|((word[2]>>3L)&017L);
	r=((word[2]&07L)<<15L)|(word[3]<<8L)|(word[4]<<1L);
	outword(l,r);
}

