#!/usr/bin/perl -w
use strict;
use Getopt::Long;

my $db_file;
my $exp_file;
my $usage = <<__EOUSAGE__;

Usage:

Required options:
  -db_file    <string>  the fasta file
  -exp_file   <string>  the blast report file

__EOUSAGE__

GetOptions(
	'db_file=s'  => \$db_file,
	'exp_file=s' => \$exp_file,
);

unless ( $db_file && $exp_file ) {
	die $usage;
}

open( EXP_FILE, $exp_file );
<EXP_FILE>;    # what does it mean?
my %exp_genes =
  ();          #hash of array: each gene pairs with a list of expression values
my %samples = ()
  ; #samples hash (here is more flexible way to create this mapping): (HUES64,0,Endoderm,1,Ectoderm,2,Mesoderm,3,Hepatoblast-like,4)
while (<EXP_FILE>) {
	chomp;    #delete the "/n" at the end. chomp(<EXP_FILE>)
	my @tokens = split(/\t/)
	  ; # the element of the array is the each tab of line reading from <EXP_FILE>
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
close(EXP_FILE);

print "gene_id";
my @sample_labels = sort { $samples{$a} <=> $samples{$b} } keys %samples;
foreach my $sample_label (@sample_labels) {
	print "\t$sample_label";
}
print "\n";
while ( my ( $gene_id, $values ) = each(%exp_genes) ) {
	print $gene_id;
	foreach my $value ( @{$values} ) {
		print "\t$value";
		print "\n";
	}
}
