#!/usr/bin/perl -w
# Storing DNA in a variable, and printing it out

# First we store the DNA in a variable called $DNA
$DNA = 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC';

# Next, we print the DNA onto the screen
print $DNA;

# Finally, we'll specifically tell the program to exit.
exit;


#statement use warnings as an alternative to -w.

#You've noticed that the variable name $DNA starts with dollar sign. In Perl this kind of
#variable is called a scalar variable, which is a variable that holds a single item of data.
#Scalar variables are used for such data as strings or various kinds of numbers.
