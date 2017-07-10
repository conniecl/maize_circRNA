open IN,"samtools view -F 4 $ARGV[0].sort.bam|" or die "cannot open the file $!";
    %hash=();
    while(<IN>)
    {
        chomp;
        @tmp=split("\t",$_,2);
        $hash{$tmp[0]}+=1;
    }
    close IN;
    open OUT,">$ARGV[0].mapnumber" or die "cannot open the file $!";
    foreach $key(keys %hash)
    {
        print OUT "$key\t$hash{$key}\n";
    }
    close OUT;
