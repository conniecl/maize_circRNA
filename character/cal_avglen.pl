#!usr/bin/perl -w
use List::Util qw/sum/;
#open OUT,">avg_length" or die "cannot open the file $!";
#foreach $in(1..1000)
#{
    #open IN,"<linear.rand$in" or die "cannot open the file $!";
    open IN,"<reanalysis_circRNA.gene.length" or die "cannot open the file $!";
    open OUT,">avg_circRNA" or die "cannot open the file $!";
    @list=();
    while(<IN>)
    {
        chomp;
        @tmp=split("\t",$_);
        push @list,$tmp[1];
    }
    close IN;
    $avg=sum(@list)/scalar(@list);
    print OUT "$avg\n";
#}
close OUT;
