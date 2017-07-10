open RE,"<Zea_mays_genome.fa.out" or die "cannot open the file $!";
print scalar <RE> for 1..3;
$order=1;
while(<RE>)
{
    chomp;
    @array=split('\s+',$_);
    #print "$array[1]\n"; exit 0;
    if($array[5]=~/chr/)
    {
    $start{$order}=$array[6];
    $end{$order}=$array[7];
    $stand{$order}=$array[9];
    $chr{$order}=$array[5];
    #print "$array[7]\t$array[6]\n";
    $length{$order}=$array[7]-$array[6];
    $repeat{$order}=$array[10];
    $class{$order}=$array[11];
    }
    if($array[4]=~/chr/)
    {
    $start{$order}=$array[5];
    $end{$order}=$array[6];
    $stand{$order}=$array[8];
    $chr{$order}=$array[4];
    #print "$array[7]\t$array[6]\n";
    $length{$order}=$array[6]-$array[5];
    $repeat{$order}=$array[9];
    $class{$order}=$array[10];
    } 
    $order++;
}
close RE;
open IN,"<$ARGV[0]" or die "cannot open the file $!"; #Zea_mays_junction.bed
$i=$ARGV[1];                                          #start of split file
open OUT1,">5_5k.$ARGV[0]" or die "cannot open the file $!";
open OUT2,">5_10k.$ARGV[0]" or die "cannot open the file $!";
open OUT3,">5_15k.$ARGV[0]" or die "cannot open the file $!";
open OUT4,">5_20k.$ARGV[0]" or die "cannot open the file $!";
open OUT5,">5_25k.$ARGV[0]" or die "cannot open the file $!";
open OUT6,">5_30k.$ARGV[0]" or die "cannot open the file $!";
open OUT7,">5_35k.$ARGV[0]" or die "cannot open the file $!";
open OUT8,">3_5k.$ARGV[0]" or die "cannot open the file $!";
open OUT9,">3_10k.$ARGV[0]" or die "cannot open the file $!";
open OUT10,">3_15k.$ARGV[0]" or die "cannot open the file $!";
open OUT11,">3_20k.$ARGV[0]" or die "cannot open the file $!";
open OUT12,">3_25k.$ARGV[0]" or die "cannot open the file $!";
open OUT13,">3_30k.$ARGV[0]" or die "cannot open the file $!";
open OUT14,">3_35k.$ARGV[0]" or die "cannot open the file $!";
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    $start_5k=$tmp[1]-5000;
    $start_10k=$tmp[1]-10000;
    $start_15k=$tmp[1]-15000;
    $start_20k=$tmp[1]-20000;
    $start_25k=$tmp[1]-25000;
    $start_30k=$tmp[1]-30000;
    $start_35k=$tmp[1]-35000;
    $end_5k=$tmp[2]+5000;
    $end_10k=$tmp[2]+10000;
    $end_15k=$tmp[2]+15000;
    $end_20k=$tmp[2]+20000;
    $end_25k=$tmp[2]+25000;
    $end_30k=$tmp[2]+30000;
    $end_35k=$tmp[2]+35000;
    print OUT1 "$i\t";
    print OUT2 "$i\t";
    print OUT3 "$i\t";
    print OUT4 "$i\t";
    print OUT5 "$i\t";
    print OUT6 "$i\t";
    print OUT7 "$i\t";
    print OUT8 "$i\t";
    print OUT9 "$i\t";
    print OUT10 "$i\t";
    print OUT11 "$i\t";
    print OUT12 "$i\t";
    print OUT13 "$i\t";
    print OUT14 "$i\t";
    foreach $key(keys %start)
    {
        if($chr{$key} eq $tmp[0])
        {
            #start part
            if($end{$key}<=$tmp[1]&&$start{$key}>$start_5k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT1 "$repeat{$key}\t$class{$key}\t";#5' 5k 
                }
                else
                {
                    print OUT8 "$repeat{$key}\t$class{$key}\t";#3'5k
                }
            }
            if($end{$key}<=$start_5k&&$start{$key}>$start_10k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT2 "$repeat{$key}\t$class{$key}\t";#5' 10k 
                }
                else
                {
                    print OUT9 "$repeat{$key}\t$class{$key}\t";#3'10k
                }
            }
            if($end{$key}<=$start_10k&&$start{$key}>$start_15k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT3 "$repeat{$key}\t$class{$key}\t";#5' 15k 
                }
                else
                {
                    print OUT10 "$repeat{$key}\t$class{$key}\t";#3'15k
                }
            }
            if($end{$key}<=$start_15k&&$start{$key}>$start_20k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT4 "$repeat{$key}\t$class{$key}\t";#5' 20k 
                }
                else
                {
                    print OUT11 "$repeat{$key}\t$class{$key}\t";#3'20k
                }
            }
            if($end{$key}<=$start_20k&&$start{$key}>$start_25k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT5 "$repeat{$key}\t$class{$key}\t";#5' 25k 
                }
                else
                {
                    print OUT12 "$repeat{$key}\t$class{$key}\t";#3'25k
                }
            }
            if($end{$key}<=$start_25k&&$start{$key}>$start_30k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT6 "$repeat{$key}\t$class{$key}\t";#5' 30k 
                }
                else
                {
                    print OUT13 "$repeat{$key}\t$class{$key}\t";#3'30k
                }
            }
            if($end{$key}<=$start_30k&&$start{$key}>$start_35k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT7 "$repeat{$key}\t$class{$key}\t";#5' 35k 
                }
                else
                {
                    print OUT14 "$repeat{$key}\t$class{$key}\t";#3'35k
                }
            }
            #end part
            if($start{$key}>=$tmp[2]&&$end{$key}<$end_5k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT8 "$repeat{$key}\t$class{$key}\t";#3' 5k
                }
                else
                {
                    print OUT1 "$repeat{$key}\t$class{$key}\t";#5' 5k
                }
            }
            if($start{$key}>=$end_5k&&$end{$key}<$end_10k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT9 "$repeat{$key}\t$class{$key}\t";#3' 10k
                }
                else
                {
                    print OUT2 "$repeat{$key}\t$class{$key}\t";#5' 10k
                }
            }
            if($start{$key}>=$end_10k&&$end{$key}<$end_15k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT10 "$repeat{$key}\t$class{$key}\t";#3' 15k
                }
                else
                {
                    print OUT3 "$repeat{$key}\t$class{$key}\t";#5' 15k
                }
            }
            if($start{$key}>=$end_15k&&$end{$key}<$end_20k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT11 "$repeat{$key}\t$class{$key}\t";#3' 20k
                }
                else
                {
                    print OUT4 "$repeat{$key}\t$class{$key}\t";#5' 20k
                }
            }
            if($start{$key}>=$end_20k&&$end{$key}<$end_25k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT12 "$repeat{$key}\t$class{$key}\t";#3' 25k
                }
                else
                {
                    print OUT5 "$repeat{$key}\t$class{$key}\t";#5' 25k
                }
            }
            if($start{$key}>=$end_25k&&$end{$key}<$end_30k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT13 "$repeat{$key}\t$class{$key}\t";#3' 30k
                }
                else
                {
                    print OUT6 "$repeat{$key}\t$class{$key}\t";#5' 30k
                }
            }
            if($start{$key}>=$end_30k&&$end{$key}<$end_35k)
            {
                if($tmp[3] eq "+")
                {
                    print OUT14 "$repeat{$key}\t$class{$key}\t";#3' 35k
                }
                else
                {
                    print OUT7 "$repeat{$key}\t$class{$key}\t";#5' 35k
                }
            }
        }
    }
    print OUT1 "\n";
    print OUT2 "\n";
    print OUT3 "\n";
    print OUT4 "\n";
    print OUT5 "\n";
    print OUT6 "\n";
    print OUT7 "\n";
    print OUT8 "\n";
    print OUT9 "\n";
    print OUT10 "\n";
    print OUT11 "\n";
    print OUT12 "\n";
    print OUT13 "\n";
    print OUT14 "\n";
    $i++;  
}
close IN;
close OUT1;
close OUT2;
close OUT3;
close OUT4;
close OUT5;
close OUT6;
close OUT7;
close OUT8;
close OUT9;
close OUT10;
close OUT11;
close OUT12;
close OUT13;
close OUT14;
