#!/usr/bin/perl -w
use strict;
open( FILE, "/home/administrator/Desktop/whole.txt" ) or die($!);
while ( my $line = <FILE> ) {
	if ( $line =~ /^ID/ ) {
		chomp($line);
		$line =~ s/^ID\t//g;
		print "$line";
		while (<FILE>) {
			chomp;
			if (/\n/) {
				last;
			}
			my @arr = split('\t');
			print "\t$arr[1]";
		}
		print "\n";
	}
}
close(FILE);
