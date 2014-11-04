## setwd for directory with the two data sets
setwd("N:/coursera/Data_Science_JH/Exploratory Data Analysis/project2")
rm(list=ls())
library(plyr)
NEI<-readRDS("./data/summarySCC_PM25.rds")
SCC<-readRDS("./data/Source_Classification_Code.rds")
NEI<-transform(NEI,year=format(year,format="%y"))

#1 Have total emissions from PM2.5 decreased in the United States 
#from 1999 to 2008? Using the base plotting system, make a plot
#showing the total PM2.5 emission from all sources for each of the 
#years 1999, 2002, 2005, and 2008.
#?aggregate

SumbyYr=aggregate(x=NEI$Emissions,by=list(YEAR=factor(NEI$year)),FUN="sum")

#make barplot for question 1
png("plot1.png", width=480, height=480)
plot(SumbyYr$x ,x =seq(1999, 2008, by = 3) ,type="b",xaxt = "n",pch = 16, col = "blue",
     ylab = expression("Total PM"[2.5] * " Emission (in tons)"), xlab = "Year",
     main = expression("Total PM"[2.5] * " Emission (1999 - 2008)"))
axis(side = 1, at = seq(1999, 2008, by = 3))
dev.off()
