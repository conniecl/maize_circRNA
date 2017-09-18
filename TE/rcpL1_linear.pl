#!usr/bin/perl -w
open IN1,"<$ARGV[0]_5upstream.L1" or die "cannot open the file $!";
readline IN1;
while(<IN1>)
{
    chomp;
    @tmp=split("\t",$_);
    $linear=join("_",$tmp[0],$tmp[1],$tmp[2],$tmp[3],$tmp[4]);
    #print "$tmp[8]\t$tmp[-1]\n"; exit 0;
    if($tmp[8] eq "+")
    {
        $five_plus{$linear}+=1;
    }
    else
    {
        $five_mins{$linear}+=1;
    }
}
close IN1;
open IN2,"<$ARGV[0]_3downstream.L1" or die "cannot open the file $!";
readline IN2;
while(<IN2>)
{
    chomp;
    @tmp=split("\t",$_);
    $linear=join("_",$tmp[0],$tmp[1],$tmp[2],$tmp[3],$tmp[4]);
    if($tmp[8] eq "+")
    {
        $three_plus{$linear}+=1;
    }    
    else
    {
        $three_mins{$linear}+=1;
    }
}
close IN2;
foreach $key(keys %five_plus)
{
    $sum=0;
    if(exists $three_mins{$key})
    {
        $sum=$five_plus{$key}*$three_mins{$key};
        $hash{$key}=$sum;
    }
}
foreach $key2(keys %five_mins)
{
    $sum=0;
    if(exists $three_plus{$key2})
    {
        $sum=$five_mins{$key2}*$three_plus{$key2};
        if(exists $hash{$key2})
        {
            $hash{$key2}+=$sum;
        }
        else
        {
            $hash{$key2}=$sum;
        }
    }   
}
open OUT,">$ARGV[0]_L1.rcp" or die "cannot open the file $!";
foreach $i(keys %hash)
{
    print OUT "$i\t$hash{$i}\n";
}
close OUT;
