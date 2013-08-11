#!/usr/bin/perl -w
use strict;
open( FILE, "/home/administrator/uniprot/uniprot_sprot.dat" ) or die($!);
my $REF;

#open( OUT,  ">/home/administrator/Desktop/OS.txt" ) or die($_);
while ( my $line = <FILE> ) {

	if ( $line =~ /^RN/ ) {
		chomp($line);
		my $str;
		$line =~ s/RN   //g;
		$str = $line;
		while (<FILE>) {
			chomp;
			if (/^CC/) {
				$REF = $REF . " $str";
				print "REF\t$REF\n";
				$REF = '';
				last;
			}
			$_ =~ s/R.   //g;
			$REF .= " $_";
		}
	}
}
close(FILE);

#close(OUT);

#while (<FILE>) {
#	if (/^CC/) {
#		last;
#	}
#	print OUT "$_";
#}
