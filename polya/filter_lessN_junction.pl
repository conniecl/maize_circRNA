#!usr/bin/perl -w
open FA,"</public/home/lchen/software/KNIFE-master/circularRNApipeline_Standalone/index/Zea_mays_junctions_scrambled.fa" or die "cannot open the file $!";
#open FA,"<total_junction_first.filter.fa" or die "cannot open the file $!";
while(<FA>)
{
    if($_=~/>/)
    {
        chomp;
        s/\>//g;
        $ID=$_;
    }
    else
    {
        $hash{$ID}.=$_;
    }
}
close FA;
#open IN,"<total_junction_fifth.filter.junction" or die "cannot open the file $!";
open IN,"<$ARGV[0]" or die "cannot open the file $!";
open OUT,">$ARGV[1]" or die "cannot open the file $!";
#open IN,"<./iso_seq/iso_support.circRNA" or die "cannot open the file $!";
#open OUT,">total_junction_fifth.filter.fa" or die "cannot open the file $!";
#open OUT,">./iso_seq/iso_support.circRNA.fa" or die "cannot open the file $!";
#readline IN;
while(<IN>)
{
    chomp;
    #@tmp=split("\t",$_);
    print OUT ">";
    #print OUT "$tmp[0]\n";
    print OUT "$_\n";
    #print OUT "$hash{$tmp[0]}";
    print OUT "$hash{$_}";
}
close IN;
close OUT;

#!usr/bin/perl -w
open IN,"<$ARGV[0]" or die "cannot open the file $!";
open OUT,">$ARGV[1]" or die "cannot open the file $!";
%hash=();
while(<IN>)
{
    if($_=~/>/)
    {
        $ID=$_;
    }
    else
    {
        $hash{$ID}.=$_;
    }
}
close IN;
foreach $key(keys %hash)
{
    @tmp=split("\n",$hash{$key});
    #if($tmp[1]!~/^N/ &&$tmp[2]!~/^N/ &&$tmp[3]!~/^N/)
    if($tmp[2]!~/^N/&&$tmp[2]!~/N$/)
    {
        print OUT "$key","$hash{$key}";
    }
}
close OUT;
