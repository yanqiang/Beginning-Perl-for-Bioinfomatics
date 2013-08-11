#!/usr/bin/perl -w
# Reading protein sequence data from a file, take 3
# The filename of the file containing the protein sequence
#data
$proteinfilename = 'NM_021964fragment.pep';

# First we have to "open" the file
open( PROTEINFILE, $proteinfilename );

# Read the protein sequence data from the file, and store
#it
# into the array variable @protein
@protein = <PROTEINFILE>;

# Print the protein onto the screen
print @protein;

# Close the file.
close PROTEINFILE;

#exit;

# Here's one way to declare an array, initialized with a
#list of four scalar values.
@bases = ( 'A', 'C', 'G', 'T' );

# Now we'll print each element of the array
print "Here are the array elements:";
print "\nFirst element: ";
print $bases[0];
print "\nSecond element: ";
print $bases[1];
print "\nThird element: ";
print $bases[2];
print "\nFourth element: ";
print $bases[3];

@bases = ( 'A', 'C', 'G', 'T' );
print "\n\nHere are the array elements: ";
print @bases, "\n\n";

@bases = ( 'A', 'C', 'G', 'T' );
$base1 = pop @bases;
print "Here's the element removed from the end: ";
print $base1, "\n\n";
print "Here's the remaining array of bases: ";
print "@bases", "\n\n";

@bases = ( 'A', 'C', 'G', 'T' );
$base2 = shift @bases;
print "Here's an element removed from the beginning: ";
print $base2, "\n\n";
print "Here's the remaining array of bases: ";
print "@bases", "\n\n";

@bases = ( 'A', 'C', 'G', 'T' );
$base1 = pop @bases;
unshift( @bases, $base1 );
print "Here's the element from the end put on the beginning:
";
print "@bases\n\n";

@bases = ( 'A', 'C', 'G', 'T' );
$base2 = shift @bases;
push( @bases, $base2 );
print "Here's the element from the beginning put on the end:
";
print "@bases\n\n";

@bases = ( 'A', 'C', 'G', 'T' );
@reverse = reverse @bases;
print "Here's the array in reverse: ";
print "@reverse\n\n";

@bases = ( 'A', 'C', 'G', 'T' );
print "Here's the length of the array: ";
print scalar @bases, "\n\n";

@bases = ( 'A', 'C', 'G', 'T' );
splice( @bases, 2, 0, 'X' );

# 0 is the number of the words that will be removed after the inserted word.
print "Here's the array with an element inserted after the
2nd element: ";
print "@bases\n\n";
exit;
