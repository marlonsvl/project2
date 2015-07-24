library("lattice")
library("graphics")
NEI <- readRDS("/Users/utpl/Documents/exploratoryDataAnalysis/project2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/utpl/Documents/exploratoryDataAnalysis/project2/exdata_data_NEI_data/Source_Classification_Code.rds")
setwd("/Users/utpl/Documents/exploratoryDataAnalysis/project2/")
#plot(NEI$year, NEI$Emissions, col = "red",type = "o", main = "Emissions", xlab = "Emission in 1999")
neidata <- aggregate(NEI[c("Emissions")], list(year=NEI$year), sum);

plot1 <- function(){
  plot(neidata$Emissions ~ neidata$year, type="l", col="black", main="Variation in Total PM25 Emissions", col.main="blue", xlab="Year", ylab="Total PM25 Emissions", col.lab="blue")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("plot1.png generado", getwd())
}
plot1()

