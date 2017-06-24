#!/usr/bin/perl

use strict;
use warnings;
# Usage: perl getfastaseq2_works.pl  genelist fasta > newfilename
# # no '>' in genelist
open(GENELIST,$ARGV[0]);
my @genelist = <GENELIST>;

open(FASTA,$ARGV[1]);
my @fasta = <FASTA>;

my ($header,%fasta_hash);

for (my $x=0; $x < scalar(@fasta); $x++) {
        my $line = $fasta[$x];
        chomp($line);
        my $total .= $line if $x==scalar(@fasta) - 1;
        if ($line =~ /^>/ || $x==scalar(@fasta) - 1) {
                if ($total ne "") {
#			print "$header\n"; 
                       $fasta_hash{$header} = $total;
                }
                $header = $line;
                $total = "";
        }else{
                $total.= $line;
                $total =~ s/\s//g;
        }
}

my ($key,$value,$hashkey);

#print "@genelist\n";

foreach $key (@genelist) {
	chomp($key);
	foreach $hashkey (sort keys %fasta_hash) {
		if ($hashkey =~ /^>$key$/) {
#			$key = ">$key";
			$value = $fasta_hash{$hashkey};
        		print "$hashkey\n$value\n";
		}
	}
}


#close(GENELIST);
#close(FASTA);
