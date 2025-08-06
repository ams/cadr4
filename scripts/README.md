
# Scripts

- `count-dip-components.py`: counts the dip components used in cadr suds files
- `create-tb.py`: create testbench from component (used for cadr_tb)
- `decode-ir.py`: decodes a 48-bit CADR raw instruction to stdout
- `fix-suds.py`: fixes the generated suds files by `soap/soap`
- `generate-alu-tests.py`: generates the test data used for various alu tbs
- `order-component-port-names.py`: order the port names in a package vhd
- `order-entity-port-names.py`: order the port names in an entity vhd
- `split-hex.py`: splits a hex file to smaller hex files to initialize components

## create-entity-from-suds.py

Create the entity VHDL file from the SUDS VHDL file.

## create-package-from-entities.py

Create the package VHDL file containing components for the given entity VHDL files.

## create-tb.py

It generates a master testbench, called cadr_tb in cadr/cadr_tb.vhd at the moment. It uses the given (package) vhd files to find components, creates a signal for each unique port name in all components and then instantiates each component once with a port map, mapping ports to signals of the same name. No other vhdl code can be entered to this file, so everything else should be done in the instantiated components.

## decode-ir.py

Decodes a given CADR IR for human friendly use.

## fix-suds.py

cadr/cadr_*_suds.vhd files are auto-generated and there are a few problems in these files. fix-suds.py is used for this purpose. The problems are:

### Problem 1 - Repeated Designators

In suds files, some labels of component instantiations might be repeated because they port map different pins of the same component. However, the labels has to be unique.

For example, cadr/actl_suds.vhd has these lines:
```
actl_3b30 : dip_74s37 port map (p1 => wp3a, p2 => destd, p3 => \-awpa\);
actl_3b30 : dip_74s37 port map (p4 => wp3a, p5 => destd, p6 => \-awpb\);
actl_3b30 : dip_74s37 port map (p8 => \-awpc\, p9 => destd, p10 => wp3a);
```

this should be merged into a single line:
```
actl_3b30 : dip_74s37 port map (p1 => wp3a, p2 => destd, p3 => \-awpa\, p4 => wp3a, p5 => destd, p6 => \-awpb\, p8 => \-awpc\, p9 => destd, p10 => wp3a);
```

### Problem 2 - @designator,pin signals

In suds files, some ports are mapped to signals of the form \@<DESIGNATOR>,p<NUM>\.

This means that port is connected to p<NUM> of the component instantiation with label <PAGE>_<DESIGNATOR>. Here <PAGE> represents the page name.

Although VHDL-2008 has a new feature called external names, it is not yet supported in GHDL. So external names are not used at the moment.

fix-suds.py finds such signals and where they are assigned to, then creates a new signal with a random name, and connects each such port to this new signal. This approach also supports when more than two ports are connected to the same net.

### Problem 3 - port terminations

In suds files, some ports of dip components are not mapped. However, all unused input ports should be set to '0' and all unused output or inout ports should be set to open.

For example, in cadr/actl_suds.vhd, there is this port map:
```
actl_3b29 : dip_25s09 port map (p1 => destm, p9 => clk3d, p10 => wadr9, p11 => ir23, p12 => gnd, p13 => gnd, p14 => ir22, p15 => wadr8);
```

The p2, p3, p4, p5, p6, p7 of dip_25s09 are missing. This line should be modified to:
```
actl_3b29 : dip_25s09 port map (p1 => destm, p2 => open, p3 => '0', p4 => '0', p5 => '0', p6 => '0', p7 => open, p9 => clk3d, p10 => wadr9, p11 => ir23, p12 => gnd, p13 => gnd, p14 => ir22, p15 => wadr8);
```

because p2 and p7 are output ports and others are input ports. There is no p8 of dip_25s09.

### Problem 4 - generic maps

The suds files may contain PROMs or RAMs that have to be initialized or preloaded from a hex file. It is possible to do this externally with sed etc., but there are a lot of RAMs so sed approach is not feasible.

A generic-map table (such as rom/promh9.table) is used for this purpose. fix-suds.py reads this file and adds a generic mapping to given component instantiations.

## generate-alu-tests.py

It is used to generate sn74181, alu_16bit, alu_32bit and cadr_alu (same as alu_32bit) test vectors. The files are added to repo, so they are not generated at build time.

## split-hex.py

It is used to generate hex files for PROMs and RAMs used in CADR.

dspctl and mskg4 hex files are fixed and stored in rom folder. These are not generated.

prom0 hex files are generated from promh.mcr.9.hex or fast-promh.mcr.hex. prom1 is initialized to zero.

If fast-promh.mcr.hex is used, memories have to be initialized and some of them have to be preloaded with values. The ones having values are given in: amem.hex, dram.hex, mmem.hex, vmem0.hex. These are used to generate the smaller hex files for individual components in respective cadr components.

The new smaller hex files are generated under build folder and not added to repo.