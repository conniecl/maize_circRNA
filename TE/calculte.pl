#!usr/bin/perl -w
#@file=glob("$ARGV[0]/3*");
foreach $in(1..1)
{
    open IN,"<$ARGV[0].$in" or die "cannot open the file $!";
    %class=();
    #$out=(split("\/",$in))[1];
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
                    $class{$tmp[$i]}{$.}=1;
                }
            }
        }
    }
    close IN;
    open OUT,">$ARGV[0].$in.class" or die "cannot open the file $!";
    foreach $key1(keys %class)
    {
       @key2=keys %{$class{$key1}};
       $length1=scalar(@key2);
       print OUT "$key1\t$length1\n";
    }
    close OUT;
}
