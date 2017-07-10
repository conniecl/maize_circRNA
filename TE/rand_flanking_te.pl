#!usr/bin/perl -w
open LI,"<$ARGV[0].rmcirc.te"or die "cannot open the file $!";
#open LI,"<Zea_mays_flanking_rmcirc.uniq" or die "cannot open the file $!";
while(<LI>)
{
    chomp;
    push @data,$_;
    #print "$tmp[1]\n"; exit 0;
}
close LI;
for(1..1)
{
    %hash=();
    while((keys %hash)<$ARGV[1])
    {
        $hash{int(rand($#data+1))}=1;
    }
    open OUT,">$ARGV[0].$_" or die "Cannot open the file $!";
    #open OUT,">linear_rand_junction.list" or die "Cannot open the file $!";
    foreach (keys %hash)
    {
        print OUT "$data[$_]\n";
    }
    close OUT;
}

