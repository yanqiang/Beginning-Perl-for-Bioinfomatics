#!/usr/bin/perl
# Example of pass-by-reference (a.k.a. call-by-reference)
use strict;
use warnings;
my @i = ( '1', '2', '3' );
my @j = ( 'a', 'b', 'c' );
print "In main program before calling subroutine: i = " . "@i\n";
print "In main program before calling subroutine: j = " . "@j\n";
reference_sub( \@i, \@j );
print "In main program after calling subroutine: i = " . "@i\n";
print "In main program after calling subroutine: j = " . "@j\n";
exit;
###########################################################
#####################
# Subroutines
###########################################################
#####################
sub reference_sub {
	my ( $i, $j ) = @_;
	print "In subroutine : i = " . "@$i\n";
	print "In subroutine : j = " . "@$j\n";
	push( @$i, '4' );
	shift(@$j);
}
