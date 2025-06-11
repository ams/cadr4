cadr/cadr_*_suds.vhd files are auto-generated. There are three problems in these files and they should be fixed. I will call these suds files.

Create a cadr/fix-suds.py python script that fixes the issues below.

If I run cadr/fix-suds.py cadr_X_suds.vhd, cadr_X_suds.vhd should be modified in-place. There is no need to create a backup file. The argument, the vhd file name can be in the different format, do not assume it is in cadr_X_suds.vhd format.

cadr/fix-suds.py will be run from the project root folder.

If all the modifications succeed, it should exit with 0 without printing anything. If there is a problem, it should exit with non-zero error code and print the error message.

The python script can be tested by running `make suds`. This will create a fresh set of cadr/*_suds.vhd files and execute the python script.

After running the pyhton script, `make` can be used to see if the project compiles successfully.

# Approach

The best approach is to read the vhd file and create a representation (using dictionary, list etc.) of the component instantiations in this vhd file. Then issue 1 can be easily fixed. To fix issue 2, find such signals @designator,pin, and keep them in a list and add them to the ports of the component label page_designator (such as actl_3b30). Finally, to fix issue 3, read the component definition in dip/dip.vhd and add the missing ports with correct termination ('0' or open). It is important to correctly parse dip/dip.vhd, some components also have generic maps in addition to port maps.

# Page Name

Do not use the argument, filename, to derive the page name. Instead, use the architecture line. For example, if the architecture line is:

'architecture suds of cadr_actl is'

then the entity is `cadr_actl` and the page name is `actl`. The entity name is always in the cadr_<PAGE> format.

# Issue 1 - Repeated Designators

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

The port names in the final instantiation should be ordered by pin numbers (e.g. p1, p2, ... p10, p11...).

The component instantiations having the same label may not be consecutive lines.

Pay attention to the entity name and the pins. The entity names should be same and the pins should not be the same in repeated labels. Give an error if this is not the case.

# Issue 2 - @designator,pin signals

In suds files, some ports are mapped to signals of the form \@<DESIGNATOR>,p<NUM>\.

This means that port is connected to p<NUM> of the component instantiation with label <PAGE>_<DESIGNATOR>. Here <PAGE> represents the page name.

However, when two or more components are connected to each other like this, this is wrong, because they have to be the same signal. The script should find such signals, define a new signal with a random name and assign all related ports this signal.

# Issue 3 - port terminations

In suds files, some ports of dip components are not mapped. However, all unused input ports should be set to '0' and all unused output ports should be set to open.

For each component instantiation, check the dip component definition in dip/dip.vhd. If the dip port is an input port, set it to '0' in the port map. If the dip port is an output port, set it to open. There is only input and output ports, no bidirectional or buffer ports. There are also no power/ground pins.

If the component definition cannot be found or if there are multiple definitions in dip/dip.vhd, give an error. 

For example, in cadr/actl_suds.vhd, there is this port map:
```
actl_3b29 : dip_25s09 port map (p1 => destm, p9 => clk3d, p10 => wadr9, p11 => ir23, p12 => gnd, p13 => gnd, p14 => ir22, p15 => wadr8);
```

The p2, p3, p4, p5, p6, p7 of dip_25s09 are missing. This line should be modified to:
```
actl_3b29 : dip_25s09 port map (p1 => destm, p2 => open, p3 => '0', p4 => '0', p5 => '0', p6 => '0', p7 => open, p9 => clk3d, p10 => wadr9, p11 => ir23, p12 => gnd, p13 => gnd, p14 => ir22, p15 => wadr8);
```

because p2 and p7 are output ports and others are input ports. There is no p8 of dip_25s09.