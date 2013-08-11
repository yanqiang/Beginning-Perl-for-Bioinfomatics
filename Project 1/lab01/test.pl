#!/usr/bin/perl -w
use strict;

#open( FILE, "/home/administrator/Desktop/TrinityFunctional.sql");
open(FILE, "/home/administrator/Desktop/schema.sql");
while(<FILE>){
	my $line = $_;
	if($line =~ /Trans_ID/i)
	{
		my @line = split(',',$line);
        foreach my $num (@line)
        {
        	print "$num\n";
        }
	}
}

