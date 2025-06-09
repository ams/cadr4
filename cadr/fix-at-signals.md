cadr/*_suds.vhd files are auto-generated. In these files, some ports are mapped to signals of the form \@<DESIGNATOR>,p<NUM>\.

For example, for cadr/X_suds.vhd, this means that port is connected to p<NUM> of the component instantiation with label X_<DESIGNATOR>.

Create a cadr/fix-at-signals.py script, that fixes this problem.

It should define a signal of the same name, \@<DESIGNATOR>,p<NUM>\.

It should connect the relevant pin of X_<DESIGNATOR> to this signal.

The original port map will continue working since it already uses the same signal.

If I run, cadr/fix-at-signals.py X_suds.vhd, X_suds.vhd should be modified accordingly.

If the change succeeds, exit with 0, if not exit with non-zero error code and print the error message. 