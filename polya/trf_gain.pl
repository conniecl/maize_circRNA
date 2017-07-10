open IN,"<Zea_mays_genome.fa.2.7.7.80.10.50.500.dat" or die "cannot open the file $!";
open OUT,">maize.trf" or die "cannot open the file $!";
while(<IN>)
{
    chomp;
    if($_=~/^Sequence/)
    {
        @tmp=split(": ",$_);
        $chr=$tmp[1];
    }
    elsif($_=~/^\d/)
    {
        @tmp=split/\s+/,$_;
        print OUT "$chr\t$tmp[0]\t$tmp[1]\n";
    }
    else
    {
        next;
    }
}
close IN;
close OUT;
