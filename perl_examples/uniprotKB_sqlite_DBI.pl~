#!/usr/bin/perl -w
use strict;
use DBI;
my $dbh = DBI -> connect("dbi:SQLite:test.db","","",{ 'RaiseError' => 1, 'AutoCommit' => 1 } )or die DBI::errstr;
my $sth =$dbh -> do("PRAGMA synchronous = OFF"); #speed up the inserting speed, which is n times than the regular method.
$sth = $dbh -> do("BEGIN TRANSACTION");
$sth = $dbh -> do("CREATE UNIQUE INDEX uniprotKB_INDEX ON uniprotKB (AC)");
$sth = $dbh -> do("CREATE INDEX GN_INDEX ON uniprotKB (GN)");
$sth = $dbh -> do("CREATE INDEX OS_INDEX ON uniprotKB (OS)");
$sth = $dbh -> do("CREATE INDEX DE_INDEX ON uniprotKB (DE)");
$sth = $dbh -> prepare("insert into uniprotKB (AC,     ID,      DE,      GN,      OS,      OC,      OX,      REF,     SQ_LEN,  SQ_MW,   SQ) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
open(FILE, "/home/administrator/Desktop/new1.txt") or die($!); 
<FILE>;
while(<FILE>){ 
	chomp;#delete the "/n" at the end. chomp(<EXP_FILE>)
	my @array  = split(/\t/);# the element of the array is the each tab of line reading from <EXP_FILE>
	my $AC = $array[0];# 
	my $ID = $array[1];
	my $DE = $array[2];
        my $GN = $array[3];# 
	my $OS = $array[4];
	my $OC = $array[5];
        my $OX = $array[6];# 
	my $REF = $array[7];
	my $SQ_LEN = $array[8];
        my $SQ_MW = $array[9];# 
	my $SQ = $array[10];
	$sth->execute($AC, $ID, $DE, $GN, $OS, $OC, $OX, $REF, $SQ_LEN, $SQ_MW, $SQ);
}
$sth->finish();
$dbh->disconnect();
