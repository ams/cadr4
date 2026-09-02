/* dump an ITS-evacuated 36-bit file as one 18-bit halfword per line (octal) */
#include <stdio.h>
#include <stdlib.h>
unsigned int *up;
int up_size;
void unpack(char *file);
int main(int argc, char **argv)
{
	int i;
	up = malloc(4 * 1024 * 1024);
	up_size = 0;
	unpack(argv[1]);
	for (i = 0; i < up_size; i++)
		printf("%o\n", up[i]);
	return 0;
}
