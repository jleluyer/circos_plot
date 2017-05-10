################OmicCircos test ############
####################################################
ls()
rm(list=ls())
ls()


#source("https://bioconductor.org/biocLite.R")
#biocLite("OmicCircos")
library(OmicCircos)

setwd("~/Omicircos/")

options(stringsAsFactors = FALSE);

#### Test real data
temp.seg.f<-read.table("test_init.seg_onlydata.txt",header=T)
data_label_methyl<-read.table("test_gene.label_methyl_onlyannot.txt",header=T)
data_value_methyl<-read.table("test_data.methyl.txt",header=T)

#Initialize value
seg.name <- temp.seg.f[,1]
seg.num   <- length(unique(temp.seg.f[,1]));
head(temp.seg.f)


# Create df
db <- segAnglePo(temp.seg.f, seg=seg.name);


#Define colors
colors   <- rainbow(seg.num, alpha=0.5);


#plot
jpeg(filename = "circos_plot.jpeg",
     width = 11, height = 11, units = 'in', res = 400)
yc=475
xc=475
par(mar=c(1,1, 1, 1));
plot(c(1,950), c(1,950), type="n", axes=FALSE, xlab="", ylab="", main="");
circos(R=420, type="chr", cir=db, col=colors, print.chr.lab=TRUE,xc=xc,yc=yc,W=4,scale=TRUE);
circos(R=360, cir=db , W=50, mapping=data_value_methyl , col.v=3,xc=xc,yc=yc, type="b2", B=TRUE, cutoff=0,col=c("red","dodgerblue4"),lwd=3);
circos(R=360, cir=db, W=20, mapping=data_label_methyl, type="label",xc=xc,yc=yc, side="in", col=c("black"), cex=0.8);
dev.off()
