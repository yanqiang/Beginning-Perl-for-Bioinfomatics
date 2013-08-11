#!/usr/bin/perl -w
use strict;
my %hash;
my ($count, $count_1, $count_2, $count_3, $count_4, $count_5) = 0;
open(FPKM, "/home/administrator/Downloads/isoforms_FPKM.txt") or die($_);
open(FILE, "/home/administrator/Desktop/switch_zebrafish.txt") or die($_);
<FPKM>;
while(<FPKM>){
	chomp;
	my @arr = split('\t');
	$count_5++;
	if($arr[1]>1){
		$hash{$arr[0]} = $arr[0];
		print "$_\n";
        $count_4++;
	}
}
<FILE>;
while (<FILE>) {
	my @arr  = split('\t');
	my $line = $arr[4];
	if ( $line =~ / / ) {
		$count_1++;
		$count = 0;
		my @array = split( ' ', $line );
		foreach my $str (@array) {
			if ( exists( $hash{$str} ) && ( $count == 0 ) ) {
#				print "$hash{$str}\n";
				$count_3++;
				$count++;
			}
			elsif ( !exists( $hash{$str} ) && ( $count == 0 ) ) {
#				print "\n";
				$count++;
			}
		}
	}
	else {
		$count_2++;
		if ( exists( $hash{$line} ) ) {
#			print "$hash{$line}\n";
		}
		elsif ( !exists( $hash{$line} ) ) {
#			print "\n";
		}
	}
}
print "$count_5\n";
print "$count_3\n";
print "$count_4\n";
print "$count_1+";
print "$count_2=";
print $count_1+ $count_2;
close(FILE);
close(FPKM);