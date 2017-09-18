###gene length comparsion###
```
perl b73_genelength.pl
perl rm_circgene.pl
perl rand_gene.pl
perl cal_avglen.pl
perl plot.pl
### plot by R
library(ggplot2)
data<-read.table("genelength_cmp.plot",header=T)
fig<-ggplot(data)+geom_boxplot(aes(x=factor(type,levels=c("linear","circular")),y=log(length,10),fill=type),outlier.size = 0.5)+theme_bw()+theme(legend.position='none',panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))+scale_fill_manual(values=c("red","blue"))
ggsave(fig,filename="gene_length_cmp.svg",height=5,width = 5)
```

###exon length comparsion##
```
perl b73_exonlen.pl
perl rand_gene.pl ###change the input file， B73 gene length to exon length
perl cal_avglen.pl 
perl cal_circ_exon.pl
### plot by R
library(ggplot2)
data1<-read.table("exon_lengthcmp.plot",header=T)
data2<-read.table("exon_len_avg.plot",header=T)
fig<-ggplot()+geom_violin(data=data1,aes(x=factor(type,levels=c("linear","circular","mutil","single")),y=log(length,10),color=type))+geom_point(data=data2,aes(x=factor(type,levels=c("linear","circular","mutil","single")),y=log(length,10),color=type))+theme_bw()+theme(legend.position='none',panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))+scale_fill_manual(values=c("red","blue","red","red"))
ggsave(fig,filename="exonlength_cmp.svg",height=5,width = 5)
```

####flanking intron comparsion##
```
perl junction_flanking.pl
perl flanking_len.pl
perl rm_circ_fgene.pl
perl rand_intron.pl
perl cal_avglen.pl
### plot by R
library(ggplot2)
data<-read.table("flankingintron_cmp.plot",header=T)
fig<-ggplot(data)+geom_boxplot(aes(x=factor(type,levels=c("linear","circular")),y=log(length,10),fill=type),outlier.size = 0.5)+theme_bw()+theme(legend.position='none',panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))+scale_fill_manual(values=c("red","blue"))
ggsave(fig,filename="flanking_intron_length_cmp.svg",height=5,width = 5)
```

###RNA seq data analysis, two repeat, trim and align step are same
```
fastqc -t 2 M_WW-1_R1.fastq.gz  M_WW-1_R2.fastq.gz
fastqc M_WW-1.read2_Clean.fastq.gz
java -jar software/Trimmomatic-0.33/trimmomatic-0.33.jar PE -phred33 -threads 20 M_WW-1_R1.fastq.gz M_WW-1_R2.fastq.gz M_WW-1_R1_trim.fastq M_WW-1_R1_unpair.fastq M_WW-1_R2_trim.fastq M_WW-1_R2_unpair.fastq ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
tophat2 bowtie2_index/Zea_mays_genome MaizeWWA_1_trim.fastq MaizeWWA_2_trim.fastq -G Zea_mays.AGPv3.26.gff3  -p 20
cuffmerge -o ./ -p 20 -s bowtie2_index/Zea_mays_genome.fa -g Zea_mays_genes.gtf merge.txt
cuffquant -o ./b73_quant_b -p 20 -b bowtie2_index/Zea_mays_genome.fa -u Zea_mays_genes.gtf RNA/wwb/tophat_out/accepted_hits.bam
cuffquant -o ./b73_quant_a -p 20 -b bowtie2_index/Zea_mays_genome.fa -u Zea_mays_genes.gtf RNA/wwa/tophat_out/accepted_hits.bam
cuffnorm -p 20 -o b73_norm Zea_mays_genes.gtf b73_quant_a/abundances.cxb b73_quant_b/abundances.cxb
```
### parent gene expression comparsion##
```
perl rm_circ_exp.pl
perl rand_gene.pl
perl cal_avglen.pl
### plot by R
library(ggplot2)
data<-read.table("geneexp_cmp.plot",header=T)
fig<-ggplot(data)+geom_density(aes(x=log(exp,10),fill=type,colour=type),alpha=1/3)+theme_bw()+theme(legend.position='none',panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))+scale_fill_manual(values=c("red","blue"))+scale_colour_manual(values=c("red","blue"))+xlim(c(-5,5))
ggsave(fig,filename="parentgeneexp_cmp.svg",height=5,width = 5)
```
