#!/usr/bin/perl -w
use strict;
my ( $sq, $OS, $REF );
open( FILE, "/home/administrator/uniprot/uniprot_sprot.dat" ) or die($!);
open( OUT,  ">/home/administrator/Desktop/whole.txt" ) or die($!);
while ( defined( my $line = <FILE> ) ) {
	if ( $line =~ /^AC/ ) {
		$line =~ s/   /\t/g;
		my @arr = split( ';', $line );
		my $str = $arr[0];
		print OUT "$str\n";
	}
	elsif ( $line =~ /^RN/ ) {
		chomp($line);
		my $str;
		$line =~ s/RN   //g;
		$str = $line;
		while (<FILE>) {
			chomp;
			if (/^CC/) {
				$REF = $REF . " $str";
				$REF =~ s/^ //g;
				print OUT "REF\t$REF\n";
				$REF = '';
				last;
			}
			$_ =~ s/R.   //g;
			$REF .= " $_";
		}
	}
	elsif ( $line =~ /^SQ/ ) {
		my @array = split( '   ', $line );
		my @arr   = split( ';  ', $array[2] );
		$arr[0] =~ s/ AA//g;
		$arr[1] =~ s/ MW//g;
		print OUT "SQ_LEN\t$arr[0]\n";
		print OUT "SQ_MW\t$arr[1]\n";
		print OUT "$array[0]\t";
		while (<FILE>) {
			chomp;
			if (/^\/\//) {
				$sq =~ s/ //g;
				print OUT "$sq\n";
				print OUT "//\n";
				$sq = "";
				last;
			}
			$sq .= "$_";
		}
	}
	elsif ( $line =~ /^GN/ ) {
		my @array = split( '   ', $line );
		my $line_types = $array[0];
		print OUT "$line_types\t";
		my $values = $array[1];
		$values =~ s/(.*=)(.*)/$2/g;
		$values =~ s/;//g;
		print OUT "$values";
	}
	elsif ( $line =~ /^OS/ ) {
		{
			chomp($line);
			$line =~ s/   /\t/g;
			$OS = $line;
			while (<FILE>) {
				chomp;
				if (/^OC/) {
					while ( $OS =~ / \(/ ) {
						$OS =~ s/(.*)( \(.*)/$1/g;
					}
					print OUT "$OS\n";
					$OS = '';
					chomp;
					$_ =~ s/   /\t/g;
					my $OC;
					$OC = $_;
					while (<FILE>) {
						chomp;
						if (/^OX/) {
							print OUT "$OC\n";
							$OC = '';
							$_ =~ s/(.*)(   .*=)(.*)/$1\t$3/g;
							$_ =~ s/;//g;
							print OUT "$_\n";
							last;
						}
						$_ =~ s/^OC   //g;
						$OC .= " $_";
					}
					last;
				}
				$OS .= $_;
			}
		}
	}
	elsif ( $line =~ /^ID/ ) {
		$line =~ s/ +/\t/g;  #that helps to remove the repeat spaces in one line
		my @arr = split( '\t', $line );
		print OUT "$arr[0]\t$arr[1]\n";
	}
	elsif ( $line =~ /^DE   RecName:/ ) {
		$line =~ s/(.*)(   .*=)(.*)/$1\t$3/g;
		$line =~ s/;//g;
		print OUT "$line";
	}
}
close(FILE);
close(OUT);
