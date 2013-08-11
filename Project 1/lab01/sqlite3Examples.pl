#!/usr/bin/perl
use strict;
use DBI;
# dbi module
my $database = "test";
my $hostname = "localhost";
my $dsn = "DBI:mysql:database=$database;host=$hostname";
my $user = "testuser"; my $pass = "userpass";
# dbh = database handler
# connecting to the database by DBI
my $dbh = DBI::->connect( $dsn, $user, $pass,
{ 'RaiseError' => 1, 'AutoCommit' => 1 } )
or die DBI::errstr;
# handling the database.
# to disconnect fromthe database
$dbh->disconnect;
