#!usr/bin/perl -w
open IN,"<../reanalysis_circRNA.gene" or die "cannot open the file $!";
%list=();
while(<IN>)
{
    chomp;
    $list{$_}=1;
}
close IN;
open RE,"<../../Zea_mays.AGPv3.26.gff3" or die "cannot open the file $!";
readline RE;
open OUT,">Zea_mays.v3.26_rmcircgene.exonlength" or die "$!";
while(<RE>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[2] eq "exon")
    {
        $tmp[-1]=~/Name=(.+?);/;
        $name=$1;
        if($name=~/GR/)
        {
            $genename=(split("_",$name))[0];
        }
        else
        {
            $genename=(split/\./,$name)[0];
        }
        if(!exists $list{$genename})
        {
            $length=$tmp[4]-$tmp[3]+1;
            print OUT "$length\n";
        }
    }
}
close RE;
close OUT;
