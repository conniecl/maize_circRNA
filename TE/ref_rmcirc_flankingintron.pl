#!usr/bin/perl -w
open LI,"<../circRNA_genename.list" or die "cannot open the file $!";
%hash=();
while(<LI>)
{
    chomp;
    $hash{$_}=1;
}
close LI;
open IN,"<Zea_mays_junction_flanking.bed" or die "$!";
open OUT,">Zea_mays_rmcirc.flank.bed" or die "$!";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[4]=~/GR/)
    {
        $tmp[4]=(split("_",$tmp[4]))[0];
    }
    else
    {
        $tmp[4]=~s/FGT/FG/;
    }
    if(!exists $hash{$tmp[4]})
    {
        print OUT "$_\n";
=pod
        @array=split/\|/,$tmp[5];
        foreach $i(@array)
        {
            if($i ne "NA")
            {
                print OUT "$i\n";
            }
        }
=cut
    }
}
close IN;
close OUT;
