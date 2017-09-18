#!usr/bin/perl -w
open GFF,"<Zea_mays.AGPv3.26.gff3" or die "cannot open the file $!";
open OUT,">Zea_mays_gene.length" or die "cannot open the file $!";
readline GFF;
while(<GFF>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[2] eq "gene")
    {
        $genename=(split(":|;",$tmp[-1]))[1];
        $length=$tmp[4]-$tmp[3]+1;
        print OUT "$genename\t$length\n";
    }
}
close GFF;
close OUT;
