#!/usr/bin/perl -w
use strict;
open( FILE, "/home/administrator/uniprot/uniprot_sprot.dat" ) or die($!);
my $OS;
while ( my $line = <FILE> ) {
	chomp($line);
	if ( $line =~ /^OS/ ) {
		$OS = $line;
		while(<FILE>){
			chomp;
			if(/^OC/){
				while($OS =~ / \(/){
					$OS =~ s/(.*)( \(.*)/$1/g;
				}
				print "$OS\n";
				$OS ='';
				last;
			}
			$OS .= $_;
		}
	}
}
close(FILE);

