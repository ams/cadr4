
# soap

soap utility reads a X.drw file and generates cadr_X_suds.vhd architecture implementing cadr_X entity (given in cadr_X.vhd).

unpack.c provides the unpack function that decodes 36-bit words from 8-bit bytes.

# soap4

Original soap.c was written by Brad Parker and unpack.c was written by John Wilson. These are modified to improve readability and to have a better compatibility with cadr4. The modified files are soap4.c and unpack4.c.

The new utility is built with `make build/soap4`.

## unpack4.c 

The new unpack4.c splits the combined process in the previous code into two:

- reading the bytes from a 8-bit file
- actually assembling the 36-bit words from these bytes

It also eliminates the use of global variables and accepts the buffer as a parameter. It also uses the fixed width types (such as uint32_t).

The new parsing code assumes the file is in correct format, so it only uses asserts when an unexpected issue happens.

It also comes with unpack4.h for the unpack function.

## soap4.c

The new soap4.c has some features removed and some features added comparing to original soap.c. SUDS and netlist dump features are removed, but it has the following new features:

- raw 18-bit word output in wide format (8 half-words in one line)
- extensive debug output including parser debug flag
- VHDL output

The main and actually only purpose of soap4 is to output a VHDL file given a drw (SUDS) file. All features that are not directly related to this are removed.

It also comes with soap4.h for the struct definitions.

## resources

- suds.txt: downloaded from https://github.com/lisper/cpus-cadr/blob/master/suds/suds.txt