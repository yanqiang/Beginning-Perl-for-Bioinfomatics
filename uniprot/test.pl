#!/usr/bin/perl -w
use strict;

#open(FILE, "test.txt");
#while(<FILE>){
#	print "$_";
#}
#my $str = "岳麓支行湖南省长沙市分行";
#$str =~ s/(.*支行)(.*省)(.*)/$2$3$1/;
#print "$str";

#my $strs = "lushen";
#my $string = "sh";
#if($strs =~ /$string/){
#print "$strs\n";
#}


#solution:
#first step: division by split via ";"and convert into an array
#second step: each array is extracted by foreach and remove the part in front of "=" by s/(.*=)(.*)/$2/g
#third step: remove the whitespace and \t, \n, etc.

#detect whether the new.txt is divided by '\t'
#open( FILE, "/home/administrator/Desktop/new.txt") or die($!);
#while(defined(my $line = <FILE>)){
#	chomp($line);
#	my @array = split( '\t', $line );
#	my $line_types = $array[1];
#	print "$line_types\n";
#}
#close(FILE);

my $l = "Name=slc10a7; ORFNames=zgc:92251;";
my @array = split( ';', $l );
    my $jj = $array[0]; 
	$jj=~ s/(.*=)(.*)/$2/g;
	$jj=~ s/ //g;
	if ( "yes" eq detect($jj) ) {
		print "shen\n";
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

my $lines = "P68711; Q76ZP8;	MITLFLILCYFILIFNIIVPAISEKMRRERAAYVNYKRLNKNFICVDDRLFSYNFTTSGIKAKVAVDNKNVPIPCSKINEVNNNKDVDTLYCDKDRDDIPGFARSCYRAYSDLFFTT	0	Vaccinia virus (strain Ankara) (VACV).	0	OrderedLocusNames=MVA131L, ACAM3000_MVA_131";
$lines =~ s/(.*\t)(.*\t)(.*\t)(.*\t)(.*\t)(.*)/$1$6$4$3$5$2/g;
print "$lines\n";