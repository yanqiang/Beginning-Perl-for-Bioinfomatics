#!/usr/bin/perl -w
use strict;
open( FILE, "/home/administrator/uniprot/uniprot_sprot.dat" ) or die($!);
#open( OUT, ">/home/administrator/Desktop/OS.txt") or die($_);
while(my $line = <FILE>){
	if($line =~ /^DE   RecName:/){
		$line =~ s/(.*)(   .*=)(.*)/$1\t$3/g;
		$line =~ s/;//g;
		print "$line";
	}
}
close(FILE);
#close(OUT);