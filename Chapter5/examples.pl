#!/usr/bin/perl -w
if( 1 == 1) {
print "1 equals 1\n\n";
}

if( 1) {
print "1 evaluates to true\n\n";
}

if( 1 == 0) {
print "1 equals 0\n\n";
}else {
print "1 does not equal 0\n\n";
}

if( 0 ) {
print "0 evaluates to true\n\n";
}

unless( 1 == 0) {
print "1 does not equal 0\n\n";
}
#The final example is unless—the opposite of if. It works like the English word
#"unless": e.g., "Unless you study Russian literature, you are ignorant of Chekov." If the
#conditional evaluates to true, no action is taken; if it evaluates to false, the associated
#statements are executed. If "you study Russian literature" is false, "you are ignorant of
#Chekov."


