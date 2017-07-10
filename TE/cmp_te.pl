#!usr/bin/perl -w
open IN,"<../$ARGV[0].circ" or die "cannot open the file $!";
open OUT,">$ARGV[0].cmp" or die "cannot open the file $!";
%hash=();%class=();
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    $length=scalar(@tmp);
    if($length>1)
    {
        foreach $i(1..$#tmp)
        {
            if($i%2==0)
            {
                $hash{$tmp[$i]}{$.}=1;
            }
        }
    }
}
close IN;
foreach $key(keys %hash)
{
    $number=scalar(keys %{$hash{$key}});
    $class{$key}=$number;
}
%total=();%up=();%down=();
foreach $in(1..1000)
{
    open LI,"<$ARGV[0].$in.class" or die "cannot open the file $!";
    while(<LI>)
    {
        chomp;
        @tmp=split("\t",$_);
        if(exists $class{$tmp[0]})
        {
            if($class{$tmp[0]}>$tmp[1])
            {
                $up{$tmp[0]}+=1;
            }
            if($class{$tmp[0]}<$tmp[1])
            {
                $down{$tmp[0]}+=1;
            }
        }
        else
        {
            $down{$tmp[0]}+=1;
        }
        $total{$tmp[0]}=1;
    }
    close LI;
}
foreach $key(keys %total)
{
    if(exists $up{$key} && exists $down{$key})
    {
        print OUT "$key\t$up{$key}\t$down{$key}\n";
    }
    elsif(exists $up{$key})
    {
        print OUT "$key\t$up{$key}\t0\n";
    }
    else
    {
        print OUT "$key\t0\t$down{$key}\n";
    }
}
close OUT;
