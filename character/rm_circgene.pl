#!usr/bin/perl -w
open IN,"<../reanalysis_circRNA.gene" or die "cannot open the filr $!";
%list=();
while(<IN>)
{
    chomp;
    $list{$_}=1;
}
close IN;
open RE,"<Zea_mays_gene.length" or die "cannot open the file $!";
open OUT,">Zea_mays_rmcirc_gene.length" or die "cannot open the file $!";
open OUT1,">reanalysis_circRNA.gene.length" or die "cannot open the file $!";
while(<RE>)
{
    chomp;
    @tmp=split("\t",$_);
    if(!exists $list{$tmp[0]})
    {
        print OUT "$_\n";
    }
    else
    {
        print OUT1 "$_\n";
    }
}
close RE;
close OUT;
close OUT1;
