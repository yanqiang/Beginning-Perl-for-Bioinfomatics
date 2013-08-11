#!/usr/bin/perl -w
use strict;
use DBI;
my $dbh = DBI -> connect("dbi:SQLite:test.db","","",{ 'RaiseError' => 1, 'AutoCommit' => 1 } )or die DBI::errstr;
my $sth = $dbh -> do("PRAGMA synchronous = OFF");
$sth = $dbh -> prepare("insert into human_exp(gene_id, HUES64, Endoderm, Ectoderm, Mesoderm, Hepatoblast_like) values(?, ?, ?, ?, ?, ?)");
open(FILE, "/home/administrator/mmc2.txt") or die($!);
<FILE>;# what does it mean?
my %exp_genes = (); #hash of array: each gene pairs with a list of expression values
my %samples = (); #samples hash (here is more flexible way to create this mapping): (HUES64,0,Endoderm,1,Ectoderm,2,Mesoderm,3,Hepatoblast-like,4)
while (<FILE>) {
	chomp;
	my @tokens   = split(/\t/);
	my $gene_id  = $tokens[1]; 
	my $sample_1 = $tokens[4];
	my $sample_2 = $tokens[5];
	my $value_1  = $tokens[7];
	my $value_2  = $tokens[8];
	if ( !exists( $samples{$sample_1} ) ) {
		$samples{$sample_1} = keys %samples;
	}
	if ( !exists( $samples{$sample_2} ) ) {
		$samples{$sample_2} = keys %samples;
	}
	$exp_genes{$gene_id}[ $samples{$sample_1} ] = $value_1;
	$exp_genes{$gene_id}[ $samples{$sample_2} ] = $value_2;
}
close(FILE);
while ( my ( $gene_id, $values ) = each(%exp_genes) ) {
    my $gene = $gene_id;
    my $HUES64 = @{$values}[0];
    my $Endoderm = @{$values}[1];
    my $Ectoderm = @{$values}[2];
    my $Mesoderm = @{$values}[3];
    my $Hepatoblast_like = @{$values}[4];
    $sth->execute($gene, $HUES64, $Endoderm, $Ectoderm, $Mesoderm, $Hepatoblast_like);
}
$sth->finish();
$dbh->disconnect();
