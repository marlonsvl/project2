library("lattice")
library("graphics")
library("datasets")
library("ggplot2")

NEI <- readRDS("/Users/utpl/Documents/exploratoryDataAnalysis/project2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/utpl/Documents/exploratoryDataAnalysis/project2/exdata_data_NEI_data/Source_Classification_Code.rds")
setwd("/Users/utpl/Documents/exploratoryDataAnalysis/project2/")

#PlotBaltimoreOR <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
#PlotBaltimoreNR <- NEI[NEI$fips=="24510" & NEI$type=="NON-ROAD",]
#PlotBaltimoreP <- NEI[NEI$fips=="24510" & NEI$type=="POINT",]
#PlotBaltimoreNP <- NEI[NEI$fips=="24510" & NEI$type=="NON-POINT",]

plotdata <- rbind(PlotBaltimoreOR, PlotBaltimoreNR, PlotBaltimoreP, PlotBaltimoreNP)

qplot(plotdata$year, plotdata$Emissions, data = plotdata, facets = type ~. , binwidth = 2, geom = "point", colour = factor(type)) +
  stat_summary(geom="line", fun.y="sum", colour = "#00C1A9") +
  xlab("Year") + ylab("Total PM25 Emissions") +
  ggtitle("Variation in Total PM25 Emissions (Baltimore, Maryland) by Type") +
  theme(plot.title=element_text(color="blue")) +
  theme(axis.title=element_text(color="darkgreen"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
