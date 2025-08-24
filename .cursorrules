# Overview

- This project is a digitally accurate functional simulation of the MIT CADR Lisp Machine.
- This project is not a timing verification, hence the components have no delays unless the component itself is a delay.
- This project will not be synthesized. It will be simulated using GHDL and/or NC.
- This project complies with VHDL-2008. You MUST write VHDL-2008 compliant code.

# General Guidelines

- Answer briefly in compact form, but without omitting important points.

# Build System

The project uses a Makefile based build system.

All the build artifacts are put into the `build` directory. Whenever you create a temporary file such as temporary shell or python scripts or a build artifact such as object files, you must create it under the build directory. If the directory does not exist, create it.

- `make`: Compiles all. The HDL compiler should be set with CADR4_HDLCOMPILER variable. ghdl and nvc are supported. ghdl is the default.
- `make clean`: Removes build artifacts (build directory)
- `make run-X`: Runs the testbench `X` compiled into `build/X`. For
example, to run cadr/cadr_alu_tb.vhd, you should execute `make run-cadr_alu_tb`.
- `make wf-X`: Runs the testbench `X` and save the waveforms to `build/X.fst` file. fst is the default wave format, it can be changed with CADR4_WAVEFORMAT variable. vcd and only with GHDL ghw is also supported.
- `cosim-run-X` and `cosim-wf-X` targets do the same above but with cosimulation library (VPI for GHDL, VHPI for NVC) loaded.
- `make regen`: Regenerates source and package files. If a port interface list is modified, `make regen` has to be run before running `make`.

# Coding Guidelines

- NEVER modify Makefile(s).
- NEVER modify port interface list of an entity or component unless specifically instructed to do so.
- NEVER modify `build/cadr_tb.vhd`, `build/cadr_boot_tb.vhd` and `*_suds.vhd` files, these are auto-generated and should not to be modified manually.
- After changing a source file, run `make clean`, then `make` to see everything compiles fine.
- DO NOT write testbenches on your own unless specifically instructed to do so.

# Git Workflow

- NEVER automatically commit changes.
- When creating a commit message, summarize the changes in bullet-points and add "Co-Authored-By: Cursor <noreply@metebalci.com>" on its own line at the end.

# Resources

- Original CADR paper is at: https://tumbleweed.nu/r/lm-3/uv/cadr.html
- CADR schematics in PNG format are at doc/schematics folder.
- CADR AI documents are at doc/ai folder.
- Datasheets for TTL components in markdown format are under doc/ttl.md folder. For example, for TTL component X.vhd, it is doc/ttl.md/X/X.md.
- VHDL-2008 language reference is at doc/VHDL_2008.md
- Verilog-2005 language reference is at doc/Verilog_2005.md
- GHDL documentation is at: https://ghdl.github.io/ghdl/
- NVC documentation is at: https://www.nickg.me.uk/nvc/manual.html