#!usr/bin/perl -w
open IN,"<reanalysis_circRNA.gene.length " or die "cannot open the file $!";
open OUT,">gene_len.plot" or die "cannot open the file $!";
print OUT "len\ttype\n";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    print OUT "$tmp[1]\tcircular\n";
}
close IN;
open LI,"<linear_genelen.rand1" or die "cannot open the file $!";
while(<LI>)
{
    chomp;
    @tmp=split("\t",$_);
    print OUT "$tmp[1]\tlinear\n";
}
close OUT;
