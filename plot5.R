library("graphics")
library("datasets")
library("ggplot2")

NEI <- readRDS("/Users/utpl/Documents/exploratoryDataAnalysis/project2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/utpl/Documents/exploratoryDataAnalysis/project2/exdata_data_NEI_data/Source_Classification_Code.rds")
setwd("/Users/utpl/Documents/exploratoryDataAnalysis/project2/")

PlotBaltimore <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
PlotBaltimore$city <- "Baltimore City"

ggplot(PlotBaltimore, aes(year, Emissions)) +
  stat_summary(geom="line", fun.y="sum", color = "#00C1A9") + 
  xlab("Year") + ylab("Total PM25 Emissions") +
  ggtitle("Total PM25 Emissions from Motor Vehicles, Baltimore, 1999-2008") +
  theme(plot.title=element_text(color="blue")) +
  theme(axis.title=element_text(color="darkgreen"))
dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()
