#!/usr/bin/perl -w
use strict;
open( FILE, "/home/administrator/uniprot/uniprot_sprot.dat" ) or die($!);
#open(OUT, ">/home/administrator/Desktop/human.txt") or die($!);
my %hash;
while ( defined( my $line = <FILE> ) ) {
	chomp($line);
	if ( $line =~ /^OS/ ) {
		$hash{$line} += 1;

		# print "$line,$hash{$line}\n";
	}
}
#insert an order line !!!
foreach my $k ( keys %hash ) {
	print "$k\t$hash{$k}\n"
	  ;    #改行打印出列和该列出现的次数到目标文件

	#    print OUT "$k\n";
}
close(FILE);
#close(OUT);