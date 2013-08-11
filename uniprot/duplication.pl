#!/usr/bin/perl -w
use strict;

#this code is to merge the duplication and print out the number of the duplication;
open( FILE, "gene_id.txt" );
open( OUT,  ">removeDuplication.txt" );
my %hash;
while ( defined( my $line = <FILE> ) ) {
	chomp($line);
	$hash{$line} += 1;
	# print "$line,$hash{$line}\n";
}
foreach my $k ( keys %hash ) {
#	print OUT "$k,$hash{$k}\n";    #改行打印出列和该列出现的次数到目标文件
    print OUT "$k\n";
}
close(FILE);
close(OUT);