#!/usr/bin/perl


$num_args=$#ARGV+1;
if ($num_args !=1) {
	print "\nUSAGE: make_bedgraph_cov.pl <input>\n";
	exit;
}
$input = "$ARGV[0]";

open (INPUT,$input);

$outm = substr($input,0,-4)."_coverage.bedgraph";
open (OUTPUT, ">$outm");

#print OUTPUT "Chromosome\tStart\tEnd\tPer_methylation\n";
$text=<INPUT>;
while ($text=<INPUT>){
	chomp($text);
	@list=split(/\t/,$text);
	($Chromosome, $Start, $End, $mod, $cov, $per)=@list;


print OUTPUT "$Chromosome\t$Start\t$End\t$cov\n";




}

close (INPUT);
close (OUTPUT);