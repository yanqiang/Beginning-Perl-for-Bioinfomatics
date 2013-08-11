#!/usr/bin/perl -w
use strict;
my %hash;
open( FILE, "/home/administrator/uniprot/uniprot_sprot.dat" ) or die($!);
while(defined(my $line = <FILE>)){
	chomp($line);
	if($line =~ /^OS/){
		if($line =~ m/Frog/ig ){
			$hash{$line}++;
		}
	}
}
foreach my $k ( keys %hash ) {
	print"$k\t$hash{$k}\n";
}
close(FILE);