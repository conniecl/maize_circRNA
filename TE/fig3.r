###3A
library(ggplot2)
data<-read.table("LINE_L1_cmp.plot",header=T)
p<-ggplot(data)+geom_bar(aes(x=plot_pos,y=count,fill=type),stat="identity",position="dodge",width=.7)+theme_bw()+theme(legend.position='none',panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))+scale_x_continuous(limits=c(0,15),breaks=data$plot_pos) +scale_fill_manual(values=c("red","blue"))
ggsave(p,filename="LINE_L1_cmp.svg",height=5,width=20)

###3C
library(ggplot2)
percent<-c(61.64,57.62,51.22,47.08,46.95)  
type<-c("circular","longest","linear","exp","intron")
data<-data.frame(type,percent)
fig<-ggplot(data)+geom_bar(aes(x=factor(type,levels=c("circular","longest","linear","exp","intron")),y=percent,fill=type),width=.5,stat="identity")+scale_fill_manual(values=c("red","blue","blue","blue","blue"))+theme_bw()+theme(legend.position='none',panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))
ggsave(fig,filename="L1.svg",height=5,width = 5)

###3D
library(ggplot2)
percent<-c(17.73,10.19,8.99,6.25,8.49)  
type<-c("circular","longest","linear","exp","intron")
data<-data.frame(type,percent)
fig<-ggplot(data)+geom_bar(aes(x=factor(type,levels=c("circular","longest","linear","exp","intron")),y=percent,fill=type),width=.5,stat="identity")+scale_fill_manual(values=c("red","blue","blue","blue","blue"))+theme_bw()+theme(legend.position='none',panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))
ggsave(fig,filename="L1_rcp.svg",height=5,width = 5)



