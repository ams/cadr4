cadr/*_suds.vhd files are auto-generated. In these files, some ports of dip components are not mapped. However, all unused input ports should be set to '0' and all unused output ports should be set to open.

Create a cadr/fix-port-terminations.py script that fixes this problem.

If a port is not mapped, check the dip component. If the dip port is an input port, set it to '0' in the port map. If the dip port is an output port, set it to open.

For example, in cadr/actl_suds.vhd, there is this port map:
```
actl_3b29 : dip_25s09 port map (p1 => destm, p9 => clk3d, p10 => wadr9, p11 => ir23, p12 => gnd, p13 => gnd, p14 => ir22, p15 => wadr8);
```

The p2, p3, p4, p5, p6, p7 of dip_25s09 are missing. This line should be modified to:
```
actl_3b29 : dip_25s09 port map (p1 => destm, p2 => open, p3 => '0', p4 => '0', p5 => '0', p6 => '0', p7 => open, p9 => clk3d, p10 => wadr9, p11 => ir23, p12 => gnd, p13 => gnd, p14 => ir22, p15 => wadr8);
```

because p2 and p7 are output ports and others are input ports.

The definition of all dip components can be found in dip/dip.vhd.

For some component instantiations, the alias might be used. Check dip/dip.vhd for the aliases.

If I run, cadr/fix-port-terminations.py X_suds.vhd, X_suds.vhd should be modified accordingly.

If the change succeeds, exit with 0, if not exit with non-zero error code and print the error message. 