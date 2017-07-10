up_repeat_fiter.pl
#!usr/bin/perl –w
open IN,"<$ARGV[0]" or die "cannot open the file $!";
open OUT,">$ARGV[1]" or die "cannot open the file $!";
$count=0; %filter=();@list=();
print scalar <IN> for 1..5;
while(<IN>)
{
 chomp;
 @tmp=split("\t",$_);
 $tmp[9]=~s/^chr//;
 @array=split/\||\:/,$tmp[9];
 if($array[-1] eq "-")
 {
     if($tmp[13] eq $array[0]&&(($tmp[15]>=($array[2]-999850)&&$tmp[15]<=($array[2]+150))||($tmp[16]<=($array[2]+150)&&$tmp[16]>=($array[2]-999850))))
      {
       $filter{$tmp[9]}=1;
       print "$_\n"; 
       $count++;
      }
      else
      {
        push @list,$tmp[9];
      }
  }
 else
 {
        if($tmp[13] eq $array[0]&&(($tmp[15]>=($array[4]-999850)&&$tmp[15]<=($array[4]+150))||($tmp[16]<=($array[4]+150)&&$tmp[16]>=($array[4]-999850))))
        {
           $filter{$tmp[9]}=1;
           print "$_\n"; 
           $count++;
        }
        else
        {
            push @list,$tmp[9];
        }
    }
}
foreach $i(@list)
{
    if(!exists $filter{$i})
    {
        print OUT "chr","$i\n"
    }
}
print "$count\n";
close IN;
close OUT;
