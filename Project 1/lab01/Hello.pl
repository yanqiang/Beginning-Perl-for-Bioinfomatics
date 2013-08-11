#print "Hello world \n";
#$count =1;

#while($count <=5){
#    print "$count \t";
#    $count +=1;
#}

#print "\n";

#for ($count2 = 1; $count2<=5; $count2 ++){
#    print "$count2 \t";
#}

#print "\n";

#do{
#   print "Enter a number: ";
#  $input = <>;
#}while($input > 1);

#use strict;
#use warnings;

#my $random = int(rand(10)+1);
#print "$random \n";

#print "Enter a number: ";
#    my $guess = <>;
#if($guess == $random){
#    print "you get it!!!\n"
#}
#else{
#    print "Sorry...please try again\n";
#}

#print "Enter a number: ";
#my $num = <>;

#if ($num >0){
#    print "the number you entered is greater than 0\n";
#}
#elsif($num < 0){
#    print "The number you entered is less than 0\n";
#}
#else{
#    print "The number you entered is equal to 0\n";
#}

#print "Enter a number: ";
    #my $num1 = <>;
#print "Enter a number: ";
    #my $num2 = <>;
#print "ADD：", ($num1+$num2), "\n";
#print "SUB：", ($num1-$num2), "\n";
#print "Divide: ", ($num1/$num2), "\n"; 
#print "Multi: ", ($num1*$num2), "\n";

my $value = "lushen821999";
$value =~ s/l.s//g;
print $value;