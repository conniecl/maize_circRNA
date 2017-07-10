#!usr/bin/perl -w
@file=glob("*.count");
foreach $in(@file)
{
    open IN,"<$in" or die "cannot open the file $!";
    $header=<IN>;
    while(<IN>)
    {
        chomp;
        @tmp=split("\t",$_);
        $sample{$tmp[0]}+=$tmp[1];
        $decoy{$tmp[0]}+=$tmp[2];
        $unmap{$tmp[0]}+=$tmp[3];
    }
    close IN;
}
open OUT,">total_junction_class.count" or die "Cannot open the file $!";
print OUT "$header";
foreach $key(keys %sample)
{
    print OUT "$key\t$sample{$key}\t$decoy{$key}\t$unmap{$key}\n";
}
close OUT;
