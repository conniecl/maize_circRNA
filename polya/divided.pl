#!usr/bin/perl –w
open FA,"<$ARGV[0]" or die "cannot open the file $!";
while(<FA>)
{
    chomp;
    if($_=~/>/)
    {
        s/\>//g;
        $ID=$_;
    }
    else
    {
        $hash{$ID}.=$_;
}
}
close FA;
open OUT1,">$ARGV[1]" or die "cannot open the file $!";
open OUT2,">$ARGV[2]" or die "cannot open the file $!";
$i=1;
foreach $key(keys %hash)
{
$up=substr($hash{$key},0,150);
$down=substr($hash{$key},150,300);
print OUT1 ">","circ$i\n$up\n";
print OUT2 ">","circ$i\n$down\n";
$i++;
}
close OUT1;
close OUT2;
