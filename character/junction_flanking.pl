#!usr/bin/perl -w
open ANN,"<Zea_mays.AGPv3.26.gtf" or die "cannot open the file $!";
%start=();%end=();%chr=();
while(<ANN>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[2] eq "exon")
    {
        $tmp[8]=~/transcript_id \"(.*?)\";/;
        $tmp[3]=$tmp[3]-1;
        push @{$start{$1}},$tmp[3];
        push @{$end{$1}},$tmp[4];
        $chr{$1}=join("\t",$tmp[0],$tmp[6]);
    }
}
close ANN;
open OUT,">Zea_mays_junction.flanking" or die "cannot open the file $!";
foreach $key(keys %start)
{
    @s=sort{$a<=>$b} @{$start{$key}};
    @e=sort{$a<=>$b} @{$end{$key}};
    if(scalar(@s)>2)
    {
        print OUT "$key\t$chr{$key}\t$s[0]\t$e[1]\tNA|$e[1]-$s[2]\n";
        foreach $i(1..$#s-2)
        {
            $j=$i+1;
            print OUT "$key\t$chr{$key}\t$s[$i]\t$e[$j]\t$e[$i-1]-$s[$i]|$e[$j]-$s[$j+1]\n";
        }
        print OUT "$key\t$chr{$key}\t$s[$#s-1]\t$e[$#s]\t$e[$#s-2]-$s[$#s-1]|NA\n";
    }
}
close OUT;
