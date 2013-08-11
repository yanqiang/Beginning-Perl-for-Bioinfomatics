#!/usr/bin/perl -w

use strict;

open(MMC_FILE, "/home/administrator/mmc2.txt") or die($!);;
#open(DAT_FILE, "/home/administrator/uniprot/uniprot_sprot.dat");
while(<MMC_FILE>){
	my @lines = split(/\t/);
	my $lines = $lines[2];	
}
close(MMC_FILE);