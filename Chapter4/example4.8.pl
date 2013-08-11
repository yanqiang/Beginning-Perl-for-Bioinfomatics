#!/usr/bin/perl -w
# Demonstration of "scalar context" and "list context"

@bases = ('A', 'C', 'G', 'T');
print "@bases\n";


$a = @bases;
print $a, "\n";
#In this kind of scalar context , an array evaluates to the size of the array, that is, the
#number of elements in the array. The scalar context is supplied by the scalar variable on
#the left side of the statement.

($a) = @bases;
print $a, "\n";
#In this kind of list context , an array evaluates to a list of its elements. The list context is
#supplied by the list in parentheses on the left side of the statement. If there aren't enough
#variables on the left side to assign to, only part of the array gets assigned to variables.
#This behavior of Perl pops up in many situations; by design, many features of Perl behave
#differently depending on whether they are in scalar or list context.
exit;