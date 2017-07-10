#!usr/bin/perl -w
open IN,"<circ_fusion.txt" or die "cannot open the file $!";
open OUT,">circexplore.list" or die "cannot open the file $!";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[12]>=2 && $tmp[13] eq "circRNA")
    {
        print OUT "$_\n";
    }
}
close IN;
close OUT;
