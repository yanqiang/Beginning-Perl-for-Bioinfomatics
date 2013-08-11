#!/usr/bin/perl -w
# Determining frequency of nucleotides, take 3
# Get the DNA sequence data
print "Please type the filename of the DNA sequence data: ";
$dna_filename = <STDIN>;
chomp $dna_filename;

# Does the file exist?
unless ( -e $dna_filename ) {
	print "File \"$dna_filename\" doesn\'t seem to
exist!!\n";
	exit;
}

# Can we open the file?
unless ( open( DNAFILE, $dna_filename ) ) {
	print "Cannot open file \"$dna_filename\"\n\n";
	exit;
}
@DNA = <DNAFILE>;
close DNAFILE;
$DNA = join( '', @DNA );

# Remove whitespace
$DNA =~ s/\s//g;

# Initialize the counts.
# Notice that we can use scalar variables to hold numbers.
$a = ($DNA =~ tr/Aa//);
$c = ($DNA =~ tr/Cc//);
$g = ($DNA =~ tr/Gg//);
$t = ($DNA =~ tr/Tt//);
$e = (length $DNA) - ($DNA =~ tr/ATGC//);
#$basecount = ($DNA =~ tr/ATGC//);
#$full = length $DNA;
# Use a regular expression "trick", and five while loops,
# to find the counts of the four bases plus errors
print "A=$a C=$c G=$g T=$t errors=$e\n";
# exit the program
exit;