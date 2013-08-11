#!/usr/bin/perl -w

use strict;

open(FILE, "/home/administrator/Downloads/genes_FPKM.txt") or die($!);

while(<FILE>)
 {
 # Good practice to store $_ value because
 # subsequent operations may change it.
 my($line) = $_;

 # Good practice to always strip the trailing
 # newline from the line.
 chomp($line);

 # Convert the line to upper case.
 #$line =~ tr/[a-z]/[A-Z]/;

 # Print the line to the screen and add a newline
 print "$line\n";
 }