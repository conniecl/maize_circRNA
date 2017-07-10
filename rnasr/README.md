RNaseR treated process
=======================
To identity circular RNA form RNaseR treated dataset, run the following commands:
```
#CIRCexplorer2
tophat2 -o tophat_fusion -p 20 --fusion-search --keep-fasta-order --bowtie1 --no-coverage-search Zea_mays_genome *_R1.fastq *_R2.fastq
CIRCexplorer2 parse --pe -t TopHat-Fusion tophat_fusion/accepted_hits.bam > CIRCexplorer2_parse.log
CIRCexplorer2 annotate -r Zea_mays.AGPv3.26.gpd -g Zea_mays_genome.fa --low-confidence circ_out > CIRCexplorer2_annotate.log
CIRCexplorer2 assemble -r Zea_mays.AGPv3.26.gpd -p 20 --bb --tophat-dir=/tophat_fusion ./circ_out > CIRCexplorer2_assemble.log
perl filter_circexplorer2.pl #filter
#circ_finder
STAR --runMode genomeGenerate --runThreadN 6 --genomeDir ./ --genomeFastaFiles Zea_mays_genome.fa --sjdbGTFfile Zea_mays.gtf
runStar.pl *R1.fastq *_R2.fastq /star_index ./maize_star.
perl postProcessStarAlignment.pl ./ ./output
#CIRI
bwa mem -T 19 -t 19 Zea_mays_genome.fa *_R1.fastq *_R2.fastq >*_bwa_mem.sam
perl CIRI_v1.2.pl -P -I *_bwa_mem.sam -O *.CIRI -F Zea_mays_genome.fa -A Zea_mays.gtf
#gain exonic annonate circRNA
perl anno_unanno_ciri.pl #filter
```
