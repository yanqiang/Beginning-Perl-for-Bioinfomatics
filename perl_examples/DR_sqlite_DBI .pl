#!/usr/bin/perl -w
use strict;
use DBI;
my $dbh = DBI -> connect("dbi:SQLite:test.db","","",{ 'RaiseError' => 1, 'AutoCommit' => 1 } )or die DBI::errstr;
my $sth = $dbh -> do("PRAGMA synchronous = OFF"); #speed up the inserting speed, which is n times than the regular method.
#$dbh -> do("BEGIN TRANSACTION");
$sth = $dbh -> do("create table uniprotKB(AC varchar(30), ID varchar(30), value varchar(30)");
$sth = $dbh -> do("CREATE INDEX AC_INDEX ON DR (AC)");
$sth = $dbh -> do("CREATE INDEX ID_INDEX ON DR (ID)");
$sth = $dbh -> do("CREATE INDEX value_INDEX ON DR (value)");
$sth = $dbh -> prepare("insert into DR (AC, ID, value) values(?, ?, ?)");
open(FILE, "/home/administrator/Desktop/DR.txt") or die($!); 
<FILE>;
while(<FILE>){ 
	chomp;#delete the "/n" at the end. chomp(<EXP_FILE>)
	my @array  = split(/\t/);# the element of the array is the each tab of line reading from <EXP_FILE>
	my $AC = $array[0];# 
	my $ID = $array[1];
	my $value = $array[2];
	$sth->execute($AC, $ID, $value);
}
$sth->finish();
$dbh->disconnect();
