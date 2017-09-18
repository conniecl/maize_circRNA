#!usr/bin/perl -w
open IN,"<Zea_mays_junction.flanking" or die "cannot open the file $!";
open OUT,">Zea_mays_junction.flanking.len" or die "cannot open the file $!";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[0]!~/GR/)
    {
        $tmp[0]=~s/FGT/FG/;
        $gene=$tmp[0];
    }
    else
    {
        @array=split("_",$tmp[0]);
        $gene=$array[0];
    }
    @intron=split/\|/,$tmp[-1];
    if($intron[0] eq "NA")
    {
        if($intron[1] ne "NA")
        {
            @array=split/-/,$intron[1];
            $len=$array[1]-$array[0]+1;
            print OUT "$len\t$gene\n";
        }
    }
    if($intron[1] eq "NA")
    {
        if($intron[0] ne "NA")
        {
            @array=split/-/,$intron[0];
            $len=$array[1]-$array[0]+1;
            print OUT "$len\t$gene\n";
        }
    }
    if($tmp[-1]!~/NA/)
    {
        @array=split/-/,$intron[0];
        $len=$array[1]-$array[0]+1;
        print OUT "$len\t$gene\n";
        @array=split/-/,$intron[1];
        $len=$array[1]-$array[0]+1;
        print OUT "$len\t$gene\n";
    }

}
close OUT;
