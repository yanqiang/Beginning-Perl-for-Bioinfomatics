#!/usr/bin/perl

use DBI;

my $dbh = DBI -> connect("DBI:mysql:mydata", "root", "lushen821999") or die "Can't connect";
open( FILE, "/home/administrator/Desktop/TrinityFunctional.sql");
<FILE>;
<FILE>;
while(<FILE>){
    my $line = $_;
    if($line =~ /^INSERT/){
      $line =~ s/;//g;
      $line =~ s/\"/\`/g;
      print $line;
    }
    else{
    	<FILE>
    }    
}
$dbh->disconnect();