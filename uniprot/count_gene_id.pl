#!/usr/bin/perl -w
use strict;

#use hash to search and compare between the both ID.
my %hash;
open( FILE, "/home/administrator/Desktop/switch.txt" ) or die($_);
open( GENE, "removeDuplication.txt" ) or die($_);
<FILE>;
while (<GENE>) {
	chomp;
	my $line = uc($_);
	$hash{$line} = $line;
}
while (<FILE>) {
	my @arr = split('\t');
	my $line = $arr[1];
	$line = uc($line);
	if ( exists( $hash{$line} ) ) {
		print "$hash{$line}\n";
#		delete $hash{$line};
	}
	elsif ( !exists( $hash{$line} ) ) {
#		print "\n";
	}
}
close(FILE);

