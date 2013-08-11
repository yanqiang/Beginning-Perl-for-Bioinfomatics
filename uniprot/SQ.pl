#!/usr/bin/perl -w
use strict;
open(DAT_FILE, "/home/administrator/uniprot/uniprot_sprot.dat") or die($!);
#open(OUT, ">/home/administrator/Desktop/SQ.txt");
my $sq;
while(defined (my $line=<DAT_FILE>)){
	if($line =~ /^SQ/){
		print "$line";
		while(<DAT_FILE>){
			chomp;
			if(/^\/\//){
				$sq =~ s/ //g;
				print "$sq\n";
				$sq = "";
				last;
			}
		    $sq .= "$_";
		}	
	}
}
close(DAT_FILE);
#close(OUT);