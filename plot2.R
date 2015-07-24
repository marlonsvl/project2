library("lattice")
library("graphics")
library("datasets")

NEI <- readRDS("/Users/utpl/Documents/exploratoryDataAnalysis/project2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/utpl/Documents/exploratoryDataAnalysis/project2/exdata_data_NEI_data/Source_Classification_Code.rds")
setwd("/Users/utpl/Documents/exploratoryDataAnalysis/project2/")

neiBaltimore <- subset(NEI, NEI$fips == 24510)
neidata <- aggregate(neiBaltimore$Emissions ~ neiBaltimore$year, neiBaltimore, sum)

plot2 <- function(){
  ggplot(neidata, aes(neiBaltimore$year, neiBaltimore$Emissions)) +
    stat_summary(geom="line", fun.y="sum", color = "blue") +
    xlab("Year") + ylab("Total PM25 Emissions") +
    ggtitle("Variation in Total PM25 Emissions (Baltimore, Maryland)") +
    theme(plot.title=element_text(color="blue")) +
    theme(axis.title=element_text(color="darkgreen"))
  #dev.copy(png, file="plot2.png", width=480, height=480)
  #dev.off()
  cat("plot2.png generado", getwd())  
}

plot2()
