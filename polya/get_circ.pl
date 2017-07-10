open IN,"<list" or die "cannot open the file $!";
while(<IN>)
{
    chomp;
    $i=$_;
    @file=glob("/public/home/lchen/software/KNIFE-master/circularRNApipeline_Standalone/pangenome/circ$i/circReads/reports/*.txt");
    print "$file[0]\n";
    open FI,"<$file[0]";
    open OUT,">/public/home/lchen/software/KNIFE-master/circularRNApipeline_Standalone/pangenome/$i.circ";
    scalar <FI> for 1..2;
    while(<FI>)
    {
        chomp;
        @tmp=split("\t",$_);
        if($tmp[0]=~/rev|dup/ && $tmp[7]>=0.9)
        {
            print OUT "$_\n";
        }
    }
    close FI;
    close OUT;
}
close IN;
