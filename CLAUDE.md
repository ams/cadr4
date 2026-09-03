# CLAUDE.md

Project rules for cadr4. The rules in `~/projects/CLAUDE.md` apply as well.

## What this project is

- A digitally accurate functional simulation of the MIT CADR Lisp Machine,
  written in VHDL-2008 and simulated with GHDL or NVC. It is never
  synthesized.
- It is not a timing model: components have no delays unless the component
  itself is a delay line (`ttl/ttldm.vhd`, `ttl/mttldl.vhd`).
- Layers, bottom up: `ttl/` behavioural chip models (one entity per part,
  ports named after the datasheet, `-- Pin N` comments), `dip/` wrappers
  that map physical pins `p1..p24` to a chip model, `cadr/` and `cadr1/`
  schematic pages generated from the original SUDS drawings, `helper/`
  hand-written glue, `build/cadr_tb.vhd` and `build/cadr_boot_tb.vhd`
  generated top levels that wire every page by signal name.

## Build and test

- `make` builds everything with the compiler in `CADR4_HDLCOMPILER`
  (`ghdl`, the default, or `nvc`). Run `make clean` when switching.
- `make check` runs every unit testbench. It must pass on both compilers
  before any change is finished. `make check-<group>` runs one group
  (`ttl`, `dip`, `helper`, `cadr`).
- `make run-X` runs testbench `X` (for example `make run-sn7474_tb`);
  `make wf-X` also writes `build/X.fst`. Set `CADR4_STOPTIME=200us` to
  bound a run.
- `make run-cadr_boot_tb` boots the CADR through the PROM and prints the
  diagnostic display; it stops on its own when the PROM reaches `0313`.
- `make regen` regenerates every generated file (packages, page entities,
  suds architectures). Run it after changing anything in `dip/`,
  `helper/`, a `ttl/` entity, `rom/*.table`, `rom/*.rename` or the
  scripts, then check `git diff` shows only what you intended.
- `make help` lists all targets.

## Rules

- Tests first. A model fix starts with a testbench change that fails
  against the current model. Testbenches fail with
  `assert ... severity error`, never `note`, and must terminate on their
  own.
- Never edit generated files by hand: `build/*`, `cadr/suds/*`,
  `cadr1/suds/*`, `cadr/cadr_*.vhd`, `cadr/icmem_*.vhd`,
  `cadr1/busint_*.vhd`, `*_book.vhd`, `dip/dip.vhd`, `helper/helper.vhd`,
  and the `ttl/` package files (`sn74.vhd`, `amd.vhd`, `fairchild.vhd`,
  `intel.vhd`, `signetics.vhd`, `ecc.vhd`, `other.vhd`). Change the
  generator, the table or the source entity and run `make regen`.
- Do not change the port list of a `ttl/` entity or a `dip/` wrapper
  unless the task is about that part; `dip/` pin numbers are the ground
  truth for the wiring.
- Every chip model input goes through `ttl_input` from `ttl/misc.vhd`.
  Flip-flops and registers power up as `'0'`; delay-line outputs power up
  as `'H'`. Unconnected page inputs are `'Z'`, which `ttl_input` reads as
  `'1'`.
- Style: `end entity;` and `end architecture;` without names; signal
  prefix `g` for gate, suffix `_n` for active low; keep the term used in
  the schematics for a signal.
- Deviations from the schematics are only made in `Makefile.common`
  (the sed patches) or in the rename tables under `rom/`, and each one
  carries a comment saying why.
- Build artefacts and temporary files go under `build/` or your
  scratchpad, never in the source tree.
- Do not commit unless asked.

## References

- CADR paper: https://tumbleweed.nu/r/lm-3/uv/cadr.html
- Schematics as PNG: `doc/schematics`; SUDS drawings: `doc/ai`
- Datasheets: `doc/ttl/<part>.pdf`, one per `ttl/<part>.vhd`
- Simulator notes: `SIMULATORS.md`; GHDL https://ghdl.github.io/ghdl/;
  NVC https://www.nickg.me.uk/nvc/manual.html
