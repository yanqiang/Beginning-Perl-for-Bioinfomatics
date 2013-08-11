#!/usr/bin/perl -w
use strict;




sub judge {
	my ($l) = @_;#"DR   Name=slc10a7; ORFNames=zgc:92251;";
	my @array = split( ';', $l );
	my $count;
	foreach my $jj (@array) {
		$jj =~ s/(.*=)(.*)/$2/g;
		$jj =~ s/ //g;
		if ( "yes" eq detect($jj) ) {
			return "SHEN";
		}
	}
}

sub detect {
	my ($gn) = @_;
	open( ID, "removeDuplication.txt" ) or die($!);
	while ( defined( my $line = <ID> ) ) {
		chomp($line);
		if ( $gn =~ m/^($line)$/ig ) {
			return "yes";
		}
	}
}

