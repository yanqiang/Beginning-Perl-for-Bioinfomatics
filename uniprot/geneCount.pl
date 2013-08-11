#!/usr/bin/perl -w
use strict;

#use hash to search and compare between the both ID.
my %hash;
my ( $count_1, $count_2 ) = 0;
my $count = 0;
open( FILE, "/home/administrator/Desktop/switch.txt" ) or die($_);
open( GENE, "removeDuplication.txt" ) or die($_);
<FILE>;
while (<GENE>) {
	chomp;
	my $line = uc($_);
	$hash{$line} = $line;
}
while (<FILE>) {
	my @arr  = split('\t');
	my $line = $arr[1];
	$line = uc($line);
	if ( $line =~ /\,/ ) {
		$count_1++;
		$count = 0;
		my @array = split( ', ', $line );
		foreach my $str (@array) {
			$str = uc($str);
			if ( exists( $hash{$str} ) && ( $count == 0 ) ) {
				print "$hash{$str}\n";
				$count++;
			}
			elsif ( !exists( $hash{$str} ) && ( $count == 0 ) ) {
				print "\n";
				$count++;
			}
		}
	}
	else {
		$count_2++;
		if ( exists( $hash{$line} ) ) {
			print "$hash{$line}\n";
		}
		elsif ( !exists( $hash{$line} ) ) {
			print "\n";
		}
	}
}
print "$count_1+";
print "$count_2=";
print $count_1+ $count_2;
close(FILE);
close(GENE);