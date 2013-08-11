#!/usr/bin/perl -w

my $line = "PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE zebrafish_exp(
gene_id char(18),
FPKM_24cell double(8,8),
FPKM_1Kcell double(8,8)
);";

$line =~ s/;//g;
print "$line";