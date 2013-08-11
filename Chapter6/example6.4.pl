#!/usr/bin/perl -w
# Example of pass-by-value (a.k.a. call-by-value)
use strict;
my $i = 2;
simple_sub($i);
print "In main program, after the subroutine call, \$i
equals $i\n\n";
exit;
###########################################################
#####################
# Subroutines
###########################################################
#####################
sub simple_sub {
	my ($i) = @_;
	$i += 100;
	print "In subroutine simple_sub, \$i equals $i\n\n";
}
