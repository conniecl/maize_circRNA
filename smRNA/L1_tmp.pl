#!usr/bin/perl -w
open GE,"<$ARGV[0].mapnumber" or die "cannot open the file $!";
#SRR521118
%genome=();$count=0;
while(<GE>)
{
    @array=split("\t",$_);
    $genome{$array[0]}=$array[1];
    $count++;
}
close GE;
open LI,"<$ARGV[1]" or die "cannot open the file $!";
#/public/home/lchen/v3_repeat/L1_pos_rand.bed
#/public/home/lchen/circRNA_combine/rcp_L1.bed
open OUT,">$ARGV[0]_$ARGV[2].tpm" or die "cannot open the file $!";
while(<LI>)
{
    chomp;
    $i=$_;
    open IN,"samtools view $ARGV[0].sort.bam $i|" or die "cannot open the file $!";
    %hash=();$sum=0;$avg=0;
    while(<IN>)
    {
        chomp;
        @tmp=split("\t",$_,2);
        $hash{$tmp[0]}+=1;
    }
    close IN;
    foreach $key(keys %hash)
    {
        $sum+=$hash{$key}/$genome{$key};
    }
    $avg=$sum/$count;
    print OUT "$i\t$avg\n";
}
close OUT;
