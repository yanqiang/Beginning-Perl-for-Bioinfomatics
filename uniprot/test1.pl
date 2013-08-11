#!/usr/bin/perl -w
use strict;

my $line = "DR   EMBL; AY548484; AAT09700.1; -; Genomic_DNA.";
my @array = split( '   ', $line );
		my @arr   = split( '; ',  $array[1] );
		my $line_types = $arr[0];
		print "$line_types\t";
		foreach my $str ( @arr) {
			unless($str eq $line_types){
				print "$str; ";
			}
		}
		print "\n"
		