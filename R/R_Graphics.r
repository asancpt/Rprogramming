

#################################################
##---------------------------------------------##
##                  Graphics                   ##
##---------------------------------------------##
#################################################

# �������� �׸� �Լ��� �׸��� �����Ѵ�.
# �������� �׸� �Լ��� ������ �׸��� �׸��� �߰��Ѵ�.

## �������� �׸� �Լ��� �ֿ� ���� (arguments) ###

# main : ����
# xlab/ylab : x�� �� y�� ���̺�
# xlim/ylim : x�� �� y�� ����
# col : ����
# lty : �� ���
# pch : �� ���
# cex : �׸� ������ ũ��
# lwd : �� ����
# type : �׸� Ÿ��


#################################################
##########     �������� �׸� �Լ�    ############
#################################################

WD <- "D:\\AMC\\Education\\UU\\2017\\R\\Graphics\\"

setwd(WD)

dta <- read.csv("PK.csv")
head(dta)
str(dta)

################ scatter plot ###################

plot(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0])

plot(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], log="y")

plot(dta$TIME[dta$MDV==0], log(dta$DV[dta$MDV==0]))

plot(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0]
	, xlab="Time (hr)", ylab="Concentration (ng/mL)" 
	, type="o", pch=2, col=1, main="PK time-course of Drug X"
	, xlim =c(-2,218), ylim=c(0,80))

plot(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], axes=F,
	, xlab="Time (hr)", ylab="Concentration (ng/mL)" 
	, type="o", pch=2, col=1, main="PK time-course of Drug X"
	, xlim =c(-2,218), ylim=c(0,80))
axis(1, at=seq(0, 218, 24))
axis(2)
box()



################## Histogram ####################

d.demog <- read.csv("DEMOG.csv")

# histogram
hist(d.demog$HT)

hist(d.demog$HT, breaks=10)
hist(d.demog$HT, nclass=10)

# with density line
hist (d.demog$HT, probability=TRUE, breaks=10)
lines(density(d.demog$HT))


hist (d.demog$HT, probability=TRUE, breaks=9, xaxt="n"
      , main="Histogram for Height", xlab="Height (cm)", ylab="Probability (%)")
axis(1, at=seq(min(d.demog$HT), max(d.demog$HT), 3))
lines(density(d.demog$HT))


hist (d.demog$HT, probability=TRUE, breaks=9, xaxt="n"
      , main="Histogram for Height", xlab="Height (cm)", ylab="Probability (%)"
      , col = "lightblue", border = "pink")
axis(1, at=seq(min(d.demog$HT), max(d.demog$HT), 3))
lines(density(d.demog$HT))


############## Box-Whisker Plot #################

# Box-and-Whisker Plot

boxplot(d.demog$WT)

boxplot(d.demog$WT ~ d.demog$SEX)

boxplot(split(d.demog$WT, d.demog$SEX))

boxplot(WT ~ SEX, data=d.demog)

boxplot(d.demog$WT ~ d.demog$SEX
        , names=c("Male","Female"), ylab="AGE, year", ylim=c(min(d.demog$WT)-2, max(d.demog$WT)+2)
		    , col="pink")

boxplot(d.demog$WT ~ d.demog$SEX
        , names=c("Male","Female"), ylab="AGE, year", ylim=c(min(d.demog$WT)-2, max(d.demog$WT)+2)
		    , col=c("lightblue", "salmon"), width=c(0.6, 1))

#varwidth: if varwidth is TRUE, the boxes are drawn with widths proportional  
#to the square-roots of the number of observations in the groups.

boxplot(d.demog$WT ~ d.demog$SEX
        , names=c("Male","Female"), ylab="AGE, year", ylim=c(min(d.demog$WT)-2, max(d.demog$WT)+2)
		    , col=c("lightblue", "salmon")
		    , varwidth=TRUE)



################## Bar Plot #####################

barplot(d.demog$HT)

VADeaths

barplot(VADeaths, border = "dark blue")

barplot(VADeaths, col = rainbow(20))

barplot(VADeaths, col = heat.colors(8))

barplot(VADeaths, col = gray.colors(4))

barplot(VADeaths, col = gray.colors(4), log="x")
barplot(VADeaths, col = gray.colors(4), log="y")
barplot(VADeaths, col = gray.colors(4), log="xy")



################## pie chart ####################

drug.X.market <- c(0.12, 0.29, 0.32, 0.22, 0.11, 0.28)
names(drug.X.market) <- c("South Korea","China","USA","Japan","Austria","EU")
pie(drug.X.market)


################ matplot �Լ� ###################

# matrix�� column ������ �׸�

pct.95 <- read.csv("pct95.csv")
matplot(pct.95[,1], pct.95[,2:ncol(pct.95)], pch=1)

matplot(pct.95[,1], pct.95[,2:ncol(pct.95)], pch=1, col=c(1,2,1), type="l", lty=1, lwd=c(1,2,1))



###### Scatter plot matrices (pairs plots) ######

pairs(d.demog)

#add a loess smoother, type:
pairs(d.demog, panel = panel.smooth)

  panel.cor <- function(x, y, digits=2, prefix="", cex.cor)
   {
       usr <- par("usr"); on.exit(par(usr))
       par(usr = c(0, 1, 0, 1))
       r = (cor(x, y))
       txt <- format(c(r, 0.123456789), digits=digits)[1]
       txt <- paste(prefix, txt, sep="")
       if(missing(cex.cor)) cex <- 1.5
       text(0.5, 0.5, txt, cex = 1.5)
   }

pairs(d.demog, lower.panel=panel.smooth, upper.panel=panel.cor) 



#################################################
##             �������� �׸� �Լ�              ##
#################################################

# points : ���߰�
# lines : �� �߰�
# abline : ���ؼ� �߰�
# mtext : �ؽ�Ʈ �߰�
# legend : ����(legend) �߰�
# polygon : polygon �߰�


############ ��, ��, ���� �߰� �ϱ� #############

plot(pct.95$TIME, pct.95$PCT50, main="PK of Drug X"
     , type="l", xlab="Time (h)", ylab="Concentration (ng/ml)"
     , ylim=range(0,80), lty=1, col="red", lwd=2)


plot(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], main="PK of Drug X"
     , type="n", xlab="Time (h)", ylab="Concentration (ng/ml)"
     , ylim=range(0,80))
points(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], pch = 16, cex=0.8)
lines(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], col="black", lwd=1)
abline(40, 0, col="red", lty=2)                               #abline(a,b): y=a+b*x
legend("topright", legend=c("Individual concentrations")
       , lty=1, col="black")


################# polygon �Լ� ###################

plot(c(1, 10), c(1, 6), type = "n")
polygon(c(2,8,8,2), c(5,4,3,2), col="lightgreen")


plot(c(1, 9), 1:2, type = "n")
polygon(1:9, c(2,1,2,1,1,2,1,2,1),
        col = c("red", "blue"),
        border = c("green", "yellow"),
        lwd = 3, lty = c("dashed", "solid"))


################# �׸� ����ϱ� ##################

#--pdf graphics devices 
pdf("PK_of_Drug_X.pdf")

plot(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], main="PK of Drug X"
     , type="n", xlab="Time (h)", ylab="Concentration (ng/ml)"
     , ylim=range(0,80))
points(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], pch = 16, cex=0.8)
lines(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], col="black", lwd=1)
abline(40, 0, col="red", lty=2)                               #abline(a,b): y=a+b*x
legend("topright", legend=c("Individual concentrations")
       , lty=1, col="black")

dev.off()


#--PNG graphics devices
png("PK_of_Drug_X.png")

plot(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], main="PK of Drug X"
     , type="n", xlab="Time (h)", ylab="Concentration (ng/ml)"
     , ylim=range(0,80))
points(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], pch = 16, cex=0.8)
lines(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], col="black", lwd=1)
abline(40, 0, col="red", lty=2)                               #abline(a,b): y=a+b*x
legend("topright", legend=c("Individual concentrations")
       , lty=1, col="black")
       
dev.off()



#--Windows graphics devices 
win.metafile("PK_of_Drug_X.wmf")

plot(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], main="PK of Drug X"
     , type="n", xlab="Time (h)", ylab="Concentration (ng/ml)"
     , ylim=range(0,80))
points(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], pch = 16, cex=0.8)
lines(dta$TIME[dta$MDV==0], dta$DV[dta$MDV==0], col="black", lwd=1)
abline(40, 0, col="red", lty=2)                               #abline(a,b): y=a+b*x
legend("topright", legend=c("Individual concentrations")
       , lty=1, col="black")
       
dev.off()

