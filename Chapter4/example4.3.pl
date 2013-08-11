#!/usr/bin/perl -w
# Transcribing DNA into RNA
# The DNA
$DNA = 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC';

# Print the DNA onto the screen
print "Here is the starting DNA:\n\n";
print "$DNA\n\n";

# Transcribe the DNA to RNA by substituting all T's with
#U's.
$RNA = $DNA;
$RNA =~ s/T/U/g;
#($RNA = $DNA) =~ s/T/U/g;

# Print the RNA onto the screen
print "Here is the result of transcribing the DNA to
RNA:\n\n";
print "$RNA\n";

# Exit the program.
exit;



#There are two new items in this statement: the binding operator (=~) and the substitute
#command s/T/U/g.
#The binding operator =~ is used, obviously enough, on variables containing strings; here
#the variable $RNA contains DNA sequence data. The binding operator means "apply the
#operation on the right to the string in the variable on the left."
#The substitution operator , shown in Figure 4-1, requires a little more explanation. The
#different parts of the command are separated (or delimited) by the forward slash. First,
#the s indicates this is a substitution. After the first / comes a T, which represents the
#element in the string that will be substituted. After the second / comes a U, which
#represents the element that's going to replace the T. Finally, after the third / comes g.
#This g stands for "global" and is one of several possible modifiers that can appear in this
#part of the statement. Global means "make this substitution throughout the entire string,"
#that is to say, everywhere possible in the string.

#(The substitution operator is an example of the use of regular expressions. Regular
#expressions are the key to text manipulation, one of the most powerful features of Perl as
#you'll see in later chapters.)