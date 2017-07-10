open IN,"<SRR2155397_filter_20.fq" or die "cannot open the file $!";
open OUT21,">SRR2155397_filter_21bp.fastq" or die "cannot open the file $!";
open OUT22,">SRR2155397_filter_22bp.fastq" or die "cannot open the file $!";
open OUT23,">SRR2155397_filter_23bp.fastq" or die "cannot open the file $!";
open OUT24,">SRR2155397_filter_24bp.fastq" or die "cannot open the file $!";
open OUT25,">SRR2155397_filter_25bp.fastq" or die "cannot open the file $!";
while(<IN>)
{
#chomp;
if($_=~/^\@SRR2155/)
{
chomp;
$line2=<IN>;
$line3=<IN>;
$line4=<IN>;
chomp($line2);chomp($line3);chomp($line4);
$length=length($line2);
if($length==21)
{
print OUT21 "$_\n$line2\n$line3\n$line4\n";
}
if($length==22)
{
print OUT22 "$_\n$line2\n$line3\n$line4\n";
}
if($length==23)
{
print OUT23 "$_\n$line2\n$line3\n$line4\n";
}
if($length==24)
{
print OUT24 "$_\n$line2\n$line3\n$line4\n";
}
if($length==25)
{
print OUT25 "$_\n$line2\n$line3\n$line4\n";
}
}
}
close IN;
#close OUT;
