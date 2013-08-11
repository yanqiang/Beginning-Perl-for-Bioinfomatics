#!/usr/bin/perl -w
use strict;
my %gene_id = ();
my %line_types =
  ("ID",0, "AC", 1, "GN", 2, "OS", 3, "eggNOG", 4, "Ensembl", 5, "SQ", 6);
open( FILE, "/home/administrator/Desktop/new1.txt" ) or die($!);
#open( ID, "gene_id") or die($!);
#open( OUT, ">/home/administrator/Desktop/new.txt") or die($!);
while ( defined( my $line = <FILE> ) ) {
	chomp($line);
	my @array = split('\t', $line);
	print "$array[0]\n";
	print "$array[1]\n";
	
}
