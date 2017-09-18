#!usr/bin/perl -w
open LI,"<../reanalysis_circRNA.gene" or die "cannot open the file $!";
while(<LI>)
{
    chomp;
    $hash{$_}=1;
}
close LI;
open IN,"</public/home/luchen/genes.fpkm_table" or die "cannot open the file $!";
open OUT,">b73_rmcirc.gene.fpkm" or die "cannot open the file $!";
readline IN;
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    if(!exists $hash{$tmp[0]})
    {
        print OUT "$_\n";
    }
}
close IN;
close OUT;
