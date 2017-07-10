#!usr/bin/perl -w
open IN,"<total_junction_class.count" or die "cannot open the file $!";
open OUT,">total_junction_first.filter" or die "cannot open the file $!";
$header=<IN>;
print OUT "$header";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    $rate_decoy=$tmp[2]/$tmp[1];
    $rate_unmap=$tmp[3]/$tmp[1];
    if($tmp[1]>=10&&$rate_decoy<=0.1&&$rate_unmap<=0.1)
    {
        print OUT "$_\n";
    }
}
close IN;
close OUT;
