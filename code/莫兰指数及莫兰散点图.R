
library(ineq)
library(readxl)
library(raster)
library(ape)
library(spdep)
library(spatialreg)
library(stargazer)
library(splm)
library(dplyr)
##############################################

w <- read.csv('E:\\文件\\AAA论文2.0\\数据7\\空间权重矩阵带省份.csv')
data_zhishu<-read_xlsx("E:\\文件\\AAA论文2.0\\数据7\\数字经济规模.xlsx")

########################################计算莫兰指数
moran <- c()
for (i in 3:22){
  x <- as.matrix(data_zhishu[ ,i])
  x <- as.vector(x)
  c <- Moran.I(x,w)
  moran <- append(moran, c$observed)
}
moran 

w = as.matrix(w)
w1=mat2listw(w,style = 'W')

#莫兰指数检验
moran.test(as.numeric(unlist(data_zhishu[ ,3])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,4])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,5])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,6])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,7])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,8])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,9])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,10])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,11])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,12])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,13])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,14])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,15])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,16])),listw=w1)
moran.test(as.numeric(unlist(data_zhishu[ ,17])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,18])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,19])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,20])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,21])),listw=w1) 
moran.test(as.numeric(unlist(data_zhishu[ ,22])),listw=w1)




font_add("myfont","C:/Windows/Fonts/simhei.ttf")
font_families()
showtext_auto()

#2005
moran.test(as.numeric(unlist(data_zhishu[ ,7])),listw=w1)
x <- as.numeric(unlist(data_zhishu[, 7]))
zx <- (x - mean(x))/sd(x)
mean(zx)
var(zx)
wfile <- w1
wzx <- lag.listw(wfile,zx)
morlm <- lm(wzx ~ zx)
aa <- morlm$coefficients[1]
mori <- morlm$coefficients[2]
par(pty="s") 
plot(zx,wzx,pch=1,cex = 0.6,xlab="2005",ylab="Spatial Lag of 2005",xlim=c(-2,4),ylim=c(-2,3),family='myfont')
abline(aa,mori,col=2)
abline(h=0,lty=2,col=4)
abline(v=0,lty=2,col=4)
title(paste("Moran Scatterplot I = ",format(round(mori,4))),cex = 0.3)
text(x=zx+0.3,y=wzx+0.02,labels=unlist(data_zhishu[, 2]),cex=0.6,family='myfont')


#2010
moran.test(as.numeric(unlist(data_zhishu[ ,12])),listw=w1)
x <- as.numeric(unlist(data_zhishu[, 12]))
zx <- (x - mean(x))/sd(x)
mean(zx)
var(zx)
wfile <- w1
wzx <- lag.listw(wfile,zx)
morlm <- lm(wzx ~ zx)
aa <- morlm$coefficients[1]
mori <- morlm$coefficients[2]
par(pty="s") 
plot(zx,wzx,pch=1,cex = 0.5,xlab="2010",ylab="Spatial Lag of 2010",xlim=c(-2,4),ylim=c(-2,3),family='myfont')
abline(aa,mori,col=2)
abline(h=0,lty=2,col=4)
abline(v=0,lty=2,col=4)
title(paste("Moran Scatterplot I = ",format(round(mori,4))),cex = 0.3)
text(x=zx+0.3,y=wzx+0.02,labels=unlist(data_zhishu[, 2]),cex=0.5,family='myfont')


par(mfrow= c(1,2))#
#2015

moran.test(as.numeric(unlist(data_zhishu[ ,17])),listw=w1)
x <- as.numeric(unlist(data_zhishu[, 17]))
zx <- (x - mean(x))/sd(x)
mean(zx)
var(zx)
wfile <- w1
wzx <- lag.listw(wfile,zx)
morlm <- lm(wzx ~ zx)
aa <- morlm$coefficients[1]
mori <- morlm$coefficients[2]
par(pty="s") 
plot(zx,wzx,pch=1,cex = 0.5,xlab="2015",ylab="Spatial Lag of 2015",xlim=c(-2,4),ylim=c(-2,3),family='myfont')
abline(aa,mori,col=2)
abline(h=0,lty=2,col=4)
abline(v=0,lty=2,col=4)
title(paste("Moran Scatterplot I = ",format(round(mori,4))),cex = 0.3)
text(x=zx+0.3,y=wzx+0.02,labels=unlist(data_zhishu[, 2]),cex=0.5,family='myfont')
# 

#2020

font_add("myfont","C:/Windows/Fonts/simhei.ttf")
font_families()
showtext_auto()

moran.test(as.numeric(unlist(data_zhishu[ ,22])),listw=w1)
x <- as.numeric(unlist(data_zhishu[, 22]))
zx <- (x - mean(x))/sd(x)
mean(zx)
var(zx)
wfile <- w1
wzx <- lag.listw(wfile,zx)
morlm <- lm(wzx ~ zx)
aa <- morlm$coefficients[1]
mori <- morlm$coefficients[2]

par(pty="s") 
plot(zx,wzx,pch=1,cex =0.5,xlab="2020",ylab="Spatial Lag of 2020",family='myfont',xlim=c(-2,4),ylim=c(-2,3))
abline(aa,mori,col=2)
abline(h=0,lty=2,col=4)
abline(v=0,lty=2,col=4)
title(paste("Moran Scatterplot I = ",format(round(mori,4))),cex = 0.3)
text(x=zx+0.3,y=wzx+0.02,labels=unlist(data_zhishu[, 2]),cex=0.5,family = "myfont")







