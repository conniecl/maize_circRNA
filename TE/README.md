This folder contain the scripts for TE analysis
```
RepeatMasker -species maize Zea_mays_genome.fa
perl tophat_junction_flanking.pl
perl ref_rmcirc_flankingintron.pl 
perl junction_te.pl
perl rand_flanking_te.pl $type $number #differnt postion(type), same number of circular RNA(number)
perl calculte.pl $type
perl rcpL1_linear.pl
perl L1_junction_info.pl
```
