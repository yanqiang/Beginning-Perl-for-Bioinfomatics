#!/usr/bin/perl -w
use strict;
open(FILE,"/home/administrator/Desktop/output.txt");
open(OUT, ">/home/administrator/Desktop/switch_zebrafish.txt");
<FILE>;
print OUT "AC\tGN\tOS\teggNOG\tEnsemble\tSQ\n";
while(<FILE>){
	chomp;
    my $line = $_;
    if($line =~/Danio rerio \(Zebrafish\) \(Brachydanio rerio\)/){
	$line =~ s/(.*\t)(.*\t)(.*\t)(.*\t)(.*\t)(.*\t)/$1$6$4$3$5$2/g;
	print OUT "$line\n";
    }
}
close(FILE);
close(OUT);