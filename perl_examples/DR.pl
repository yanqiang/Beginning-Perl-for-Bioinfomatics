#!/usr/bin/perl -w
use strict;
my $str;
open( FILE, "/home/administrator/uniprot/uniprot_sprot.dat" ) or die($!);
open (OUT, ">/home/administrator/Desktop/DR.txt") or die($!);
print OUT "AC\tID\tVALUE\n";
while(my $line = <FILE>){
	if($line =~ /^AC/){
		$line =~ s/   /\t/g;
	    my @arr = split(';', $line); #
	    $str = $arr[0];
	    $str =~ s/^AC\t//g;
	}
	elsif ($line =~ /^DR   /ig )
	{
		chomp($line);
		$line =~ s/^DR   //g;
		my @arr   = split( '; ',  $line );
		print OUT "$str\t$arr[0]\t";
		print OUT "$arr[1]\n";
	}
}
close(FILE);
close(OUT);
