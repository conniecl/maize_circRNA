#!usr/bin/perl -w
open IN,"<../circRNA_exon.len" or die "Cannot open the file $!";
open OUT,">circRNA_exon.avglen" or die "cannot open the file $!";
$m_c=0;$multi=0;$single=0;$s_c=0;$all=0;$c=0;
while(<IN>)
{
    chomp;
    @tmp=split("\t",$_);
    if($tmp[1] eq "multi")
    {
        $multi+=$tmp[0];
        $m_c+=1;
    }
    else
    {
        $single+=$tmp[0];
        $s_c+=1;
    }
    $all+=$tmp[0];
    $c++;
}
$avg=$all/$c;
$avg_m=$multi/$m_c;
$avg_s=$single/$s_c;
print OUT "multi\t$avg_m\n";
print OUT "single\t$avg_s\n";
print OUT "all\t$avg\n";
close IN;
close OUT;
