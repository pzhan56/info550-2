#! /usr/local/bin/Rscript

#############
# Load Data #
#############
library(ggplot2)
library(dplyr)
library(wesanderson)

# Load full data set
data.f = read.csv("muse_randomized_scored.csv")

#####################
# Subset by Country #
#####################
data.IN=data.f[data.f$SCR02==2,]
data.UG=data.f[data.f$SCR02==1,]

# Binary risk scores
# Anxiety
data.f$a.risk<- ifelse(data.f$PHQ4.a >= 3,1,0)
# Depression
data.f$d.risk<- ifelse(data.f$PHQ4.d >= 3,1,0)

data.f$SCR02 <- factor(data.f$SCR02, levels=c(1,2), labels=c("Uganda","India"))
data.f$d.risk <- factor(data.f$d.risk, levels=c(0,1), labels=c("Not at Risk","At Risk"))
data.f$a.risk <- factor(data.f$a.risk, levels=c(0,1), labels=c("Not at Risk","At Risk"))

dep<-na.omit(data.frame(data.f %>% group_by(SCR02) %>% count(d.risk)))
anx<-na.omit(data.frame(data.f %>% group_by(SCR02) %>% count(a.risk)))

png("fig1.png")
# Depression plot
ggplot(dep, aes(fill=d.risk, y=n, x=SCR02)) + geom_bar(position="fill", stat="identity")+ggtitle("Proportion at Risk for Clinically Significant Levels of Depression")+xlab("Country") + ylab("Count")+labs(fill = "")+scale_fill_manual(values=wes_palette(name="GrandBudapest1"))
dev.off()
