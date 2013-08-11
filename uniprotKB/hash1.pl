#!/usr/bin/perl -w
use strict;
my %sample;
my %hash = (
	"ID", 0, "DE",  1, "GN",     2, "OS",    3, "OC", 4,
	"OX", 5, "REF", 6, "SQ_LEN", 7, "SQ_MW", 8, "SQ", 9
);
open( FILE, "/home/administrator/Desktop/whole.txt" ) or die($_);

my ( $ID, $ID_values );
while ( my $line = <FILE> ) {
	chomp($line);
	if ( $line =~ /^AC/ ) {
		my @arr = split( '\t', $line );
		$ID                 = $arr[0];
		$ID_values          = $arr[1];
		$sample{$ID_values} = '';
	}
}
open( FILE, "/home/administrator/Desktop/whole.txt" ) or die($_);
while(my $line = <FILE>){
	chomp($line);
	my @arr = split('\t', $line);
	my $id = $arr[0];
	my $val = $arr[1];
	print "$id\t$val\n";	 
	while(<FILE>){
		chomp;
		if(/\/\//){
			last;
		}elsif(/^AC/){
		
		}else{
		my @arr = split('\t');
		my $id = $arr[0];
		my $val = $arr[1];
		print "$id\t$val\n";
		}
	}
}

while ( my ( $gene_id, $values ) = each(%sample) ) {
	foreach my $value ( @{$values} ) {
		print "\t$value";
	}
	print "\n";
}

#foreach my $line (keys %sample){
#		print "$line\n";
#}
