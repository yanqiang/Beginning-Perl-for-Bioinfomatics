#!/usr/bin/perl -w
use strict;
my %hash = (
	"AC",     0, "ID",    1, "DE", 2, "GN",  3,
	"OS",     4, "OC",    5, "OX", 6, "REF", 7,
	"SQ_LEN", 8, "SQ_MW", 9, "SQ", 10
);
print "gene_id";

#my @sample_labels = keys %hash; #there is no regular order.
#my @sample_labels = sort { $a <=> $b } keys %hash; #order in number.
my @sample_labels =
  sort { $hash{$a} <=> $hash{$b} } keys %hash;    #order in words.
foreach my $sample_label (@sample_labels) {
	print "\t$sample_label";
}
open( FILE, "/home/administrator/Desktop/whole.txt" ) or die($_);
while ( my $line = <FILE> ) {
    if ( $line =~ /^ID/ ) {
		chomp($line);
		my $OC = $line;
		while (<FILE>) {
			chomp;
			if (/\/\//) {
				print "$OC\n";
				$OC = '';
				last;
			}
			$OC .= "\t$_";
		}
	}
}
close(FILE);
