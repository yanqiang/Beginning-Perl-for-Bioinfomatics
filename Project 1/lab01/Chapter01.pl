#!/usr/bin/perl

use DBI;

print "Hello\n";

my @drivers = DBI -> available_drivers;
print join(", ", @drivers), "\n";
#display all the drivers available in your computer.
print "\n\n";
#connect the sql driever in your computer(if it does not work, it will throw a massage "Can't connnect" vie die)
# Q: what does the "my" mean?
my $dbh = DBI -> connect("DBI:mysql:mydata", "root", "lushen821999") or die "Can't connect";
#the method I used.
print "method 1: dump\n";
#to prepare the statement sql will execute.
$sth = $dbh -> prepare("select*from Ko") or die "Can't prepare sql statement" . DBI -> errstr;
#execute your statement you set.
$sth->execute();
#show the result of executing the statement in prepare. 
$sth->dump_results();
#terminate the execution of that statement.
$sth->finish();
#terminate the connection.
#$dbh->disconnect();
#use this method you will get all the content of the table and you can't dump out only one line or one column information. 

print "method 2: array\n";
my $sth = $dbh->prepare("select name, wins, losses from teams");
$sth->execute();
while(my @row=$sth->fetchrow_array()){
	print "name=$row[0]\n";
	print "wins=$row[1]\n";
	print "losses=$row[2]\n";
	print "\n";
}
print $sth->rows, "rows were retrieved. \n";
$sth->finish();
$dbh->disconnect();

print "method 3: hash\n";
$sth=$dbh->prepare("select name,wins, losses from teams");
