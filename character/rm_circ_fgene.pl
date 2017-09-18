#!usr/bin/perl -w
open IN,"<../reanalysis_circRNA.gene" or die "cannot open the filr $!";
%list=();
while(<IN>)
{
    chomp;
    $list{$_}=1;
}
close IN;
open RE,"<Zea_mays_junction.flanking.len" or die "cannot open the file $!";
open OUT,">Zea_mays.v3.26_rmcirc_flanking.length" or die "cannot open the file $!";
while(<RE>)
{
    chomp;
    @tmp=split("\t",$_);
    if(!exists $list{$tmp[1]})
    {
        print OUT "$tmp[0]\n";
    }
}
close RE;
close OUT;
