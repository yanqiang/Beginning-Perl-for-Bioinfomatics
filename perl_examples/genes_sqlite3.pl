#!/usr/bin/perl -w
use strict;
use DBI;
my $dbh = DBI -> connect("dbi:SQLite:test.db","","",{ 'RaiseError' => 1, 'AutoCommit' => 1 } )or die DBI::errstr;
$dbh -> do("PRAGMA synchronous = OFF"); #speed up the inserting speed, which is n times than the regular method.
$dbh -> do("BEGIN TRANSACTION");
$dbh -> do("DROP TABLE IF EXISTS zebrafish_exp");
my $sth = $dbh -> prepare("insert into zebrafish_exp (gene_id, FPKM_24cell, FPKM_1Kcell) values(?, ?, ?)");
open(FILE, "/home/administrator/Downloads/isoforms_FPKM.txt") or die($!); 
<FILE>
while(<FILE>)
{ 
	chomp;#delete the "/n" at the end. chomp(<EXP_FILE>)
	my @array  = split(/\t/);# the element of the array is the each tab of line reading from <EXP_FILE>
	my $gene_id  = $array[0];# 
	my $FPKM_24cell = $array[1];
	my $FPKM_1Kcell = $array[2];
	$sth->execute($gene_id, $FPKM_24cell, $FPKM_1Kcell);
}
$sth->finish();
$dbh->disconnect();
