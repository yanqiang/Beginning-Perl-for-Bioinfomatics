#!/usr/bin/perl -w
use strict;
my $sq;
open( FILE, "/home/administrator/uniprot/uniprot_sprot.dat" ) or die($!);
open( OUT,  ">/home/administrator/Desktop/new2.txt" ) or die($!);
while ( defined( my $line = <FILE> ) ) {    
	if (   $line =~ /^AC/
		|| $line =~ /^OS/ )
	{
		my @array = split( '   ', $line );
		my $line_types = $array[0];
		print OUT "$line_types\t";
		my $values = $array[1];
		print OUT "$values";
	}
	elsif ($line =~ /^DR   eggNOG;/ig
		|| $line =~ /^DR   Ensembl;/ig )
	{
		chomp($line);
		my @array = split( '   ', $line );
		my @arr   = split( '; ',  $array[1] );
		my $line_types = $arr[0];
		print OUT "$line_types\t";
		foreach my $line (@arr) {
			unless ( $line eq $line_types ) {
				print OUT "$line ";
			}
		}
		print OUT "\n";
	}
	elsif ( $line =~ /^SQ/ ) {
		my @array = split( '   ', $line );
		print OUT "$array[0]\t";
		while (<FILE>) {
			chomp;
			if (/^\/\//) {
				$sq =~ s/ //g;
				print OUT "$sq\n\n";
				$sq = "";
				last;
			}
			$sq .= "$_";
		}
	}elsif($line =~ /^GN/){
		my @array = split( '   ', $line );
		my $line_types = $array[0];
		print OUT "$line_types\t";
		my $values = $array[1];
		$values =~ s/(.*=)(.*)/$2/g;
		print OUT "$values";
	}
}
close(FILE);
close(OUT);
