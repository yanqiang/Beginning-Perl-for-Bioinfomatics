#!/usr/bin/perl -w
use strict;
open( FILE, "/home/administrator/zebrafish_exp/genes_zebrafish2.sql" )or die($!);
open(OUT, ">/home/administrator/zebrafish_exp/output2.txt")or die($!);
my @value = <FILE>;
chomp(@value);
my $value = join('', @value);
my @a = split(';',$value);
$value = $a[2];
print OUT "$value;";