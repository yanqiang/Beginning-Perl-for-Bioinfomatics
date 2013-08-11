#!/usr/bin/perl -w
use strict;
my %gene_id = ();
my %line_types = ("AC", '', "GN", '', "OS", '', "eggNOG", '', "Ensembl", '', "SQ", '' );
open( FILE, "/home/administrator/Desktop/new2.txt" ) or die($!);
open( OUT, ">/home/administrator/Desktop/output.txt") or die($!);
print OUT "AC\tSQ\teggNOG\tOS\tEnsembl\tGN\n";
while (<FILE>) {
	chomp;
        $_ =~ s/(;|\.)//g;
	if (/^\s*$/) {
		while ( my ( $gene_id, $values ) = each(%line_types) ) {
#			print "$gene_id\t";
			print OUT "$values\t";
		}
		print OUT "\n";
		%line_types = ("AC", '', "GN", '', "OS", '', "eggNOG", '', "Ensembl", '', "SQ", '' );
	}elsif(!/^\s*$/){
	my @tokens = split(/\t/);
	my $types  = $tokens[0];
	my $data   = $tokens[1];
	$line_types{$types} = $data;
	}
}
close(FILE);
close(OUT);
