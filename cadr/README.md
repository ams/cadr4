
# cadr

This folder contains cadr components.

A cadr component implements a CADR schematic page and named accordingly as cadr_<PAGE>. The cadr components are grouped into two packages `cadr_book` and `icmem_book`.

The suds architecture of CADR components are auto-generated with `make suds` from `doc/ai/cadr/*.drw` files. The architecture is implemented in cadr_<PAGE>_suds.vhd files.

`make suds` uses `soap/soap` utility to generate cadr_*_suds.vhd files but these files are also post-processed with `fix-suds.py` script and various sed commands. See `Makefile`.