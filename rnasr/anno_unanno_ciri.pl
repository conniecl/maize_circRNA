#!usr/bin/perl -w
open ANN,"<Zea_mays.gtf" or die "cannot open the file $!";
%splice=();
while(<ANN>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[2] eq "exon")
    {
        $splice{$tmp[0]}{$tmp[3]}=1;
        $splice{$tmp[0]}{$tmp[4]}=1;
    }
}
close ANN;
open IN,"<ww.CIRI" or die "cannot open the file $!";
readline IN;
open OUT,">ciri_anno.list" or die "cannot open the file $!";
open OUT1,">ciri_junction.list" or die "cannot open the file $!";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[4]>=2 && $tmp[8] eq "exon")
    {
        if(exists $splice{$tmp[1]}{$tmp[2]} && exists $splice{$tmp[1]}{$tmp[3]})
        {
            print OUT "$tmp[1]\t$tmp[2]\t$tmp[3]\t$tmp[4]\n";
        }
        print OUT1 "$tmp[1]\t$tmp[2]\t$tmp[3]\t$tmp[4]\n";
    }
}
close IN;
close OUT;
close OUT1;
