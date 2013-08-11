#!/usr/bin/perl -w
use strict;
my %sample = ();
my %hash = (
	"ID", 0, "DE",  1, "GN",     2, "OS",    3, "OC", 4,
	"OX", 5, "REF", 6, "SQ_LEN", 7, "SQ_MW", 8, "SQ", 9
);
my ($AC);
open( FILE, "/home/administrator/Desktop/new.txt" ) or die($!);
open(OUT , ">/home/administrator/Desktop/new1.txt") or die($!);
while(my $line = <FILE>){
	chomp($line);
	my @arr = split('\t', $line);
	my $ID = $arr[0];
	my $VAL = $arr[1];	 
	while(<FILE>){
		chomp;
		if(/\/\//){
			my %hash = (
	"ID", 0, "DE",  1, "GN",     2, "OS",    3, "OC", 4,
	"OX", 5, "REF", 6, "SQ_LEN", 7, "SQ_MW", 8, "SQ", 9);
			last;
		}elsif(/^AC/){
		my @arr = split('\t');
		$AC = $arr[1];
		}else{
		my @arr = split('\t');
		my $id = $arr[0];
		my $val = $arr[1];
        $sample{$AC}[$hash{$id}] = $val;
		}
	}
	$sample{$AC}[$hash{$ID}] = $VAL;
}
print OUT "AC\tID\tDE\tGN\tOS\tOC\tOX\tREF\tSQ_LEN\tSQ_MW\tSQ\n";
while ( my ( $gene_id, $values ) = each(%sample) ) {
	print OUT "$gene_id";
	foreach my $value ( @{$values} ) {
		print OUT "\t$value";
	}
	print OUT "\n";
}
close(FILE);
close(OUT);