#!/perl -w


use warnings;
use strict;


open (FILE,"<$ARGV[0]") or die "can't open file $ARGV[0]";#input kegg.4level.output
open (OUT,">$ARGV[1]") or die "can't create file $ARGV[1]";#output abundance file

my %hash_dna = ();

while(my $line = <FILE>){
	$line =~ s/\s+$//ig;
	my @list = split/\t/,$line;
	my $count = $list[3];
	$count .= "\t";
	$count .= $list[4];
        if($hash_dna{$count}){
         	$hash_dna{$count} = $hash_dna{$count} + 1;
         }
         else{
                	$hash_dna{$count} = 1;
         }

}

foreach my $key (keys %hash_dna){
	print OUT "$key\t$hash_dna{$key}\n";
}