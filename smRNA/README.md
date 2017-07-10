fastq-dump SRR2155397.sra
~/software/fastx_toolkit-0.0.14/bin/fastq_quality_filter -q 20 -p 100 -i SRR2155397.fastq -o SRR2155397_filter_20.fq
fastqc  SRR2155397_filter_20.fq
perl  gain_specific_len.pl 
#for different read size, repeat the following processes:
bowtie -n 0 -p 19 -a /public/home/lchen/reference/bowtie1_index/Zea_mays_genome SRR2155397_filter_${len}bp.fastq -S SRR2155397_${len}bp.sam
samtools view -@ 19 -bS SRR2155397_${len}bp.sam >SRR2155397_${len}bp.bam
samtools sort -@ 19 SRR2155397_${len}bp.bam SRR2155397_${len}bp.sort
samtools index SRR2155397_${len}bp.sort.bam
perl mapnumber.pl SRR2155397_${len}
for i in $(cat circ_junction_rcp.L1);
do
samtools view SRR2155397_${len}bp.sort.bam $i;
done >SRR2155397_${len}bp.rcp.sam
for i in $(cat circ_junction_un_rcp.L1.rand);
do
samtools view SRR2155397_${len}bp.sort.bam $i;
done >SRR2155397_${len}bp.unrcp.sam
perl L1_tpm.pl SRR2155397_${len}bp circ_junction_un_rcp.L1.rand unrcp
