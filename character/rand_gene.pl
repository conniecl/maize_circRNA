#!usr/bin/perl -w
open LI,"<Zea_mays_rmcirc_gene.length"or die "cannot open the file $!";
while(<LI>)
{
    chomp;
    push @data,$_;
    #print "$tmp[1]\n"; exit 0;
}
close LI;
for(1..1000)
{
    %hash=();
    while((keys %hash)<$ARGV[0])
    {
        $hash{int(rand($#data+1))}=1;
    }
    open OUT,">linear.rand$_" or die "Cannot open the file $!";
    foreach (keys %hash)
    {
        print OUT "$data[$_]\n";
    }
    close OUT;
}
