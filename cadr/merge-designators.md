cadr/*_suds.vhd files are auto-generated. In these files, some labels of component instantiations might be repeated because they port map different pins of the same component. Please create a python script, cadr/merge-designators.py that performs this task. The labels has to be unique.

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

The component instantiations having the same label may not be consecutive lines.

Do not modify any file other than cadr/*_suds.vhd.

Pay attention to the entity name and the pins. The entity names should be same and the pins should not be the same in repeated labels.

If I run, cadr/merge-designators.py X_suds.vhd, X_suds.vhd should be modified accordingly.

If the change succeeds, exit with 0, if not exit with non-zero error code and print the error message.