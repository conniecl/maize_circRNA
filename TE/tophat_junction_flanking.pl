#!usr/bin/perl -w
open IN,"<Zea_mays_cds.gtf" or die "cannot open the file $!";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    @array=split("\"",$tmp[-1]);
    push @{$start{$array[5]}},$tmp[3];
    push @{$end{$array[5]}},$tmp[4];
    #print "$array[5]\n"; exit 0;
    $stand{$array[5]}=$tmp[6];
    $chr{$array[5]}=$tmp[0];
}
close IN;
open OUT,">Zea_mays_junction_flanking.bed" or die "cannot open the file $!";
foreach $key(keys %start)
{
    @sj=sort{$a<=>$b} @{$start{$key}};
    @ej=sort{$a<=>$b} @{$end{$key}};
    $length=scalar(@sj);
    if($length==1)
    {
        print OUT "$chr{$key}\t$sj[0]\t$ej[0]\t$stand{$key}\t$key\tNA|NA\n";
    }
    elsif($length==2)
    {
        print OUT "$chr{$key}\t$sj[0]\t$ej[1]\t$stand{$key}\t$key\tNA|NA\n";
    }
    elsif($length==3)
    {
        $posS=$sj[2]-$ej[1];
        print OUT "$chr{$key}\t$sj[0]\t$ej[1]\t$stand{$key}\t$key\tNA|$posS\n";
        $posE=$sj[1]-$ej[0];
        print OUT "$chr{$key}\t$sj[1]\t$ej[2]\t$stand{$key}\t$key\t$posE|NA\n";
    }
    else
    {
        $posS=$sj[2]-$ej[1];
        print OUT "$chr{$key}\t$sj[0]\t$ej[1]\t$stand{$key}\t$key\tNA|$posS\n";
        foreach $j(1..($#sj-2))
        {
            $s=$sj[$j]-$ej[$j-1];
            $e=$sj[$j+2]-$ej[$j+1];
            print OUT "$chr{$key}\t$sj[$j]\t$ej[$j+1]\t$stand{$key}\t$key\t$s|$e\n";
        }
        $posE=$sj[$#sj-1]-$ej[$#sj-2];
        print OUT "$chr{$key}\t$sj[$#sj-1]\t$ej[$#sj]\t$stand{$key}\t$key\t$posE|NA\n";
    }
}
close OUT;
