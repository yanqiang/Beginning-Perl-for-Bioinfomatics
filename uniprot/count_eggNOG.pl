#!/usr/bin/perl -w
use strict;
my ($count1, $count2);
open(FILE, "/home/administrator/Desktop/new2.txt")or die($!);
while(defined(my $line = <FILE>)){
	if($line =~/Homo sapiens \(Human\)/){
		$count2++;
		while(<FILE>){
			if(/^eggNOG/){
				$count1++;
			}elsif(/^SQ/){
				last;
			}
		}
	}
}
print "$count1\n";
print "$count2";