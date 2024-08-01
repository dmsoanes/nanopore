#!/usr/bin/perl


$num_args=$#ARGV+1;
if ($num_args !=1) {
	print "\nUSAGE: make_bedgraph_stranded.pl <input>\n";
	exit;
}
$input = "$ARGV[0]";

open (INPUT,$input);

$outm_plus = substr($input,0,-4)."_plus.bedgraph";
$outm_minus = substr($input,0,-4)."_minus.bedgraph";
open (OUTPUT_PLUS, ">$outm_plus");
open (OUTPUT_MINUS, ">$outm_minus");

#print OUTPUT "Chromosome\tStart\tEnd\tPer_methylation\n";
$text=<INPUT>;
while ($text=<INPUT>){
	chomp($text);
	@list=split(/\t/,$text);
	($Chromosome, $Start, $End, $stand, $mod, $cov, $per)=@list;
	if ($stand eq "+"){
		print OUTPUT_PLUS "$Chromosome\t$Start\t$End\t$per\n";
	}
	elsif ($stand eq "-"){
		print OUTPUT_MINUS "$Chromosome\t$Start\t$End\t$per\n";
	}


}

close (INPUT);
close (OUTPUT);