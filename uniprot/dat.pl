#!/usr/bin/perl -w

use strict;

open(DAT_FILE, "/home/administrator/uniprot/uniprot_sprot.dat") or die($!);
open(OUT, ">test.txt")or die($!);
while(<DAT_FILE>){
	if($_ =~ /^GN/){
		my @array = split('; ');
        foreach my $value(@array){
        	$value =~ s/(.*=)(.*)/$2/;
            $value =~ s/;//;
        	print OUT "$value";
        }
	}
}
