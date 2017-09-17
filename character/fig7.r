##fig7c##
library(ggplot2)
data<-read.table("C:/Users/lchen/Desktop/fig7c.txt",header=T)
p<-ggplot(data)+geom_boxplot(aes(x=rcp,y=log(circ,10),fill=rcp))+scale_fill_manual(values=c("red","blue"))+theme_bw()+theme(legend.position='none',panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))
ggsave(p,filename = "fig7c.svg",height = 4,width = 6)

##fig7d##
data<-read.table("C:/Users/lchen/Desktop/fig7d.txt",header=T)
p<-ggplot(data,aes(x=circ,y=linear))+geom_point(fill="red",size=4,shape=21,color="darkgrey",alpha=3/5,stroke=1.5)+theme_bw()+theme(legend.position='none',panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))
ggsave(p,filename = "fig7d.svg",height = 4,width = 6)

##fig7e##
data<-read.table("C:/Users/lchen/Desktop/fig7e.txt",header=T)
norcp<-data[which(data$rcp=="without"),]
rcp<-data[which(data$rcp=="with"),]
type<-c("with","without")
mean<-c(mean(rcp$earheight),mean(norcp$earheight))
sd<-c(sd(rcp$earheight),sd(norcp$earheight))
data_p<-data.frame(type,mean,sd)
p<-ggplot(data_p,aes(x=type,y=mean,fill=type))+geom_bar(stat="identity",width = .5)+geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd),width=.1,position = "dodge")+scale_fill_manual(values=c("red","blue"))+theme_bw()+theme(legend.position='none',panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))
ggsave(p,filename = "fig7e.svg",height = 4,width = 6)
