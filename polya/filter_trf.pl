#!usr/bin/perl -w
open IN,"<maize.trf" or die "cannot open the file $!";
%chr=();%start=();%end=();$i=0;
while(<IN>)
{
    chomp;
    @tmp=split/\s+/,$_;
    $chr{$i}=$tmp[0];
    $start{$i}=$tmp[1];
    $end{$i}=$tmp[2];
    $i++;
}
close IN;
open LI,"<t";
open OUT,">t_last";
#open LI,"<./cov_20/cov_20_lessn_unrepeat.junction" or die "cannot open the file $!";
#open OUT,">./cov_20/cov_20_lessn_unrepeat_untrf.junction" or die "cannot open the file $!";
while(<LI>)
{
    chomp;
    @list=split/\:|\|/,$_;
    $flag=0;$file=0;
    if($flag==0)
    {
        foreach $key(keys %start)
        {            
            if($list[0] eq $chr{$key}&&(($list[2]>=$start{$key}&&$list[2]<=$end{$key})||($list[4]>=$start{$key}&&$list[4]<=$end{$key})))
            {
                $flag++;
                $file++;
            }
        }
    }
    if($file==0)
    {
        print OUT "$_\n";
    }
}
close LI;
close OUT;
