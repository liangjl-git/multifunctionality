#!/perl -w


use warnings;
use strict;


open (FILE1,"<$ARGV[0]") or die "can't open file $ARGV[0]";#input gene_ko list 
open (FILE2,"<$ARGV[1]") or die "can't open file $ARGV[1]";#input gene_profile file
open (OUT,">$ARGV[2]") or die "can't create file $ARGV[2]";

my $name = ();
my $id2 = ();
my %hash=();

while(my $line = <FILE2>){
	$line =~ s/\s+$//ig;
	my @list = split/\t/,$line;
	$id2 = $list[0];
	$hash{$id2} = $line;
}

while(my $line = <FILE1>){
	$line =~ s/\s+$//ig;
	my @list = split/\s+/,$line;
	$name = $list[0];
	if(exists($hash{$name})){
    print OUT "$hash{$name}\n";	    	
}
}		
