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
    if($line =~ /^ID/){
        my @arr = split('\t', $line);
        $ID = $arr[0];
        $ID_values = $arr[1];
    }elsif($line =~ /^AC/){
    	my @arr = split('\t', $line);
    	my $id = $arr[1];
        $sample{$id}[$hash{$ID}] = $ID_values;
    }
}
while ( my ( $id, $values ) = each(%sample) ) {
	foreach my $value ( @{$values} ) {
		print "\t$value";
		print "\n";
	}
}

#while ( my $line = <FILE> ) {
#	chomp($line);
#    if($line =~ /^ID/){
#        my @arr = split('\t', $line);
#        $ID = $arr[0];
#        $ID_values = $arr[1];
#    }elsif($line =~ /^AC/){
#    	my @arr = split('\t', $line);
#    	my $id = $arr[1];
#        $sample{$id}[$hash{$ID}] = $ID_values;
#    }
#}
