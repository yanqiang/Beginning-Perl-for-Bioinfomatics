#!/usr/bin/perl -w
use strict;
my %gene_id = ();
my %line_types =
  ( "AC", 0, "GN", 1, "OS", 2, "eggNOG", 3, "Ensemble", 4, "SQ", 5 );
my $sq;
open(ID, "removeDuplication.txt") or die($!);
open( FILE, "/home/administrator/Desktop/uniprot.txt" ) or die($!);
while ( defined( my $line = <FILE> ) ) {
		$line =~ s/(;|\.)//g;
	if (   $line =~ /^AC/
		|| $line =~ /^OS/
		|| $line =~ /^DR   eggNOG/
		|| $line =~ /^DR   Ensembl/ )
	{
		my @array = split( '   ', $line );
		my $line_types = $array[0];
		print "$line_types\t";
		my $values = $array[1];
		print "$values";
	}
	elsif ( $line =~ /^SQ/ ) {
		my @array = split( '   ', $line );
		print "$array[0]\t";
		while (<FILE>) {
			chomp;
			if (/^\/\//) {
				$sq =~ s/ //g;
				print "$sq";
				$sq = "";
				last;
			}
			$sq .= "$_";
		}
	}elsif($line =~ /^GN/){
		my @array = split( '   ', $line );
		my $line_types = $array[0];
		print "$line_types\t";
		my $values = $array[1];
		$values =~ s/(.*=)(.*)/$2/g;
		print "$values";
	}
	while(<ID>){
		chomp;
		
	}
}
