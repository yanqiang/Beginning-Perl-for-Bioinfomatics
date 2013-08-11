#!/usr/bin/perl -w
use strict;
open( FILE, "/home/administrator/uniprot/uniprot_sprot.dat" ) or die($!);
while ( my $line = <FILE> ) {
	if ( $line =~ /^OC/ ) {
		chomp($line);
		$line =~ s/   /\t/g;
		my $OC;
		$OC = $line;
		while (<FILE>) {
			chomp;
			if (/^OX/) {
				print "$OC\n";
				$OC = '';
				last;
			}
			$_ =~ s/^OC   //g;
			$OC .= " $_";
		}
	}
}
close(FILE);

#	elsif ( $line =~ /^OC/ ) {
#		chomp($line);
#		$line =~ s/   /\t/g;
#		my $OC;
#		$OC = $line;
#		while (<FILE>) {
#			chomp;
#			if (/^OX/) {
#				print "$OC\n";
#				$OC = '';
#				$_ =~ s/(.*)(   .*=)(.*)/$1\t$3/g;
#				$_ =~ s/;//g;
#				print "$_\n";
#				last;
#			}
#			$_ =~ s/^OC   //g;
#			$OC .= " $_";
#		}
#	}