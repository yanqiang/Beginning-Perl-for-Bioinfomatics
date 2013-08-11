#!/usr/bin/perl -w
use strict;
open(FILE, "/home/administrator/uniprot/uniprot_sprot.dat") or die($!);
while(defined(my $line = <FILE>)){
	if($line =~ /^AC/ ||$line =~ /^GN/|| $line =~ /^OS/||$line =~ /^DR   eggNOG/||$line =~ /^DR   Ensembl/){
		my @array = split('  ', $line);
		$array[1] =~ s/(.*)(.*=)(.*)/$3/g;
		$array[1] =~ s/;//g;
		$array[1] =~ s/\.//g;
		print "$array[1]";
	}
}
close(FILE);