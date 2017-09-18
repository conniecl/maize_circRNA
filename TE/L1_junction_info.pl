#!usr/bin/perl -w
open RE,"<../../circ_te/Zea_mays_genome.fa.out.L1" or die "cannot open the file $!";
$order=1;
while(<RE>)
{
    @array=split('\s+',$_);
    $start{$order}=$array[6];
    $end{$order}=$array[7];
    $stand{$order}=$array[9];
    $chr{$order}=$array[5];
    $repeat{$order}=$array[10];
    $order++;
}
close RE;
open IN,"<$ARGV[0].list" or die "cannot open the file $!";
open OUT1,">$ARGV[0]_5upstream.L1" or die "cannot open the file $!";
open OUT2,">$ARGV[0]_3downstream.L1" or die "cannot open the file $!";
open OUT3,">$ARGV[0]_in.L1" or die "cannot open the file $!";
print OUT1 "genename\tchromosome\tstart\tend\tstand\tdistance\tstart_L1\tend_L1\tstand_L1\trepeat\n";
print OUT2 "genename\tchromosome\tstart\tend\tstand\tdistance\tstart_L1\tend_L1\tstand_L1\trepeat\n";
print OUT3 "genename\tchromosome\tstart\tend\tstand\tdistance\tstart_L1\tend_L1\tstand_L1\trepeat\n";
#readline IN;
while(<IN>)
{
    chomp;
    @brray=split("\t",$_);
    $start_upstream=$brray[3]-35000;
    $end_downstream=$brray[4]+35000;
    foreach $key(keys %start)
    {
        if($chr{$key} eq $brray[1])
        {
            if($start{$key}>=$start_upstream && $end{$key}<=$brray[3])
            {
                $dis=$brray[3]-$end{$key};
                if($brray[2] eq "+")
                {
                    print OUT1 "$brray[0]\t$brray[1]\t$brray[3]\t$brray[4]\t$brray[2]\t$dis\t$start{$key}\t$end{$key}\t$stand{$key}\t$repeat{$key}\n";
                }
                else
                {
                    print OUT2 "$brray[0]\t$brray[1]\t$brray[3]\t$brray[4]\t$brray[2]\t$dis\t$start{$key}\t$end{$key}\t$stand{$key}\t$repeat{$key}\n";
                }
            }
            if($start{$key}>=$brray[4] && $end{$key}<=$end_downstream)
            {
                $dis=$start{$key}-$brray[4];
                if($brray[2] eq "+")
                {
                    print OUT2 "$brray[0]\t$brray[1]\t$brray[3]\t$brray[4]\t$brray[2]\t$dis\t$start{$key}\t$end{$key}\t$stand{$key}\t$repeat{$key}\n";
                }
                else
                {
                    print OUT1 "$brray[0]\t$brray[1]\t$brray[3]\t$brray[4]\t$brray[2]\t$dis\t$start{$key}\t$end{$key}\t$stand{$key}\t$repeat{$key}\n";
                }
            }
            if($start{$key}>$brray[3] && $end{$key}<$brray[4])
            {
                if($brray[2] eq "+")
                {
                    $dis=$start{$key}-$brray[3];
                    print OUT3 "$brray[0]\t$brray[1]\t$brray[3]\t$brray[4]\t$brray[2]\t$dis\t$start{$key}\t$end{$key}\t$stand{$key}\t$repeat{$key}\n";
                }
                else
                {
                    $dis=$brray[4]-$end{$key};
                    print OUT3 "$brray[0]\t$brray[1]\t$brray[3]\t$brray[4]\t$brray[2]\t$dis\t$start{$key}\t$end{$key}\t$stand{$key}\t$repeat{$key}\n";
                }
            }
        }
    }
}
close IN;
close OUT1;
close OUT2;
close OUT3;
