polyA-seleced data process
===========================
These scripts have been tested on various Linux distributions. Before they can be run, make sure that the following prerequisites are installed:
>Perl  
>Python  
>Bowtie2  
>KNIFE  
>TRF  
>BLAT  

To identity circular RNA form polyA-seleced dataset, run the following commands:
```
#MAKE DB
python makeExonDB.py -f ../circularRNApipeline_Standalone/index/Zea_mays_genome.fa -a /public/home/lchen/reference/test.gtf -o ./cds
python makeJunctionsAndWriteFasta.py -w 1000000 -e cds/exons -r cds/records -f cds/fastas –v
cat cds/fastas/*.fa > Zea_mays_cds.fa
python limitFasta.py -s Zea_mays_cds.fa -o cds/fastas/ -t reg -p _junctions_reg
python limitFasta.py -s Zea_mays_cds.fa -o cds/fastas/ -t dup -p _junctions_dup
python limitFasta.py -s Zea_mays_cds.fa -o cds/fastas/ -t rev -p _junctions_rev
cat cds/fastas/Zea_mays_cds_junctions_rev.fa cds/fastas/Zea_mays_cds_junctions_dup.fa > Zea_mays_cds_junctions_scrambled.fa
#circRNA prediction
sh /software/KNIFE-master/circularRNApipeline_Standalone/completeRun.sh /RNA complete /software/KNIFE-master/circularRNApipeline_Standalone ww 13 maize_phred33 circReads 100 > ww.log
```

To filter the false positive cirular RNAs, run the following scripts 
```
perl get_circ.pl
perl combine.pl
perl first_filter.pl
perl filter_lessN_junction.pl
perl divided.pl
blat Zea_mays_genome.fa total_junction_second.filter.up.fa total_junction_second.filter.up.psl
blat Zea_mays_genome.fa total_junction_second.filter.down.fa total_junction_second.filter.down.psl
perl up_repeat_fiter.pl
perl down_repeat_filter.pl
trf Zea_mays_genome.fa 2 7 7 80 10 50 500 -f -d -m
perl trf_gain.pl
perl filter_trf.pl
```
